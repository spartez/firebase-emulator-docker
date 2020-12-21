FROM node:lts-alpine
ARG VERSION
ENV HOME=/home/node
EXPOSE 9000
WORKDIR $HOME
COPY firebase.json ./
RUN apk --no-cache add openjdk11-jre bash && \
    yarn global add firebase-tools@${VERSION} && \
    yarn cache clean
CMD ["firebase","emulators:start", "--only" ,"database"]
