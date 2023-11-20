// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to only the owner of the account
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to receive products
    function receiveProduct() public payable {
        balance += msg.value; // Increase the balance by the sent amount
    }

    // Function to withdraw money
    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
        payable(owner).transfer(amount); // Transfer the specified amount to the owner
    }

    // Function to show the balance
    function showBalance() public view returns (uint256) {
        return balance;
    }

    // Fallback function to receive ether
    receive() external payable {
        receiveProduct();
    }
}
