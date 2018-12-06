pragma solidity ^0.4.24;

contract NameRegistry {
    
    struct ContractDetails {
        address ownerName;
        address contractAddress;
    }
    
    mapping(string => ContractDetails) registry;
    
    function registerName(string _assetOwner, address _owner, address _contractAddress) public payable returns (bool) {
        
        ContractDetails memory info = registry[_owner];
        
        info = ContractDetails ({
            ownerName: _assetOwner,
            contractAddress: _contractAddress
        });
        
        registry[_owner] = info;
        return true;
    }
    
    function getContractDetails(address _owner) public view returns (string, address) {
        if (bytes(_assetOwner).length != 0) {
            return (registry[_owner].ownername, registry[_owner].contractAddress);
        }
    }
}