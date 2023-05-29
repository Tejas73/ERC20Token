// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 public rewardRate;
    uint256 public minStakeDuration;

    mapping(address => uint256) public stakeStartTime;

    event Stake(address indexed staker, uint256 amount, uint256 duration);
    event Unstake(address indexed staker, uint256 amount, uint256 reward);

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSupply
    ) ERC20(_name, _symbol) {
        _mint(msg.sender, _totalSupply);
        rewardRate = 1; // 1 token per second
        minStakeDuration = 1 hours;
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    function stake(uint256 amount, uint256 duration) external {
        require(amount > 0, "Invalid amount");
        require(duration >= minStakeDuration, "Stake duration too short");

        transfer(address(this), amount);
        stakeStartTime[msg.sender] = block.timestamp;

        emit Stake(msg.sender, amount, duration);
    }

    function unstake() external {
        uint256 stakedAmount = balanceOf(address(this));
        require(stakedAmount > 0, "No tokens staked");

        uint256 stakedDuration = block.timestamp - stakeStartTime[msg.sender];
        uint256 reward = stakedAmount * rewardRate * stakedDuration;

        transfer(msg.sender, stakedAmount);
        stakeStartTime[msg.sender] = 0;

        emit Unstake(msg.sender, stakedAmount, reward);
    }

    function setRewardRate(uint256 rate) external onlyOwner {
        rewardRate = rate;
    }

    function setMinStakeDuration(uint256 duration) external onlyOwner {
        minStakeDuration = duration;
    }
}