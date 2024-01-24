## Script pull peers from RPC Node 
###HTTP request:
```
http get https://rpc.space-pussy.cybernode.ai:443/net_info | get result.peers | each {|i| $i | get remote_ip node_info.id node_info.listen_addr} | each {|i| $'($i.1)@($i.0):($i.2 | split row ":" | last)'} | str join ',' | $'persistent_peers = "($in)"'
```
###CURL request:
```
curl -s https://rpc.space-pussy.cybernode.ai:443/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr | split(":") | last)"' | tr '\n' ',' | sed 's/,$//'
```
