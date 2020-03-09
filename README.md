# Bots sociales en la #AperturasDeSesiones #
Analisis de bots sociales en Twitter durante los discursos de Apertura de Sesiones del Congreso en Argentina (2016, 2020): https://twitter.com/guadag12/status/1236271057889345536

El repositorio cuenta con diferentes scripts (redactados en R (3) y en Python(1)) que siguen el siguiente orden:
1. Descarga de tweets (descarga_tweets.R) para la apertura de sesiones 2016 y 2020.
2. Seleccion de muestra (seleccion_muestra.R) a partir de tweets obtenidos en el punto 1.
3. Conexion a la API de Botometer y asignación de probabilidad p/ las cuentas de la muestra del paso 2 (conexion_api_botometer.ipynb)
4. Limpieza, manipulacion y visualizacion (metricas_y_graficos.R) de la información recolectada en el paso 3.
