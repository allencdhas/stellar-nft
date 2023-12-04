const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("StellarNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.waitForDeployment();
  console.log("Contract deployed to:", await nftContract.getAddress());
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
