# Plan de Diapositivas — Coloquio 2026-2
**Transportes Anillares y su importancia en la CDMX y ZMVM**
Avances de tesis — Junio 2026

---

## SECCIÓN 1 — Introducción
> Archivo: `s01_seccion_introduccion.tex` ← YA ESCRITA

### Diapositiva 1.1 — Pregunta de Investigación
Texto formal de la tesis con la pregunta central sobre el VFTModel.
Diseño: línea dorada arriba, texto centrado, línea corta abajo.

### Diapositiva 1.2 — Paráfrasis de la Hipótesis
Versión accesible de la pregunta: "¿cuánto mejoraría si el Periférico tuviera transporte circular?"
Contexto: las alcaldías del sur quedan desconectadas del sistema masivo.

### Diapositiva 1.3 — Metodología en 4 Fases
Diagrama horizontal con flechas: Construir → Diagnosticar → Simular → Proponer.
Bajo cada bloque, descripción breve de qué herramienta o proceso corresponde.

---

## SECCIÓN 2 — Marco Teórico: ¿Por qué un Anillo?
> Archivo: `s02_seccion_problema.tex` ← PARCIALMENTE ESCRITA (1 frame)

### Diapositiva 2.1 — La Geometría de la Ciudad ← YA ESCRITA
Tres columnas con imágenes históricas: XII Cuarteles (1940), Ciudad de 4 Contornos (2020), Modelo Radial.

### Diapositiva 2.2 — La Paradoja del Periférico ← PENDIENTE
**Columna izquierda (60% del ancho):**
Caja provisional que ocupa ese espacio, indicando que aquí irá el
`mapa02_cobertura_sur.png` — isócrona de cobertura del transporte masivo.
El hueco visible al sur es el argumento visual central.

**Columna derecha (40%):**
Texto corto: el Periférico conecta en papel, pero hoy es autopista de autos.
Las alcaldías del sur no tienen ninguna línea masiva que las conecte entre sí
sin pasar por el centro.

### Diapositiva 2.3 — El Costo de Ser Periférico ← PENDIENTE
Tres bloques visuales con datos duros, cada uno con número grande y descripción breve:
- **>122 min** — tiempo de viaje promedio desde el 4to contorno
- **60%** — viajes en transporte informal o de baja capacidad
- **32%** — de la población vive fuera del 3er contorno

Remate al centro: frase que vincule el dato técnico con la justicia urbana.

### Diapositiva 2.4 — ¿Por qué un Anillo? El Respaldo Teórico ← PENDIENTE
Dos columnas simétricas, cada una con una imagen de diagrama de aristas:
- Izquierda: `Diagrama1Aristas.png` → red radial = circuito en serie. Si falla un nodo, colapsa.
- Derecha: `Diagrama2Aristas.png` → red con anillo = circuito en paralelo. Hay rutas alternativas.

Subtítulo de introducción: referencia a Aldous (2019) con la analogía eléctrica.

### Diapositiva 2.5 — No es un Experimento, Ya Funciona ← PENDIENTE
**Columna izquierda:** imagen `M7Estambul.png` en un bloque con descripción de la línea orbital.
**Columna derecha:** lista de ciudades que ya tienen anillos de transporte masivo
(Moscú, Beijing, Berlín, París, Estambul), con año y longitud aproximada de cada línea.

---

## SECCIÓN 3 — El Modelo Analítico
> Archivo: `s03_seccion_modelo_analitico.tex` ← VACÍO

### Diapositiva 3.1 — De la Ciudad al Grafo ← PENDIENTE
**Columna izquierda:** imagen `AbstraccionComponentesGrafo.PNG`.
**Columna derecha:** explicación sin jerga técnica usando la analogía
del plano del metro en papel: estaciones = puntos, líneas = conexiones,
pero el modelo además mide el costo de ir de A a B y la vulnerabilidad de cada punto.
Lista de datos de entrada: feeds GTFS de Metro, Metrobús, RTP y tren ligero.

### Diapositiva 3.2 — Los 3 Indicadores Clave ← PENDIENTE
Subtítulo introductorio: "Qué mide cada indicador, sin fórmulas."
Tres columnas con imagen + explicación accesible:
- **DI** + `DistanciaEuclidiana.png` — rodeo geométrico: qué tan largo es el viaje real vs. la distancia en línea recta. DI alto = rodeo innecesario.
- **B(v)** + `CentralidadItnermediacion.png` — cuello de botella: qué tan indispensable es una estación. Si falla una con B(v) alto, muchos viajes se interrumpen.
- **ΔE** + `RobustezGeometrica.png` — fragilidad: cuánto cae la eficiencia total si se elimina una estación.

