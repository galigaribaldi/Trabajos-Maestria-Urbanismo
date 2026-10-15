# Plan de presentación — SOTM Latam 2026

**Ponencia:** Democratización de la Información Metropolitana: Apimetro como Infraestructura de Datos Abiertos y Motor de Análisis Topológico de Red en la ZMVM
**Evento:** State of the Map Latam 2026 · Antiguo Colegio de San Ildefonso, CDMX · 27 oct 2026
**Duración:** 20 min exposición + 5–10 min preguntas (total ≈ 30 min)
**Fuente:** `../main.tex` (artículo iGISc / ISPRS)

---

## Hilo conductor

> Los datos oficiales no alcanzan → OSM llena los vacíos → Apimetro une ambos y los vuelve fáciles de usar → esto es lo que se puede hacer con ellos → la comunidad puede ayudar a mejorarlo.

- [ ] Centro de la presentación: **Apimetro (primera capa)**
- [ ] VFTModel solo como *ejemplo de uso*, no como tema principal
- [ ] Público objetivo: comunidad OSM (mapeadores, desarrolladores, activistas de datos abiertos)

---

## Decisiones tomadas

- [x] **Demo:** video local (sin conexión en vivo)
- [x] **Coautor:** David López — Instituto de Ingeniería, UNAM; mencionar que es **asesor de tesis de la Maestría en Urbanismo, FES Acatlán**
- [x] **Idioma:** español; anglicismos en *cursiva* (p. ej. *snapping*, *pipeline*, *conflation*, *dashboard*), igual que las citas
- [x] **Licencias:**
  - Código de Apimetro: BSD (confirmar variante: BSD-2 / BSD-3)
  - Datos abiertos CDMX: uso libre (confirmar nombre exacto de la licencia del portal)
  - Datos OSM: abiertos bajo ODbL — requiere atribución "© colaboradores de OpenStreetMap" y aplica *share-alike* a bases de datos derivadas (preparar respuesta)

---

## Estructura por bloques (≈ 16–18 diapositivas)

### 1. Apertura — 0:00–1:30 (2 diapositivas)
- [ ] Portada: título, subtítulo, autor + coautor (asesor de tesis), afiliaciones, logo SOTM
- [ ] Pregunta gancho: *"¿Cuántas fuentes de datos necesitas para trazar un viaje de Ecatepec a Coyoacán?"*

### 2. El problema — 1:30–5:00 (3 diapositivas)
- [ ] Red radial de la ZMVM e ineficiencias funcionales (Padilla 2022; Molinero 2002)
- [ ] GTFS de SEMOVI: rutas inconclusas, atributos incompatibles, Mexibús excluido (SEMOVI 2020)
- [ ] Corte de información en la frontera CDMX / Estado de México
- [ ] Idea fuerza: **"abrir el dato ≠ democratizarlo"** (Gurstein 2011; CPEUM Art. 6)

### 3. OSM como pieza clave — 5:00–8:00 (2–3 diapositivas)
- [ ] Calidad comparable a la oficial (Haklay 2010; Barrington-Leigh 2017)
- [ ] Nivel 1 — **Geometrías de ruta:** relaciones `route=bus`, `route=subway`, `route=light_rail`
- [ ] Nivel 2 — **Cobertura periférica:** Mexibús y autobuses del Edomex obtenidos íntegramente de OSM
- [ ] Nivel 3 — **Validación cruzada:** distancia de Hausdorff entre trazas GTFS y OSM, umbral configurable
- [ ] Visual antes/después: trazo GTFS roto (Trolebús L13) vs. geometría OSM

