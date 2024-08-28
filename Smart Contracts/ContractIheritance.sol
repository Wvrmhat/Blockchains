// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract Ownable {
   address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

        constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {      // acts as a factory, therefore it creates other smart contracts. Based off the factory design pattern
     string secret;      // only certain person can read secret

    constructor(string memory _secret) {
        secret = _secret;

    }
   
    function getSecret() public view returns(string memory) {
        return secret;
    }
}


contract ContractInheritance is Ownable {       // inheritance
    address secretVault;


    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);    
        super;           // calls constructor from parent contract
    }

    function getSecret() public view onlyOwner returns(string memory) {
        return SecretVault(secretVault).getSecret();        // gets name of contract, we give it the address and call the function directly
    }
}