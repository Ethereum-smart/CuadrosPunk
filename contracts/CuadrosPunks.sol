// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract CuadrosPunks is ERC721, ERC721Enumerable {

  using Counters for Counters.Counter;

  Counters.Counter private _idCounter;
  
  uint256 public maxSupply;
  address owner;
  
  constructor( uint256 _maxSupply ) ERC721("CuadrosPunks", "CPT") {
    maxSupply = _maxSupply;
    owner = msg.sender;
  }

  modifier checkSupply {
    require( 
      _idCounter.current() < maxSupply,
      "No more nfts can be minted"   
    );
    _;
  }

  function mint() public virtual payable checkSupply {
    uint256 currentTokenId = _idCounter.current();
    require( 
      msg.value == 100000000000000000, 
      "Not enough ETH sent; check price!"
    );
    payable(owner).transfer(msg.value);
    _safeMint( msg.sender, currentTokenId );
    _idCounter.increment();
  }

  function tokenURI(uint256 tokenId) public view override returns( string memory ) {
    require( 
      _exists(tokenId), 
      "ERC721 Metadata: URI query for nonexistent token"
    );

    bytes memory jsonURI = abi.encodePacked(
        '{ "name": "CuadrosPunks',
        tokenId,
        '","description": "Cuadros Punk", "image":"',
        "// TODO: IMAGE"
        '"}'
      );
    

    return string(
      abi.encodePacked(
          "data:application/json;base64,",
          Base64.encode(jsonURI)
      )
    );
  }

  function _beforeTokenTransfer(address from, address to, uint256 tokenId)
    internal
    override(ERC721, ERC721Enumerable)
  {
    super._beforeTokenTransfer(from, to, tokenId);
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }

}