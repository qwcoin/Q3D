pragma solidity ^0.4.24;
contract Coin {
    address public owner;
    mapping (address => uint) public balances;
    address[] public users;
    uint256 public starttime=0;
    uint256 public total=0;
    constructor() public{
        owner = msg.sender;
        starttime=now;
    }

     function check() public payable returns (uint){
         require(msg.sender==owner);
         for(uint i=0;i<users.length;i++)
         {
                users[i].transfer(balances[users[i]]/100);
        }
        if(starttime+5 minutes+users.length*30 seconds<=now)
        {
             for(i=0;i<users.length;i++)
              {
                balances[users[i]] = 0;
              }
              if(users.length>0)
              {
                users[users.length-1].transfer((address)(this).balance);
              }
              starttime=now;
              total=0;
              users.length=0;
              return 1;
        }
        
        return 0;
    }
      function userCount() public view returns (uint256) {
        return users.length;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    function remainTime() public view returns (uint){
        if(starttime+5 minutes+users.length*30 seconds<=now){
            return 0;
        }
        return (starttime+5 minutes+users.length*30 seconds)-now;
    }
    
     function contractBalance() public view returns (uint256) {
        return (address)(this).balance;
    }  
    function () public payable {
        if (msg.value > 0 ) {
                        total += msg.value;
                        bool isfind=false;
                        for(uint i=0;i<users.length;i++)
                        {
                            if(msg.sender==users[i])
                            {
                                isfind=true;
                                break;
                            }
                        }
                        if(!isfind){users.push(msg.sender);}
                        balances[msg.sender] += msg.value;
        }
    }
}
