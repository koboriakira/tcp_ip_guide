# ネットワークネームスペースを追加
ip netns add ns1
ip netns add ns2

# 仮想のインターフェース（ns1-veth0 <-> ns2-veth0）を追加
ip link add ns1-veth0 type veth peer name ns2-veth0

# それぞれのネームスペースとイーサネットを関連させる
ip link set ns1-veth0 netns ns1
ip link set ns2-veth0 netns ns2

# それぞれのネームスペース内で、インターフェースにIPアドレスを追加する
ip netns exec ns1 ip address add 192.0.2.1/24 dev ns1-veth0
ip netns exec ns2 ip address add 192.0.2.2/24 dev ns2-veth0

# インターフェースのLink UPをする
ip netns exec ns1 ip link set ns1-veth0 up
ip netns exec ns2 ip link set ns2-veth0 up
