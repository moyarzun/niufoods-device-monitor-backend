require 'net/http'
require 'uri'
require 'json'

# Configuración de la URL y los headers
base_url = 'http://localhost:3001/api/v1'
headers = { 'Content-Type' => 'application/json' }

# Método para enviar una solicitud GET
def send_get_request(url, headers)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri, headers)
  response = http.request(request)
  JSON.parse(response.body)
end

# Método para enviar una solicitud POST
def send_post_request(url, headers, data)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, headers)
  request.body = data.to_json
  response = http.request(request)
  puts "Response: #{response.code} #{response.message}"
  response
end

# Obtener locaciones disponibles
locations = send_get_request("#{base_url}/locations", headers)

# Mostrar locaciones al usuario
puts 'Locaciones disponibles:'
locations.each do |location|
  puts "ID: #{location['id']}, Nombre: #{location['name']}"
end

# Preguntar al usuario si desea escoger una locación existente o crear una nueva
puts 'Ingrese el ID de la locación que desea usar, o presione ENTER para crear una nueva locación y dispositivo:'
location_id = gets.chomp

if location_id.empty?
  # Crear una nueva locación
  puts 'Ingrese el nombre de la nueva locación:'
  location_name = gets.chomp
  response = send_post_request("#{base_url}/locations", headers, { location: { name: location_name } })
  location_id = JSON.parse(response.body)['id'].to_i
else
  # Validar que el ID de la locación se encuentra en la lista de locaciones
  location_ids = locations.map { |location| location['id'].to_s }
  until location_ids.include?(location_id)
    puts 'ID de locación no válido. Por favor, ingrese un ID válido de la lista:'
    location_id = gets.chomp
  end
  location_id = location_id.to_i
end

# Obtener dispositivos disponibles para la locación seleccionada
devices = send_get_request("#{base_url}/locations/#{location_id}/devices", headers)

# Mostrar dispositivos al usuario
puts "Dispositivos disponibles en la locación #{location_id}:"
devices.each do |device|
  puts "ID: #{device['id']}, Nombre: #{device['name']}"
end

# Preguntar al usuario si desea escoger un dispositivo existente o crear uno nuevo
puts 'Ingrese el ID del dispositivo que desea usar, o presione ENTER para crear un nuevo dispositivo:'
device_id = gets.chomp

if device_id.empty?
  # Crear un nuevo dispositivo
  puts 'Ingrese el nombre del nuevo dispositivo:'
  device_name = gets.chomp
  response = send_post_request("#{base_url}/devices", headers,
                               { device: { name: device_name, location_id: location_id } })
  device_id = JSON.parse(response.body)['id'].to_i
else
  # Validar que el ID del dispositivo se encuentra en la lista de dispositivos
  device_ids = devices.map { |device| device['id'].to_s }
  until device_ids.include?(device_id)
    puts 'ID de dispositivo no válido. Por favor, ingrese un ID válido de la lista:'
    device_id = gets.chomp
  end
  device_id = device_id.to_i
end

# Configuración de la URL y los datos de la solicitud para status_logs
status_logs_url = "#{base_url}/status_logs"
status_logs_headers = { 'Content-Type' => 'application/json' }

# Datos de ejemplo para enviar en la solicitud POST
def generate_status_log_data(device_id)
  {
    status_log: {
      device_id: device_id,
      status_id: rand(0..3) # Genera un número al azar entre 1 y 3
    }
  }
end

# Bucle infinito para enviar solicitudes en intervalos regulares
interval = 10 # Intervalo en segundos

loop do
  data = generate_status_log_data(device_id)
  response = send_post_request(status_logs_url, status_logs_headers, data)
  puts "Respuesta: #{response.code} #{response.message}"
  puts response.body
  sleep(interval)
end
