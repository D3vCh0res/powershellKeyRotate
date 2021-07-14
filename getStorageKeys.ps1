# Set Az Context

# Loop through subscription

# Get-AzSubscription | ForEach-Object{
#     $subscriptionId = $_.Id
#     $subscriptionName = $_.Name
     
# Loop through RG in a subscription

Get-AzResourceGroup | ForEach-Object{
    $resourceGroup = $_.ResourceGroupName

    # Loop through Storage Accounts in a RG
    Get-AzStorageAccount -ResourceGroupName $resourceGroup | ForEach-Object{
        $storageAccountName = $_.StorageAccountName
        Write-Host "StgAcct: $storageAccountName `t RG: $resourceGroup"

        $keys = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroup -Name $storageAccountName)

        $primaryKey = $keys.Value[0]
        $secondaryKey = $keys.Value[1]

        Write-Host "Key1: $primaryKey `nKey2: $secondaryKey"
    }
}

Write-Host "Done Job"