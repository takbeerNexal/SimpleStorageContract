// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //created simple storage array for simpleStorage contract
    SimpleStorage[] public simpleStorageArray;

// we can create contract from another contract via this function 
    function createSimpleStorageContract() public  {
        //create the contract
        SimpleStorage simpleStorage = new SimpleStorage();

        //pushed the address of newly contract address to simpleStorageArray
        simpleStorageArray.push(simpleStorage);
    }  


 // call the function in another contract and save the value in that function 
   function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber ) public{
   // send the index number to simpleStorageArray and save the favorite number on this index
   SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
   simpleStorage.store(_simpleStorageNumber);
   }

  //get the value of another contract function from this contract
   function sfGet(uint256 _simpleStorageIndex) public  view returns(uint256){

    //send the index number and get the value which are stored on that index
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorageArray[_simpleStorageIndex].retrieve();

   }
}