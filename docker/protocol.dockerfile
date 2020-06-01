FROM streetcred/dotnet-indy:1.14.2 AS base
RUN apt-get update && apt-get install npm -y

CMD [ "bash" ]
