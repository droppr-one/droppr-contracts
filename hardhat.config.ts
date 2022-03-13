import * as dotenv from "dotenv";

import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";

dotenv.config();
const PRIVATE_KEY =
  process.env.PRIVATE_KEY ||
  "0xabc123abc123abc123abc123abc123abc123abc123abc123abc123abc123abc1";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  networks: {
    andromeda: {
      url: "https://andromeda.metis.io/?owner=1088",
      accounts: [PRIVATE_KEY],
    },
    stardust: {
      url: "https://stardust.metis.io/?owner=588",
      accounts: [PRIVATE_KEY],
    },
    fuse: {
      url: "https://rpc.fuse.io",
      accounts: [PRIVATE_KEY],
    },
    spark: {
      url: "https://rpc.fusespark.io",
      accounts: [PRIVATE_KEY],
    },
  },
};

export default config;
