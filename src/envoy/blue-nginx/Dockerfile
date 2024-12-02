# Start with the official NGINX base image
FROM nginx:alpine

# Copy the custom NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the custom index.html
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
