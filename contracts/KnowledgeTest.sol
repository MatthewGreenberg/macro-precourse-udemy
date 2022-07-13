//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;
    event Received(address, uint256);
    error ONLY_OWNER(string message);
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    function changeTokens() public {
        string[] memory t = tokens;
        t[0] = "VET";
        tokens[0] = "VET";
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address payable destination) public {
        require(msg.sender == owner, "ONLY_OWNER");
        destination.transfer(getBalance());
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory _string1, string memory _string2)
        public
        pure
        returns (string memory)
    {
        return string(abi.encodePacked(_string1, _string2));
    }
}
