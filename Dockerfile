FROM debian:buster

# avec RUN, utiliser les services wordpress, phpmyadmin, et nginx ?
RUN apt-get update && apt-get install -y \
&& 


COPY ["fichierQueJeVaisCreer", "./srcs"]
# copier les fichier de run vers srcs ???

CMD 
