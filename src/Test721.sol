pragma solidity ^0.8.13;
import "ERC721A/ERC721A.sol";

contract Test721 is ERC721A {
    constructor() ERC721A("Azuki", "AZUKI") {}

    function mint(uint256 quantity) external payable {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
        _mint(msg.sender, quantity);
    }

    error ContractNotOwner();

    function transferFromContract(uint tokenId) external {
        if(ownerOf(tokenId) != address(this)) {
            revert ContractNotOwner();
        }
        transferFrom(ownerOf(tokenId), msg.sender, tokenId);
    }
}