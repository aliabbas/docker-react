# BUILD PHASE
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install 

COPY . .

RUN ["npm", "run", "build"]

# RUN PHASE
FROM nginx

# GET BUILD ASSET(S) FROM BUILD PHASE
COPY --from=builder /app/build /usr/share/nginx/html