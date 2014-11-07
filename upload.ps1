Add-AzureAccount
#fill your credential details to run the below script via powershell 

$subscriptionName = "YOUR NAME"
$storageAccountName = "YOUR STORAGE ACCOUNT NAME "
$containerName = "YOUR CONTAINER NAME"

#The file name must be same in both source and destination 

$fileName = "LOCAL FILE PATH\filename with extension"
$blobName = "CONTAINER BLOB NAME/SOURCE FILE NAME WITH EXTENSION"

#get the storage account key 

Select-AzureSubscription $subscriptionName

$storageaccountkey = Get-AzureStorageKey $storageAccountName | % {$_.Primary}

#Create the storage context object 

$destContext = New-AzureStorageContext -StorageAccountName $storageaccountName -StorageAccountKey $storageaccountkey

#Copy the file from local workstation to the blob container 

Set-AzureStorageBlobContent -File $fileName -Container $containerName -Blob $blobName -Context $destContext
