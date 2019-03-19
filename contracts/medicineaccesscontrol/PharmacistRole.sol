pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'PharmacistRole' to manage this role - add, remove, check
contract PharmacistRole {

  // Define 2 events, one for Adding, and other for Removing
  
  // Define a struct 'pharmacists' by inheriting from 'Roles' library, struct Role

  // In the constructor make the address that deploys this contract the 1st pharmacist
  constructor() public {
    
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyPharmacist() {
    
    _;
  }

  // Define a function 'isPharmacist' to check this role
  function isPharmacist(address account) public view returns (bool) {
    
  }

  // Define a function 'addPharmacist' that adds this role
  function addPharmacist(address account) public onlyPharmacist {
    
  }

  // Define a function 'renouncePharmacist' to renounce this role
  function renouncePharmacist() public {
    
  }

  // Define an internal function '_addPharmacist' to add this role, called by 'addPharmacist'
  function _addPharmacist(address account) internal {
    
  }

  // Define an internal function '_removePharmacist' to remove this role, called by 'removePharmacist'
  function _removePharmacist(address account) internal {
    
  }
}