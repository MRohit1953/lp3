// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }
    
    Student[] public students;

    function addStudent(uint256 _id, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_id, _name, _age);
        students.push(newStudent);
    }

    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Student index out of bounds");
        Student memory s = students[index];
        return (s.id, s.name, s.age);
    }

    // Fallback function to receive ether
    receive() external payable {}

    // Function to get contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
