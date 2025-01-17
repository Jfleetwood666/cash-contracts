// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {DebtManagerSetup} from "./DebtManagerSetup.t.sol";

contract DebtManagerDeployTest is DebtManagerSetup {
    function test_Deploy() public view {
        assertEq(
            address(debtManager.cashDataProvider()),
            address(cashDataProvider)
        );

        assertEq(
            debtManager.hasRole(debtManager.DEFAULT_ADMIN_ROLE(), owner),
            true
        );
        assertEq(debtManager.hasRole(debtManager.ADMIN_ROLE(), owner), true);
        assertEq(
            debtManager.hasRole(debtManager.DEFAULT_ADMIN_ROLE(), notOwner),
            false
        );
        assertEq(
            debtManager.hasRole(debtManager.ADMIN_ROLE(), notOwner),
            false
        );
        assertEq(debtManager.liquidationThreshold(), liquidationThreshold);
        assertEq(debtManager.borrowApyPerSecond(), borrowApyPerSecond);

        assertEq(debtManager.getCollateralTokens().length, 1);
        assertEq(debtManager.getCollateralTokens()[0], address(weETH));

        assertEq(debtManager.getBorrowTokens().length, 1);
        assertEq(debtManager.getBorrowTokens()[0], address(usdc));
    }
}
