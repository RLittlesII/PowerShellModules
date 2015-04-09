<#
	.SYNOPSIS
		This is designed to add the upstream remote; fetch the upstream; merge the upstream to master; and push the origin to master.

	.DESCRIPTION
		Synchronizes a forked repository
		
	.PARAMETER Repository
		URL of the original repository to synchronize with the fork
		
	.NOTE
		This MUST be executed from the fork folder
		
	.EXAMPLE
		 Pull-Fork -Repository https://github.com/<User>/<Repository>	
#>
function Pull-Fork
{
	param(
		[Parameter(Mandatory=$true)] [string] $Repository
	)
	
	#Verify there are no upstream remotes created
	if((git remote -v | ForEach-Object { $_.contains('upstream') }).contains($true) -eq $false)
	{
		Write-Warning "No remote exists at the repository location $Repository"
		git remote add upstream $Repository
	}
	
	Write-Host "Fetching Upstream Remote (The repository this fork originated from) . . ." -ForegroundColor Green
	git fetch upstream
	
	git merge upstream/master
	
	git push origin master
}