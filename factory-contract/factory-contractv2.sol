pragma solidity ^0.4.24;

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
    
    function createAsset(string _brand, string _model) public payable { // create a child contract - *payable, if you want to sell the asset 
        address newCarAsset = new CarAsset(msg.sender, _brand, _model);
        carAssets.push(newCarAsset); // push new asset address to array
    }
    
    function getAllAssets() public view returns (address[]) { // check deployed child contract
        return carAssets;
    }
}