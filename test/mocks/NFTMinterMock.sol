// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { INFT } from "src/interfaces/INFT.sol";
import { INFTMinter } from "src/interfaces/INFTMinter.sol";

contract NFTMinterMock is INFTMinter {
    address immutable nft;

    constructor(address _nft) {
        nft = _nft;
    }

    function isAirdrop(uint256) external pure returns (bool) {
        return false;
    }

    function increaseBogoOf(address account) external { }

    function mint(uint256 amount) external payable {
        INFT(nft).draw{ value: msg.value }(amount, msg.sender);
    }

    function onMint(uint256 tokenId, uint256 amount, address to) external {
        // Empty
    }
}
