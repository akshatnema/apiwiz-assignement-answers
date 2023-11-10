ARG DB_URL

# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the port that your server will run on
EXPOSE 5000

# Define environment variables (if needed)
ENV DB_URL=${DB_URL}

# Start the Express server
CMD ["node", "server.js"]
