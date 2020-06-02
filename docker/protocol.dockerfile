FROM streetcred/dotnet-indy:1.14.2 AS base
RUN apt-get update && apt-get install npm -y
# WORKDIR /app
# RUN dotnet clean && dotnet build
# WORKDIR /app/service
# rm -rf node_modules
# EDGE_USE_CORECLR=1 npm install

CMD [ "bash" ]
