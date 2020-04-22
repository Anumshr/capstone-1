# Pulling image from docker hub 
FROM nginx

# removing the static index.html file fom nginx 
RUN rm /usr/share/nginx/html/index.html

#Copying the own inde.html file
COPY index.html /usr/share/nginx/html/
