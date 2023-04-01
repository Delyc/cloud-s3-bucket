# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the app's dependencies
RUN npm install

# Copy the rest of the app's files to the container
COPY . .

# Set the environment variables from the .env file
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
ENV AWS_ACCESS_ID=${AWS_ACCESS_ID}
ENV AWS_BUCKET_NAME=${AWS_BUCKET_NAME}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV DATABASE=${DATABASE}
ENV DATABASE_HOST=${DATABASE_HOST}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_USERNAME=${DB_USERNAME}
ENV PORT=${PORT}

# Expose the port that the app listens on
EXPOSE $PORT

# Start the app
CMD ["npm", "start"]
