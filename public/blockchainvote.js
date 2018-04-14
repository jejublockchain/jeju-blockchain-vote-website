var Web3 = require('web3');
var web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider("http://jejublockvote-vrlkh.run.goorm.io"));
var vc = web3.eth.contract([
    {
        "constant": false,
        "inputs": [
            {
                "name": "restaurant",
                "type": "string"
            }
        ],
        "name": "addRestaurant",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "killContract",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [
            {
                "name": "userId",
                "type": "address"
            },
            {
                "name": "restaurant",
                "type": "string"
            }
        ],
        "name": "vote",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": false,
        "inputs": [],
        "name": "voteContract",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "userId",
                "type": "address"
            }
        ],
        "name": "alreadyVoted",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "getNumOfRestaurants",
        "outputs": [
            {
                "name": "",
                "type": "uint8"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "number",
                "type": "uint8"
            }
        ],
        "name": "getRestaurantString",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "restaurant",
                "type": "string"
            }
        ],
        "name": "getScore",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }
]).at("0x03455ee4839c693e7a38d834072cd4083ad2d7ed");
web3.eth.defaultAccount = web3.eth.accounts[0];
console.log(vc);
var account = "0xe1b91ed42980b972be6a341fb4e5d8456efbe5a3";
var numberOfCandidates = vc.getNumOfRestaurants();
var candidates = new Array(numberOfCandidates);
for(i=0; i<numberOfCandidates; i++){
	cadidate = vc.getRestaurantString(i);
	candidates[i] = {name: cadidate};
	candidates[i]["score"] = vc.getScore(candidates[i]["name"]).toNumber();
}
var total_vote_count = _.reduce(candidates, function(sum, candidate){ return sum + candidate["score"]; }, 0);
var candidates_names = _.map(candidates, function(item){ return item['name']});
var candidates_scores = _.map(candidates, function(item){ return item['score']});

console.log(candidates);
console.log(total_vote_count);