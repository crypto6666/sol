// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Owner {


    address public owner; // 管理员地址

   // 构造函数
   constructor() {
      owner = msg.sender; // 在部署合约的时候，将owner设置为部署者的地址
   }


    modifier onlyOwner() {
       require(owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    //调用测试
    function calltest() public onlyOwner view returns(bool){
        return true;
    }

    //更换管理员地址
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        owner=newOwner;
    }




}
