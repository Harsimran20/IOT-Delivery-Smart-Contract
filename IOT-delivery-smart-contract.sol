// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TemperatureBasedDelivery {
    address public sender;
    address payable public receiver;
    uint public temperature;
    uint public threshold = 30;
    uint public paymentAmount;

    constructor(address payable _receiver) payable {
        sender = msg.sender;
        receiver = _receiver;
        paymentAmount = msg.value;
    }

    function setTemperature(uint _temperature) public {
        require(msg.sender == sender, "Only sender can set temperature");
        temperature = _temperature;
    }

    function executeContract() public {
        require(msg.sender == sender, "Only sender can execute contract");

        if (temperature <= threshold) {
            receiver.transfer(paymentAmount);  // Delivery accepted
        }
        // else: Delivery canceled and payment not made
    }
}
