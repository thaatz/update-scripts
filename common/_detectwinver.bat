Set UseExpresssion=Ver
for /F "tokens=*" %%X IN ('%UseExpresssion%') do Set OSBuild=%%X
Set OSBuild=%OSBuild:*10.0.=%
Set OSBuild=%OSBuild:~0,-1%

REM build numbers above 22000 is windows 11
@REM if %OSBuild% geq 22000 echo win11