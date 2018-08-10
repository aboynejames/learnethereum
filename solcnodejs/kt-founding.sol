pragma solidity ^0.4.22;
/// @title Founding Knowledge Token
contract ktfounding {

  address genesis;
  uint claimproof;
  uint dkt;

  mapping(address => uint) public ktowners;

  // Constructor
   constructor() public {
    genesis = msg.sender;
    dkt = 9911221;
  }

  function newd () public returns(bool successful) {
  	dkt = 888;
  	return true;
  }

  function getd() public constant returns(uint) {
     return dkt;
  }

  function newktclaim (address receiver) public returns(bool successful) {
  	ktowners[receiver] = 888;
  	return true;
  }

  function verifykt(address receiver) public constant returns(uint) {
     return ktowners[receiver];
  }

  function remove() private {
    if (msg.sender == genesis){
      selfdestruct(genesis);
    }
  }

}
