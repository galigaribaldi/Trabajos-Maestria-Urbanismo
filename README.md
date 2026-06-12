# Trabajos de Maestría en Urbanismo

**Hernán Galileo Cabrera Garibaldi**
Programa de Maestría y Doctorado en Urbanismo — FES Acatlán, UNAM
Semestre 2026-2

---

## Descripción

Repositorio de documentos académicos del programa de Maestría en Urbanismo. Contiene ensayos, artículos y presentaciones organizados por semestre y materia, junto con un sistema de plantillas LaTeX reutilizables y un `Makefile` para compilar y crear nuevos documentos con un solo comando.

---

## Requisitos

- **TeX Live** (o MiKTeX) con `pdflatex` y `bibtex`
- **Make** (`make --version`)
- **latexdiff** — solo para el target `latexdiff-tesis` (`sudo apt install latexdiff` o `tlmgr install latexdiff`)
- **gh CLI** — solo para publicar releases (`gh auth login` antes del primer uso)
- Editor recomendado: VS Code con extensión LaTeX Workshop, o cualquier editor con soporte `.tex`

---

## Estructura del repositorio

```
Trabajos-Maestria-Urbanismo/
│
├── Makefile                          ← Comandos de compilación y scaffolding
├── Img/                              ← Escudos y logos institucionales compartidos
│   ├── UNAM_crest_blue.pdf
│   ├── UNAM_crest_black.pdf
│   ├── escudo-fes-azul.png
│   └── escudo-fes-negro.jpg
│
├── DocumentosPlantilla/              ← Plantillas de documentos
│   ├── Ensayos/
│   │   ├── ConPortada/               ← Ensayo con portada institucional
│   │   └── SinPortada/               ← Ensayo sin portada (con TOC e índices)
│   ├── Articulos/
│   │   ├── ConPortada/               ← Artículo con portada minimalista
│   │   ├── SinPortada/               ← Artículo sin portada (con palabras clave)
│   │   └── RegistroDiff/             ← Registro de avances con evidencia latexdiff
│   └── Instructions Plantilla Documents.md
│
├── PresentacionPlantilla/            ← Plantilla Beamer UNAM
│   ├── main.tex
│   ├── Latex/BeamerTheme.tex
│   ├── secciones/
│   └── Instructions Plantilla Presentacion.md
│
├── InfografiaPlantilla/              ← Plantilla infografía TikZ (A4/A3/Landscape)
│   ├── main.tex
│   ├── Latex/
│   │   ├── InfografiaTheme.tex       ← setup completo: TikZ, tcolorbox, fontawesome5
│   │   ├── color-config.tex
│   │   ├── size-config.tex
│   │   ├── Colores/                  ← mismo sistema de 6 temas que documentos/presentaciones
│   │   └── Tamanos/                  ← A4Portrait | A3Portrait | A4Landscape
│   └── img/                          ← carpeta para imágenes del usuario
│
└── TercerSemestre/                   ← Trabajos por semestre
    ├── DesarrolloUrbanoSostenible/
    │   ├── Ensayo_Humedales/
    │   ├── Presentacion_Humedales/
    │   └── Movilidad_Sustentable_Presentacion/
    ├── SociologiaUrbana/
    │   └── EnsayoFinal/
    └── SeminarioInvestigacion/
        └── RegistroAvances2026-2/    ← Registro de avances con diff de tesis
```

---

## Inicio rápido — Crear un documento nuevo

Todos los comandos se ejecutan desde la raíz del repositorio con `DIR=` apuntando a donde quieres crear el documento.

### Documentos (ensayos y artículos)

```bash
# Ensayo con portada institucional (escudos UNAM/FES, TOC, índice de figuras)
make EnsayosConPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Ensayo sin portada (encabezado inline, TOC, índice de figuras)
make EnsayosSinPortada DIR=TercerSemestre/MiMateria/NombreEnsayo

# Artículo con portada minimalista (sin TOC ni índices)
make ArticulosConPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Artículo sin portada con palabras clave (sin TOC ni índices)
make ArticulosSinPortada DIR=TercerSemestre/MiMateria/NombreArticulo

# Registro de avances con evidencia latexdiff (para Seminario de Investigación)
make RegistroDiffDoc DIR=TercerSemestre/MiMateria/NombreRegistro

# Cualquier documento con un color específico al crearlo
make EnsayosConPortada DIR=TercerSemestre/MiMateria/NombreEnsayo COLOR=Teal
```

