# 09-04 Revisión: Paper sobre APImetro y motor analítico BFT — GTFS, OSM, indicadores y estructura

**Revisión de borrador de paper sobre APImetro y BFT**
**Date:** 2026-09-04
**Attendees:** 
- [Usuario] (autor del paper)
- K (revisor)
**1. Executive Summary:**
- Objetivo: Revisar y pulir el borrador del paper de 2 páginas (con referencias) sobre la arquitectura APImetro y el motor analítico BFT, su uso de GTFS, OpenStreetMap y los indicadores derivados.
- Principales temas: 
  - Correcciones de redacción y precisión conceptual (evitar aseveraciones categóricas no probadas, definir términos técnicos, coherencia terminológica).
  - Claridad metodológica (qué hace APImetro vs. BFT; uso de GTFS y OSM; proceso de snapping).
  - Estructura del artículo (resumen de secciones al final de la introducción; recortes para ajustarse a extensión).
  - Citado y soporte bibliográfico (principios, métricas, algoritmos, lenguaje Go).
  - Resultados y visualizaciones (mapa sintético, indicadores clave con citas).
  - Conclusiones y trabajo futuro (evitar afirmaciones “inéditas”; propuesta de replicabilidad, mapatones, bidireccionalidad).
- Outcome: Lista detallada de ajustes editoriales y técnicos, decisión de incluir un mapa pequeño, reubicar párrafos, precisar términos (normalización vs. estandarización), añadir definiciones y citas, y construir un mini-resumen de secciones al cierre de la introducción.
**2. Key Action Items/Commitments for [Usuario]:**
- Incorporar definiciones claras de “discontinuidad” y “resolución insuficiente” en trazos GTFS [Responsable: Usuario; Deadline: 2026-09-06].
- Sustituir aseveraciones categóricas por formulaciones prudentes (“uno de los obstáculos”, “falta de homologación”, etc.) [Responsable: Usuario; Deadline: 2026-09-06].
- Especificar a qué “fuentes” se refiere la falta de homologación (p.ej., GTFS SEMOVI vs. Estado de México) [Responsable: Usuario; Deadline: 2026-09-06].
- Añadir resumen de secciones al final de la introducción (Sección 2 arquitectura; Sección 3 resultados; Sección 4 discusión/implicaciones) [Responsable: Usuario; Deadline: 2026-09-06].
- Agregar citas:
  - Eficiencia del lenguaje Go (fuente oficial) 
  - Indicadores (cobertura, centralidad, grado, etc.) 
  - Distancia de Hausdorff 
  - Uso/valor de datos colaborativos (Hackley u otra) [Responsable: Usuario; Deadline: 2026-09-07].
- Ajustar terminología:
  - Reemplazar “estandarización” por “normalización” donde corresponda 
  - Precisar “modelo de datos coherente” o usar término de BD con ejemplo [Responsable: Usuario; Deadline: 2026-09-06].
- Clarificar roles:
  - APImetro: ingesta GTFS, normalización, modelo unificado 
  - BFT: construcción de grafos, cálculo de indicadores (listar 2–3 con propósito y cita) [Responsable: Usuario; Deadline: 2026-09-07].
- Explicar el “snapping” (con término en cursivas/itálicas y sin “intermodal” si no aplica; describir cómo conecta líneas por proximidad geográfica) [Responsable: Usuario; Deadline: 2026-09-06].
- Reubicar el párrafo de “robustez” hacia la descripción de BFT o reformular como “usabilidad/aplicación” [Responsable: Usuario; Deadline: 2026-09-06].
- Reducir el texto para cumplir 2 páginas totales (incluyendo referencias): 
  - Recortar introducción a ~1 columna y breve 
  - Simplificar listas (evitar entornos numerados en LaTeX; usar texto corrido con numeración simple) 
  - Eliminar referencias redundantes (autorreferencia no publicada; reemplazar por nota al pie con link a GitHub) [Responsable: Usuario; Deadline: 2026-09-08].
- Incluir un mapa pequeño en Resultados para evidenciar la herramienta, sin extender el análisis [Responsable: Usuario; Deadline: 2026-09-08].
- Reformular conclusiones:
  - Evitar “canal inédito”; enfatizar “facilita” en lugar de “demuestra” 
  - Añadir breve párrafo de trabajo futuro (p.ej., permitir indicadores personalizados, mejoras de integración OSM/GTFS) [Responsable: Usuario; Deadline: 2026-09-08].
- Revisar términos técnicos muy específicos (“fuerza capilar”) y aterrizar su explicación en lenguaje claro para el público del congreso [Responsable: Usuario; Deadline: 2026-09-07].
- Generar/recortar el abstract en inglés con soporte de una herramienta de lenguaje (p.ej., auto) siguiendo lineamientos de abstracts científicos [Responsable: Usuario; Deadline: 2026-09-07].
**3. Detailed Breakdown by Topic:**
**Topic 1: Redacción y precisión conceptual**
- Puntos clave:
  - Evitar aseveraciones categóricas no sustentadas (“enfrenta un obstáculo recurrente” → “uno de los obstáculos recurrentes”).
  - Definir términos como “discontinuidades” y “resolución insuficiente” con ejemplos concretos (p.ej., rutas inconclusas por carencia de digitalización; diferencias de campos como delegación/código postal).
  - Sustituir “falta de homologación” especificando entre cuáles GTFS (SEMOVI vs. EdoMex).
  - No usar “principio de acceso a la información” sin cita; si es opinión, reformular como tesis del autor sin adjudicarlo a un “principio”.
  - Evitar “este/eso” tras punto y aparte; nombrar explícitamente el referente.
