rem https://www.elevenforum.com/t/how-do-i-detect-windows-11-with-version-command-in-batch-file.21925/
rem https://www.tenforums.com/general-support/170066-windows-10-image.html#post2308372
Set UseExpresssion=Ver
for /F "tokens=*" %%X IN ('%UseExpresssion%') do Set OSBuild=%%X
Set OSBuild=%OSBuild:*10.0.=%
Set OSBuild=%OSBuild:~0,-1%

REM build numbers above 22000 is windows 11
@REM if %OSBuild% geq 22000 echo win11