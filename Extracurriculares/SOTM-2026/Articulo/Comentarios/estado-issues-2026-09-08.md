# Estado de issues — artículo iGISc 2026
**Última actualización:** 2026-09-08
**Rama:** `igisc-geoint`
**Archivo principal:** `Extracurriculares/Igisc-2026-isprs/main.tex`

---

## Issues CERRADOS

| # | Título | Commit |
|---|---|---|
| **#1** | Reescribir incompatibilidad GTFS CDMX/EdoMex; definir "discontinuidades" | Correcciones 4 |
| **#2** | "un obstáculo recurrente" → "problema recurrente de homologación" | Correcciones 4 |
| **#3** | "calidad desigual" → "incompatibilidad entre GTFS SEMOVI y EdoMex" | Correcciones 4 |
| **#4** | Sujeto explícito — "Esta fricción" eliminado | Correcciones 4 |
| **#5** | "principio de acceso a la información" → citas cpeum_art6 + gurstein2011open | Correcciones 4 |
| **#6** | "En este escenario" → "Ante la fragmentación institucional..." | Correcciones 4 |
| **#7** | Guía de secciones al cierre de la introducción | Correcciones 4 |
| **#8** | "normalización y estandarización" → "normaliza: homologa campos faltantes..." | Correcciones 3 |
| **#9** | "modelo de datos coherente" → "base de datos homogénea" | Correcciones 3 |
| **#12** | Distancia de Hausdorff: definición en texto + citas hausdorff1914, neis2012street | Correcciones 3 |
| **#13** | "algoritmo de ajuste geométrico" → proceso de *snapping* con umbral 50 m | Correcciones 2 |
| **#16** | "la peor alcaldía" → descripción objetiva de cobertura de Milpa Alta | Correcciones 2 |

## Cambios aplicados sin issue (sesiones anteriores)
- "colectivos" → "autobuses"
- Cita `goauthors2025` para eficiencia concurrente en Go
- Autorreferencia VFTModel → nota al pie con repositorio + blog
- `\usepackage{url}` agregado

---

## Issues ABIERTOS — por sección

### Introducción
| # | Título | Tipo |
|---|---|---|
| #24 | Recortar introducción a ~1 columna (Group B — hacer al final) | estructura |

### Metodología
| # | Título | Tipo |
|---|---|---|
| #10 | Ampliar presentación inicial del VFTModel; listar 2–3 indicadores con propósito y cita | redaccion |
| #11 | "cadena de procesamiento" → contribución directa de OSM a Apimetro | redaccion |
| #14 | "robustez" → "usabilidad/aplicación"; reubicar párrafo VFTModel | redaccion |
| #25 | Convertir `enumerate` → texto corrido con numeración inline (Metod + Resultados) | estructura |

### Resultados
| # | Título | Tipo |
|---|---|---|
| #15 | "deficiencias estructurales" → nombres específicos de los indicadores | redaccion |
| #17 | Explicar "Fuerza Capilar" y "alternativa lateral" en lenguaje accesible | redaccion |
| #18 | "demuestran que la API permite investigación" → "facilita el acceso sin programar" | redaccion |
| **#22** | Confirmar número real de rutas — reemplazar `$XX$` | **BLOQUEANTE** |
| **#23** | Incluir mapa del VFTModel en Resultados | **BLOQUEANTE** |

### Conclusiones
| # | Título | Tipo |
|---|---|---|
| #19 | "canal inédito" → reformular | redaccion |
| #20 | Agregar párrafo de trabajo futuro (2–3 líneas) | redaccion |
| #21 | "Apimetro demuestra" → "facilita" | redaccion |
| #26 | Lista de 3 frentes OSM → párrafo narrativo + trabajo futuro (Group B) | estructura |

### Abstract
| # | Título | Tipo |
|---|---|---|
| #27 | Revisar y condensar el abstract en inglés | redaccion |

---

## Metodología de trabajo acordada

- Ir issue por issue, presentar original + propuesta antes de aplicar
- Esperar aprobación explícita antes de editar
- No incluir "Co-Authored-By" en commits
- Commits los ejecuta el autor en su terminal
- Issues se cierran en GitHub manualmente tras cada commit (no auto-close en ramas)
