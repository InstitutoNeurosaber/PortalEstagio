# 🔌 Integração Real com API NeuroSaber/Cademi

## 📋 Visão Geral

A integração real com a API da NeuroSaber/Cademi permite sincronizar automaticamente os alunos matriculados na plataforma educacional com o Portal do Estágio.

## 🔑 Credenciais da API

```
API Key: f87fe7f3-a1ba-4737-b236-ae2907091bc2
Base URL: https://painel.neurosaberead.com.br
```

## 🚀 Como Funciona

### 1. **Edge Function**
- Nome: `sync-cademi-emails`
- Localização: Supabase Edge Functions
- Função: Conecta com a API da NeuroSaber e importa alunos

### 2. **Processo de Sincronização**
1. A Edge Function faz uma requisição para a API da NeuroSaber
2. Busca todos os alunos ativos
3. Importa emails, nomes e cursos para a tabela `authorized_emails`
4. Apenas alunos com emails autorizados podem se cadastrar

### 3. **Endpoints Testados**
A Edge Function tenta múltiplos endpoints para garantir compatibilidade:
- `/api/alunos`
- `/api/students`
- `/api/v1/alunos`

### 4. **Métodos de Autenticação**
A função tenta diferentes métodos:
- Bearer Token: `Authorization: Bearer {API_KEY}`
- API Key Header: `X-API-Key: {API_KEY}`

## 🧪 Como Testar

### Via Painel Administrativo
1. Faça login como professor
2. Acesse o painel administrativo (ícone de escudo)
3. Na aba "Emails Autorizados"
4. Procure o componente "Teste de Integração Real - NeuroSaber/Cademi API"
5. Clique em "Testar Conexão Real com API"

### Via Importação
1. No mesmo painel, role até "Emails Autorizados (Cademi)"
2. Clique em "Importar da Cademi"
3. O sistema tentará usar a API real primeiro

## 📊 Resposta da API

### Sucesso
```json
{
  "success": true,
  "imported": 25,
  "total": 30,
  "errors": ["5 alunos sem email"],
  "timestamp": "2025-09-12T16:45:00Z",
  "source": "NeuroSaber API"
}
```

### Campos Importados
- **email**: Email do aluno (obrigatório)
- **name**: Nome completo
- **course**: Curso matriculado
- **cademi_id**: ID único na plataforma Cademi
- **active**: Status do aluno

## 🔄 Sincronização Automática

### Configurar Cron Job (Opcional)
Para sincronização automática periódica, configure um cron job no Supabase:

```sql
-- Criar função para chamar a Edge Function
CREATE OR REPLACE FUNCTION sync_cademi_emails_cron()
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  -- Chama a Edge Function via HTTP
  PERFORM net.http_post(
    url := current_setting('app.settings.supabase_url') || '/functions/v1/sync-cademi-emails',
    headers := jsonb_build_object(
      'Authorization', 'Bearer ' || current_setting('app.settings.supabase_anon_key'),
      'Content-Type', 'application/json'
    ),
    body := '{"action": "sync", "source": "cron"}'::jsonb
  );
END;
$$;

-- Agendar para rodar diariamente às 6h
SELECT cron.schedule(
  'sync-cademi-emails-daily',
  '0 6 * * *',
  'SELECT sync_cademi_emails_cron();'
);
```

## 🔍 Troubleshooting

### Erro: "Failed to invoke edge function"
- Verifique se a Edge Function está ativa no Supabase
- Confirme que as variáveis de ambiente estão configuradas

### Erro: "Erro ao buscar dados da Cademi"
- API Key pode estar inválida
- Endpoint da API pode ter mudado
- Verificar se a API está online

### Nenhum aluno importado
- Verificar formato da resposta da API
- Confirmar que os alunos têm emails válidos
- Checar logs da Edge Function no Supabase

## 🛡️ Segurança

1. **API Key**: Armazenada apenas na Edge Function
2. **CORS**: Configurado para aceitar requisições do frontend
3. **RLS**: Políticas de segurança aplicadas na tabela
4. **Validação**: Emails são validados e normalizados

## 📈 Monitoramento

### Logs da Edge Function
1. Acesse o Supabase Dashboard
2. Vá para Edge Functions > Logs
3. Filtre por `sync-cademi-emails`

### Métricas
- Total de alunos importados
- Erros de importação
- Tempo de execução
- Última sincronização

## 🔮 Melhorias Futuras

1. **Webhook**: Receber atualizações em tempo real da Cademi
2. **Filtros**: Importar apenas alunos de cursos específicos
3. **Relatórios**: Enviar email com resumo da sincronização
4. **Cache**: Otimizar para não reimportar alunos já existentes
