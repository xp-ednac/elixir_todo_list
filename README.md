### UNIVERSIDADE FEDERAL DO MARANHÃO - UFMA
### CENTRO DE CIÊNCIAS EXATAS E TECNOLOGIA – CCET
### DEPARTAMENTO DO CURSO DE ENGENHARIA DA COMPUTAÇÃO
### DISCIPLINA: TÓPICOS DE ENGENHARIA DA COMPUTAÇÃO II - 2025.2

### 📋 Todo List com Elixir e Phoenix LiveView

#### Docente
Dr. Sérgio Souza Costa

#### 👩‍🎓 Nome discente
Edna Cristina Durans Santos

---

## 📚 Tutorial de Referência

Este projeto foi desenvolvido com base no tutorial:

**Como Criar um App Todo List com Elixir e LiveView do Zero**  
🔗 https://profsergiocosta.notion.site/Como-Criar-um-App-Todo-List-com-Elixir-e-LiveView-do-Zero-2a8cce97509380eba53fc82bbeb08435

---

## 📝 Descrição do Projeto

Este projeto consiste no desenvolvimento de uma aplicação **Todo List** utilizando **Elixir** e **Phoenix LiveView**, explorando o modelo de *estado no servidor*.

A aplicação foi construída de forma incremental, conforme as fases propostas no tutorial da disciplina, passando por:

- Setup inicial do Phoenix
- Implementação de lógica em memória
- Persistência de dados com **Ecto** e **SQLite**
- Refatoração utilizando **changesets** e `to_form/1`
- Implementação de exclusão de tarefas
- Implementação de conclusão de tarefas (checkbox)
- Estilização da interface com **Tailwind CSS** e **DaisyUI**

O **Phoenix LiveView** permite atualizações em tempo real no navegador sem a necessidade de frameworks frontend como React ou Vue, mantendo toda a lógica no backend.

---

## 🛠️ Tecnologias Utilizadas

- Elixir  
- Phoenix Framework  
- Phoenix LiveView  
- Ecto  
- SQLite  
- Tailwind CSS  
- DaisyUI  
- Git e GitHub  

---

## ▶️ Como Rodar o Projeto

### ✅ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

- **Elixir** (versão 1.15 ou superior)
- **Erlang/OTP**
- **Node.js** (necessário para os assets)
- **Git**

---

### 📥 Clonar o Repositório

```bash
git clone https://github.com/xp-ednac/elixir_todo_lis.git
cd elixir_todo_list
---
```

### 🚀 Executar a Aplicação
```bash
mix phx.server
````
----
A aplicação estará disponível em:
👉 http://localhost:4000


