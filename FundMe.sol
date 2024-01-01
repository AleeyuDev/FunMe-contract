// get funds from users

// withdraw funds

// set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // allow users to send $
        // have a minmum $ sent $5
        // require(getConversionRate(msg.value) >= minimumUsd, "you dont have enough ETH");
        funders.push(msg.sender);

        // msg.value.getConversionRate();
        require(
            msg.value.getConversionRate() >= minimumUsd,
            "you dont have enough ETH"
        );
        addressToAmountFunded[msg.sender] += msg.value;

        // How do we send Eth to this contract?
        // The Eth will be automatically sent to the contract when this function is called.
    }

    function withdraw() public onlyOwner {
        //   require(msg.sender == owner, "must be owner");
        // forr loop
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // withdraw fund
        // retseting an array

        // transfer:=== (2300 gas , throws error, revert the the transanction)
        // msg.sender = address
        // payable(msg.sender) = payble address
        // payable(msg.sender).transfer(address(this).balance)

        //     // send = (2300 gas , returns bool)
        //    bool sendeSucesss =  payable(msg.sender).send(address(this).balance) // it wont revert th tx
        //    require(sendeSucesss, "send failed" )

        // call= (forward all gas or set gas, returns bool)
        //  we can use it to call any virtual  funct in  any ethereum
        // without having abi
        //  low level
        //    (bool callSuccess, bytes memory  dataReturned ) =  (msg.sender).call{value: (this).balance}(" ")  // it return two variable
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }(""); // it return two variable
        require(callSuccess, "call failed");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "sender its not owner!");
        _;
    }
}

// //  get  funds from users

// // // withdraw funds

// // set a minimum funding value in USD

// pragma solidity ^0.8.18;

// import {AggregetorV#Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"

// contract FundMe {

//     uint256   public  minimumUsd = 5e18;
//     function fund() public payable {
//         //  allow users to send $
//         //  have a minmum $ sent $5
//         //   require( msg.value >  1e18, "you dont have enough ETH" )  //  1e18 = 1 ETH 1000000000000000  1 * 10 ** 18
//           require( getConversionRate(  msg.value) >= minimumUsd , "you dont have enough ETH" )  //  1e18 = 1 ETH 1000000000000000  1 * 10 ** 18
//         //  How do we send Eth to this contarct ?

//          // reverts  :  undo any action that have been
//         //  done and send the remaining gas back

//         function getLatestPrice()  public  view returns(uint256) {
//             //  Address
//             //  ABI
//             AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)

//         // (uint80 rounId,int256 price , uint256 startAt, uint256 timestamp, uint80 answeredInRound ) priceFeed.latestRoundData()
//         (,int256 price , , ,  ) priceFeed.latestRoundData()
//         // price of Eth in terms of USD
//         // solidity dont work with decimals
//         // 2000.00000000
//         return uint256(price * 1e10);

//         }

//        function  getConversionRate (uint256 ethAmount) public  view returns(uint256){

//           uint256  ethPrice = getLatestPrice();
//             uint256   ethAmountInUsd   = (ethPrice * ethAmount) / 1e18;
//             return ethAmountInUsd;

//               }

//               function  getVersion() public view returns (uint256)  {
//             AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

//               }

//     }

//     // function withdraw() public {}
// }
