FROM openjdk:8

ENV USER_ID 1000
ENV USER_NAME fool
ENV USER_HOME /minecraft
ENV MODPACK_URL https://media.forgecdn.net/files/2642/141/FoolCraft+3+-++Server+Files+-+1.6.zip

RUN apt-get update && apt-get install apt-utils -y && apt-get install -y wget htop

RUN uname -a

RUN useradd ${USER_NAME} --uid ${USER_ID} --home ${USER_HOME}

WORKDIR ${USER_HOME}

VOLUME ${USER_HOME}

COPY ./setup.sh ${USER_HOME}
# COPY ./serverfiles.zip ${USER_HOME}
RUN chown ${USER_NAME}:${USER_NAME} ${USER_HOME}
RUN chown ${USER_NAME}:${USER_NAME} ${USER_HOME}/setup.sh
RUN chmod ug+x ${USER_HOME}/setup.sh

USER ${USER_NAME}

# RUN wget https://media.forgecdn.net/files/2642/141/FoolCraft+3+-++Server+Files+-+1.6.zip

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT exec /minecraft/setup.sh ${MODPACK_URL}