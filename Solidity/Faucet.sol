// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity ^0.8.11;

contract Faucet {
  // Accept any incoming amount
  receive() external payable{}

  // Give out ether to anyone who asks
  function withdraw(uint withdraw_amount) public {
    // Limit withdraw amount
    require(withdraw_amount <= 100000000000000000);

    // Send the amount to the address that requiested it
    payable(msg.sender).transfer(withdraw_amount);
  }
}