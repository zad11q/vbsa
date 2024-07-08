// SPDX-License-Identifier: MIT  
pragma solidity ^0.8.0;  
  
contract vbsa {  
    string public name = "vbsa";  
    string public symbol = "vbsa";  
    uint8 public decimals = 18;
    uint256 public totalSupply;  
  
    mapping(address => uint256) public balanceOf;  
    mapping(address => mapping(address => uint256)) public allowance;  
  
    event Transfer(address indexed from, address indexed to, uint256 value);  
    event Approval(address indexed owner, address indexed spender, uint256 value);  
  
    constructor() {  
        totalSupply = 10000000 * 10**decimals;  
        balanceOf[msg.sender] = totalSupply;
    }  
  
    function transfer(address _to, uint256 _value) public returns (bool success) {  
        require(balanceOf[msg.sender] >= _value);  
        require(balanceOf[_to] + _value >= balanceOf[_to]);  
        balanceOf[msg.sender] -= _value;  
        balanceOf[_to] += _value;  
        emit Transfer(msg.sender, _to, _value);  
        return true;  
    }  
  
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {  
        require(balanceOf[_from] >= _value);  
        require(allowance[_from][msg.sender] >= _value);  
        require(balanceOf[_to] + _value >= balanceOf[_to]);  
        balanceOf[_from] -= _value;  
        balanceOf[_to] += _value;  
        allowance[_from][msg.sender] -= _value;  
        emit Transfer(_from, _to, _value);  
        return true;  
    }  
  
    function approve(address _spender, uint256 _value) public returns (bool success) {  
        allowance[msg.sender][_spender] = _value;  
        emit Approval(msg.sender, _spender, _value);  
        return true;  
    }  
  
    function getAllowance(address _owner, address _spender) public view returns (uint256 remaining) {  
        return allowance[_owner][_spender];  
    }  
}