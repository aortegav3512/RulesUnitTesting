FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
COPY /src/UnitTestProcess /app

RUN dotnet publish -c Release -o /out /app/UnitTestProcess.csproj

FROM mcr.microsoft.com/dotnet/runtime:6.0 as base
COPY --from=build /out /app
ENTRYPOINT ["dotnet", "/app/UnitTestProcess.dll"]