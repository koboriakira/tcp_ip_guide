## ネットワークの作成は、前章と同様
. 3-2.sh

ip netns exec ns1 ip link set dev ns1-veth0 address 00:00:5E:00:53:01
ip netns exec ns2 ip link set dev ns2-veth0 address 00:00:5E:00:53:02
