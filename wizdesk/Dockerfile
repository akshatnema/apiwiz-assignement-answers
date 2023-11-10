ARG GOOGLE_OAUTH_CLIENT_ID
ARG PUBLIC_KEY
ARG API_BASE_URL

# Stage 1: Build the React app
FROM node:14 as build

WORKDIR /

# Copy package.json and package-lock.json (if applicable)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the app
RUN npm run build

# Stage 2: Serve the app using a lightweight web server
FROM nginx:alpine

# Copy the built app from the previous stage
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 3000

# Define environment variables (if needed)
ENV GOOGLE_OAUTH_CLIENT_ID=${GOOGLE_OAUTH_CLIENT_ID}
ENV PUBLIC_KEY=${PUBLIC_KEY}
ENV API_BASE_URL=${API_BASE_URL}

# The default command to start the server
CMD ["nginx", "-g", "daemon off;"]