### Ensayos — aliases de color (atajos directos)

```bash
make nuevo-ensayo          DIR=TercerSemestre/MiMateria/NombreEnsayo   # Azul UNAM (default)
make nuevo-ensayo-teal     DIR=TercerSemestre/MiMateria/NombreEnsayo   # Verde azulado
make nuevo-ensayo-olivo    DIR=TercerSemestre/MiMateria/NombreEnsayo   # Verde olivo
make nuevo-ensayo-purpura  DIR=TercerSemestre/MiMateria/NombreEnsayo   # Púrpura
make nuevo-ensayo-rojo     DIR=TercerSemestre/MiMateria/NombreEnsayo   # Rojo
```

### Presentaciones — variantes de color

```bash
make nueva-presentacion          DIR=TercerSemestre/MiMateria/NombrePres   # Azul UNAM (default)
make nueva-presentacion-teal     DIR=TercerSemestre/MiMateria/NombrePres   # Verde azulado
make nueva-presentacion-olivo    DIR=TercerSemestre/MiMateria/NombrePres   # Verde olivo
make nueva-presentacion-purpura  DIR=TercerSemestre/MiMateria/NombrePres   # Púrpura
make nueva-presentacion-rojo     DIR=TercerSemestre/MiMateria/NombrePres   # Rojo
```

### Infografías — tamaño y color

```bash
# Por tamaño de hoja
make nueva-infografia            DIR=TercerSemestre/MiMateria/NombreInfografia              # A4 Portrait (default)
make nueva-infografia-a3         DIR=TercerSemestre/MiMateria/NombreInfografia              # A3 Portrait
make nueva-infografia-landscape  DIR=TercerSemestre/MiMateria/NombreInfografia              # A4 Landscape

# Por color (tamaño A4 Portrait por default; agrega TAMANIO= para cambiarlo)
make nueva-infografia-teal       DIR=TercerSemestre/MiMateria/NombreInfografia              # Verde azulado
make nueva-infografia-olivo      DIR=TercerSemestre/MiMateria/NombreInfografia              # Verde olivo
make nueva-infografia-purpura    DIR=TercerSemestre/MiMateria/NombreInfografia              # Púrpura
make nueva-infografia-rojo       DIR=TercerSemestre/MiMateria/NombreInfografia              # Rojo

# Con tamaño y color combinados
make nueva-infografia            DIR=TercerSemestre/MiMateria/NombreInfografia  COLOR=Teal  TAMANIO=A3Portrait
```

---

## Compilar documentos existentes

```bash
# Compilar un ensayo o artículo (color por defecto del documento)
make Document DIR=TercerSemestre/MiMateria/MiDocumento

# Compilar con un color distinto sin modificar el archivo
make Document DIR=TercerSemestre/MiMateria/MiDocumento COLOR=Purpura

# Compilar una presentación
make Presentacion DIR=TercerSemestre/MiMateria/MiPresentacion

# Compilar una presentación en otro color
make Presentacion DIR=TercerSemestre/MiMateria/MiPresentacion COLOR=Teal

# Compilar una infografía (pdflatex × 2, sin bibtex)
make Infografia DIR=TercerSemestre/MiMateria/MiInfografia
make Infografia DIR=TercerSemestre/MiMateria/MiInfografia COLOR=Teal TAMANIO=A3Portrait

# Alias para trabajos conocidos
make desarrollo          # Ensayo_Humedales
make pres-humedales      # Presentacion_Humedales
make pres-movilidad      # Movilidad_Sustentable_Presentacion
make sociologia          # EnsayoFinal (SociologiaUrbana)
```

La compilación sigue el ciclo completo: `pdflatex → bibtex → pdflatex → pdflatex`. El PDF resultante queda en `<DIR>/main.pdf`.

---

## GitHub Releases — publicar PDFs

Los PDFs finales se distribuyen como **GitHub Releases**. Cada release lleva un tag que identifica unívocamente el semestre, la materia, el tipo de documento y el tema.

### Estructura del tag

```
v{AÑO}-{S}-{MAT}-{TIPO}-{TEMA}[-r{N}]
```

| Segmento | Descripción | Ejemplos |
|----------|-------------|---------|
| `{AÑO}` | Año del semestre | `2026` |
| `{S}` | Semestre dentro del año | `1`, `2` |
| `{MAT}` | Abreviatura de materia (ver tabla) | `dsma`, `urbs`, `dsu` |
| `{TIPO}` | Tipo de documento | `ens`, `pres`, `art`, `mapa`, `col` |
| `{TEMA}` | Slug del tema en kebab-case | `humedales`, `movilidad` |
| `[-r{N}]` | Revisión post-entrega (opcional) | `-r2`, `-r3` |

