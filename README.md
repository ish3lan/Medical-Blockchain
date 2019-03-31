
# Architect a Blockchain Medical Supply Chain Solution
_Udacity Blockchain Nanodegree - Project 7_

<br>
#Project write-up: <br> 

  - UML: <br>

    - State Diagram: <br>

      <img src="State.png">

    - Activity Diagram: <br>

      <img src="Activity.png">

    - Data Model Diagram: <br>

      <img src="Data Model.png">

    - Sequence Diagram: <br>

      <img src="Sequence.png">
  - Libraries Documentation: <br>
  


  - IPFS Documentation: <br>
    IPFS is not used to host static files such as html/js/css/imgs. IPFS should ensure full decentralization of this project.



  - HD Wallet: <br>
    Connecting to rinkeby network using infura






  - Versions: <br>
  *Node:* v11.2.0 <br>
  *Truffle:* v5.0.2 (core: 5.0.2) <br>
  *Solidity* 0.4.24 (solc-js) <br>
  *Web3:* 1.0.0-beta.51 <br>

  




# Medical-Blockchain
This blockchain dapp shows the contribution it can add to the medical field, by tracking medicine from the moment it is manufactured till it reaches the patient.


#Contracts deployment output:

Starting migrations...
======================
> Network name:    'rinkeby'
> Network id:      4
> Block gas limit: 7001609


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x62af6080db7a126e50a6b23641ef7a3c695b8ecf2e10dfedc231e5f84ddefeae
   > Blocks: 0            Seconds: 9
   > contract address:    0x1BeccA6dc31a65029cFC5A4812A35ff42115290d
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.099711443222213392
   > gas used:            277462
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.000277462 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:         0.000277462 ETH


2_deploy_contracts.js
=====================

   Deploying 'ManufacturerRole'
   ----------------------------
   > transaction hash:    0x9a23082eaeb6ced0a6339cd233bc946957789371c465e22d30a80c6db1b60384
   > Blocks: 0            Seconds: 9
   > contract address:    0x95cc2F672C78c90Eef6F52015b74e0de49F85D35
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.099289105222213392
   > gas used:            380330
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.00038033 ETH


   Deploying 'DistributorRole'
   ---------------------------
   > transaction hash:    0x0fafa79db7bf45bc37f0e5383ecc9def8ed2dd467abdde7a78a50e290f42883b
   > Blocks: 0            Seconds: 9
   > contract address:    0x3A863d01F5c23B0c5fDA62f8E3878e37C7946832
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.098908903222213392
   > gas used:            380202
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.000380202 ETH


   Deploying 'PharmacistRole'
   --------------------------
   > transaction hash:    0x836b7e4190379ee2f6eb94b3118d2c5d0854c776a657ed6cfe01aab3f455c92f
   > Blocks: 0            Seconds: 9
   > contract address:    0x8B3fe04804552B929058a879662856Dd3D107883
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.098528701222213392
   > gas used:            380202
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.000380202 ETH


   Deploying 'PatientRole'
   -----------------------
   > transaction hash:    0xdd299cba520a28f55225edf845a7725b05de920324aad706d17d4830e8b0c315
   > Blocks: 0            Seconds: 9
   > contract address:    0x75163E16d6eA79462835D48f5C5Ae793FF35B874
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.098148499222213392
   > gas used:            380202
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.000380202 ETH


   Deploying 'SupplyChain'
   -----------------------
   > transaction hash:    0xe1b88cc1d8bc9c669cb9969e1f42086decac73be539709cd8c2d2fac1690c445
   > Blocks: 0            Seconds: 9
   > contract address:    0x33d839692456381d4D741095B89f523E805a00FB
   > account:             0x2d5faBF0533647E18dc4e96CdD447EF0045Db32B
   > balance:             2.095517993222213392
   > gas used:            2630506
   > gas price:           1 gwei
   > value sent:          0 ETH
   > total cost:          0.002630506 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:         0.004151442 ETH


Summary
=======
> Total deployments:   6
> Final cost:          0.004428904 ETH

