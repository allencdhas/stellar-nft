// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract StellarNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Woah!");
    }

    // A function our user will hit to get their NFT.
    function makeAnNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Return the NFT's metadata
        tokenURI(newItemId);

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }

    // Set the NFT's metadata
    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        require(_exists(_tokenId));
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            _tokenId,
            msg.sender
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    "ewogICAgIm5hbWUiOiAiU3RlbGxhciBDb3Jwc2UiLAogICAgImRlc2NyaXB0aW9uIjogIlN0ZWxsYXIncyBmaXJzdCBORlQiLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIQnlaWE5sY25abFFYTndaV04wVW1GMGFXODlJbmhOYVc1WlRXbHVJRzFsWlhRaUlIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJajRLSUNBZ0lEeHpkSGxzWlQ0dVltRnpaU0I3SUdacGJHdzZJSGRvYVhSbE95Qm1iMjUwTFdaaGJXbHNlVG9nYzJWeWFXWTdJR1p2Ym5RdGMybDZaVG9nTVRSd2VEc2dmVHd2YzNSNWJHVStDaUFnSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0FnSUR4MFpYaDBJSGc5SWpVd0pTSWdlVDBpTlRBbElpQmpiR0Z6Y3owaVltRnpaU0lnWkc5dGFXNWhiblF0WW1GelpXeHBibVU5SW0xcFpHUnNaU0lnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJK1UzUmxiR3hoY2lCRGIzSndjMlU4TDNSbGVIUStDand2YzNablBnPT0iCn0=="
                )
            );
    }
}
