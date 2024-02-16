# Se utiliza la imagen base de node js en su version 18
FROM node:18-alpine
# Autor:
LABEL authors="emmanuelrosas1999@gmail.com"
# Se define el directorio de trabajo
WORKDIR /app
# Se copea archivos para generar dependencias node js
COPY app/package.json app/yarn.lock ./
# Se ejecuta instalacion de dependencias
RUN npm install --omit=dev
# Se copean los archivos de la aplicacion
COPY app/spec ./spec
COPY app/src ./src
# Se ejecuta la aplicacion node js
CMD ["node","src/index.js"]
# Se declaran los puertos a exponer
EXPOSE 3000
# Se crea el mapeo para base de datos
VOLUME /etc/todos