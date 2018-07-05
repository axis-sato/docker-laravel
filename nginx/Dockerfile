# FROM nginx:alpine
FROM nginx:latest


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

ARG APP_NAME=${APP_NAME}
ARG APP_CONTAINER_PATH=${APP_CONTAINER_PATH}
RUN sed -i -e s/{APP_NAME}/"${APP_NAME}"/ -e s@{APP_CONTAINER_PATH}@"${APP_CONTAINER_PATH}"@ /etc/nginx/conf.d/default.conf
