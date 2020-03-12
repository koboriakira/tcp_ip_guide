ip netns add server
ip netns add client

ip link add s-veth0 type veth peer name c-veth0

ip link set s-veth0 netns server
ip link set c-veth0 netns client

ip netns exec server ip link set s-veth0 up
ip netns exec client ip link set c-veth0 up

# server側だけIPアドレスを付与しておく
ip netns exec server ip address add 192.0.2.254/24 dev s-veth0

# DHCPサーバとして準備
ip netns exec server dnsmasq \
--dhcp-range=192.0.2.100,192.0.2.200,255.255.255.0 \
--interface=s-veth0 \
--no-daemon
