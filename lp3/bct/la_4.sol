// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductInventory {
    struct Product {
        uint256 id;
        string name;
        uint256 stock;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductReceived(uint256 indexed id, string name, uint256 stock);
    event ProductSold(uint256 indexed id, string name, uint256 stock);

    // Function to receive products
    function receiveProduct(uint256 _id, string memory _name, uint256 _stock) public {
        products[_id] = Product(_id, _name, _stock);
        productCount++;
        emit ProductReceived(_id, _name, _stock);
    }

    // Function to sell products
    function saleProduct(uint256 _id, uint256 _quantity) public {
        require(products[_id].stock >= _quantity, "Insufficient stock");

        products[_id].stock -= _quantity;
        emit ProductSold(_id, products[_id].name, products[_id].stock);
    }

    // Function to display stock of a product
    function displayStock(uint256 _id) public view returns (uint256) {
        return products[_id].stock;
    }
}