#### Abreviaturas de materias

| Código | Materia |
|--------|---------|
| `dsma` | Desarrollo Sostenible del Medio Ambiente |
| `urbs` | Desarrollo Urbano Sostenible |
| `dsu`  | Desarrollo Sustentable en el Urbanismo |

#### Tipos de documento

| Código | Tipo |
|--------|------|
| `ens`  | Ensayo |
| `pres` | Presentación |
| `art`  | Artículo |
| `mapa` | Mapa / Cartografía |
| `col`  | Coloquio |
| `inf`  | Infografía |

> **Regla de revisiones:** el tag sin sufijo es la entrega original. Si hay una corrección posterior, se crea un nuevo release con `-r2`, `-r3`, etc. **Nunca** se reutiliza ni sobreescribe un tag existente.

---

### Publicar un release

#### Aliases prefabricados (3er semestre 2026-2)

Compilan el PDF y lo publican en un solo comando. Requieren `gh auth login` activo.

```bash
make release-ens-humedales    # → v2026-2-dsma-ens-humedales
make release-pres-humedales   # → v2026-2-urbs-pres-humedales
make release-pres-movilidad   # → v2026-2-dsu-pres-movilidad
```

Para publicar con un color distinto al default:

```bash
make release-pres-movilidad COLOR=Teal
```

#### Release genérico (documentos futuros)

```bash
make release \
    DIR=TercerSemestre/MiMateria/MiDocumento \
    TAG=v2026-2-dsu-ens-tema \
    TITULO="Título completo del documento" \
    TIPO=Document          # Document | Presentacion
```

#### Flujo interno del release

1. Compila el PDF completo (`pdflatex → bibtex → pdflatex × 2`)
2. Copia `main.pdf` como `<TAG>.pdf` dentro de la carpeta del documento
3. Ejecuta `gh release create <TAG> <TAG>.pdf --title "..." --notes "..."`
4. Elimina el PDF temporal (el `main.pdf` original permanece)

---

## Generar evidencia latexdiff (`latexdiff-tesis`)

El target `latexdiff-tesis` compara dos versiones de un capítulo de la tesis (almacenado en un repositorio externo) y genera un archivo `.tex` con las diferencias coloreadas: adiciones en **azul** y eliminaciones en **rojo**. El resultado se incluye automáticamente en el documento `RegistroDiff` para documentar el progreso entre entregas.

> **Requisito previo:** `latexdiff` instalado en el sistema.

### Uso

```bash
make latexdiff-tesis \
    CHAPTER=<archivo.tex relativo a TESIS_DIR> \
    REV1=<tag-o-commit-inicial> \
    DIR=<directorio-del-documento-destino> \
    [TESIS_DIR=../Tesis_Latex] \
    [REV2=HEAD] \
    [OUT=diff_evidencia]
```

### Parámetros

| Parámetro | Obligatorio | Default | Descripción |
|---|---|---|---|
| `CHAPTER` | Sí | — | Ruta del capítulo `.tex` relativa a `TESIS_DIR` |
| `REV1` | Sí | — | Tag o hash del commit de la versión inicial |
| `DIR` | Sí | — | Directorio del documento `RegistroDiff` destino |
| `TESIS_DIR` | No | `../Tesis_Latex` | Ruta al repositorio de la tesis (puede ser cualquier repo local) |
| `REV2` | No | `HEAD` | Tag o hash del commit de la versión final |
| `OUT` | No | `diff_evidencia` | Nombre del `.tex` de salida (sin extensión) |

### Ejemplo

```bash
make latexdiff-tesis \
    CHAPTER=3-Conceptos-Indicadores/3-Conceptos-Indicadores.tex \
    REV1=v0.3.2 REV2=v0.4.1 \
    DIR=TercerSemestre/SeminarioInvestigacion/RegistroAvances2026-2
```

Después de ejecutarlo, compila el documento normalmente:

```bash
make Document DIR=TercerSemestre/SeminarioInvestigacion/RegistroAvances2026-2 COLOR=Rojo
```

### Notas técnicas

