if [ -z "${contract}" ];
then contract=artifacts/bluemove_launchpad.wasm
fi 
if [ -z "${keyname}" ];
then keyname=admin
fi 
if [ -z "${password}" ];
then password="Vbn693178\n"
fi 

seid=~/go/bin/seid
code=$(printf $password | $seid tx wasm store $contract -y --from=$keyname --chain-id=sei-chain --gas=10000000 --fees=10000000usei --broadcast-mode=block | grep -A 1 "code_id" | sed -n 's/.*value: "//p' | sed -n 's/"//p')
printf "Code id is %s\n" $code
admin_addr=$(printf $password |$seid keys show $keyname | grep -A 1 "address" | sed -n 's/.*address: //p')
printf "Admin addr id is %s\n" $admin_addr

printf Vbn693178 | seid tx wasm store artifacts/bluemove_launchpad.wasm --from=dragon --node=https://sei-rpc.polkachu.com:443 --chain-id=pacific-1 --gas=2000000 --fees=200000usei --broadcast-mode=block -y
// init 81
printf Vbn693178 | seid tx wasm instantiate 81 '{"extension": {}, "fee":"10000","registeration_open":true,"denom":"usei"}' --from=dragon --node=https://sei-rpc.polkachu.com:443 --chain-id=pacific-1 --gas=2000000 --fees=200000usei --broadcast-mode=block --label "bluemove_launchpad" --admin=sei14pzk3uf9rxqxvq53kvuhuv7mxnwevy6t8gra8r -y

printf Vbn693178 | seid tx wasm execute "sei160c72lne9pjvu7537c6frc3drycac2hwultkd3xshsmcskr0550sga9h8y" '{
            "register_collection":{
                "cw721_code":1407,
                "name":"CAP NFT",
                "symbol":"CN",
                "supply":1000,
                "token_uri":"https://static.bluemove.net/cap-nft.json",
                "royalty_percent":5,
                "royalty_wallet":"sei1983l7sakdd7nuk9p0fsfgc2j94mfarc2e3hy68",
                "creator_wallet":"sei1983l7sakdd7nuk9p0fsfgc2j94mfarc2e3hy68",
                "mint_groups":[
                    {
                        "name":"Public",
                        "max_tokens": 1,
                        "merkle_root":null,
                        "unit_price": "100000",
                        "start_time": 1688914800000,
                        "end_time": 1689001200000
                    }
                ],
                "extension":null,
                "iterated_uri":true
            }
            
        }' --from=dragon --node=https://sei-testnet-rpc.polkachu.com:443 --chain-id=atlantic-2 --fees=400000usei --gas=2000000 --broadcast-mode=block -y


printf Vbn693178 | seid tx wasm execute "sei160c72lne9pjvu7537c6frc3drycac2hwultkd3xshsmcskr0550sga9h8y" '{
            "update_collection":{
            "collection":"sei1d2vrrt5nrv8vn6g0er3jn8r56mf7dya23kyupa9gru5r0k9z3x2s7x9thw",
            "name":null,
            "symbol":null,
            "supply":null,
            "token_uri":null,
            "royalty_percent":null,
            "royalty_wallet":null,
            "creator_wallet":null,
            "mint_groups":[
                 {
                        "name":"Public",
                        "max_tokens": 1,
                        "merkle_root":null,
                        "unit_price": "100000",
                        "start_time": 1687969800000,
                        "end_time": 1688056200000
                    }
            ],
            "iterated_uri":null
            }
            
        }' --from=dragon --node=https://sei-testnet-rpc.polkachu.com:443 --chain-id=atlantic-2 --fees=7000000usei --gas=2000000 --broadcast-mode=block -y