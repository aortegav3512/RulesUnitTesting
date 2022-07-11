FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
COPY /src/UnitTestingProcess /app
RUN dotnet publish -c Release -o /out /app/UnitTestingProcess.csproj

FROM mcr.microsoft.com/dotnet/runtime:6.0 as base
COPY --from=builder /out /app
ENTRYPOINT ["dotnet", "/app/UnitTestingProcess.dll"]