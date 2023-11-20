// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployeeData {
    struct Employee {
        uint256 id;
        string name;
        uint256 salary;
    }
    
    Employee[] public employees;

    function addEmployee(uint256 _id, string memory _name, uint256 _salary) public {
        Employee memory newEmployee = Employee(_id, _name, _salary);
        employees.push(newEmployee);
    }

    function getEmployee(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < employees.length, "Employee index out of bounds");
        Employee memory e = employees[index];
        return (e.id, e.name, e.salary);
    }

    // Fallback function to receive ether
    receive() external payable {}

    // Function to get contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
