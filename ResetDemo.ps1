# Demo 1 Reset
Push-Location .\Demo1
terraform destroy -auto-approve
Remove-Item .\.terraform -recurse
Remove-Item .\terraform.tfstate
Remove-Item .\terraform.tfstate.backup
Pop-Location

# Demo 2 Reset
Push-Location .\Demo2\Envs

$envPaths = Get-ChildItem . -Directory

Foreach ($envPath in $envPaths)
{
	$envName = $envPath.Name

	Push-Location .\$envName
	terraform destroy -auto-approve
	Remove-Item .\.terraform -recurse
	Remove-Item .\terraform.tfstate
	Remove-Item .\terraform.tfstate.backup
	Pop-Location
}
Pop-Location

# Demo 3 Reset
Push-Location .\Demo3
terraform destroy -auto-approve
Remove-Item .\.terraform -recurse
Remove-Item .\terraform.tfstate
Remove-Item .\terraform.tfstate.backup
Pop-Location