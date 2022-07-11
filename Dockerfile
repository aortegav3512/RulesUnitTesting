FROM mcr.microsoft.com/dotnet/sdk:6.0-buster-slim AS build
WORKDIR /src
COPY src/UnitTestingProcess/. .
RUN dotnet restore "UnitTestingProcess.csproj"
RUN dotnet build "UnitTestingProcess.csproj" -c Release
RUN dotnet publish "UnitTestingProcess.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "/app/UnitTestingProcess.dll"]