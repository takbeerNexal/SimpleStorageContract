// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 50 * 10 ** 18;
    address[] public funders;
    mapping(address => uint256) public  addressToAmountFunded;

    function fund() public payable {
        uint256 ethAmountInUsd = getConversionRate(msg.value);
        require(ethAmountInUsd >= minimumUsd, "Please send at least 50 USDT worth of ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        // rest of your code
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
