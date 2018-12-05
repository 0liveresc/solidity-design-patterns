pragma solidity ^0.4.24;

contract NameRegistry {
    
    struct ContracDetails {
        address owner;
        address contractAddress;
    }
    
    mapping(string => ContracDetails) registry;
    
    function registerName(string _assetOwner, address _owner, address _contractAddress) public payable returns (bool) {
        
        ContracDetails memory info = registry[_assetOwner];
        
        info = ContracDetails ({
            owner: _owner,
            contractAddress: _contractAddress
        });
        
        registry[_assetOwner] = info;
        return true;
    }
    
    function getContractDetails(string _assetOwner) public view returns (address, address) {
        return (registry[_assetOwner].owner, registry[_assetOwner].contractAddress);
    }
}