var solc = require('solc');
var Web3 = require('web3');
var fs = require('fs');

//var web3 = new Web3();
//web3.setProvider(new web3.providers.HttpProvider('http://localhost:8553'));
if (typeof web3 !== 'undefined') {
  web3 = new Web3(web3.currentProvider);
} else {
  // set the provider you want from Web3.providers
  web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

// Define the address to search witin.
var addr = ('0xbb4fdf83996829b3479743d4b3fec6620e260e21');

// Use Wb3 to get the balance of the address, convert it and then show it in the console.
web3.eth.getBalance(addr, function (error, result) {
	if (!error)
    console.log(result)
		//console.log('Ether:', web3.utils.fromWei(result,'ether')); // Show the ether balance after converting it from Wei
	else
		console.log('Huston we have a promblem: ', error); // Should dump errors here
});

var filepath = 'kt-founding.sol';
var input = fs.readFileSync(filepath).toString();
//console.log(input);
//var input = 'contract x { function g() {} }';

var output = solc.compile(input, 1); // 1 activates the optimiser
//console.log(output);
for (var contractName in output.contracts) {
      // code and ABI that are needed by web3
  //console.log(contractName + ': ' + output.contracts[contractName].bytecode);
  //console.log(contractName + '; ' + JSON.parse(output.contracts[contractName].interface));

  var code = '0x' + output.contracts[contractName].bytecode;//compiled[keye[0]].code;
  //console.log(code);
  // contract json abi, this is autogenerated using solc CLI
  var abi = JSON.parse(output.contracts[contractName].interface);//compiled[keye[0]].info.abiDefinition;
  //console.log(abi);
  var myContract;
    //var blockwatch = web3.eth.filter('latest');
  //console.log(blockwatch);
  //console.log(web3);

  var myContract = new web3.eth.Contract(abi, '0x565CE1eeEcdc0BEE660BB3c29D0b83e33Dc01aD9');
//console.log(myContract);

  myContract.methods.newd().send({from: '0xbb4fdf83996829b3479743d4b3fec6620e260e21'}).then(function(receipt){
      // receipt can also be a new contract instance, when coming fro
      console.log('put value address to contract');
      console.log(receipt);
  }).catch(function(error) {
  console.log(' send error');
  console.log(error);
  });
};
