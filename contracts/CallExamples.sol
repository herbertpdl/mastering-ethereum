// SPDX-License-Identifier: CC-BY-SA-4.0

pragma solidity >=0.4.22 <0.9.0;

contract calledContract {
  event callEvent(address sender, address origin, address from);
  function calledFunction() public {
    emit callEvent(msg.sender, tx.origin, address(this));
  }
}

library calledLibrary {
  event callEvent(address sender, address origin, address from);
  function calledFunction() public {
    emit callEvent(msg.sender, tx.origin, address(this));
  }
}

contract caller {
  function make_calls(calledContract _calledContract) public {
    // Calling calledContract and calledLibrary directly
    _calledContract.calledFunction();
    calledLibrary.calledFunction();

    // Low-level calls using the address object calledContract
    require(address(_calledContract).
           call(abi.encode(bytes4(keccak256("calledFunction()")))));
    require(address(_calledContract).
            delegatecall(abi.encode(bytes4(keccak256("calledFunction()")))));
  }
}