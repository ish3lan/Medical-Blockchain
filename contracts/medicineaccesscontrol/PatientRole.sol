pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'PatientRole' to manage this role - add, remove, check
contract PatientRole {

  // Define 2 events, one for Adding, and other for Removing

  // Define a struct 'patients' by inheriting from 'Roles' library, struct Role

  // In the constructor make the address that deploys this contract the 1st patient
  constructor() public {
    
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyPatient() {
    
    _;
  }

  // Define a function 'isPatient' to check this role
  function isPatient(address account) public view returns (bool) {
    
  }

  // Define a function 'addPatient' that adds this role
  function addPatient(address account) public onlyPatient {
    
  }

  // Define a function 'renouncePatient' to renounce this role
  function renouncePatient() public {
    
  }

  // Define an internal function '_addPatient' to add this role, called by 'addPatient'
  function _addPatient(address account) internal {
    
  }

  // Define an internal function '_removePatient' to remove this role, called by 'removePatient'
  function _removePatient(address account) internal {
    
  }
}