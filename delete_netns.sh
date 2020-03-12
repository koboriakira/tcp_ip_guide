for ns in $(ip netns list | awk '{print $1}')
do
ip netns delete $ns
done
