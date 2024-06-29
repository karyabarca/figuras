
# Utiliza una imagen base de Alpine con OpenJDK 21
FROM openjdk:21-slim

# Crea un directorio de trabajo
RUN mkdir /app
WORKDIR /app

# Añade un usuario no root para mayor seguridad
RUN addgroup --system javauser && adduser --system --ingroup javauser --shell /bin/false javauser

# Copia los archivos Java al contenedor
COPY *.java /app/

# Compila el archivo Java
RUN javac Figuras.java

# Cambia la propiedad de los archivos a javauser
RUN chown -R javauser:javauser /app

# Cambia a usuario no root
USER javauser

# Establece las opciones de Java
ENV JAVA_OPTS=""

# Define el comando para ejecutar la aplicación
CMD ["java", "Figuras"]