- Usa `git archive | tar -x` en lugar de `latexdiff-vc` para evitar problemas con **Git LFS** (los punteros LFS nunca llegan al diff).
- Si el capítulo no existía en `REV1`, el diff muestra todo el contenido como adición.
- El bloque `%DIF PREAMBLE` generado por latexdiff se filtra automáticamente; el documento destino lo maneja con `Latex/latexdiff-preamble.tex`.
- El markup de diferencias usa **solo color** (sin subrayado de `ulem`) para compatibilidad con cualquier comando LaTeX complejo.
- Las figuras referenciadas por el capítulo se copian automáticamente a `DIR/Figures/` sin sobreescribir las existentes.

### Flujo completo de trabajo

```
1. make RegistroDiffDoc DIR=<ruta>          # Crea el documento desde la plantilla
2. Edita main.tex, secciones/1-Introduccion.tex, secciones/2-Desarrollo.tex y secciones/3-Conclusiones.tex
3. make latexdiff-tesis CHAPTER=... REV1=... DIR=<ruta>   # Genera el diff
4. make Document DIR=<ruta> COLOR=<tema>    # Compila el PDF final
```

---

## Limpiar auxiliares LaTeX

```bash
make limpiar                   # Todo el proyecto
make limpiar-dir DIR=<ruta>    # Solo una carpeta
```

---

## Plantillas de documentos

Cada plantilla tiene el mismo patrón de uso:

1. Crear el documento con el comando `make` correspondiente
2. Editar el bloque `PERSONALIZACIÓN` al inicio de `main.tex`
3. Escribir el contenido en `secciones/`
4. Agregar referencias en `referencias.bib`
5. Compilar con `make Document DIR=<ruta>`

### Comparativa de plantillas

| Plantilla | Portada | TOC | Índice figuras | Palabras clave | Resumen |
|---|---|---|---|---|---|
| Ensayo ConPortada | Institucional + escudos | Sí | Sí | No | No |
| Ensayo SinPortada | — (encabezado inline) | Sí | Sí | No | Sí |
| Artículo ConPortada | Minimalista | No | No | No | No |
| Artículo SinPortada | — (encabezado inline) | No | No | Sí | No |
| RegistroDiff | Minimalista + repo/versiones | No | No | No | No |
| Infografía | Franja TikZ + escudos | No | No | No | No |

> **Infografía** — Plantilla TikZ de una página. Soporta 3 tamaños (`A4Portrait`, `A3Portrait`, `A4Landscape`) y los mismos 6 temas de color que el resto del sistema. Los comandos disponibles son: `\InfoCabecera`, `\InfoPie`, `\InfoBloque`, `\InfoBloqueAcento`, `\InfoNota`, `\InfoDato`, `\InfoIconoItem`, `\InfoImagenPlaceholder`. El layout usa `\paperwidth`/`\paperheight` — escala automáticamente entre tamaños.

> **RegistroDiff** — Variante especializada para reportes de avance de tesis. Incluye variables `\NombreRepo`, `\VerRef`, `\VerActual`; tablas `longtable` y `tabularx` pre-configuradas para bitácora de commits y autoevaluación por capítulo; y una sección de evidencia visual generada automáticamente con `latexdiff` (ver `make latexdiff-tesis` más abajo).

---

## Temas de color

Todos los documentos y presentaciones soportan 6 temas de color. El tema se puede cambiar de dos maneras:

**Permanente** — edita `Latex/color-config.tex` dentro del documento:
```latex
\providecommand{\ColorTema}{Purpura}   % opciones: Institucional | Teal | VerdeOlivo | Purpura | Rojo | VerdeEsmeralda
```

**Por compilación** — sin tocar el archivo:
```bash
make Document     DIR=<ruta> COLOR=VerdeOlivo
make Presentacion DIR=<ruta> COLOR=Rojo
```

| Tema | ColorPrincipal | ColorAcento | Uso sugerido |
|---|---|---|---|
| `Institucional` | Azul UNAM `RGB 0,56,147` | Oro UNAM `RGB 244,180,0` | Todos los entregables (default) |
| `Teal` | Verde azulado `RGB 0,105,92` | Ámbar `RGB 255,171,0` | Medio ambiente, geografía |
| `VerdeOlivo` | Verde olivo `RGB 56,87,35` | Ocre `RGB 188,143,60` | Historia urbana, patrimonio |
| `Purpura` | Púrpura `RGB 106,27,154` | Dorado `RGB 255,196,0` | Economía, política pública |
| `Rojo` | Rojo `RGB 183,28,28` | Dorado `RGB 255,196,0` | Derecho urbano, normatividad |
| `VerdeEsmeralda` | Esmeralda `RGB 0,130,80` | Dorado cálido `RGB 255,186,8` | Ecología, sustentabilidad, tesis |

