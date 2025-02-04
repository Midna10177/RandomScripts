#!/data/data/com.termux/files/usr/bin/zsh
datapoints=$*
sleeptime=0
echo getting $datapoints datapoints...
echo charge rate of $[$((for i in {1..$datapoints}; do termux-battery-status | grep current | rev | cut -d ' ' -f 1 | rev; sleep $sleeptime; done) | paste -sd+ - | bc)/$datapoints]
