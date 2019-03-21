pragma solidity ^0.4.24;
// Define a contract 'Supplychain'
contract SupplyChain {

  // Define 'owner'
  address owner;

  // Define a variable called 'upc' for Universal Product Code (UPC)
  uint  upc;

  // Define a variable called 'sku' for Stock Keeping Unit (SKU)
  uint  sku;

  // Define a public mapping 'medicines' that maps the UPC to an Medicine.
  mapping (uint => Medicine) medicines;

  // Define a public mapping 'medicinesHistory' that maps the UPC to an array of TxHash, 
  // that track its journey through the supply chain -- to be sent from DApp.
  mapping (uint => string[]) medicinesHistory;
  
  // Define enum 'State' with the following values:
  enum State 
  { 
    Made,       // 0
    Packed,     // 1
    ForSale,    // 2
    Sold,       // 3
    Shipped,    // 4
    Received,   // 5
    Purchased   // 6
  }

  State constant defaultState = State.Made;

  // Define a struct 'Medicine' with the following fields:
  struct Medicine {
    uint    sku;  // Stock Keeping Unit (SKU)
    uint    upc; // Universal Product Code (UPC), generated by the Manufacturer, goes on the package, can be verified by the Patient
    address ownerID;  // Metamask-Ethereum address of the current owner as the medicine moves through 8 stages
    address originManufacturerID; // Metamask-Ethereum address of the Manufacturer
    string  originFactoryName; // Manufacturer Name
    string  originFactoryInformation;  // Manufacturer Information
    string  originFactoryLatitude; // Factory Latitude
    string  originFactoryLongitude;  // Factory Longitude
    uint    medicineID;  // Product ID potentially a combination of upc + sku
    string  medicineNotes; // Product Notes
    uint    medicinePrice; // Product Price
    State   medicineState;  // Product State as represented in the enum above
    address distributorID;  // Metamask-Ethereum address of the Distributor
    address pharmacistID; // Metamask-Ethereum address of the Pharmacist
    address patientID; // Metamask-Ethereum address of the Patient
  }

  // Define 8 events with the same 7 state values and accept 'upc' as input argument
  event Made(uint upc);
  event Packed(uint upc);
  event ForSale(uint upc);
  event Sold(uint upc);
  event Shipped(uint upc);
  event Received(uint upc);
  event Purchased(uint upc);

  // Define a modifer that checks to see if msg.sender == owner of the contract
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // Define a modifer that verifies the Caller
  modifier verifyCaller (address _address) {
    require(msg.sender == _address); 
    _;
  }

  // Define a modifier that checks if the paid amount is sufficient to cover the price
  modifier paidEnough(uint _price) { 
    require(msg.value >= _price); 
    _;
  }
  
  // Define a modifier that checks the price and refunds the remaining balance
  modifier checkValue(uint _upc) {
    _;
    uint _price = medicines[_upc].medicinePrice;
    uint amountToReturn = msg.value - _price;
    medicines[_upc].patientID.transfer(amountToReturn);
  }

  // Define a modifier that checks if an medicine.state of a upc is Made
  modifier made(uint _upc) {
    require(medicines[_upc].medicineState == State.Made);
    _;
  }
  
  // Define a modifier that checks if an medicine.state of a upc is Packed
  modifier packed(uint _upc) {
    require(medicines[_upc].medicineState == State.Packed);

    _;
  }

  // Define a modifier that checks if an medicine.state of a upc is ForSale
  modifier forSale(uint _upc) {
    require(medicines[_upc].medicineState == State.ForSale);

    _;
  }

  // Define a modifier that checks if an medicine.state of a upc is Sold
  modifier sold(uint _upc) {
    require(medicines[_upc].medicineState == State.Sold);

    _;
  }
  
  // Define a modifier that checks if an medicine.state of a upc is Shipped
  modifier shipped(uint _upc) {
    require(medicines[_upc].medicineState == State.Shipped);

    _;
  }

  // Define a modifier that checks if an medicine.state of a upc is Received
  modifier received(uint _upc) {
    require(medicines[_upc].medicineState == State.Received);

    _;
  }

  // Define a modifier that checks if an medicine.state of a upc is Purchased
  modifier purchased(uint _upc) {
    require(medicines[_upc].medicineState == State.Purchased);
    _;
  }

  // In the constructor set 'owner' to the address that instantiated the contract
  // and set 'sku' to 1
  // and set 'upc' to 1
  constructor() public payable {
    owner = msg.sender;
    sku = 1;
    upc = 1;
  }

  // Define a function 'kill' if required
  function kill() public {
    if (msg.sender == owner) {
      selfdestruct(owner);
    }
  }

  // Define a function 'makeMedicine' that allows a manufacturer to mark a medicine 'Made'
  function makeMedicine(uint _upc, address _originManufacturerID, string _originFactoryName, string _originFactoryInformation, string  _originFactoryLatitude, string  _originFactoryLongitude, string  _medicineNotes) public
  onlyManufacturer

  {
      // Add the new medicine as part of medicines
      Medicine memory temp_medicine = Medicine({
        sku:sku + 1,
        ownerID:_originManufacturerID,
        originManufacturerID:_originManufacturerID,
        originFactoryName:_originFactoryName,
        originFactoryInformation:_originFactoryInformation,
        originFactoryLatitude:_originFactoryLatitude,
        originFactoryLongitude:_originFactoryLongitude,
        medicineNotes:_medicineNotes
        });


    // Increment sku
    sku = sku + 1;
    // Emit the appropriate event
    emit Made(_upc);
  }


  // Define a function 'packMedicine' that allows a manufacturer to mark an medicine 'Packed'
  function packMedicine(uint _upc) public 
  // Call modifier to check if upc has passed previous supply chain stage
  isMade
  // Call modifier to verify caller of this function
  onlyManufacturer
  {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'sellMedicine' that allows a manufacturer to mark an medicine 'ForSale'
  function sellMedicine(uint _upc, uint _price) public 
  // Call modifier to check if upc has passed previous supply chain stage
  
  // Call modifier to verify caller of this function
  
  {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'buyMedicine' that allows the disributor to mark an medicine 'Sold'
  // Use the above defined modifiers to check if the medicine is available for sale, if the buyer has paid enough, 
  // and any excess ether sent is refunded back to the buyer
  function buyMedicine(uint _upc) public payable 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Call modifer to check if buyer has paid enough
    
    // Call modifer to send any excess ether back to buyer
    
    {

    // Update the appropriate fields - ownerID, distributorID, medicineState
    
    // Transfer money to manufacturer
    
    // emit the appropriate event
    
  }

  // Define a function 'shipMedicine' that allows the distributor to mark an medicine 'Shipped'
  // Use the above modifers to check if the medicine is sold
  function shipMedicine(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Call modifier to verify caller of this function
    
    {
    // Update the appropriate fields
    
    // Emit the appropriate event
    
  }

  // Define a function 'receiveMedicine' that allows the pharmacist to mark an medicine 'Received'
  // Use the above modifiers to check if the medicine is shipped
  function receiveMedicine(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Access Control List enforced by calling Smart Contract / DApp
    {
    // Update the appropriate fields - ownerID, pharmacistID, medicineState
    
    // Emit the appropriate event
    
  }

  // Define a function 'purchaseMedicine' that allows the patient to mark an medicine 'Purchased'
  // Use the above modifiers to check if the medicine is received
  function purchaseMedicine(uint _upc) public 
    // Call modifier to check if upc has passed previous supply chain stage
    
    // Access Control List enforced by calling Smart Contract / DApp
    {
    // Update the appropriate fields - ownerID, patientID, medicineState
    
    // Emit the appropriate event
    
  }

  // Define a function 'fetchMedicineBufferOne' that fetches the data
  function fetchMedicineBufferOne(uint _upc) public view returns 
  (
    uint    medicineSKU,
    uint    medicineUPC,
    address ownerID,
    address originManufacturerID,
    string  originFactoryName,
    string  originFactoryInformation,
    string  originFactoryLatitude,
    string  originFactoryLongitude
    ) 
  {
  // Assign values to the 8 parameters
  

  return 
  (
    medicineSKU,
    medicineUPC,
    ownerID,
    originManufacturerID,
    originFactoryName,
    originFactoryInformation,
    originFactoryLatitude,
    originFactoryLongitude
    );
}

  // Define a function 'fetchMedicineBufferTwo' that fetches the data
  function fetchMedicineBufferTwo(uint _upc) public view returns 
  (
    uint    medicineSKU,
    uint    medicineUPC,
    uint    medicineID,
    string  medicineNotes,
    uint    medicinePrice,
    uint    medicineState,
    address distributorID,
    address pharmacistID,
    address patientID
    ) 
  {
    // Assign values to the 9 parameters

    
    return 
    (
      medicineSKU,
      medicineUPC,
      medicineID,
      medicineNotes,
      medicinePrice,
      medicineState,
      distributorID,
      pharmacistID,
      patientID
      );
  }
}
