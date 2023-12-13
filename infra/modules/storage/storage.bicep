param location string
@minLength(3)
param suffix string 

resource functionStorage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'st${suffix}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}