### Elementos visuales con color en documentos

El tema de color se aplica a los siguientes elementos en todas las plantillas de documentos:

| Elemento | Descripción |
|---|---|
| Reglas de portada | Líneas horizontales superior e inferior en `ColorPrincipal` |
| Línea del encabezado | Regla `fancyhdr` en `ColorPrincipal` |
| Texto de sección en encabezado | Nombre de sección en `ColorPrincipal` bold |
| Pie de página | Materia y fecha en `ColorPrincipal` |
| `\section` | Título grande bold en `ColorPrincipal` |
| `\subsection` | Título mediano bold en `ColorPrincipal!80!black` |
| `\subsubsection` | Título itálica en `ColorPrincipal!60!black` |
| Hipervínculos | `linkcolor`, `citecolor`, `urlcolor` en `ColorPrincipal` |
| `\citaclave{...}` | Cita destacada en cursiva `ColorPrincipal` |

---

## Plantilla de Presentaciones

Basada en Beamer con tema Madrid. El frametitle muestra la sección activa como etiqueta pequeña dentro de la barra de color, y el acento dorado separa visualmente los elementos.

Incluye portada con escudos institucionales, transiciones automáticas de sección, pie de página personalizado y los siguientes tipos de diapositiva listos para usar:

- Dos columnas + bloque de dato clave
- Objetivos numerados (01 / 02 / 03)
- Tres bloques horizontales comparativos
- Tabla con `tabularx` y `booktabs`
- Una figura + bullets
- Dos imágenes con texto explicativo
- Tres imágenes con texto explicativo
- Cita destacada centrada
- Mensaje clave con banda lateral (frame plain)
- Diagrama de flujo con TikZ
- Síntesis block + alertblock
- Frame de cierre / Gracias
- Bibliografía con `allowframebreaks`

Ver el catálogo completo en `PresentacionPlantilla/Instructions Plantilla Presentacion.md`.

---

## Recursos compartidos (`Img/`)

La carpeta `Img/` en la raíz contiene los escudos institucionales disponibles para todas las plantillas:

| Archivo | Uso recomendado |
|---|---|
| `UNAM_crest_blue.pdf` | Portadas de presentaciones (fondo claro) |
| `UNAM_crest_black.pdf` | Portadas de ensayos (impresión) |
| `escudo-fes-azul.png` | Portadas de presentaciones |
| `escudo-fes-negro.jpg` | Portadas de ensayos (impresión) |

Las plantillas los referencian automáticamente vía `\graphicspath` — no es necesario copiar los archivos a cada documento.

---

## Trabajos del semestre

### Tercer Semestre — Desarrollo Urbano Sostenible

| Trabajo | Ruta | Tag de release | Estado |
|---------|------|----------------|--------|
| Ensayo: Humedales Urbanos y Movilidad | `TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales` | `v2026-2-dsma-ens-humedales` | Terminado |
| Presentación: Humedales Urbanos y Movilidad | `TercerSemestre/DesarrolloUrbanoSostenible/Presentacion_Humedales` | `v2026-2-urbs-pres-humedales` | Terminada |
| Presentación: Movilidad Sustentable | `TercerSemestre/DesarrolloUrbanoSostenible/Movilidad_Sustentable_Presentacion` | `v2026-2-dsu-pres-movilidad` | Terminada |
| Artículo: El Jefe Seattle y el Medio Ambiente | `TercerSemestre/DesarrolloUrbanoSostenible/JefeSeattle` | `v2026-2-dsu-art-jefe-seattle` | Terminado |
| Infografía: Agenda 2030 — ODS 11 y Movilidad ZMVM | `TercerSemestre/DesarrolloUrbanoSostenible/Agenda2030_Infografia` | `v2026-2-dsu-inf-agenda2030` | Terminada |

### Tercer Semestre — Sociología Urbana

| Trabajo | Ruta | Tag de release | Estado |
|---------|------|----------------|--------|
| Ensayo Final | `TercerSemestre/SociologiaUrbana/EnsayoFinal` | — | En proceso |

### Tercer Semestre — Seminario de Investigación

| Trabajo | Ruta | Tag de release | Estado |
|---------|------|----------------|--------|
| Registro de Avances 2026-2 | `TercerSemestre/SeminarioInvestigacion/RegistroAvances2026-2` | — | Terminado |
