pragma solidity ^0.4.11;

contract VictimBalane{
    
    mapping (address => uint)public userBalances;
    
    event MessageLog(string);
    
    event BalanceLog(uint);
    
    function VictimBalance(){
    }
    
    function addToBalance() public payable{
        userBalances[msg.sender] += msg.value;
    }
    
    function withdrawBalance() public payable returns(bool){
        MessageLog("withdrawBalance started, ");
        BalanceLog(this.balance);
        
        if(userBalances[msg.sender] == 0){
            MessageLog("No balance. ");
            return false;
        }
        
        if(!(msg.sender.call.value(userBalances[msg.sender])())) { throw; }
        
        userBalances[msg.sender] = 0;
        
        MessageLog("withdrawBalance finished.");
        
        return false;
    }
}