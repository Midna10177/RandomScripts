#!/data/data/com.termux/files/usr/bin/bash

echo set up ip vars
quest_ip="quest"
desktop_ip="desktop"
phone_ip="motonew"
target_direct_ip_quest="192.168.254.14" # quest
target_direct_ip_bf_pc="192.168.254.29" # bf pc
target_direct_ip_pc="192.168.254.13" # renny pc
target_direct_ip_desktop="192.168.254.13" # renny pc

#----------------------------------------------------------------------------------------------
echo init mem functions
get_free_mem_from_ssh(){
	used=$(ssh $* 'free  -w -h --giga | head -n 2 | tail -n 1 | cut -d":" -f 2|cut -d"G" -f 2 | tr -d " "')
	available=$(ssh $* 'free  -w -h --giga | head -n 2 | tail -n 1 | cut -d":" -f 2|cut -d "G" -f 1 | tr -d " "')
	echo $*: ${used}/${available}G
}

get_free_mem(){
	echo mem:
	get_free_mem_from_ssh $quest_ip
	get_free_mem_from_ssh $phone_ip
#	get_free_mem_from_ssh $desktop_ip
}

#----------------------------------------------------------------------------------------------
echo init space functions
get_free_space(){
	echo $(ssh $phone_ip 'df -h . | tail -n 1 | cut -d" " -f 7') remaining on phone
	echo $(ssh $quest_ip 'df -h . | tail -n 1 | cut -d" " -f 7') remaining on quest
}

#----------------------------------------------------------------------------------------------
echo init battery functions
get_free_bat_from_ssh(){
	quest_bat=$(ssh $* termux-battery-status|base32 -w 0)
	echo $*: $(echo $quest_bat|base32 -d | jq '.percentage')%, $(echo $quest_bat|base32 -d | jq '.status'), current: $[$(echo $quest_bat|base32 -d|jq '.current')/1000] mA
}

get_free_bat(){
	get_free_bat_from_ssh $quest_ip
	get_free_bat_from_ssh $phone_ip

}

#----------------------------------------------------------------------------------------------
echo init song functions
get_song(){
	echo $(ssh $phone_ip 'mpc -f "%artist% \n%album% \n%title%" current "${mpc_args[@]}"')
}

#----------------------------------------------------------------------------------------------
echo init volume functions
get_volume(){
		echo $(ssh $desktop_ip 'pactl get-sink-volume $(pactl get-default-sink)');
}

#----------------------------------------------------------------------------------------------
while true; 
	do
		echo ----------------------------------------------------------------------------------------------
#		set our string to show :D
		data=$(
			(
#				echo just had 400mg edibles
				get_free_bat_from_ssh $phone_ip
				get_free_mem
#				get_free_space
			) | base32 -w 0
		)
#----------------------------------------------------------------------------------------------
#		print data to terminal
		echo $data | base32 -d
#----------------------------------------------------------------------------------------------
#		pipe data to udp sender script
		(echo $data | base32 -d) | ./vrchat_osc_chatbox.py $target_direct_ip_bf_pc&
		(echo $data | base32 -d) | ./vrchat_osc_chatbox.py $target_direct_ip_desktop&
		(echo $data | base32 -d) | ./vrchat_osc_chatbox.py $target_direct_ip_quest;
	done
