# bots_in_congress #
Analisis de bots sociales en Twitter durante los discursos de Apertura de Sesiones del Congreso en Argentina (2016, 2020): https://twitter.com/guadag12/status/1236271057889345536

El repositorio cuenta con diferentes scripts (redactados en R (3) y en Python(1)) que siguen el siguiente orden:
1. Descarga de tweets (descarga_tweets.R)
2. Seleccion de muestra (seleccion_muestra.R)
3. Conexion a la API de Botometer y asignacion de probabilidad a las cuentas de la muestra del paso 2 (botometer_api_conexion.ipynb)*
4. Limpieza, manipulacion y visualizacion de la información recolectada en el paso 3.
