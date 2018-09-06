call FOR /F %P IN ('dir /b /S *.Tests.csproj') DO dotnet test %P
