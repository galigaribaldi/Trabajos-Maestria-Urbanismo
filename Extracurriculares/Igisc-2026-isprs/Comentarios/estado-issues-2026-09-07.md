# Estado de issues — artículo iGISc 2026
**Última actualización:** 2026-09-07
**Rama:** `igisc-geoint`
**Archivo principal:** `Extracurriculares/Igisc-2026-isprs/main.tex`

---

## Issues CERRADOS

| # | Título | Sesión |
|---|---|---|
| **#13** | "algoritmo de ajuste geométrico" → proceso de *snapping* por proximidad geográfica | 2026-09-07 |
| **#16** | Quitar "la peor alcaldía de la Ciudad de México" → descripción objetiva del indicador | 2026-09-07 |

## Cambios aplicados SIN issue previo (sesión 2026-09-07)

- "colectivos" → "autobuses" en texto narrativo y lista de mapatones
- Cita Haklay reformulada: principio general + cita → ejemplo concreto Mexibús sin cita
- Cita `goauthors2025` (Go 1.25, go.dev/doc/) para eficiencia concurrente en Metodología §1
- Autorreferencia `galigaribaldi2026vftmodel` → nota al pie con repositorio + blog
- `\usepackage{url}` agregado al preámbulo
- Issue #12 (Hausdorff): cita `hausdorff1914` + `neis2012street` + definición en texto — **CERRADO**
- Issue #8 ("estandarización" → "normalización"): texto actualizado con explicación de alcance — **CERRADO**
- Issue #9 ("modelo de datos coherente" → "base de datos homogénea"): texto actualizado — **CERRADO**

---

## Issues ABIERTOS — por sección

### Introducción
| # | Título | Tipo |
|---|---|---|
| #1 | Reescribir incompatibilidad GTFS CDMX/EdoMex; definir "discontinuidades" con ejemplos | redaccion |
| #2 | "un obstáculo recurrente" → "uno de los obstáculos recurrentes" | redaccion |
| #3 | "calidad desigual" → "falta de homologación" entre GTFS SEMOVI vs. EdoMex | redaccion |
| #4 | Sujeto explícito — evitar "Esta fricción" | redaccion |
| #5 | Reformular "principio de acceso a la información" o añadir cita | redaccion |
| #6 | "En este escenario" → especificar cuál escenario antes de nombrar OSM | redaccion |
| #7 | Agregar guía de secciones al cierre de la introducción | redaccion |

### Metodología
| # | Título | Tipo |
|---|---|---|
| #10 | Ampliar presentación inicial del VFTModel; listar 2–3 indicadores con propósito y cita | redaccion |
| #11 | "cadena de procesamiento" → describir directamente la contribución de OSM a Apimetro | redaccion |
| #14 | "robustez" → "usabilidad/aplicación"; mover párrafo VFTModel al inicio de la segunda capa | redaccion |

### Resultados
| # | Título | Tipo |
|---|---|---|
| #15 | "deficiencias estructurales" → usar nombres específicos de los indicadores | redaccion |
| #17 | Explicar "Fuerza Capilar" y "alternativa lateral" en lenguaje accesible | redaccion |
| #18 | "demuestran que la API permite investigación cuantitativa" → "facilita el acceso sin programar" | redaccion |
| **#22** | Confirmar número real de rutas — reemplazar `$XX$` | **BLOQUEANTE — decision** |
| **#23** | Incluir mapa pequeño del VFTModel en Resultados (confirmado; pendiente generar archivo) | **BLOQUEANTE — decision** |

### Conclusiones
| # | Título | Tipo |
|---|---|---|
| #19 | "canal inédito" → reformular; GTFS+OSM es canal ya utilizado | redaccion |
| #20 | Agregar párrafo de trabajo futuro (solo trabajo futuro, no debilidades; 2–3 líneas) | redaccion |
| #21 | "Apimetro demuestra" → "facilita" | redaccion |

---

## Issues Group B NUEVOS (de reunión 09-04, aún sin crear en GitHub)

| Tema | Descripción |
|---|---|
| Recortar introducción | Condensar a ~1 columna; 3 párrafos: problema / solución / estructura del paper |
| Convertir listas numeradas en texto corrido | `\begin{enumerate}` en Metodología, Resultados y Conclusiones → párrafos con numeración inline |
| Conclusiones: lista de 3 frentes → narrativo | Convertir mapatones/bidireccional/replicabilidad en texto seguido de párrafo de trabajo futuro |
| Abstract en inglés | Revisar y condensar el abstract actual |

---

## Metodología de trabajo acordada

- Ir issue por issue, tramo por tramo
- Presentar texto actual → propuesta antes de aplicar
- Esperar aprobación explícita antes de editar
- No incluir "Co-Authored-By" en commits
- Commits los ejecuta el autor en su terminal
