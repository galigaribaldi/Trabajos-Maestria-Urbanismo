# Plan de presentación — SOTM Latam 2026

**Ponencia:** Democratización de la Información Metropolitana: Apimetro como Infraestructura de Datos Abiertos y Motor de Análisis Topológico de Red en la ZMVM
**Evento:** State of the Map Latam 2026 · Antiguo Colegio de San Ildefonso, CDMX · 27 oct 2026
**Duración:** 20 min exposición + 5–10 min preguntas (total ≈ 30 min)
**Fuente:** `../main.tex` (artículo iGISc / ISPRS)

**Estado:** ✅ construido · 🟡 en revisión · 🔴 no implementado — *actualizado 26 oct 2026*

---

## Hilo conductor

> Los datos oficiales no alcanzan → OSM llena los vacíos → Apimetro une ambos y los vuelve fáciles de usar → esto es lo que se puede hacer con ellos → la comunidad puede ayudar a mejorarlo.

- ✅ Centro de la presentación: **Apimetro (primera capa)**
- ✅ VFTModel solo como *ejemplo de uso*, no como tema principal
- ✅ Público objetivo: comunidad OSM (mapeadores, desarrolladores, activistas de datos abiertos)

---

## Decisiones tomadas

- ✅ **Demo:** video local (sin conexión en vivo)
- ✅ **Coautor:** Dr. David López Flores — Instituto de Ingeniería, UNAM; **asesor de tesis de la Maestría en Urbanismo, FES Acatlán** (aparece en la portada)
- ✅ **Tiempos:** se mantienen las 6 diapositivas del bloque 2 (son problemas de la investigación); el bloque 3 cede 1–2 min
- ✅ **Idioma:** español; anglicismos en *cursiva* (p. ej. *snapping*, *pipeline*, *conflation*, *dashboard*), igual que las citas
- 🟡 **Licencias:**
  - ✅ Código de Apimetro: *Business Source License* 1.1 (BSL) — uso gratuito académico / investigación / sector público; pasa a Apache 2.0 en abril de 2029
  - 🟡 Datos abiertos CDMX: uso libre (confirmar nombre exacto de la licencia del portal)
  - 🟡 Datos OSM: abiertos bajo ODbL — requiere atribución "© colaboradores de OpenStreetMap" y aplica *share-alike* a bases de datos derivadas (preparar respuesta)

---

## Estructura por bloques (≈ 21–23 diapositivas)

### ✅ 1. Apertura — 0:00–1:30 (`secciones/01-apertura.tex`)
- ✅ Portada: título, subtítulo, autor + coautor (asesor de tesis), afiliaciones, logo SOTM
- ✅ ¿Quién y por qué?: ítems de "¿Quién?" y "¿Por qué?" (borradores `% EDITAR`)
- ✅ Pregunta gancho: *"¿Cuántas fuentes de datos necesitas para trazar un viaje de Ecatepec (EDOMEX) a Milpa Alta (CDMX)?"*
- ✅ Respuesta al gancho: diagrama horizontal 3 fuentes → validación → viaje; "≥ 3 fuentes · …¿y si fuera una sola consulta?"

### ✅ 2. El problema — 1:30–6:00 (6 diapositivas, `secciones/02-problema.tex`)
- ✅ Red radial de la ZMVM e ineficiencias funcionales (Padilla 2022; Molinero 2002 en `.bib`, aún sin citar)
- ✅ GTFS de SEMOVI: rutas inconclusas, atributos incompatibles, Mexibús excluido (SEMOVI 2020)
- ✅ Corte de información en la frontera CDMX / Estado de México
- ✅ Idea fuerza: **"abrir el dato ≠ democratizarlo"** (Gurstein 2011; CPEUM Art. 6)

Diapositivas construidas:
1. ✅ Un problema político que se volvió estructural
2. ✅ CDMX: el centro del poder político y económico
3. ✅ Modelos de estructura urbana en la ZMVM
4. ✅ Modelo de expansión (fases 1–3)
5. ✅ Dispersión en los datos (GTFS · polígonos · parámetros)
6. ✅ Abrir el dato no es democratizarlo (tiempo · conocimientos · capital tecnológico)

