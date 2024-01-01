# FundMe Smart Contract Project

This repository contains a Solidity smart contract for a crowdfunding application. The project consists of two main components: the `FundMe` contract and the `PriceConverter` library. 

## FundMe Smart Contract

The `FundMe` contract allows users to fund the contract with Ether and the owner to withdraw the funds. The contract also includes functionality to convert the Ether amount to USD and set a minimum funding value in USD.

### Usage

Once the contract is deployed, users can fund the contract by sending Ether. The `fund()` function allows users to send Ether and the `withdraw()` function allows the owner to withdraw the funds.

The `fund()` function checks if the sent Ether amount converted to USD is greater than or equal to the minimum USD. If it is, the sender is added to the `funders` array and the amount funded is recorded.

The `withdraw()` function resets the `funders` array and the `addressToAmountFunded` mapping, then sends all the contract's Ether balance to the owner.

## PriceConverter Library

The `PriceConverter` library is used to convert Ether amounts to USD. It uses the Chainlink Aggregator V3 Interface to fetch the latest Ether price in USD.

### Usage

The `getPrice()` function retrieves the latest Ether price in USD. The `getConversionRate()` function converts an Ether amount to USD using the latest price. The `getVersion()` function returns the version of the price feed.

## Installation

To install the project, follow these steps:

1. Clone the repository:
 ```
 git clone https://github.com/YourUsername/FundMe.git
 ```
2. Navigate to the project directory:
 ```
 cd FundMe
 ```
3. Install the required dependencies:
 ```
 npm install
 ```

## Testing

To run the tests, use the following command:

```
truffle test
```

## Contributing

Contributions are welcome. Please follow these steps:

1. Fork the repository.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
