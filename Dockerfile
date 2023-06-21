# Use the official Nginx base image
FROM nginx

# Copy custom Nginx configuration file to container
COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html/index.html


# Expose the Nginx default port
EXPOSE 80

# Start Nginx server in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]