### 🔴 3. OSM como pieza clave — 6:00–8:00 (2 diapositivas, `secciones/03-osm-pieza-clave.tex` vacío)
- 🔴 Calidad comparable a la oficial (Haklay 2010; Barrington-Leigh 2017)
- 🔴 Nivel 1 — **Geometrías de ruta:** relaciones `route=bus`, `route=subway`, `route=light_rail`
- 🔴 Nivel 2 — **Cobertura periférica:** Mexibús y autobuses del Edomex obtenidos íntegramente de OSM
- 🔴 Nivel 3 — **Validación cruzada:** distancia de Hausdorff entre trazas GTFS y OSM, umbral configurable
- 🔴 Visual antes/después: trazo GTFS roto (Trolebús L13) vs. geometría OSM

### 🟡 4. Apimetro — bloque central — 8:00–13:00 (4 diapositivas, `secciones/04-apimetro.tex`)
- ✅ Origen del proyecto: *"¿Cómo surge Apimetro?"* — La Saga de la Catacumba + flujo entrada → procesamiento → salida (borradores `% EDITAR`)
- ✅ **Proceso 1 — ETL** (*Extraction, Treatment and Liberation*): datos abiertos + OSM (Mexibús, Mexicable, Trolebús L13) → Python/GeoPandas en 2 fases → PostgreSQL + PostGIS (`Diagramas-TiKz/apimetro-etl.tex`, borrador `% EDITAR` sobre OSM). Normalización → *snapping* ≤ 50 m **no** es de Apimetro: no va aquí
- 🟡 Modelo de datos: frame *"Esquema E-R de Apimetro"* con diagrama TikZ (`Diagramas-TiKz/apimetro-er-simple.tex`) — estaciones, líneas, polígonos y relaciones
  - ✅ Etiquetas de cardinalidad (N, M, 1) ancladas con `pos=` (solo en la copia de la presentación)
  - 🔴 Mencionar jerarquía / nodos CETRAM y `MultiLineString` tramo a tramo
- ✅ **Proceso 2 — Salida: API REST en GeoJSON**: diagrama `apimetro-salidas-tipos` (copia de la tesis) + porqués (*SaaS*, texto plano, GeoPackage) + fragmento explicado de la estación 20 de Noviembre (borradores `% EDITAR`)
- ✅ **¿Qué transportes integra Apimetro?**: tabla sencilla sistema → líneas → estaciones (12 · 309 · **11 115** estaciones y paradas = ubicaciones únicas, igual que los nodos del grafo de la tesis; los 22 878 son registros con paradas repetidas por ruta); sin jerarquía ni derecho de vía (decisión del usuario)
- ✅ **Las líneas, una por una**: tabla sencilla con los nombres de las líneas; RTP, Corredores Conc. y Pumabús solo con conteo + ejemplo. Mexibús "01" se cuenta como línea distinta
- ✅ **Un solo estándar, sin perder detalles**: homologación (cada sistema con su organismo / sindicato) → mismo formato e independencia de datos (borradores `% EDITAR`)
- ✅ **Tres formas de usar los datos**: web (`apimetro.dev`) · base de datos (`seed.sql` generado con el ETL, *próximamente en GitHub*) · código (Docker Compose) + licencia BSL 1.1
  - 🔴 Pendiente posterior: subir el `seed.sql` actual a GitHub (hoy `04_seed.sql` está en `.gitignore`; en el repo solo existe `seed.sql.disabled` del 28 ago)
- ⏱️ El bloque ya suma 8 diapositivas + demo para 5 min: revisar tiempos al final
- 🔴 Sistemas (Tabla 5.3 de la tesis): Tren Interurbano, Tren Suburbano, Metro, Tren Ligero, Trolebús (L10 y compartido), Cablebús, Mexicable, Metrobús, Mexibús, Pumabús, RTP, Corredores Conc. — ⚠️ son 12, el artículo dice 11; revisar 88 % / 12 %
- 🔴 Cifras de escala (tesis 5.2): 11 115 nodos · 45 517 aristas (25 025 servicio + 20 492 transbordo) · 38 MB — el artículo trae 45 679 (ver notas de corrección)
- 🔴 **Demo en video local (60–90 s, aún no existe → frame placeholder):** consulta a `apimetro.dev` → capa cargada en QGIS

