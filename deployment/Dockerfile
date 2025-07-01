# Deployment Dockerfile for backend
FROM node:20-alpine
WORKDIR /app
COPY ./api ./api
RUN cd api && npm install
CMD ["node", "api/index.js"]