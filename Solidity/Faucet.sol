// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity ^0.8.11;

contract Faucet {
  address payable owner;

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  // Initialize Faucet contract: set owner
  constructor() {
    owner = payable(msg.sender);
  }

  // Contract destructor
  function destroy() public onlyOwner {
    selfdestruct(owner);
  }

  // Accept any incoming amount
  receive() external payable{}

  // Give out ether to anyone who asks
  function withdraw(uint withdraw_amount) public {
    // Limit withdraw amount
    require(withdraw_amount <= 0.1 ether);

    // Send the amount to the address that requiested it
    payable(msg.sender).transfer(withdraw_amount);
  }
}