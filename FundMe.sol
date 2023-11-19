// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "./PriceConverter.sol";

//727,789
//727,789
//727,789
contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant minimumUsd = 50 * 10 ** 18;
    address[] public funders;
    mapping(address => uint256) public  addressToAmountFunded;

    //this will store the owner address who deploy contract
    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;
    }


    function fund() public payable {
        uint256 ethAmountInUsd = msg.value.getConversionRate();
        require(ethAmountInUsd >= minimumUsd, "Please send at least 50 USDT worth of ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        // rest of your code
    }

    function withdraw() public{
       
        //make the amount of all user to 0
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array by adding the new address array with 0 object
        funders = new address[](0);

        //withdraw the funds

        // there is 3 methods to withdraw funds 

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed");

    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "sender is not owner only owner can withdraw fund");
        // _; mean 1st do do reuire line and then do the rest of the code 
        _;
    }
    
    //these function are special function if user dont call the fund function to send money it will automatically call the fund function 
    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }
    
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "./PriceConverter.sol";

//727,789
//727,789
//727,789
contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant minimumUsd = 50 * 10 ** 18;
    address[] public funders;
    mapping(address => uint256) public  addressToAmountFunded;

    //this will store the owner address who deploy contract
    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;
    }


    function fund() public payable {
        uint256 ethAmountInUsd = msg.value.getConversionRate();
        require(ethAmountInUsd >= minimumUsd, "Please send at least 50 USDT worth of ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        // rest of your code
    }

    function withdraw() public{
       
        //make the amount of all user to 0
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array by adding the new address array with 0 object
        funders = new address[](0);

        //withdraw the funds

        // there is 3 methods to withdraw funds 

        //transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed");

    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "sender is not owner only owner can withdraw fund");
        // _; mean 1st do do reuire line and then do the rest of the code 
        _;
    }
    
    //these function are special function if user dont call the fund function to send money it will automatically call the fund function 
    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }

    //lessons 5 started
    // setup for lesson 5
    
}
