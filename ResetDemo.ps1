Push-Location .\Demo1
terraform destroy #-auto-approve
Remove-Item .\.terraform -recurse
Remove-Item .\terraform.tfstate
Remove-Item .\terraform.tfstate.backup
Pop-Location

Push-Location .\Demo2
Push Location .\envs\dev # Get Directory listing
terraform destroy #-auto-approve
Remove-Item .\.terraform -recurse
Remove-Item .\terraform.tfstate
Remove-Item .\terraform.tfstate.backup
Pop-Location
Pop-Location

#Remove-Item .\envs/prod/.terraform -recurse
#Remove-Item .\envs/prod/terraform.tfstate
#Remove-Item .\envs/prod/terraform.tfstate.backup