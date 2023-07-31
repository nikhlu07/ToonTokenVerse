// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract ToonToken is ERC20 {
    address public owner;

    constructor() ERC20("ToonToken", "TNT") {
        owner = msg.sender;
        _mint(msg.sender, 1000 * 10**uint(decimals()));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    function mint(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        transfer(to, amount);
    }

    function watchCartoon() public pure returns (string memory) {
    return "Watching cartoons with ToonToken!";
}

}
