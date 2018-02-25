/**
*  Dsensor sensor api
*  Smart Contract
*
**/
pragma solidity ^0.4.6;

contract usernameContract {

  string username;


  function setName(string inname) returns(bool successful) {
  	 username = inname;
  }

  function getName() constant returns(string) {
     return username;
  }

}
