import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";

dotenv.config({path: '.env'});

const { URL_MUMBAI, WALLET_KEY } = process.env

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
    },
    mumbai: {
      url: URL_MUMBAI,
      accounts: [
        `${WALLET_KEY}`
      ],
    },
  },
};

export default config;
