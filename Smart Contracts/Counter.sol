// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Counter{
    // code for contract, supports inheritance
    uint count; // unsigned integer, is only positive

    // sets the default value of count
    constructor() public{
        count = 0;
    }

    function getCount() public view returs(uint) {
        return count;
        
    }

    function incrementCount() public {
       count = count + 1; 
    }

}