### 🔴 5. Usos: qué se puede hacer — 13:00–17:00 (3 diapositivas)
- 🔴 VFTModel como caso de uso (Python: NetworkX, GeoPandas, Momepy)
- 🔴 **Cobertura espacial:** Milpa Alta con 11.75 % de superficie dentro de 800 m
- 🔴 **Factor de desviación:** DF = 1.545 (54 % más recorrido); caso extremo San Pedro Atocapan → Santa Catarina Yecahuizotl, DF = 2.52
- 🔴 **Fuerza capilar:** FC_H = 130 en Hospitales Sur
- 🔴 Otros usos sin programar: QGIS, Kepler.gl, Leaflet; exportación GeoPackage

### 🔴 6. Invitación a la comunidad — 17:00–19:00 (1–2 diapositivas)
- 🔴 Mapatones temáticos: Ecatepec, Nezahualcóyotl, Chimalhuacán
- 🔴 Validación bidireccional: publicar resultados de *conflation* para corregir OSM y GTFS
- 🔴 Replicabilidad regional: Bogotá, São Paulo, Buenos Aires

### 🔴 7. Cierre — 19:00–20:00 (1 diapositiva)
- 🔴 Mensaje final: *"el dato oficial y el colaborativo se potencian mutuamente"*
- 🔴 Códigos QR: dashboard, repositorio, API
- 🔴 Contacto y agradecimientos

---

## Diapositivas de respaldo para preguntas (fuera del conteo)

- 🔴 **Licencias:** BSL 1.1 → Apache 2.0 en 2029 (código) / uso libre (datos CDMX) / ODbL (datos OSM) — atribución y *share-alike*
- 🔴 **Actualización:** frecuencia de reingesta de GTFS y OSM; ¿automática?
- 🔴 **Umbral de Hausdorff:** valor usado y tratamiento de discrepancias marcadas
- 🔴 **Colectivos y microbuses:** origen de los datos y confiabilidad
- 🔴 **Cómo contribuir:** repositorio, *issues*, documentación
- 🔴 **Sostenibilidad:** quién mantiene el proyecto y dónde está alojado

---

## Material visual

### Disponible (`../figures/`)
- 🔴 `Dashboard_Apimetro_2026_Red_ZMVM.pdf` → bloque 4 (red unificada)
- 🔴 `Dashboard_Apimetro_2026.pdf` → bloque 4 (panel REST)
- 🔴 `Mapa_Cobertura_Mapa_Calor_vftmodel.pdf` → bloque 5 (cobertura)
- 🔴 `Dashboard_Apimetro_2026_Factor_desviacion_grafica.pdf` → bloque 5 (DF)
- 🔴 `Dashboard_VFTModel_2026_Fuerza_capilar_grafica.pdf` → bloque 5 (FC_H)

### Por crear
- 🔴 Diagrama de arquitectura de Apimetro (bloque 4)
- 🔴 Antes/después GTFS vs. OSM — Trolebús L13 (bloque 3)
- 🔴 Video de demo local (bloque 4)
- 🔴 Códigos QR (bloque 7)

---

## Pendientes técnicos (plantilla)

- ✅ Agregar coautor y su afiliación en el bloque `PERSONALIZACIÓN` de `main.tex` (`\Coautor`, `\AfiliacionCoautor`)
- 🟡 Pasar referencias de `../ISPRSguidelines_authors.bib` a `referencias.bib` — copiadas las de los bloques 1–2; faltan las de los bloques 3–5 (Barrington-Leigh, Hausdorff, Neis, Fortin…)
- 🟡 Repartir los bloques en archivos propios (`01-apertura`, `02-problema`, `03-osm-pieza-clave`, …); `main.tex` aún incluye las plantillas `s01_intro`, `s02_desarrollo`, `s03_conclusiones` — quitarlas al final
- ✅ Compilar: `make PresentacionSotm DIR=Extracurriculares/Igisc-2026-isprs/Presentacion-Igisc`
- ✅ Citas autor–año: `plainnat` + `natbib[round]` + corrección de `hyperref` en `Latex/BeamerThemeSotm.tex`
- 🔴 Agregar `../figures/` al `\graphicspath` del tema para usar las figuras del artículo
- 🔴 Decidir si se conserva el frame de Contenido (resta tiempo al bloque 1)

---

## Notas libres

- 🟡 Revisar los borradores marcados con `% EDITAR` en `01-apertura.tex` y `02-problema.tex`
- 🟡 Confirmar el crédito de la imagen `ArichieExpress.JPEG` (pie actual: "Archie's Press")
- 🟡 Cita CPEUM sale larga ("Cámara de Diputados del H. Congreso de la Unión, 1917"); valorar forma corta