Remate: los tres juntos responden ¿dónde está el problema?, ¿quién lo causa? y ¿qué tan grave es?

### Diapositiva 3.3 — Las Herramientas Propias ← PENDIENTE
**Columna izquierda:** imagen `EsquemaVFTArquitecture.png`.
**Columna derecha:** lista numerada del pipeline:
1. Apimetro (Go) — consume datos GTFS y construye el grafo.
2. VFTModel (Python) — calcula los indicadores y simula escenarios con/sin el anillo.
3. QGIS — traduce los resultados en mapas para la tesis.

Punto clave a comunicar: herramientas de autoría propia, no software comercial.

---

## SECCIÓN 4 — Resultados Preliminares
> Archivo: `s04_seccion_resultados_preeliminares.tex` ← VACÍO

### Diapositiva 4.1 — ¿Qué Dice el Modelo? ← PENDIENTE
Tabla comparativa de tres filas (antes/después/cambio):
- DI Xochimilco → Santa Fe: 1.87 → 1.20 (−35%)
- Tiempo promedio de viaje: 85 min → 65 min (−24%)
- Vulnerabilidad de Pantitlán (ΔE): 36% → 17% (−53%)

Nota al pie: resultados sujetos a refinamiento en la fase de simulación completa.
Callout destacando el hallazgo más contundente.

### Diapositiva 4.2 — El Hueco de Cobertura ← PENDIENTE
Caja provisional que ocupa casi toda la diapositiva, indicando que aquí irá
`mapa02_cobertura_sur.png` — mapa de cobertura actual del transporte masivo sobre la ZMVM.
Las zonas sin cobertura (blancas) se concentran en el sur: Xochimilco, Tláhuac, Milpa Alta, Tlalpan.
Texto breve bajo el mapa vinculando el vacío cartográfico con el uso de transporte informal.

### Diapositiva 4.3 — Nodos Críticos ← PENDIENTE
Caja provisional que ocupa casi toda la diapositiva, indicando que aquí irá
`mapa04_nodos_criticos.png` — mapa de centralidad de intermediación B(v).
Los nodos más críticos resaltados: Pantitlán, Indios Verdes, Tacubaya.
Texto breve: con el corredor anillar, cada nodo crítico tendría al menos una ruta alternativa.

---

## SECCIÓN 5 — Avances y Cierre
> Archivo: `s05_seccion_cierre.tex` ← VACÍO

### Diapositiva 5.1 — Estado Actual de la Tesis ← PENDIENTE
Tabla por capítulo con tres columnas: número, título y estado.
- Caps. 1–3: Completos (revisados por tutor)
- Cap. 4: En revisión (Apimetro y VFTModel)
- Cap. 5: En construcción (Fases 1 y 2 avanzadas)
- Caps. 6–7: Pendientes (inicio sept. 2026 y dic. 2026 respectivamente)

### Diapositiva 5.2 — Lo que Viene ← PENDIENTE
Cronograma visual horizontal con 4 etapas y flechas:
- Caps. 1–3: Hecho (bloque en tono suave)
- Caps. 4–5: Jun–Jul 2026 — simulación completa y resultados
- Cap. 6: Sept. 2026 — análisis socio-espacial
- Versión Sínodo: Dic. 2026 — documento completo para revisión

Nota al pie: el repositorio zmvm-transport-gis garantiza reproducibilidad.

### Diapositiva 5.3 — Cierre ← PENDIENTE
Diapositiva `[plain]` sin encabezado ni pie, centrada verticalmente.
Solo la frase de cierre entre líneas doradas arriba y abajo:

> "El Periférico ya existe.
> La pregunta no es si es posible —
> es si la ciudad puede darse el lujo de no construirlo."

Nombre, programa, institución y fecha al final en texto pequeño.

---

## Notas generales de producción

- Las imágenes de la tesis se encuentran en `Tesis_Latex/Figures/` (ruta relativa desde Coloquio2026-2: `../../../Tesis_Latex/Figures/`). Hay que agregar esa ruta a `\graphicspath` en `main.tex` antes de escribir las secciones que las usen.
- Las cajas provisionales de mapas se sustituirán por `\includegraphics` cuando los mapas QGIS estén exportados desde el repositorio `zmvm-transport-gis`.
- Los archivos `s03`, `s04` y `s05` existen pero están vacíos; hay que agregarlos al `\input` en `main.tex`.
- Las referencias nuevas que se necesitan agregar a `referencias.bib`: Aldous (2019) e INEGI Censo 2020.