- Decisiones:
  - Se adoptará un estilo prudente y definiciones explícitas en el texto.
- Acciones:
  - Usuario reformula frases categóricas y define términos con ejemplos; precisa las fuentes comparadas.
**Topic 2: Terminología técnica (GTFS, normalización, modelo de datos)**
- Puntos clave:
  - GTFS ya es un estándar; “estandarizar” GTFS es confuso. Usar “normalizar” (unificar formato y campos para manejo uniforme).
  - “Modelo de datos coherente”: precisar si existe término canónico en BD (p.ej., “esquema unificado”/“modelo canónico”) o ejemplificar qué uniforma (campos faltantes, formatos).
- Decisiones:
  - Reemplazar “estandarización” por “normalización” y explicar alcance práctico (“hacer más sencillo de manejar para públicos no programadores”).
- Acciones:
  - Usuario actualiza terminología y añade una breve explicación con ejemplos.
**Topic 3: Arquitectura y capas (APImetro vs. BFT)**
- Puntos clave:
  - APImetro: ingiere GTFS oficiales (SEMOVI), normaliza y unifica.
  - BFT: consume servicios de APImetro, construye grafos y calcula indicadores de eficiencia de la red.
  - Describir indicadores con propósitos y citas (cobertura, centralidad, grado, etc.).
- Decisiones:
  - Clarificar funciones separadas de cada capa; listar 2–3 indicadores con definiciones breves y fuente.
- Acciones:
  - Usuario agrega párrafo metodológico conciso y citas correspondientes.
**Topic 4: Snapping y conexiones entre sistemas**
- Puntos clave:
  - “Algoritmo de ajuste geométrico intermodal”: confuso. Usar “snapping” (en itálicas) y explicar que conecta por proximidad geográfica.
  - Evitar “intermodal” si no se aplican restricciones por modo; aclarar que puede conectar metro-RTP-trolebús cuando exista conexión caminable.
- Decisiones:
  - Reetiquetar y explicar snapping; retirar “intermodal” si no aporta.
- Acciones:
  - Usuario reformula el párrafo y aclara criterios de conexión.
**Topic 5: Citas y soporte bibliográfico**
- Puntos clave:
  - Citar eficiencia de Go (fuente oficial/documentación).
  - Citar distancia de Hausdorff y su uso para comparar geometrías (y explicar propósito).
  - Citar indicadores (cobertura, centralidad, grado) de papers base.
  - Citar valor de datos colaborativos (Hackley u otra), sin afirmar específicamente sobre Mexibús si la fuente no lo respalda; reformular como evidencia general de calidad colaborativa.
- Decisiones:
  - Añadir todas las citas faltantes; reformular donde las fuentes no cubren casos concretos.
- Acciones:
  - Usuario compila y añade citas; ajusta la redacción para alinearla con las fuentes.
**Topic 6: Resultados y visualización**
- Puntos clave:
  - Incluir un mapa pequeño para demostrar la herramienta (no extender análisis).
  - Reformular indicadores reportados (p.ej., “Milpa Alta presenta 11.75% de cobertura”, sin “peor alcaldía”).
  - Explicar métricas técnicas con lenguaje accesible (p.ej., “centralidad y grado nodal” → nodos con alta concentración de flujos; evitar “fuerza capilar” o definirla claramente).
- Decisiones:
  - Añadir mapa; simplificar lenguaje de resultados; mantener foco demostrativo de la herramienta.
- Acciones:
  - Usuario incorpora mapa y ajusta descripciones de indicadores.
**Topic 7: Estructura y extensión del artículo**
- Puntos clave:
  - Paper de 2 páginas incluyendo referencias.
  - Recortar introducción a una columna y breve; finalizar con resumen de secciones.
  - En resultados, usar numeración en línea en lugar de entornos LaTeX que ocupan espacio.
  - Eliminar autorreferencias no publicadas; usar nota al pie con GitHub.
- Decisiones:
  - Aplicar recortes consistentes; optimizar formato para ahorrar espacio.
- Acciones:
  - Usuario realiza recortes, simplifica listas y ajusta referencias.
**Topic 8: Conclusiones y trabajo futuro**
- Puntos clave:
  - Evitar afirmaciones “inéditas”; reconocer que GTFS+OSM es un canal ya utilizado.
  - Usar “facilita” en lugar de “demuestra” cuando corresponde.
  - Añadir trabajo futuro: permitir indicadores personalizados, fortalecer integración OSM/GTFS, mejorar documentación para públicos no técnicos.
  - Vincular replicabilidad regional, mapatones temáticos y bidireccionalidad con la arquitectura propuesta.
- Decisiones:
  - Conclusiones sintéticas (2–3 párrafos), orientadas a utilidad y próximos pasos.
- Acciones:
  - Usuario reescribe conclusiones y agrega párrafo de trabajo futuro.
**Topic 9: Abstract en inglés**
- Puntos clave:
  - Recortar y ajustar el abstract conforme a lineamientos científicos.
  - Sugerencia: usar auto para generar/depurar el abstract con el artículo completo como insumo.
- Decisiones:
  - Generar nuevo abstract breve y preciso.
- Acciones:
  - Usuario produce el abstract recortado y lo valida.
**Topic 10: Varios (LaTeX, sintaxis, erratas)**
- Puntos clave:
  - Corregir “gorritas”/caracteres escapados y sintaxis LaTeX.
  - Verificar consistencia de idioma/terminología (colectivos → “autobuses”).
  - Ajustar título y cumplir requerimientos formales del congreso.
- Decisiones:
  - Pasar corrección de estilo final antes del envío.
- Acciones:
  - Usuario realiza limpieza final de sintaxis y estilo.