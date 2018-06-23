# FROM nginx:alpine
FROM nginx:latest


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

ARG APP_NAME=${APP_NAME}
RUN sed -i s/{APP_NAME}/"${APP_NAME}"/ /etc/nginx/conf.d/default.conf