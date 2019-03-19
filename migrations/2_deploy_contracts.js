// migrating the appropriate contracts
var ManufacturerRole = artifacts.require("./ManufacturerRole.sol");
var DistributorRole = artifacts.require("./DistributorRole.sol");
var PharmacistRole = artifacts.require("./PharmacistRole.sol");
var PatientRole = artifacts.require("./PatientRole.sol");
var SupplyChain = artifacts.require("./SupplyChain.sol");

module.exports = function(deployer) {
  deployer.deploy(ManufacturerRole);
  deployer.deploy(DistributorRole);
  deployer.deploy(PharmacistRole);
  deployer.deploy(PatientRole);
  deployer.deploy(SupplyChain);
};
