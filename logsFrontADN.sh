# !/bin/bash
<< 'Comment'
    El script funciona en producción pero le fueron modificados datos sensibles como ip's y rutas de servidores.
Comment
usuario="jboss7" 
fecha=$(date +'%Y-%m-%d-Con_horario_%H-%M-%S') #Variable para fecha y hora exacta
fechaLogsRespaldo=$(date +'%d-%m-%Y')
ruta1="/home/******************"
archivolog="******.log"
archivodetalle="******.log"
ruta2="/home/********"
archivolog2="Front"
archivodetalle2="*******"
ruta1Vieja="*****"
ruta2Vieja="*****"
echo "¿Logs de hoy o logs viejos (1/2)"
read Decision
case $Decision in 
1)
FuncionLogsActuales(){
if [ Logs_$ip ]
then
rm -rf Logs_$ip*
fi
ArregloDeIps=(**********************************************)
for ip in ${ArregloDeIps[@]}
do
mkdir Logs_$ip
scp $usuario@$ip:$ruta1/$archivolog .
scp $usuario@$ip:$ruta1/$archivodetalle .
mv $archivolog Logs_$ip
mv $archivodetalle Logs_$ip
done

}
FuncionLogsActuales
;;
2)
FuncionLogsViejos(){
read -p "Ingresa día y mes de los logs con el siguiente formato DD-MM-AA | Ejemplo = 30-04-22 : " fechavieja
ArregloDeIps=(*******************************************)
for ip in ${ArregloDeIps[@]}
do
mkdir Logs_$ip-del_$fechavieja
scp $usuario@$ip:$ruta2/$archivolog2$fechavieja* .
scp $usuario@$ip:$ruta2/$archivodetalle2$fechavieja* .
mv $archivolog2$fechavieja* Logs_$ip-del_$fechavieja
mv $archivodetalle2$fechavieja* Logs_$ip-del_$fechavieja
scp -r Logs_* core@******:/02_Logs/Front/Produccion/2022/
done
}
FuncionLogsViejos
;;
*)
echo "Opción invalida"
;;
esac