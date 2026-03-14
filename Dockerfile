# Use a lightweight Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package files
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY app/ ./

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
