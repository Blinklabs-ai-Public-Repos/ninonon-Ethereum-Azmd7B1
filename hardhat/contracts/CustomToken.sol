// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title CustomToken
 * @dev Implementation of a capped ERC20 token with customizable name, symbol, and max supply.
 * This contract inherits from ERC20Capped and Ownable to provide capped supply functionality
 * and restricted minting capabilities.
 */
contract CustomToken is ERC20Capped, Ownable {
    /**
     * @dev Constructor that sets the name, symbol, and max supply of the token.
     * @param name_ The name of the token.
     * @param symbol_ The symbol of the token.
     * @param maxSupply_ The maximum supply of the token.
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 maxSupply_
    ) ERC20(name_, symbol_) ERC20Capped(maxSupply_) {
        // The ERC20Capped constructor is called with maxSupply_
    }

    /**
     * @dev Function to mint new tokens. Only the contract owner can call this function.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 amount) public onlyOwner returns (bool) {
        _mint(to, amount);
        return true;
    }

    /**
     * @dev Internal function that is called for any token transfer, including mints and burns.
     * It includes the capped supply check from ERC20Capped.
     * @param to Address tokens are sent to.
     * @param amount The amount of tokens transferred.
     */
    function _mint(address to, uint256 amount) internal override(ERC20Capped) {
        super._mint(to, amount);
    }
}