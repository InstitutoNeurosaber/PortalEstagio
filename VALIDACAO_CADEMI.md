# 📧 Sistema de Validação de Emails Cademi

## 🎯 Visão Geral

O Portal do Estágio possui um sistema de validação que permite apenas que alunos com emails cadastrados na plataforma Cademi possam criar contas no sistema.

## ✅ Como Funciona

### 1. **Durante o Registro**
- Quando um aluno tenta se cadastrar, o sistema verifica se o email está na lista de emails autorizados
- Se o email não estiver autorizado, o cadastro é bloqueado com uma mensagem explicativa
- Professores podem se cadastrar sem essa validação

### 2. **Tabela `authorized_emails`**
Estrutura no banco de dados:
```sql
- id (UUID)
- email (texto) - Email autorizado
- name (texto) - Nome do aluno
- course (texto) - Curso do aluno
- cademi_id (texto) - ID na plataforma Cademi
- active (boolean) - Se o email está ativo
- imported_at (timestamp) - Data de importação
- last_verified_at (timestamp) - Última verificação
```

### 3. **Integração com Cademi**
- **API Real**: Quando configurada, importa emails diretamente da Cademi
- **Modo Simulação**: Fallback com dados de teste quando API não está disponível

## 📋 Emails Autorizados para Teste

| Email | Nome | Curso |
|-------|------|-------|
| aluno@test.com | Ana Silva | Neuropsicopedagogia Clínica |
| teste1@example.com | Aluno Teste 1 | Neuropsicopedagogia Clínica |
| teste2@example.com | Aluno Teste 2 | Neuropsicopedagogia Institucional |
| teste3@example.com | Aluno Teste 3 | Neuropsicopedagogia Clínica e Institucional |
| aluno.autorizado@gmail.com | Aluno Autorizado | Neuropsicopedagogia Clínica |
| estudante.permitido@outlook.com | Estudante Permitido | Neuropsicopedagogia Institucional |
| maria.santos@email.com | Maria Santos | Neuropsicopedagogia Institucional |
| joao.oliveira@email.com | João Oliveira | Neuropsicopedagogia Clínica e Institucional |
| carla.rodrigues@email.com | Carla Rodrigues | Neuropsicopedagogia Clínica |

## 🛠️ Administração

### Painel Administrativo
1. Acesse como professor
2. Vá para o painel administrativo (ícone de escudo no header)
3. Na aba "Emails Autorizados" você pode:
   - Ver todos os emails cadastrados
   - Importar novos emails da Cademi
   - Ativar/desativar emails específicos
   - Testar validação de emails

### Componente de Teste
No painel administrativo há um componente "Validação de Email Cademi" onde você pode:
- Testar qualquer email para ver se está autorizado
- Ver lista de emails de exemplo
- Entender como o sistema funciona

## 🔒 Segurança

- Apenas emails com `active = true` podem se cadastrar
- A validação é case-insensitive (não diferencia maiúsculas/minúsculas)
- Professores não precisam de email autorizado
- Sistema preparado para integração real com API Cademi

## 🚀 Como Adicionar Novos Emails

### Via Painel Admin
1. Clique em "Importar da Cademi"
2. Os emails serão importados automaticamente

### Via SQL (Supabase)
```sql
INSERT INTO authorized_emails (email, name, course, cademi_id, active)
VALUES ('novo.email@example.com', 'Nome do Aluno', 'Curso', 'CAD-123', true);
```

## ⚠️ Importante

- Emails não autorizados receberão a mensagem: "Este email não está cadastrado na Cademi. Entre em contato com a secretaria."
- A lista de emails autorizados deve ser mantida atualizada com os alunos matriculados
- O sistema está preparado para sincronização automática com a Cademi quando a API estiver configurada
