// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity >=0.4.22 <0.9.0;

import './Faucet.sol';

contract Token is Mortal {
  Faucet _faucet;

  constructor(address payable _f) payable {
    _faucet = Faucet(_f);

  }

  function destroy() override public onlyOwner {
    _faucet.destroy();
    _faucet.withdraw(0.1 ether);
  }
}