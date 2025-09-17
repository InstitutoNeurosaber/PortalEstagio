# Portal do Estágio - Neuropsicopedagogia

![Portal do Estágio](EstagioPortall/public/logoo.png)

## 🎓 Sobre o Projeto

O **Portal do Estágio** é uma plataforma completa e inovadora para gestão de estágios supervisionados em Neuropsicopedagogia. Desenvolvido com tecnologias modernas, o sistema oferece uma experiência intuitiva e eficiente para alunos, professores e coordenadores.

### ✨ Principais Funcionalidades

- 📄 **Gestão de Documentos**: Upload e validação automática de todos os documentos obrigatórios
- ⏱️ **Acompanhamento em Tempo Real**: Monitore o progresso e receba atualizações instantâneas
- 📊 **Avaliação Inteligente**: Sistema completo de avaliação com feedback detalhado
- 👥 **Colaboração Eficiente**: Conecte alunos e professores em uma plataforma única
- 🔒 **Segurança Garantida**: Proteção de dados com as melhores práticas do mercado
- 📈 **Relatórios Detalhados**: Visualize métricas e gere relatórios completos

## 🚀 Tecnologias Utilizadas

### Frontend
- **React 18** - Biblioteca para construção de interfaces
- **TypeScript** - Superset JavaScript com tipagem estática
- **Vite** - Build tool rápida e moderna
- **Tailwind CSS** - Framework CSS utilitário
- **Framer Motion** - Biblioteca de animações
- **React Router** - Roteamento de páginas
- **Radix UI** - Componentes acessíveis e customizáveis
- **Lucide React** - Ícones modernos e consistentes

### Backend & Infraestrutura
- **Supabase** - Backend as a Service (BaaS)
  - PostgreSQL Database
  - Authentication
  - Real-time subscriptions
  - Storage
  - Edge Functions

### Integrações
- **CADEMI API** - Validação de alunos e sincronização de dados acadêmicos
- **NeuroSabre API** - Sistema de gestão educacional

## 📦 Instalação

### Pré-requisitos
- Node.js 18+ 
- NPM ou Yarn
- Conta no Supabase

### Passo a Passo

1. **Clone o repositório**
```bash
git clone https://github.com/seu-usuario/portal-estagio.git
cd portal-estagio/EstagioPortall
```

2. **Instale as dependências**
```bash
npm install
```

3. **Configure as variáveis de ambiente**

Crie um arquivo `.env` na raiz do projeto EstagioPortall:
```env
VITE_SUPABASE_URL=sua_url_do_supabase
VITE_SUPABASE_ANON_KEY=sua_chave_anonima_do_supabase
VITE_NEUROSABRE_API_KEY=sua_chave_api_neurosabre
VITE_NEUROSABRE_API_URL=url_da_api_neurosabre
```

4. **Configure o banco de dados**

Execute o script SQL no seu projeto Supabase:
```bash
# O arquivo supabase-setup.sql contém toda a estrutura do banco
```

5. **Inicie o servidor de desenvolvimento**
```bash
npm run dev
```

O aplicativo estará disponível em `http://localhost:5173`

## 🏗️ Estrutura do Projeto

```
EstagioPortall/
├── src/
│   ├── components/     # Componentes reutilizáveis
│   │   ├── admin/      # Componentes administrativos
│   │   ├── layout/     # Componentes de layout
│   │   └── ui/         # Componentes de UI base
│   ├── contexts/       # Contextos React (Auth, App)
│   ├── hooks/          # Custom hooks
│   ├── lib/            # Utilitários e configurações
│   ├── pages/          # Páginas da aplicação
│   ├── services/       # Serviços e integrações
│   └── utils/          # Funções utilitárias
├── supabase/
│   └── functions/      # Edge Functions do Supabase
├── public/             # Assets públicos
└── ...configurações    # Arquivos de configuração
```

## 🔐 Autenticação e Autorização

O sistema possui dois tipos principais de usuários:

### Alunos
- Acesso ao dashboard de estágio
- Upload de documentos
- Visualização de avaliações
- Acompanhamento de progresso

### Professores
- Gerenciamento de alunos
- Avaliação de documentos
- Feedback e orientações
- Relatórios de desempenho

### Credenciais de Demonstração
```
Aluno: aluno@test.com / 123456
Professor: professor@test.com / 123456
```

## 📝 Scripts Disponíveis

```bash
npm run dev          # Inicia o servidor de desenvolvimento
npm run build        # Cria a build de produção
npm run preview      # Visualiza a build de produção
npm run lint         # Executa o linter
```

### Scripts Utilitários (PowerShell)
- `clear-cache.ps1` - Limpa o cache do projeto
- `setup-cademi-integration.ps1` - Configura integração com CADEMI
- `setup-neurosabre.ps1` - Configura integração com NeuroSabre
- `test-cademi-api.ps1` - Testa a API do CADEMI
- `test-neurosabre-api.ps1` - Testa a API do NeuroSabre

## 🔄 Integrações

### CADEMI API
- Validação automática de matrículas
- Sincronização de dados acadêmicos
- Verificação de status do aluno

### NeuroSabre API
- Integração com sistema de gestão educacional
- Sincronização de calendário acadêmico
- Importação de dados institucionais

## 🚢 Deploy

### Vercel (Recomendado)
1. Conecte seu repositório GitHub ao Vercel
2. Configure as variáveis de ambiente
3. Deploy automático a cada push

### Netlify
1. Build command: `npm run build`
2. Publish directory: `dist`
3. Configure as variáveis de ambiente

## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Por favor:

1. Fork o projeto
2. Crie sua feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👥 Equipe

- **Desenvolvimento**: [Seu Nome]
- **Design**: [Nome do Designer]
- **Gestão**: [Nome do Gestor]

## 📞 Suporte

Para suporte, envie um email para suporte@portaldoestagio.com.br ou abra uma issue no GitHub.

## 🙏 Agradecimentos

- Equipe Supabase pela excelente plataforma
- Comunidade React pelos componentes e bibliotecas
- Todos os contribuidores do projeto

---

<p align="center">
  Feito com ❤️ para a comunidade de Neuropsicopedagogia
</p>
