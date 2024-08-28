// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract ContractMapping {
    // Mapping involves key - value pairs
    // mappings allow us to simulate databases on the blockchain
    mapping(uint => string) public names;
    mapping(uint => Book) public books;     // database of books

    // we can make nested mappings similar to 2D arrays    
    // common for things like tokens or nfts
     mapping(address => mapping(uint => Book)) public myBooks; 
    
    
    struct Book {
        string title;
        string author;
    }

    constructor() {  // constructor runs once when smart contract is deployed to the blockchain
    names[1] = "Adam";
    names[2] = "Max";
    names[3] = "John";
    }

    function addBook(uint256 _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(uint256 _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);                   // msg.sender is the person calling the smart contract, address acts as the key.
    }

}