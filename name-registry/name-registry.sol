pragma solidity ^0.4.24;

contract NameRegistry {
    
    struct ContractDetails {
        address owner;
        address contractAddress;
    }
    
    mapping(string => ContractDetails) registry;
    
    function registerName(string _assetOwner, address _owner, address _contractAddress) public payable returns (bool) {
        
        ContractDetails memory info = registry[_assetOwner];
        
        info = ContractDetails ({
            owner: _owner,
            contractAddress: _contractAddress
        });
        
        registry[_assetOwner] = info;
        return true;
    }
    
    function getContractDetails(string _assetOwner) public view returns (address, address) {
        if (bytes(_assetOwner).length != 0) {
            return (registry[_assetOwner].owner, registry[_assetOwner].contractAddress);
        }
    }
}