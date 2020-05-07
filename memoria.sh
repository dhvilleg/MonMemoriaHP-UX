MACHINE=`uname -n`
OPERADOR='sis-AlarmasSRV@FDM.com.ec'
HOME_DIR=/usr/local/bin/monitor
#OPERADOR='edgar.marmol@FDM.com.ec'
zombie=`ps -ef | grep -i defunc |wc -l`
memoria=`swapinfo -tan | grep total | sed -e s/%//g | sed -e s/,/./g | awk '{print $5}'`
   if [ "$memoria" -gt 85 ]
   then

        echo "Alarma de MEMORIA CRITICAL $MACHINE" > $HOME_DIR/memorias.tmp
        echo "Total: $memoria %" >> $HOME_DIR/memorias.tmp
        echo "Procesos Zombies: $zombie" >> $HOME_DIR/memorias.tmp
        mailx -s "$MACHINE: MEMORIA Critical!!!" $OPERADOR < $HOME_DIR/memorias.tmp
        rm $HOME_DIR/memorias.tmp
   else
 if [ "$memoria" -gt 80 ]
 then
        echo "Alarma de MEMORIA WARNING $MACHINE" > $HOME_DIR/memorias.tmp
        echo "Total: $memoria %" >> $HOME_DIR/memorias.tmp
        echo "Procesos Zombies: $zombie" >> $HOME_DIR/memorias.tmp
        mailx -s "$MACHINE: MEMORIA Warning" $OPERADOR < $HOME_DIR/memorias.tmp
        rm $HOME_DIR/memorias.tmp


   fi
fi

 if [ "$zombie" -gt 4 ]
 then
        echo "Alarma de Procesos Zombies SCLPuntos $MACHINE" > $HOME_DIR/memorias.tmp
        echo "Total: $zombie" >> $HOME_DIR/memorias.tmp
        mailx -s "$MACHINE: Procesos Zombies SCLPuntos WARNING" $OPERADOR < $HOME_DIR/memorias.tmp
        rm $HOME_DIR/memorias.tmp


   fi
