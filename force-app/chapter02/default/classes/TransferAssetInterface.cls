public with sharing class TransferAssetInterface {
    @AuraEnabled(cacheable=true)
    public static String returnCountries(){
        try {
            return JSON.serialize(TransferAssetAccess.getComboboxCountries());
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String returnCities(String countryName){
        try {
            return JSON.serialize(TransferAssetAccess.getComboboxCities(countryName));
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String returnAccounts(String cityName){
        try {
            return JSON.serialize(TransferAssetAccess.getAccountWrappers(cityName));
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void setAssetWrapper(String assetId, String accountId){
        try {
            TransferAssetAccess.transferAssetWrapper(new TransferAssetAccess.AssetWrapper(assetId, accountId));
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}