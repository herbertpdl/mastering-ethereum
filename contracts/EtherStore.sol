// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity ^0.8.11;

contract EtherStore {
  uint public withdrawalLimit = 1 ether;
  mapping(address => uint256) public lastWithdrawTime;
  mapping(address => uint256) public balances;

  function depositFunds() external payable {
    balances[msg.sender] += msg.value;
  }

  function withdrawFunds (uint _weiToWithdraw) public {
    require(balances[msg.sender] >= _weiToWithdraw);
    
    // limit the withdrawal
    require(_weiToWithdraw <= withdrawalLimit);

    // limit the time allowed to withdraw
    require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);

    require(msg.sender.call{ value: _weiToWithdraw }(""));
    balances[msg.sender] -= _weiToWithdraw;
    lastWithdrawTime[msg.sender] = block.timestamp;
  }
}