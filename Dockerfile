FROM mcr.microsoft.com/dotnet/core/aspnet

ARG project_name

WORKDIR /app

#COPY ./WebApiDemo/bin/Debug/netcoreapp2.2/publish .

COPY /publish/. /app

EXPOSE 80
ENV env_project_name=$project_name
CMD ["sh","-c","dotnet ${env_project_name}"]
