pragma solidity ^0.4.24;

contract User {
    address owner;
    address factory;
    bool status;
    
    constructor (address _address) public {
        owner = _address;
        factory = msg.sender;
    }
    
    modifier isOwner(address _caller) {
        require(msg.sender == factory);
        require(_caller == owner);
        _;
    }
    
    function addUser(address _caller) public isOwner(_caller) {
        status = true;
    }
    
    function getStatus() constant external returns (bool) {
        return status;
    }
    
}

contract UserFactory {
    mapping(address => address) users;
    
    function createuser() public { // create a contract from user's address
        if (users[msg.sender] == 0) {
            users[msg.sender] = new User(msg.sender);
        }
    }
    
    function addUser() public {
        require(users[msg.sender] != 0, "You must create a new user before using this function");
        require(User(users[msg.sender]).getStatus() != true, "You can only create one contract per address");
        
        User(users[msg.sender]).addUser(msg.sender); // set the user's registration status
    }
    
    function getUserStatus(address _account) public constant returns (bool) { // check the user's registration status
        if (users[_account] != 0) {
            return (User(users[_account]).getStatus());
        }
    }
}