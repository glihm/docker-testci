FROM alpine:3.14.3

RUN apk update
RUN apk upgrade

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-alpine
RUN apk add bash wget icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib

# Only if using System.Drawing.Common.
# RUN apk add libgdiplus --repository https://dl-3.alpinelinux.org/alpine/edge/testing/

# Install latest LTS dotnet runtime.
# RUN wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
# RUN chmod +x /tmp/dotnet-install.sh
# RUN /tmp/dotnet-install.sh --channel LTS --runtime dotnet
# RUN /tmp/dotnet-install.sh --channel LTS --runtime aspnetcore
# RUN export PATH=$PATH:/root/.dotnet/
# RUN export DOTNET_ROOT=/root/.dotnet/

RUN mkdir -p /srv/onx/app
ADD ./publish/ /srv/onx/app

ENV ASPNETCORE_URLS="http://*:5000"
EXPOSE 5000
	
WORKDIR /srv/onx/app/

ENTRYPOINT ["./proj1"]

