# Prueba Técnica Científico de Datos - Puntored

## Índice
- [Prueba Técnica Científico de Datos - Puntored](#prueba-técnica-científico-de-datos---puntored)
  - [Índice](#índice)
  - [Objetivo General](#objetivo-general)
  - [Estructura del Repositorio](#estructura-del-repositorio)
  - [Sección 1: Preguntas Teóricas](#sección-1-preguntas-teóricas)
    - [Python](#python)
    - [SQL](#sql)
    - [Machine Learning](#machine-learning)
  - [Sección 2: Prueba Práctica](#sección-2-prueba-práctica)
    - [SQL Práctica](#sql-práctica)
    - [Python y Machine Learning](#python-y-machine-learning)
  - [Resumen de Resultados](#resumen-de-resultados)
  - [Conclusiones](#conclusiones)
    - [***Cristian Andrés Riveros***](#cristian-andrés-riveros)

---

## Objetivo General
El objetivo de esta prueba es evaluar tanto los conocimientos teóricos como las habilidades prácticas en el manejo de datos, SQL, Python y Machine Learning. La prueba se divide en dos secciones principales: una teórica y otra práctica. En la sección teórica, se evalúa el conocimiento conceptual sobre Python, SQL y Machine Learning. En la sección práctica, se aplican estos conocimientos para resolver problemas concretos, incluyendo la manipulación de datos con SQL y la construcción de un modelo de Machine Learning para predecir si un cliente hará default en su crédito.

---

## Estructura del Repositorio
- **Seccion_1_Teorica**: Contiene las respuestas a las preguntas teóricas sobre Python, SQL y Machine Learning.
- **Seccion_2_Practica**: Incluye los ejercicios resueltos de SQL y Python, así como el desarrollo del modelo de Machine Learning.

---

## Sección 1: Preguntas Teóricas
### Python
1. **Lista vs Conjunto**: Se explica la diferencia entre una lista (ordenada, permite duplicados) y un conjunto (no ordenado, sin duplicados), y en qué situaciones usar cada uno.
2. **Método `apply()`**: Se describe cómo `apply()` permite aplicar una función a lo largo de un eje en un DataFrame de pandas, con un ejemplo práctico.
3. **`deepcopy()` vs `copy()`**: Se explica la diferencia entre una copia superficial (`copy()`) y una copia profunda (`deepcopy()`), con un ejemplo que ilustra su uso.

### SQL
4. **Consulta de Ventas**: Se proporciona una consulta SQL para obtener el total de ventas por cliente en el último mes.
5. **INNER JOIN vs LEFT JOIN**: Se explica la diferencia entre ambos tipos de join, con ejemplos prácticos.
6. **Cláusula `HAVING`**: Se describe el uso de `HAVING` y cómo difiere de `WHERE`, con un ejemplo.

### Machine Learning
7. **Modelos Supervisados vs No Supervisados**: Se explica la diferencia entre ambos tipos de modelos, con ejemplos de cada uno.
8. **Métricas de Clasificación**: Se mencionan tres métricas (precisión, recall y F1-score) y se explica cuándo usar cada una.

---

## Sección 2: Prueba Práctica
### SQL Práctica
En esta sección se resuelven consultas SQL para:
1. Obtener los 5 clientes con mayor monto total de ventas en los últimos 6 meses.
2. Calcular el ticket promedio de ventas por cliente en el último año.
3. Obtener el nombre completo de los clientes y su monto total de ventas.
4. Calcular el ingreso promedio de ventas por mes.
5. Calcular el ranking de clientes por ventas en el último año.
6. Seleccionar clientes cuyo total de ventas es superior al promedio general.

### Python y Machine Learning
En esta sección se trabaja con un dataset de clientes bancarios para predecir si un cliente hará default en su crédito. Los pasos incluyen:
1. **Limpieza de Datos**: Se realiza una limpieza básica del dataset.
2. **División de Datos**: Se divide el dataset en conjuntos de entrenamiento (80%) y prueba (20%).
3. **Entrenamiento de Modelos**: Se entrenan modelos de clasificación como Random Forest, XGBoost y Regresión Logística. Estos modelos se eligieron por su capacidad para manejar problemas de clasificación binaria y su robustez ante desequilibrios de clases.
4. **Evaluación del Modelo**: Se evalúan los modelos utilizando métricas como precisión, recall y F1-score. Se justifica la elección de estas métricas debido al desequilibrio de clases en el dataset.
5. **Hiperparametrización**: Se utiliza Random Search para la optimización de hiperparámetros. Aunque Grid Search hubiera sido preferible, los recursos computacionales no lo permitieron.
6. **Balanceo de Clases**: Se aplican técnicas de balanceo de clases (como SMOTE) para mejorar el rendimiento del modelo en la clase minoritaria (clientes que hacen default).
7. **Resultados**: El modelo final (Random Forest) obtuvo un recall de 0.70 para la clase 1,  lo que indica que, a pesar del desbalanceo de las clases el modelo cuenta con una buen performance para predecir la probabilidad de default de un cliente.

---

## Resumen de Resultados
- **Modelo Final**: Random Forest con hiperparámetros optimizados mediante Random Search.
- **Métricas**:
  - AUC-ROC: 0.83
  - Recall: 0.70
  - **Output**: Se generó un archivo CSV con la probabilidad de default para cada cliente, identificando aquellos con mayor riesgo. Y otro archivo que contiene aquello que representan un menor riesgo (no default).

---

## Conclusiones
La prueba permitió demostrar habilidades en el manejo de datos, tanto en SQL como en Python, y la capacidad para desarrollar y evaluar modelos de Machine Learning. Aunque se lograron buenos resultados, se identificó que el uso de Grid Search y técnicas más avanzadas de balanceo de clases podría mejorar aún más el rendimiento del modelo en futuras iteraciones.

### ***Cristian Andrés Riveros***
cristian1028andres@hotmail.com
