pragma solidity ^0.8.4;

import "Flashloan.sol";
import "MockERC20.sol";

contract FlashloanChain {
    Flashloan flashloan;
    MockERC20 token;

    constructor(address _flashloan, address _token) {
        flashloan = Flashloan(_flashloan);
        token = MockERC20(_token);
    }

    function executeFlashloanChain() external {
        // Step 1: First Flashloan
        uint256 initialBalance = token.balanceOf(address(this));
        flashloan.flashloan(initialBalance);

        // Step 2: Perform some operations with the borrowed funds
        // ... (your logic)

        // Step 3: Second Flashloan
        uint256 newBalance = token.balanceOf(address(this));
        flashloan.flashloan(newBalance);

        // Step 4: Perform more operations with the borrowed funds
        // ... (your logic)

        // Step 5: Repay the Flashloans
        uint256 totalBalance = token.balanceOf(address(this));
        flashloan.repayFlashloan(totalBalance);
    }
}
