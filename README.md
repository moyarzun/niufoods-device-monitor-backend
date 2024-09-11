# Prueba Técnica Niu Foods - Backend para Aplicación de Monitoreo de Dispositivos

Aplicación para recepción de reportes y monitoreo de cambios de estado de dispositivos de hardware. Backend (servidor) desarrollado con Ruby on Rails, Sidekiq y Redis.
Desarrollado por [Mauricio Oyarzún](https://github.com/moyarzun).

## Requisitos

- Ruby (versión 2.7 o superior)
- Rails (versión 6.0 o superior)
- Node.js (versión 14 o superior)
- npm (versión 6 o superior)
- Base de datos (PostgreSQL recomendado)
- Redis

## Instalación

1. Clonar el repositorio de GitHub:

    ```bash
    git clone https://github.com/moyarzun/niufoods-device-monitor-backend.git
    cd niufoods-device-monitor-backend
    ```

2. Instalar las dependencias del proyecto:

    ```bash
    bundle install
    ```

3. Editar el archivo `config/database.yml` con los datos de conexión a la base de datos.

4. Asegurar que la base de datos esté en ejecución y accesible desde la ubicación del servidor.

5. Configurar la base de datos con migraciones y semillas para ambiente de desarrollo:

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

6. Editar el archivo `config/initializers/sidekiq.rb` con la dirección del servidor Redis.

## Ejecución en Ambiente de Desarrollo

    ```bash
    rails s
    ```

## Ejecución en Ambiente de Producción

1. Configurar la base de datos para producción:

    ```bash
    RAILS_ENV=production rails db:create
    RAILS_ENV=production rails db:migrate
    RAILS_ENV=production rails db:seed
    ```

2. Asegurar que los servidores PostgreSQL y Redis se encuentran en ejecución y son alcanzables por el servidor Ruby on Rails de producciíon.

3. Iniciar el servidor en modo producción:

    ```bash
    RAILS_ENV=production rails s
    ```

## Ejecución de script de simulación de dispositivos

1. Ejecutar script desde terminal:

   ```bash
   ruby scripts/device_simulator.rb
   ```

2. Seguir las instrucciones en pantalla para iniciar la simulación.
   * Seleccionar locación de la lista ingresando el ID de la locación. Si no hay locaciones disponibles o se desea crear una nueva, presionar ENTER y luego ingresar el nombre de la nueva locación.
   * Seleccionar dispositivo de la lista ingresando el ID del dispositivo. Si no hay dispositivos disponibles en la locación o se desea crear uno nuevo, presionar ENTER y luego ingresar el nombre del nuevo dispositivo.

3. El script enviará solicitudes HTTP a http://localhost:3001 (ubicación del servidor Backend local), el servidor responderá con el `job_id` del Job encolado en Redis con Sidekiq.

## Visualización de reportes de cambio de estado

Para observar los reportes generados y almacenados en Backend, es necesario ejecutar el cliente de Frontend una vez que el servidor de Backend se encuentra operativo. Visite https://github.com/moyarzun/niufoods-device-monitor-frontend para descargar el cliente y siga las instrucciones para ejecutarlo.
