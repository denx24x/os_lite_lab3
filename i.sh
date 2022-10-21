#!/bin/bash
t=$(date)
mkdir $HOME/test && echo "catalog was created successfully" >> $HOME/report && touch $HOME/test/${t// /_}
ping -c1 www.net_nikogo.ru || { echo "$(date) - error service not available" >> $HOME/report; }
