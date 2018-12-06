pragma solidity ^0.4.24;

import './NameRegistry.sol';

contract CarAsset {
    
    address public owner;
    string public brand;
    string public model;
    
    constructor (address _address, string _brand, string _model) public {
        owner = _address;
        brand = _brand;
        model = _model;
    }
}

contract AssetFactory {
    
    address[] carAssets;
    NameRegistry nr; // create an object of name registry to call its function

    constructor (address _contractAddress) public {
        nr = NameRegistry(_contractAddress); // contract address of deployed NameRegistry
    }
    
    function createAsset(string _ownerName, address _owner, string _brand, string _model) public payable { // create a child contract - *payable, if you want to sell the asset 
        address newCarAsset = new CarAsset(_owner, _brand, _model);
        carAssets.push(newCarAsset); // push new asset address to array
        nr.registerName(_ownerName, _owner, newCarAsset); // put data to another contract
    }

    function getOwnerDetails(address _owner) public view returns (string, address) {
        // fetch owner's address and asset's address
        return nr.getContractDetails(_owner);
    }

    function getAllAssets() public view returns (address, string, string) { // check deployed child contract
        CarAsset ca = CarAsset(carAssets[0]);
        return (ca.owner(), ca.brand(), ca.model());
    }
}