require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
      forking: {
        url: "https://goerli.infura.io/v3/{key}",
      },
      allowUnlimitedContractSize:true
    },
  },
  solidity: {
    version: "0.8.17",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 40000
  }
}


