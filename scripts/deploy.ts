import { ethers } from "hardhat";

const deploy = async () => {

  // Info on the deployed contract
  const [ deployer ] = await ethers.getSigners();
  console.log("deploy contract", deployer.address);

  // Deploy the contract
  const Token = await ethers.getContractFactory("CuadrosPunks");
  const deployed = await Token.deploy();
  console.log("contract has been deployed", deployed.address);

}

deploy().then(() => {
  process.exit(0)
}).catch((error) => {
  console.error(error)
  process.exit(1)
});