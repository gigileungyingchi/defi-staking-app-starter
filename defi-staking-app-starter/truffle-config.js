const { notEqual } = require('assert')

require('babel-register')
require('babel-polyfill')

// creating an export and setting up our network to a ganache network
module.exports = {
    networks: {
        development: {
            host: '127.0.0.1',
            port: '7545',
            network_id: '*', // connects to any network
        },
    },
    contracts_directory: './src/contracts/',
    contracts_build_directory: './src/truffle_abis', // directory for where json files for javascprits 
    compiler: {
        solc : {
            version: '^0.5.0',
            optimizer: {
                enabled: true,
                runs: 200,
            }
        }
    }
}