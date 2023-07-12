=begin
Este código contiene métodos para realizar solicitudes HTTP a la API de Nasa, construir una página web HTML con las fotos obtenidas y contar la cantidad de fotos por cámara. 
=end


# Dependencias
require "uri"
require "net/http"
require 'json'

# Método request que recibirá como parámetro la url a consultar
def request_api(url_requested)
    # URL de la API
    url = URI(url_requested)

    # Crea un objeto Net::HTTP para realizar la petición HTTP
    http = Net::HTTP.new(url.host, url.port)

    # Habilita el uso de SSL para una conexión segura
    http.use_ssl = true

    # Verifica el certificado del servidor sea confiable y que el nombre del dominio coincida con el certificado
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    #Creamos el request con los metodos y protocolos correspondientes
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'

    # Guardamos la respuesta del request
    response = http.request(request)

    # Retornamos la respuesta pero parseada para poder trabajarlo
    return JSON.parse(response.body)
end


def build_web_page(data)
    # Seleccionamos los primeros 10 elementos
    data_photos = data["photos"][0..9]
    # Mapeamos los datos y se guarda el valor de hash "img_src"
    photos = data_photos.map{|x| x["img_src"]}

    # Construimos el html
    html_body = "<html>\n<head>\n</head>\n<body>\n<ul>\n"
    html_body += "#{photos.map { |photo| "\t<li><img src=\"#{photo}\"></li>\n" }.join}"
    html_body += "</ul> \n</body>\n</html>"

    # Creamos el archivo index.html y le pasamos el html_body
    File.write('index.html', html_body)
    puts "Archivo index.html creado"

    # Retornamos el html
    return html_body
end

# Crear un método photos_count que reciba el hash de respuesta y devuelva un nuevo
# hash con el nombre de la cámara y la cantidad de fotos. 
def photos_count(data)
    # Conservamos todos los elementos del hash "photos" para tener más datos
    data_camera_photos = data["photos"]

    # Creamos un hash vacío para guardar los datos
    camera_photos = {}

    # Recorremos el hash, identificamos el nombre de la cámara e incrementamos el valor en 1 cada vez que se repita
    data_camera_photos.each do |data_camera|
        camera_name = data_camera["camera"]["name"]
        camera_photos[camera_name] = camera_photos[camera_name].to_i + 1
    end 

    # Retornamos el hash
    return camera_photos
end

apikey = "7HMCSocbhyg0oC4bwWmaNhshT1yhq0NZ78FeW5CV"

# Invocación del método request_api de la API de la NASA
data = request_api("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=#{apikey}")

# Invocación del método build_web_page
html = build_web_page(data)

# Invocación del método photos_count
cameras = photos_count(data)

# Imprimimos los resultados
puts "","Archivo HTML:",html
puts "","Hash de Cantidad de Fotos por Cámara:",cameras




