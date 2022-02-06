// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity >=0.4.22 <0.9.0;

import './Faucet.sol';

contract Token is Mortal {
  Faucet _faucet;

  constructor() payable {
    _faucet = (new Faucet){value: 0.5 ether}();
  }

  function destroy() override public onlyOwner {
    _faucet.destroy();
  }
}