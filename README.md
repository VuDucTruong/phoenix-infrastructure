1. terraform plan
2. terraform apply --auto-approve
3.2. terraform output -raw kube_config > kubeconfig.yaml
4. kubectl apply -f k8s.yml --kubeconfig=./kubeconfig.yaml
5. kubectl --kubeconfig=./kubeconfig.yaml get pods,svc
6. terraform output -raw azure_credentials
az ad sp show --id <client_id> --query objectId --output tsv

--json-auth instead of --auth-sdk