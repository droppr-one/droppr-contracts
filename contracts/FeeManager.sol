// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";


contract FeeManager is Ownable{
    uint256 public serviceFee;
    uint256 public subscribtionFee;
    mapping (address => bool) public subscribers;
    
    constructor (uint256 _serviceFee, uint256 _subscribtionFee){
        subscribtionFee = _subscribtionFee;
        serviceFee = _serviceFee;
    }

    function setServiceFee (uint256 fee) public onlyOwner {
        serviceFee = fee;
    }

    function setSubscribtionFee (uint _subscribtionFee) public onlyOwner{
        subscribtionFee = _subscribtionFee;
    }

    function isSubscribed (address _addr) public view returns (bool) {
        return msg.sender == owner() || subscribers[_addr];
    }

    modifier onlySubscriber () {
        require(isSubscribed(msg.sender), "Message sender is not subscribed");
        _;
    }

    function subscribe () public payable {
        require(msg.value >= subscribtionFee, "Insufficient amount");
        subscribers[msg.sender] = true;
    }

    function unsubscribe () public {
        subscribers[msg.sender] = false;
    }

    function giftSubscribtion (address to) public payable {
        require(msg.value >= subscribtionFee, "Insufficient amount");
        subscribers[to] = true;
    }

    function ownerGiftSubscribtion (address to) public onlyOwner {
        subscribers[to] = true;
    }

}