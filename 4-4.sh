# ネットワークの作成は、前章と同様
. 3-4.sh

# MACアドレスの設定
ip netns exec ns1 ip link set dev ns1-veth0 address 00:00:5E:00:53:11
ip netns exec router ip link set dev gw-veth0 address 00:00:5E:00:53:12
ip netns exec router ip link set dev gw-veth1 address 00:00:5E:00:53:21
ip netns exec ns2 ip link set dev ns1-veth0 address 00:00:5E:00:53:22
