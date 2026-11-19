# Terraform Lab

Repositório dedicado ao estudo prático da ferramenta **Terraform** e da infraestrutura como código.

Os laboratórios serão organizados em diretórios independentes e poderão tratar de providers, módulos, variáveis, outputs, estado, backends, workspaces, ambientes, provedores de nuvem e outros conceitos da ferramenta. Neste momento, o laboratório disponível é o `lab-01`.

## Pré-requisitos

- Terraform 1.0 ou superior
- Git
- PowerShell
- Credenciais ou conta de provedor, somente nos laboratórios que exigirem

Confira as ferramentas instaladas:

```powershell
terraform version
git --version
```

## Estrutura do repositório

```text
terraform-lab/
├── lab-01/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       └── file_generator/
├── lab-02/
├── lab-03/
└── README.md
```

As pastas `lab-02` e posteriores representam laboratórios futuros. Execute os comandos do Terraform dentro do diretório do laboratório desejado.

## Laboratórios

### Lab 01 - Provider local e módulos

O laboratório demonstra:

- Configuração do Terraform e dos providers necessários
- Uso de variáveis
- Criação e reutilização de módulos
- Uso do provider `hashicorp/local`
- Geração de arquivos locais
- Definição de outputs

O módulo `file_generator` cria os seguintes arquivos em `lab-01`:

- `development.txt`
- `testing.txt`
- `production.txt`

### Próximos laboratórios

Os laboratórios futuros poderão abordar:

- Expressões, funções e tipos de dados
- Data sources e dependências
- Meta-argumentos
- Workspaces e múltiplos ambientes
- Arquivos de estado e backends remotos
- Recursos em provedores de nuvem
- Provisioners e `terraform import`
- Módulos locais e remotos
- Gerenciamento de secrets
- Testes, validações e políticas
- Integração com CI/CD

## Executando um laboratório

Entre no diretório do laboratório:

```powershell
cd lab-01
```

Inicialize o diretório, baixe os providers e prepare os módulos:

```powershell
terraform init
```

Atualize providers e módulos:

```powershell
terraform init -upgrade
```

Recarregue a configuração do backend:

```powershell
terraform init -reconfigure
```

Migre o estado para outro backend:

```powershell
terraform init -migrate-state
```

## Comandos essenciais

### Formatação

Formate o diretório atual:

```powershell
terraform fmt
```

Formate recursivamente o repositório:

```powershell
terraform fmt -recursive
```

Verifique a formatação sem alterar os arquivos:

```powershell
terraform fmt -check -recursive
```

### Validação

Valide a sintaxe e as referências da configuração:

```powershell
terraform validate
```

### Plano

Crie um plano de execução:

```powershell
terraform plan
```

Salve o plano em um arquivo:

```powershell
terraform plan -out="lab.tfplan"
```

Exiba um plano salvo:

```powershell
terraform show "lab.tfplan"
```

Exporte o plano em JSON:

```powershell
terraform show -json "lab.tfplan" > "lab-plan.json"
```

Visualize o plano de destruição:

```powershell
terraform plan -destroy
```

### Aplicação

Aplique uma configuração:

```powershell
terraform apply
```

Aprove automaticamente:

```powershell
terraform apply -auto-approve
```

Aplique um plano salvo:

```powershell
terraform apply "lab.tfplan"
```

Substitua um recurso específico:

```powershell
terraform apply -replace="tipo_recurso.nome_logico"
```

Para os laboratórios locais:

```powershell
cd lab-01
terraform init
terraform validate
terraform fmt -check -recursive
terraform plan
terraform apply
```

### Outputs

Liste os outputs:

```powershell
terraform output
```

Exiba um output específico:

```powershell
terraform output development_file
terraform output -raw development_content
terraform output -raw testing_content
terraform output -raw production_content
```

Exiba todos em JSON:

```powershell
terraform output -json
```

### Destruição

Destrua os recursos gerenciados:

```powershell
terraform destroy
```

Destrua sem confirmação:

```powershell
terraform destroy -auto-approve
```

## Variáveis

Informe uma variável pela linha de comando:

```powershell
terraform plan -var="project_name=Laboratorio"
terraform apply -var="project_name=Laboratorio"
```

Informe várias variáveis:

```powershell
terraform apply `
  -var="project_name=Laboratorio Avancado" `
  -var="environment=homologacao" `
  -var="message=Configuracao parametrizada via CLI"
```

Utilize um arquivo de variáveis:

```powershell
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="production.tfvars"
```

Defina variáveis por ambiente com o prefixo `TF_VAR_`:

```powershell
$env:TF_VAR_project_name = "Laboratorio"
terraform plan
Remove-Item Env:TF_VAR_project_name
```

Não versione arquivos `*.tfvars`, arquivos de estado ou variáveis contendo secrets.

## Estado

Liste os recursos gerenciados:

```powershell
terraform state list
```

Exiba detalhes de um recurso:

```powershell
terraform state show "module.development"
```

Exiba o estado completo:

```powershell
terraform show
```

Remova um recurso do gerenciamento do Terraform sem destruir o recurso real:

```powershell
terraform state rm "tipo_recurso.nome_logico"
```

Mova um recurso dentro do estado:

```powershell
terraform state mv "module.old" "module.new"
```

Importe um recurso existente:

```powershell
terraform import "tipo_recurso.nome_logico" "identificador"
```

Atualize o estado a partir da infraestrutura real:

```powershell
terraform refresh
```

Os arquivos `terraform.tfstate` e `terraform.tfstate.*` não devem ser compartilhados nem editados manualmente. Em projetos colaborativos, prefira backend remoto com:

- Criptografia
- Lock do estado
- Controle de acesso
- Versionamento
- Ambientes separados

## Workspaces

Liste os workspaces disponíveis:

```powershell
terraform workspace list
```

Crie e selecione um workspace:

```powershell
terraform workspace new development
terraform workspace select development
```

Exiba o workspace atual:

```powershell
terraform workspace show
```

Exclua um workspace:

```powershell
terraform workspace delete development
```

Workspaces não substituem uma estratégia adequada de separação de ambientes e backends.

## Inspeção e diagnóstico

Exiba os providers utilizados:

```powershell
terraform providers
terraform providers schema
```

Gere o grafo de dependências:

```powershell
terraform graph
terraform graph > "graph.dot"
```

Abra o console interativo:

```powershell
terraform console
```

Exemplos de expressões:

```hcl
upper("terraform")
var.project_name
tolist(["development", "testing", "production"])
```

Para sair do console, execute `exit`.

## Boas práticas

- Execute os comandos dentro do diretório correto
- Revise `terraform plan` antes de `terraform apply`
- Utilize variáveis em vez de valores fixos
- Utilize módulos para componentes reutilizáveis
- Não versione arquivos de estado ou credenciais
- Fixe a versão mínima do Terraform e a versão dos providers
- Utilize backends remotos em projetos colaborativos
- Separe configurações por ambiente
- Execute `terraform fmt` e `terraform validate` antes dos commits
- Utilize nomes claros para recursos, variáveis, módulos e outputs
- Não coloque secrets diretamente no código-fonte
- Considere contas ou subscriptions separadas para ambientes

## Convenções

- Terraform: versão 1.0 ou superior
- Arquivos de configuração: `*.tf`
- Variáveis: `*.tfvars`
- Módulos locais: `modules/<nome-do-modulo>`
- Ambientes: `development`, `testing` e `production`
- Secrets: variáveis de ambiente ou gerenciador de secrets
- Estado local: usado apenas em laboratórios ou estudos