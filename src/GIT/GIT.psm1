<#
	.SYNOPSIS
		This is designed to add the upstream remote; fetch the upstream; merge the upstream to master; and push the origin to master.

	.DESCRIPTION
		Syncronizes a forked repository
		
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
	
	git remote add upstream $Repository
	
	git fetch upstream
	
	git merge upstream/master
	
	git push origin master
}