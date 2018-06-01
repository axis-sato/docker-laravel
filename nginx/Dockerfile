# FROM nginx:alpine
FROM nginx:latest


COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

ARG PROJECT_NAME=${PROJECT_NAME}
RUN sed -i s/PROJECT_NAME_PLACEHOLDER/"${PROJECT_NAME}"/ /etc/nginx/conf.d/default.conf