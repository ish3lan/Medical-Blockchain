App = {
    web3Provider: null,
    contracts: {},
    emptyAddress: "0x0000000000000000000000000000000000000000",
    sku: 0,
    upc: 0,
    metamaskAccountID: "0x0000000000000000000000000000000000000000",
    ownerID: "0x0000000000000000000000000000000000000000",
    originManufacturerID: "0x0000000000000000000000000000000000000000",
    originFactoryName: null,
    originFactoryInformation: null,
    originFactoryLatitude: null,
    originFactoryLongitude: null,
    medicineNotes: null,
    medicinePrice: 0,
    distributorID: "0x0000000000000000000000000000000000000000",
    pharmacistID: "0x0000000000000000000000000000000000000000",
    patientID: "0x0000000000000000000000000000000000000000",

    init: async function () {
        App.readForm();
        /// Setup access to blockchain
        return await App.initWeb3();
    },

    readForm: function () {
        App.sku = $("#sku").val();
        App.upc = $("#upc").val();
        App.ownerID = $("#ownerID").val();
        App.originManufacturerID = $("#originManufacturerID").val();
        App.originFactoryName = $("#originFactoryName").val();
        App.originFactoryInformation = $("#originFactoryInformation").val();
        App.originFactoryLatitude = $("#originFactoryLatitude").val();
        App.originFactoryLongitude = $("#originFactoryLongitude").val();
        App.medicineNotes = $("#medicineNotes").val();
        App.medicinePrice = $("#medicinePrice").val();
        App.distributorID = $("#distributorID").val();
        App.pharmacistID = $("#pharmacistID").val();
        App.patientID = $("#patientID").val();

        console.log(
            App.sku,
            App.upc,
            App.ownerID, 
            App.originManufacturerID, 
            App.originFactoryName, 
            App.originFactoryInformation, 
            App.originFactoryLatitude, 
            App.originFactoryLongitude, 
            App.medicineNotes, 
            App.medicinePrice, 
            App.distributorID, 
            App.pharmacistID, 
            App.patientID
        );
    },

    initWeb3: async function () {
        /// Find or Inject Web3 Provider
        /// Modern dapp browsers...
        if (window.ethereum) {
            App.web3Provider = window.ethereum;
            try {
                // Request account access
                await window.ethereum.enable();
            } catch (error) {
                // User denied account access...
                console.error("User denied account access")
            }
        }
        // Legacy dapp browsers...
        else if (window.web3) {
            App.web3Provider = window.web3.currentProvider;
        }
        // If no injected web3 instance is detected, fall back to Ganache
        else {
            App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        }

        App.getMetaskAccountID();

        return App.initSupplyChain();
    },

    getMetaskAccountID: function () {
        web3 = new Web3(App.web3Provider);

        // Retrieving accounts
        web3.eth.getAccounts(function(err, res) {
            if (err) {
                console.log('Error:',err);
                return;
            }
            console.log('getMetaskID:',res);
            App.metamaskAccountID = res[0];

        })
    },

    initSupplyChain: function () {
        /// Source the truffle compiled smart contracts
        var jsonSupplyChain='../../build/contracts/SupplyChain.json';
        
        /// JSONfy the smart contracts
        $.getJSON(jsonSupplyChain, function(data) {
            console.log('data',data);
            var SupplyChainArtifact = data;
            App.contracts.SupplyChain = TruffleContract(SupplyChainArtifact);
            App.contracts.SupplyChain.setProvider(App.web3Provider);
            
            App.fetchMedicineBufferOne();
            App.fetchMedicineBufferTwo();
            App.fetchEvents();

        });

        return App.bindEvents();
    },

    bindEvents: function() {
        $(document).on('click', App.handleButtonClick);
    },

    handleButtonClick: async function(event) {
        event.preventDefault();

        App.getMetaskAccountID();

        var processId = parseInt($(event.target).data('id'));
        console.log('processId',processId);

        switch(processId) {
            case 1:
                return await App.makeMedicine(event);
                break;
            case 2:
                return await App.processMedicine(event);
                break;
            case 3:
                return await App.packMedicine(event);
                break;
            case 4:
                return await App.sellMedicine(event);
                break;
            case 5:
                return await App.buyMedicine(event);
                break;
            case 6:
                return await App.shipMedicine(event);
                break;
            case 7:
                return await App.receiveMedicine(event);
                break;
            case 8:
                return await App.purchaseMedicine(event);
                break;
            case 9:
                return await App.fetchMedicineBufferOne(event);
                break;
            case 10:
                return await App.fetchMedicineBufferTwo(event);
                break;
            }
    },

    makeMedicine: function(event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.makeMedicine(
                App.upc, 
                App.metamaskAccountID, 
                App.originFactoryName, 
                App.originFactoryInformation, 
                App.originFactoryLatitude, 
                App.originFactoryLongitude, 
                App.medicineNotes
            );
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('makeMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    processMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.processMedicine(App.upc, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('processMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },
    
    packMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.packMedicine(App.upc, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('packMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    sellMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            const medicinePrice = web3.toWei(1, "ether");
            console.log('medicinePrice',medicinePrice);
            return instance.sellMedicine(App.upc, App.medicinePrice, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('sellMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    buyMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            const walletValue = web3.toWei(3, "ether");
            return instance.buyMedicine(App.upc, {from: App.metamaskAccountID, value: walletValue});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('buyMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    shipMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.shipMedicine(App.upc, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('shipMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    receiveMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.receiveMedicine(App.upc, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('receiveMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    purchaseMedicine: function (event) {
        event.preventDefault();
        var processId = parseInt($(event.target).data('id'));

        App.contracts.SupplyChain.deployed().then(function(instance) {
            return instance.purchaseMedicine(App.upc, {from: App.metamaskAccountID});
        }).then(function(result) {
            $("#ftc-medicine").text(result);
            console.log('purchaseMedicine',result);
        }).catch(function(err) {
            console.log(err.message);
        });
    },

    fetchMedicineBufferOne: function () {
    ///   event.preventDefault();
    ///    var processId = parseInt($(event.target).data('id'));
        App.upc = $('#upc').val();
        console.log('upc',App.upc);

        App.contracts.SupplyChain.deployed().then(function(instance) {
          return instance.fetchMedicineBufferOne(App.upc);
        }).then(function(result) {
          $("#ftc-medicine").text(result);
          console.log('fetchMedicineBufferOne', result);
        }).catch(function(err) {
          console.log(err.message);
        });
    },

    fetchMedicineBufferTwo: function () {
    ///    event.preventDefault();
    ///    var processId = parseInt($(event.target).data('id'));
                        
        App.contracts.SupplyChain.deployed().then(function(instance) {
          return instance.fetchMedicineBufferTwo.call(App.upc);
        }).then(function(result) {
          $("#ftc-medicine").text(result);
          console.log('fetchMedicineBufferTwo', result);
        }).catch(function(err) {
          console.log(err.message);
        });
    },

    fetchEvents: function () {
        if (typeof App.contracts.SupplyChain.currentProvider.sendAsync !== "function") {
            App.contracts.SupplyChain.currentProvider.sendAsync = function () {
                return App.contracts.SupplyChain.currentProvider.send.apply(
                App.contracts.SupplyChain.currentProvider,
                    arguments
              );
            };
        }

        App.contracts.SupplyChain.deployed().then(function(instance) {
        var events = instance.allEvents(function(err, log){
          if (!err)
            $("#ftc-events").append('<li>' + log.event + ' - ' + log.transactionHash + '</li>');
        });
        }).catch(function(err) {
          console.log(err.message);
        });
        
    }
};

$(function () {
    $(window).load(function () {
        App.init();
    });
});
