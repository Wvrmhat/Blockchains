// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

contract ContractArrays_Tut {
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["Apple", "banana", "carrot"];
    string[] public value;

    // 2 dimensional arrays (an array of an array)

    uint256[][] public array2D = [[1, 2, 3], [4, 5, 6]];    // to get values from the second array it would be (1:0)


    function addValue(string memory _value) public {  // _value is passed into the function.  
        value.push(_value);                           // push adds a new item into the array at the last position
    }

    function valueLen() public view returns(uint) {
        return value.length;
    }



}