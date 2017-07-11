VIDEOS=$(find -name *.webm -exec basename {} \;)
VIDEOS=($VIDEOS)

len=${#VIDEOS[@]}
DIRS=
for ((i = 0 ; i < len ; ++i)); do
	dir=$(find -name ${VIDEOS[$i]} -exec dirname {} \; | cut -c 3-)
	DIRS[$i]="$dir"
	if [ "$dir" != "$prev_dir" ];
	then
		echo "INSERT INTO ZLABEL (Z_ENT, Z_OPT, ZNAME) VALUES (4, 3, \"$dir\");"
	fi
	prev_dir=$dir
done

printf "\n\n"

for ((i = 0 ; i < len ; ++i)); do
	VIDEO=${VIDEOS[$i]}
	VIDEO=${VIDEOS[$i]/.webm/}

	echo "sqlite3 MediaLibrary.sqlite \""
	echo "insert into Z_3LABELS (Z_3FILES, Z_4LABELS)"
	echo "SELECT ZFILE.Z_PK, ZLABEL.Z_PK"
	echo "FROM ZFILE, ZLABEL"
	echo "WHERE instr(ZPATH, '$VIDEO')"
	echo "AND instr(ZNAME, '${DIRS[$i]}');\""
	printf "\n"
done
