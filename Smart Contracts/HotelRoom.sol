// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

// covers how to pay with crypto, use function modifiers, visibility, events and enums
contract HotelRoom {
    // Vacant or Occupied
    event Occupy(address _occupant, uint _value);       // declares an event
    enum States {Vacant, Occupied}      // options of state
    States public currentState;        // current state

    address payable public owner;       // address of person creating the smart contract
    
    constructor() { 
        owner = payable(msg.sender);
        currentState = States.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentState == States.Vacant, "Currently occupied");   // checks status
        _;  // returns modifier code
    }

    modifier costs(uint _amount) {
       require(msg.value >= _amount, "Not enough ether provided.");    // checks price of rooms 
        _;
    }

    function bookRoom() public payable onlyWhileVacant costs(2 ether){
        
        currentState = States.Occupied;
       // owner.transfer(msg.value);      // .transfer sends crypto to recipient. The crypto comes from person calling the bookRoom function
        (bool sent, bytes memory _value) = owner.call{value: msg.value}("");
        require(true);
        emit Occupy(msg.sender, msg.value);     // logs the event
        
    }


}