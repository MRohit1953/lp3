// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomerData {
    struct Customer {
        uint256 id;
        string name;
        string email;
    }
    
    Customer[] public customers;

    function addCustomer(uint256 _id, string memory _name, string memory _email) public {
        Customer memory newCustomer = Customer(_id, _name, _email);
        customers.push(newCustomer);
    }

    function getCustomer(uint256 index) public view returns (uint256, string memory, string memory) {
        require(index < customers.length, "Customer index out of bounds");
        Customer memory c = customers[index];
        return (c.id, c.name, c.email);
    }

    // Fallback function to receive ether
    receive() external payable {}

    // Function to get contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
