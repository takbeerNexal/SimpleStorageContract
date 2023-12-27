// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract SimpleStorage {

    uint256 number;
    uint256 favoriteNumber;

// map the array like we use in javascript
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

// array of people
    People[] public people;

    // function store(uint256 _favoriteNumber) public{
    //      favoriteNumber = _favoriteNumber;
    // }

 // add person to People array
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name:_name});
        
        // push the users
        people.push(People(_favoriteNumber,_name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


// store the value in blockchain
    function store(uint256 _favoriteNumber) public {
       favoriteNumber = _favoriteNumber;
    }

   // print the store value
    function retrieve()public view returns(uint256) {
        return favoriteNumber;
    }

}