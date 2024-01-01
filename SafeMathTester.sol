// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.18;

contract SafeMathTester {
    // uint8 public bigNumber = 255; // unchecked v 0.6.8;
    uint8 public bigNumber = 255; // checked v 0.8.0;

    // function add() public {
        // bigNumber = bigNumber + 1;

    // }

    function add() public {
      unchecked  {bigNumber = bigNumber + 1};
    }
}
