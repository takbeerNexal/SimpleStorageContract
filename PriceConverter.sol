// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// custom library for converting price
//asdfasd

library PriceConverter{
    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

// calling the external Library for geeting prices from  third party
    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

// get rate of converstion rate price
    function getConversionRate(uint256 ethAmount) internal  view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}