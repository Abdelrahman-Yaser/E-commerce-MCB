# المرحلة 1: بناء الملفات (Build Stage)
FROM node:20-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build # هنا بنطلع فولدر اسمه dist أو build

# المرحلة 2: تشغيل الملفات (Production Stage)
FROM nginx:stable-alpine AS production-stage  
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
