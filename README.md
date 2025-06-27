
## Here is the Terraform code for infrastructure AKS + Key vault for my backend spring boot
1. You need to create a **service principal** by using this command : 
``` command
az ad sp create-for-rbac --name admin-sp --role Owner --scopes /subscriptions/<your subcription id> --json-auth
```
2. Create terraform.tfvars to store secrets that will be used for building infrastructure :
``` terraform.tfvars
location            = <Your location of cluster>
resource_group_name = <Your resource group name>
prefix              = <Your prefix>
subscription_id = <Your subscription id>
tenant_id       = <Your tenant id>
client_id      = <Your client id>
client_secret  = <Your client secret>
```
3. Use this command to initialize the infrastructure in terraform :
``` command
terraform init
```
4. Choose your options:
- terraform plan : Plan which will be created in your infrastrucure
- terraform apply --auto-approve : This command will create your infrastructure (~5 mins)
- terraform destroy --auto-approve : This command will destroy your entire infrastructure