### 4. Apimetro — bloque central — 8:00–13:00 (4 diapositivas)
- [ ] Diagrama de arquitectura: GTFS + OSM → Go / PostgreSQL + PostGIS → normalización → *snapping* ≤ 50 m → API REST / GeoJSON
- [ ] Modelo de datos: *estaciones* (jerarquía, nodos CETRAM) y *líneas* (`MultiLineString` tramo a tramo)
- [ ] 11 sistemas: Metro, Metrobús, Cablebús, RTP, Trolebús, Tren Ligero, Tren Suburbano, Mexibús, Colectivo, Microbús, Autobús (88 % superficie / 12 % vía exclusiva)
- [ ] Cifras de escala: 22 766 entidades · 11 115 nodos · 45 679 aristas (25 197 servicio + 20 482 transbordo) · 38 MB
- [ ] **Demo en video local (60–90 s):** consulta a `apimetro.dev` → capa cargada en QGIS

### 5. Usos: qué se puede hacer — 13:00–17:00 (3 diapositivas)
- [ ] VFTModel como caso de uso (Python: NetworkX, GeoPandas, Momepy)
- [ ] **Cobertura espacial:** Milpa Alta con 11.75 % de superficie dentro de 800 m
- [ ] **Factor de desviación:** DF = 1.545 (54 % más recorrido); caso extremo San Pedro Atocapan → Santa Catarina Yecahuizotl, DF = 2.52
- [ ] **Fuerza capilar:** FC_H = 130 en Hospitales Sur
- [ ] Otros usos sin programar: QGIS, Kepler.gl, Leaflet; exportación GeoPackage

### 6. Invitación a la comunidad — 17:00–19:00 (1–2 diapositivas)
- [ ] Mapatones temáticos: Ecatepec, Nezahualcóyotl, Chimalhuacán
- [ ] Validación bidireccional: publicar resultados de *conflation* para corregir OSM y GTFS
- [ ] Replicabilidad regional: Bogotá, São Paulo, Buenos Aires

### 7. Cierre — 19:00–20:00 (1 diapositiva)
- [ ] Mensaje final: *"el dato oficial y el colaborativo se potencian mutuamente"*
- [ ] Códigos QR: dashboard, repositorio, API
- [ ] Contacto y agradecimientos

---

## Diapositivas de respaldo para preguntas (fuera del conteo)

- [ ] **Licencias:** BSD (código) / uso libre (datos CDMX) / ODbL (datos OSM) — atribución y *share-alike*
- [ ] **Actualización:** frecuencia de reingesta de GTFS y OSM; ¿automática?
- [ ] **Umbral de Hausdorff:** valor usado y tratamiento de discrepancias marcadas
- [ ] **Colectivos y microbuses:** origen de los datos y confiabilidad
- [ ] **Cómo contribuir:** repositorio, *issues*, documentación
- [ ] **Sostenibilidad:** quién mantiene el proyecto y dónde está alojado

---

## Material visual

### Disponible (`../figures/`)
- [ ] `Dashboard_Apimetro_2026_Red_ZMVM.pdf` → bloque 4 (red unificada)
- [ ] `Dashboard_Apimetro_2026.pdf` → bloque 4 (panel REST)
- [ ] `Mapa_Cobertura_Mapa_Calor_vftmodel.pdf` → bloque 5 (cobertura)
- [ ] `Dashboard_Apimetro_2026_Factor_desviacion_grafica.pdf` → bloque 5 (DF)
- [ ] `Dashboard_VFTModel_2026_Fuerza_capilar_grafica.pdf` → bloque 5 (FC_H)

### Por crear
- [ ] Diagrama de arquitectura de Apimetro (bloque 4)
- [ ] Antes/después GTFS vs. OSM — Trolebús L13 (bloque 3)
- [ ] Video de demo local (bloque 4)
- [ ] Códigos QR (bloque 7)

---

## Pendientes técnicos (plantilla)

- [ ] Agregar coautor y su afiliación en el bloque `PERSONALIZACIÓN` de `main.tex`
- [ ] Pasar referencias de `../ISPRSguidelines_authors.bib` a `referencias.bib`
- [ ] Repartir los bloques en `secciones/s01_intro.tex`, `s02_desarrollo.tex`, `s03_conclusiones.tex`
- [ ] Compilar: `make PresentacionSotm DIR=Extracurriculares/Igisc-2026-isprs/Presentacion-Igisc`

---

## Notas libres

-
