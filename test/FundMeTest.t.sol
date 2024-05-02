// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from 'forge-std/Test.sol';
import {FundMe} from '../src/FundMe.sol';
import {DeployFundMe} from '../script/DeployFundMe.s.sol';

contract FundMeTest is Test{
  FundMe fundMe;

  function setUp() external{
    // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    DeployFundMe deployFundMe = new DeployFundMe();
    fundMe = deployFundMe.run();
  }
  function testMiniumDollarIsFive() public view {
    assertEq(fundMe.MINIMUM_USD(), 5e18);
  }

  function testOwnerIsMsgSender() public view {
    console.log(fundMe.i_owner());
    console.log(msg.sender);
    console.log(address(this));
    assertEq(fundMe.i_owner(), msg.sender);
  }

  function testPriceFeedVersion() public view {
    assertEq(fundMe.getVersion(), 4);
  }
}
