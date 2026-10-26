# Notas para corregir el artículo (`main.tex`) — después de la presentación SOTM

Hallazgos detectados al construir la presentación (`Presentacion-Igisc/`), contrastando el
artículo con la tesis (`TesisUrbanismo/4-Capas-Codigo/4-1-Apimetro/`).

**Fuente de verdad: la tesis.** El artículo se escribió antes de una corrección importante en el
código de VFTModel; las cifras de resultados deben tomarse de la tesis (cap. 5, corrida 2026-10-04).

**Estado:** ✅ corregido · 🔴 pendiente

| # | Estado | Sección del artículo | Problema | Corrección propuesta |
|---|---|---|---|---|
| 1 | 🔴 | Metodología, párr. 4 (l. ~159) | La lista de sistemas incluye Colectivo, Microbús y Autobús, que no forman parte de la red | Usar la lista de la Tabla 5.3 de la tesis: Tren Interurbano, Tren Suburbano, Metro, Tren Ligero, Trolebús (L10 y compartido), Cablebús, Mexicable, Metrobús, Mexibús, Pumabús, RTP, Corredores Concesionados |
| 2 | 🔴 | Metodología y Resultados | "11 sistemas": la Tabla 5.3 lista 12 sistemas distintos (incluye Tren Interurbano), pero el desglose de aristas de Resultados tiene 11 categorías sin Tren Interurbano | Definir el conteo correcto y unificarlo en todo el texto; revisar también el 88 % / 12 % |
| 3 | 🔴 | Metodología, párr. 1 (l. ~124–128) | Atribuye el procesamiento (ingesta / unificación) a Go | Según la tesis (Anexo A2), el ETL es en Python (GeoPandas → PostGIS); Go solo sirve la API REST |
| 4 | 🔴 | Metodología | El ETL no usa el nombre de la tesis | Adoptar *Extraction, Treatment and Liberation* (nota al pie de 4-1-1 de la tesis) |
| 5 | 🔴 | Metodología, párr. 4 (l. ~162) | Atribuye a Apimetro la normalización → *snapping* ≤ 50 m | El usuario indica que ese proceso no es de Apimetro; revisar a qué capa corresponde y reubicarlo |
| 6 | 🔴 | Metodología, párr. 3 | OSM cubre "Mexibús y autobuses periféricos"; omite Mexicable y Trolebús L13 | Fuentes OSM según la tesis (cap. 5): Trolebús L13 (incompleta en el portal), Mexicable y Mexibús (sin registro) |
| 7 | 🔴 | — (no aparece) | Licencia del código | Si se menciona: *Business Source License 1.1*, con conversión a Apache 2.0 en abril de 2029 (no BSD) |
| 8 | 🔴 | Resultados, párr. 2 (l. ~200) | "22 766 entidades espaciales" no coincide con la tesis ni con la base | Tesis 5.2 (corrida 4 oct): 23 550 entidades = 22 872 estaciones y paradas + 678 trazos → **11 115 nodos** (ubicaciones únicas). `04_seed.sql` (26 oct): 22 878 registros → 11 115 ubicaciones únicas; 309 líneas o rutas |
| 9 | 🔴 | Resultados, párr. 2 | Aristas: el artículo dice 45 679 (25 197 + 20 482), igual que el log del 18 abr (Anexo B.4); la tesis 5.2 dice 45 517 (25 025 + 20 492), con desglose por sistema distinto | Unificar con la corrida vigente de la tesis (45 517) y actualizar el desglose por sistema |
| 10 | 🔴 | Metodología, párr. 3 (l. ~154) | Validación cruzada con distancia de Hausdorff (`hausdorff1914`, umbral configurable): no existe en la tesis ni en el código de Apimetro | Eliminarla del artículo (y la cita `hausdorff1914` si queda sin uso) |
| 11 | 🔴 | Metodología, párr. 3 | Describe la integración de OSM en "tres niveles" con consultas a relaciones `route=bus/subway/light_rail` | Proceso real (autor, 26 oct): (1) identificar vacíos del portal de datos abiertos, (2) buscar los sistemas faltantes en otras fuentes, (3) OSM los resuelve, (4) script de validación en Python para integrarlos. OSM aporta ubicación, nombres, alcaldía / municipio y actualizaciones; los datos técnicos (velocidad, frecuencia, capacidad, CETRAM) vienen del portal |
| 12 | 🔴 | Resultados, párr. 1 | Factor de desviación: "DF = 1.545, 54 % más"; caso extremo San Pedro Atocapan → Santa Catarina Yecahuizotl, DF = 2.52 | Tesis 5.3.4: indicador **DI**; media 1.701 (≈ 70 % más), mediana 1.54, rango 1.03–4.42 (100 pares, semilla 42); caso 9 Milpa Alta → Santa Catarina Yecahuizotl, DI = 2.99 (14.8 km en línea recta vs. 44.3 km en red). Revisar también la figura `Dashboard_Apimetro_2026_Factor_desviacion_grafica.pdf` (otra corrida) |
| 13 | 🔴 | Resultados, párr. 1 | Fuerza capilar: nodo máximo "en la zona de Hospitales Sur" | Tesis 5.3.3: $FC_H$ = 130 en el entorno del Hospital Gea González; le siguen Acoxpa (111) y La Rosa, todos sobre la Calzada de Tlalpan. Cobertura de Milpa Alta (11.75 %) sí coincide |
