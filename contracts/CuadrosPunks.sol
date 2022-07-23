// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CuadrosPunks is ERC721 {
  
  constructor() ERC721("CuadrosPunks", "CPT") {}

}