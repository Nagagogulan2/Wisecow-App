FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Add /usr/games to PATH (fortune & cowsay live here)
ENV PATH="/usr/games:${PATH}"

EXPOSE 4499

CMD ["/app/wisecow.sh"]
