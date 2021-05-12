# Use NodeJS base image
FROM node:13

# Create app directory in Docker
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Add ENV variables
# ARG POSTGRES_USERNAME
# ARG POSTGRES_PASSWORD
# ARG POSTGRES_DB
# ARG POSTGRES_HOST
# ARG AWS_REGION
# ARG AWS_PROFILE
# ARG AWS_BUCKET
# ARG JWT_SECRET
# ARG URL

ENV POSTGRES_USERNAME=$POSTGRES_USERNAME
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_DB=$POSTGRES_DB
ENV POSTGRES_HOST=$POSTGRES_HOST
ENV AWS_REGION=$AWS_REGION
ENV AWS_PROFILE=$AWS_PROFILE
ENV AWS_BUCKET=$AWS_BUCKET
ENV JWT_SECRET=$JWT_SECRET
ENV URL=$URL

# Install dependencies in Docker
RUN npm install

# Copy app from local environment into the Docker image
COPY www .

# Set the API’s port number
EXPOSE 8080

# Define Docker’s behavior when the image is run
CMD ["node", "server.js"]