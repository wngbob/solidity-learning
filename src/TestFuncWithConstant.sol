pragma solidity ^0.4.24;


/**
 * found the constant view will not stop change value in function and returned
 * value,  but it will not actually change the storage var
 */
contract Test{
    uint public num = 5;
    
    function updateNumConstant() constant returns (uint ) {
        num = 10;
        return num;
    }
    
    function updateNumView() view returns (uint ) {
        num = 10;
        return num;
    }
    
    function updateNumPure() pure returns (uint ) {
        //num = 10;
        //error
        
        //return num;
        //error
    }
}
