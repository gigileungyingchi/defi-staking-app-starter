// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Migrations {
    address public owner; // new address
    uint public last_completed_migration; // to keep track with each migration with this integer

    constructor() public {
        owner = msg.sender; // current wallet that is currently connected to the contract / doing a call with solidity
    } // having constructor set up means that we can set Migrations up as an object now

    modifier restricted() {
        if (msg.sender == owner) _; // _ means continues in solidity
    }

    function set_completed(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.set_completed(last_completed_migration);
    }
}