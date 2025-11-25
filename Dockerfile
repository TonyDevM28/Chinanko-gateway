# --- Etapa 1: Compilar ---
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# TRUCO MAESTRO: Agregamos -DfinalName=app
# Esto obliga a Maven a generar un archivo llamado "app.jar" sin importar la versión ni si es jar/war
RUN mvn clean package -DskipTests -DfinalName=app

# --- Etapa 2: Ejecutar ---
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Ahora copiamos el archivo exacto que acabamos de forzar
# Nota que aquí ya no usamos asteriscos (*), vamos directo al grano
COPY --from=build /app/target/app.jar app.jar

EXPOSE 8081
ENTRYPOINT ["java","-jar","app.jar"]
