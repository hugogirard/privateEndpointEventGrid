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
    allowBlobPublicAccess: false
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: 'default'
  parent: functionStorage
  properties: {
  }
}


resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: 'files'
  parent: blob
  properties: {
  }
}
