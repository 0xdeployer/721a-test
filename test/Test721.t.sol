// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Test721.sol";

contract TestsForTest721 is Test {
    Test721 public test721;

    function setUp() public {
        test721 = new Test721();
    }

    function testInternalTransfer() public {
        test721.mint(10);
        test721.transferFrom(address(this), address(test721), 1);
        test721.transferFromContract(1);
    }
}
