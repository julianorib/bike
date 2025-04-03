# Projeto demonstração 

Este projeto de demonstração, exibirá um site com Imagens Aleatórias de Bicicletas.

## Tecnologias utilizadas

- Terraform
- Github Actions
- Docker
- Kubernetes

## Requisitos

- Conta no Github
- Conta na AWS
- - Usuário com permissões Admin
- - Access Token 
- - Bucket S3 para salvar o Terraform Backend
- Git instalado
- AWS cli instalado
- Terraform ou Opentofu instalados
- Kubectl instalado


## Como usar

### Clonar este projeto
```
git clone https://github.com/julianorib/bike.git
```

### Exportar credenciais da AWS para uso no Terraform
```
export AWS_ACCESS_KEY=suachave
export AWS_SECRET_KEY=suasenha
```

### Criar o Bucket S3
```
aws s3 mb s3://demo-bike
```
### Definir o nome do Bucket no Backend 
(environment/prod/backend.tfvars)

### Executar o terraform init
```
cd bike\terraform
terraform init --backend-config=environment/prod/backend.tfvars
``` 

### Executar o terraform apply
```
terraform apply -var-file=environment/prod/terraform.tfvars
```

### Obter o kubeconfig do Cluster
```
aws eks update-kubeconfig --region us-east-1 --name bike-eks-cluster
```

### Configurar as Secrets no projeto do Github
- DOCKER_LOGIN
- DOCKER_PASS
- KUBECONFIG
- AWS_ACCESS_KEY
- AWS_SECRET_KEY


### Criar uma Tag para executar o CI/CD
```
git tag
git tag v1.4
git push --tags
```

### Visualizar no Cluster Kubernetes a aplicação
```
kubectl get pods
```

### Acessar a aplicação
```
kubectl get service
```

Visualizar o IP do Loadbalance (external-ip) e abrir um navegador carregando este IP.