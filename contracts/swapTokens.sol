// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the necessary interfaces
import "hardhat/console.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SwapTokens {

    address public uniswapRouterAddress;
    IUniswapV2Router02 public uniswapRouter; 

    constructor(){
       uniswapRouterAddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
       uniswapRouter = IUniswapV2Router02(uniswapRouterAddress);
    }

    receive() payable external {}

    function swapAndYield(
        address tokenIn,
        uint256 amountIn,
        uint256 amountOutMin
    ) external {
        // Approve the router to spend tokenIn on behalf of the contract  
        IERC20(tokenIn).approve(uniswapRouterAddress, amountIn);

        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = uniswapRouter.WETH();

        console.log("ZC Tokens balance of Swap Contract: ", IERC20(tokenIn).balanceOf(address(this)));
        console.log("check allownace: ", IERC20(tokenIn).allowance(address(this), uniswapRouterAddress));

        // perform the swap
        
        // uniswapRouter.swapExactTokensForTokens(
        //     amountIn,
        //     amountOutMin,
        //     path,
        //     address(this),
        //     block.timestamp
        // );

        uniswapRouter.swapExactTokensForETH(amountIn, amountOutMin, path, address(this), block.timestamp + 3600);

        // Now we can implement yield logic here.
        // This could involve stacking, providing liquidity, or any other action
        // that generates yield for our contract.
    }
}
