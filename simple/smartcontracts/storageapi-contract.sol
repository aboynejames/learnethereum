/**
*  Dsensor storage permission
*  Smart Contract
*
**/
pragma solidity ^0.4.4;

contract storageAccess {

    address owner;
    uint public creationTime = now;



    string storedToken;
    string grantToken;
    string jam;

    mapping (address => string) askers;
    mapping (address => uint) permlist;

    function storageAccess () {

        owner = msg.sender;
      }

    function setToken(string x) {

        storedToken = x;
    }

    function getToken() constant returns(string) {
       return storedToken;
    }

    function setSensorOwner(address receiver, string x) returns(bool successful) {
      askers[receiver] = x;
      return true;
    }

    function setPermission(address receiver, uint x) returns(bool successful) {
      if (msg.sender != owner){
          return false;
        }
        else
        {
          permlist[receiver] = x;

          //return true;
        }
    }

    function getOwner(address addr) constant returns(string access) {
      return askers[addr];
    }

    function getPermissionLevel() constant returns(string res) {

      if(permlist[msg.sender] == 2){
          jam = storedToken;
          return jam;
      }
      else
      {
        jam = 'fail';
        return jam;
      }
    }

}
