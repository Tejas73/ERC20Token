# ERC20Token
 Developed an ERC20 token contract with a staking mechanism that provides rewards based on staking duration
 
# MyToken Contract

This repository contains the smart contract code for the MyToken ERC20 token.

## Overview

The MyToken contract is an ERC20 token implementation that allows users to stake and unstake tokens. It includes functionality for minting tokens, setting the reward rate, and setting the minimum stake duration.

## Deployment

The contract has been deployed on the [Ethereum](https://ethereum.org/) network. You can find the deployed contract at the following address:

Contract Address: [0x123ABC...](https://etherscan.io/address/0x123ABC...)

## Usage

To interact with the MyToken contract, you can use any Ethereum wallet or web3 provider. Connect your wallet to the Ethereum network and use the contract's address and ABI to interact with its functions.

Make sure to approve the contract to spend your tokens before staking or unstaking. You can call the `approve` function on the token contract with the desired amount of tokens and the address of the MyToken contract.

The available functions in the MyToken contract are as follows:

- `stake(uint256 amount, uint256 duration)`: Stake a specified amount of tokens for a given duration.
- `unstake()`: Unstake the currently staked tokens and claim the rewards.
- `setRewardRate(uint256 rate)`: Set the reward rate for staking rewards.
- `setMinStakeDuration(uint256 duration)`: Set the minimum duration for staking.

## Development

To develop and test the MyToken contract locally, you can use the Remix IDE or any other Solidity development environment. The contract uses the OpenZeppelin library for ERC20 functionality and access control.

## License

This project is licensed under the [MIT License](LICENSE).
