# --- Etapa 1: Compilar ---
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Quitamos el -DfinalName porque Maven lo está ignorando
RUN mvn clean package -DskipTests

# --- Etapa 2: Ejecutar ---
FROM eclipse-temurin:21-jdk
WORKDIR /app

# TRUCO: Copiamos CUALQUIER archivo .jar que esté en target
# y lo renombramos a app.jar al vuelo.
COPY --from=build /app/target/*.jar app.jar

# NOTA SOBRE EL PUERTO:
# En Docker EXPOSE es solo documentación.
# Lo que importa es la variable de entorno PORT que pusiste en Render.
EXPOSE 8080 

ENTRYPOINT ["java","-jar","app.jar"]
