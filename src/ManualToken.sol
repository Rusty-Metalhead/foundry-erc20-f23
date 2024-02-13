// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract ManualToken {
    mapping(address => uint256) private s_addressToBalance;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 1000 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_addressToBalance[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_addressToBalance[msg.sender] -= _value;
        s_addressToBalance[_to] += _value;

        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalance);
    }
}
