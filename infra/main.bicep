targetScope = 'subscription'

@description('Primary location for all resources')
param location string

var suffix = uniqueString(subscription().subscriptionId)

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-event-grid-pull'
  location: location  
}


module vnet 'modules/networking/network.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'vnet'
  params: {
    location: location
  }
}

module storage 'modules/storage/storage.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'storage'
  params: {
    location: location
    suffix: suffix
  }
}
