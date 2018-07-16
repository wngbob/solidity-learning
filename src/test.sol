pragma solidity ^0.4.24;

contract Test {
    // This function is called for all messages sent to
    // this contract (there is no other function).
    // Sending Ether to this contract will cause an exception,
    // because the fallback function does not have the "payable"
    // modifier.
    function() public { x = 1; }
    uint public x;
}


// This contract keeps all Ether sent to it with no way
// to get it back.
contract Sink {
    function() public payable { }

    function getBalance() public view returns (uint) { 
        return address(this).balance;
    }
}


contract Caller {
    function callTest(Test test) public returns (bool){
      return address(test).call(0xabcdef01); // hash does not exist
        // results in test.x becoming == 1.

    }
    
    function callSink(Sink test) public returns (bool){
        // The following call will fail, reject the
        // Ether and return false:
        return address(test).send(2 ether);
    }
    
    function() payable public { }
    
    function getBalance() public view returns (uint) { 
        return address(this).balance;
    }
}
