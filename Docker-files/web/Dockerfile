FROM nginx:stable

# Remove default site config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom config into container
COPY vproapp.conf /etc/nginx/conf.d/

# Expose HTTP port
EXPOSE 80

# Start nginx (already handled by base image’s CMD)
