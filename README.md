# Ruby - Arreglos, hashes y APIs - Mars Rover Photos

Este proyecto utiliza la API de la NASA para obtener y mostrar fotos tomadas por el Rover Curiosity en Marte. Se implementa un método en Ruby para realizar una solicitud HTTP, procesar los datos de respuesta y generar una página HTML con las fotos obtenidas.

## Dependencias

- `uri`: se utiliza para trabajar con URLs y construir objetos URI.
- `net/http`: se utiliza para realizar solicitudes HTTP.
- `json`: se utiliza para parsear los datos de respuesta en formato JSON.

## Métodos y Funcionalidades

### `request_api(url_requested)`

Este método realiza una solicitud HTTP a una URL especificada y devuelve los datos de respuesta parseados como un objeto Ruby. Recibe como parámetro la URL a consultar.

### `build_web_page(data)`

Este método recibe los datos de respuesta obtenidos de la API y construye una página web HTML que muestra las primeras 10 fotos. Guarda el archivo `index.html` con el contenido generado.

### `photos_count(data)`

Este método recibe los datos de respuesta obtenidos de la API y devuelve un hash que contiene el nombre de la cámara y la cantidad de fotos asociadas a cada cámara.

## Uso

Asegúrate de tener instaladas las dependencias requeridas mencionadas anteriormente.

1. Ejecuta el archivo Ruby `main.rb` en la terminal:
   ```
   ruby main.rb
   ```

2. El programa realizará una solicitud a la API de la NASA y obtendrá los datos de respuesta.

3. Se generará el archivo `index.html` que mostrará las fotos obtenidas.

4. Además, se imprimirá en la consola el contenido del archivo HTML generado y un hash con la cantidad de fotos por cámara.

¡Disfruta explorando las fotos del Rover Curiosity en Marte!

```
Archivo HTML (EJEMPLO):
<html>
<head>
</head>
<body>
<ul>
    <li><img src="photo_url_1"></li>
    <li><img src="photo_url_2"></li>
    <li><img src="photo_url_3"></li>
    ...
</ul>
</body>
</html>

Hash de Cantidad de Fotos por Cámara (EJEMPLO):
{"Camera1"=>10, "Camera2"=>8, "Camera3"=>6, ...}
```

## Contribución

Si deseas contribuir a este proyecto, no dudes en abrir un pull request. Cualquier aporte o mejora será bienvenido.

¡Explora las maravillas de Marte con el Mars Rover Photos! 🚀🌖