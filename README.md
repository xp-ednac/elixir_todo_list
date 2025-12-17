# 📚 Trabalho Acadêmico  
## Desenvolvimento de uma Todo List em Elixir com Phoenix LiveView

### 📌 Informações Gerais
 **Disciplina:** UNIVERSIDADE FEDERAL DO MARANHÃO - UFMA
- **Discente:** Edna Cristina Durans Santos  
- **Referência Didática:** Desenvolvimento de uma Todo List utilizando Elixir e Phoenix LiveView  
- **Disciplina:** TOPICOS DE ENGENHARIA DA COMPUTACAO II

---

## 📝 Descrição do Projeto

Este projeto tem como objetivo o desenvolvimento de uma aplicação web do tipo **Todo List**, utilizando a linguagem **Elixir** em conjunto com o **Phoenix Framework** e sua extensão **LiveView**.

A aplicação permite a criação, edição, exclusão e marcação de tarefas como concluídas, oferecendo uma experiência **reativa e em tempo real**, sem a necessidade de recarregar a página ou utilizar JavaScript complexo no frontend.

O projeto foi desenvolvido com foco na **programação funcional**, **reatividade** e **boas práticas de desenvolvimento**, servindo como aplicação prática para consolidação dos conteúdos estudados em contexto acadêmico.

---

## 🛠️ Tecnologias Utilizadas

- **Elixir** – Linguagem funcional voltada para sistemas concorrentes e distribuídos  
- **Phoenix Framework** – Framework web robusto e altamente performático  
- **Phoenix LiveView** – Interfaces dinâmicas sem necessidade de JavaScript pesado  
- **Ecto** – Abstração e manipulação de banco de dados  
- **SQLite** – Banco de dados utilizado no desenvolvimento  
- **Tailwind CSS + DaisyUI** – Estilização da interface  

---

## 🚀 Funcionalidades

- ✅ Criar tarefas  
- ✏️ Editar tarefas  
- 🗑️ Excluir tarefas  
- ✔️ Marcar tarefas como concluídas  
- 🔄 Atualização em tempo real com LiveView  

---

## 🔧 Pré-requisitos

Antes de executar o projeto, certifique-se de ter os seguintes softwares instalados:

- **Elixir**  
  👉 https://elixir-lang.org/install.html  

- **Erlang** (necessário para o Elixir)  
  👉 https://www.erlang.org/downloads  

- **Phoenix Framework**  
  👉 https://hexdocs.pm/phoenix/installation.html  

- **Node.js** (para assets/frontend)  
  👉 https://nodejs.org  

- **SQLite**  
  👉 https://www.sqlite.org/download.html  

> 💡 Dica: após instalar Elixir, instale o Phoenix executando:
> ```bash

## 📥 Como Executar o Projeto

### 1️⃣ Clonar o repositório
```bash


📥 Passo a Passo
https://github.com/xp-ednac/

# Clonar o repositório
git clone https://github.com/seu-usuario/seu-repositorio.git

# Acessar o diretório do projeto
cd seu-repositorio

# Instalar dependências
mix deps.get

# Criar e migrar o banco de dados
mix ecto.create
mix ecto.migrate

# Instalar dependências do frontend
npm install --prefix assets

# Rodar o servidor
mix phx.server

A aplicação estará disponível em:
👉 http://localhost:4000