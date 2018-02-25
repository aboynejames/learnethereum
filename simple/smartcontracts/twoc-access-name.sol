/**
*  Dsensor sensor api
*  Smart Contract
*
**/
pragma solidity ^0.4.6;

contract usernameContract {

  UserCreator creator;
  string username;


  function usernameContract () {

    creator = UserCreator(msg.sender);
  }

  function setName(string inname) returns(bool successful) {

  	 username = inname;
  }

  function getName() constant returns(string) {
     return username;
  }

}


contract UserCreator {

    string livename;
    string livname;

    function createUser() returns (usernameContract userAddress)
    {
        // Create a new user from contract above
        // From the JavaScript side, the return type is simply
        // "address", as this is the closest type available in
        // the ABI.
        // create a user contract
        return new usernameContract();

    }

    function setliveName (usernameContract userAddress, string livname) returns (bool successful) {

      userAddress.setName(livname);

    }

    function getliveName (usernameContract userAddress) returns (string livename) {

      //livename = userAddress.getName();
      return livename;

    }



}
