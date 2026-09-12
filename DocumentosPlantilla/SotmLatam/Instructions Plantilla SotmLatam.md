# Instrucciones — Plantilla de Presentaciones SOTM Latam CDMX 2026

**State of the Map Latinoamérica · Antiguo Colegio de San Ildefonso, CDMX**

---

## Crear una nueva presentación

Desde la raíz del repositorio:

```bash
make nueva-presentacion-sotm DIR=Extracurriculares/SotmLatam/NombrePonencia
```

Copia la plantilla completa al destino. **No sobreescribe** si ya existe `main.tex`.

---

## Personalizar

Abre `main.tex` y edita solo el bloque `PERSONALIZACIÓN`:

```latex
\newcommand{\TituloPresent}{Título de la Ponencia}
\newcommand{\SubtituloPresent}{Subtítulo descriptivo}
\newcommand{\Autor}{Hernán Galileo Cabrera Garibaldi}
\newcommand{\AutorCorto}{H. Cabrera}        % Aparece en el pie de página
\newcommand{\Afiliacion}{UNAM — Maestría en Urbanismo}
\newcommand{\FechaPresent}{Ciudad de México, Octubre 2026}
```

---

## Compilar

```bash
make PresentacionSotm DIR=<ruta/a/la/presentacion>
```

Ejecuta: `pdflatex → bibtex → pdflatex → pdflatex`. El PDF se genera en `<ruta>/main.pdf`.

---

## Paleta de colores SOTM Latam CDMX 2026

Extraída del logo oficial `Img/sotm-latam-logo.png`:

| Nombre | Hex | RGB | Uso |
|---|---|---|---|
| `SotmVerde` | `#3D5226` | (61, 82, 38) | Color principal — frametitle, bloques, estructura |
| `SotmOlivo` | `#8FA05A` | (143, 160, 90) | Acento secundario — ejemplo blocks |
| `SotmTerracota` | `#B85440` | (184, 84, 64) | Acento principal — líneas, alertas, ítems |
| `SotmCrema` | `#F0EAD6` | (240, 234, 214) | Fondo de bloques |

Los colores están definidos en `Latex/BeamerThemeSotm.tex` y son **fijos** (no hay sistema de temas intercambiables como en la plantilla UNAM).

---

## Catálogo de tipos de diapositiva

Todos los ejemplos están en `secciones/`. Copia el bloque y adapta el contenido.

### Portada con logo SOTM
```latex
\begin{frame}[plain]
  \titlepage
\end{frame}
```
Muestra automáticamente el logo SOTM Latam + datos del bloque PERSONALIZACIÓN.

---

### Índice
```latex
\begin{frame}{Contenido}
  \tableofcontents
\end{frame}
```

---

### Transición de sección
Generada **automáticamente** al declarar `\section{Nombre}`. Solo aparece a partir de la segunda sección.

---

### Dos columnas + bloque de dato clave
```latex
\begin{frame}{Contexto y Motivación}
  \begin{columns}[T]
    \begin{column}{0.58\textwidth}
      \begin{itemize}
        \item Primer punto
        \item Segundo punto
      \end{itemize}
    \end{column}
    \begin{column}{0.38\textwidth}
      \begin{block}{Dato clave}
        Texto del bloque lateral.
      \end{block}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Objetivos numerados (01 / 02 / 03)
```latex
\begin{frame}{Objetivos}
  \begin{columns}[T]
    \begin{column}{0.32\textwidth}
      \centering
      {\color{SotmVerde}\Large\textbf{01}}\\[0.1cm]
      {\small Descripción del objetivo 1}
    \end{column}
    % Repetir para 02, 03...
  \end{columns}
\end{frame}
```

---

### Tres bloques horizontales (comparativa)
```latex
\begin{frame}{Componentes}
  \begin{columns}[T]
    \begin{column}{0.32\textwidth}
      \begin{block}{Componente A}
        Descripción breve.
      \end{block}
    \end{column}
    % Repetir para B y C...
  \end{columns}
\end{frame}
```

---

### Tabla comparativa
```latex
\begin{frame}{Comparativa}
  \begin{table}
    \centering\small
    \begin{tabularx}{\textwidth}{@{} l X X @{}}
      \toprule
      \textbf{Criterio} & \textbf{Opción A} & \textbf{Opción B} \\
      \midrule
      Fila 1 & Dato & Dato \\
      \bottomrule
    \end{tabularx}
    \fuentefigura{Elaboración propia, 2026.}
  \end{table}
\end{frame}
```

---

### Una figura + bullets
```latex
\begin{frame}{Resultados}
  \begin{columns}[T]
    \begin{column}{0.55\textwidth}
      \includegraphics[width=\textwidth]{img/figura.png}
      \fuentefigura{Elaboración propia, 2026.}
    \end{column}
    \begin{column}{0.42\textwidth}
      \begin{itemize}
        \item Hallazgo 1
        \item Hallazgo 2
      \end{itemize}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Dos imágenes con texto explicativo
```latex
\begin{frame}{Comparativa Visual}
  \begin{columns}[T]
    \begin{column}{0.48\textwidth}
      \centering
      \includegraphics[width=\textwidth, height=3.8cm, keepaspectratio]{img/fig1.png}\\[0.15cm]
      {\small Texto explicativo de la imagen izquierda.}\\[0.05cm]
      \fuentefigura{Fuente, 2026.}
    \end{column}
    \begin{column}{0.48\textwidth}
      \centering
      \includegraphics[width=\textwidth, height=3.8cm, keepaspectratio]{img/fig2.png}\\[0.15cm]
      {\small Texto explicativo de la imagen derecha.}\\[0.05cm]
      \fuentefigura{Fuente, 2026.}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Solo texto — mensaje clave (frame plain con banda lateral verde)
```latex
\begin{frame}[plain]
  \begin{tikzpicture}[remember picture, overlay]
    \fill[SotmVerde]
      (current page.north west) rectangle
      ([xshift=0.35cm] current page.south west);
    \fill[SotmTerracota]
      ([xshift=0.32cm] current page.north west) rectangle
      ([xshift=0.35cm] current page.south west);
  \end{tikzpicture}
  \hspace{0.8cm}%
  \begin{minipage}{0.88\textwidth}
    \vspace{2.2cm}
    {\color{SotmTerracota}\rule{0.5\textwidth}{1.2pt}}\\[0.5cm]
    {\large\bfseries\color{SotmVerde} Pregunta o mensaje clave}\\[0.6cm]
    {\normalsize Texto de apoyo o contexto.}\\[0.5cm]
    {\color{SotmTerracota}\rule{0.3\textwidth}{0.8pt}}
  \end{minipage}
\end{frame}
```

---

### Diagrama de flujo (TikZ)
Ver el ejemplo completo en `secciones/s02_desarrollo.tex`. Estilos reutilizables:

| Estilo | Descripción |
|---|---|
| `caja` | Rectángulo redondeado, borde verde, fondo crema |
| `inicio` | Caja relleno verde sólido, texto blanco |
| `result` | Caja relleno terracota, texto blanco |
| `decision` | Rombo, aspecto 2.5 |
| `flecha` | Flecha gruesa verde (`-Stealth`) |
| `lateral` | Flecha terracota punteada (retroalimentación) |

---

### Síntesis dos columnas (block + alertblock)
```latex
\begin{frame}{Síntesis}
  \begin{columns}[T]
    \begin{column}{0.48\textwidth}
      \begin{block}{Lo que encontramos}
        \begin{itemize}
          \item Hallazgo positivo 1
        \end{itemize}
      \end{block}
    \end{column}
    \begin{column}{0.48\textwidth}
      \begin{alertblock}{Limitaciones y retos}
        \begin{itemize}
          \item Limitación 1
        \end{itemize}
      \end{alertblock}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Cierre con logo SOTM
```latex
\begin{frame}[plain]
  \begin{center}
    \vfill
    \includegraphics[height=1.5cm]{sotm-latam-logo.png}\\[0.4cm]
    {\color{SotmTerracota}\rule{0.6\textwidth}{1.5pt}}\\[0.4cm]
    {\Large\bfseries\color{SotmVerde} Gracias}\\[0.3cm]
    {\normalsize\Autor}\\[0.1cm]
    {\small\Afiliacion}\\[0.4cm]
    {\color{SotmTerracota}\rule{0.6\textwidth}{1.5pt}}
    \vfill
  \end{center}
\end{frame}
```

---

## Comando `\framelinea`

Activa una línea terracota debajo del frametitle en el siguiente frame:

```latex
\framelinea
\begin{frame}{Mi Título Destacado}
  ...
\end{frame}
```

---

## Comandos de utilidad

| Comando | Uso |
|---|---|
| `\fuentefigura{Texto}` | Pie de figura pequeño: *Fuente: Texto* |
| `\tituloframe{Texto}` | Título verde + línea terracota dentro del frame |
| `\termino{palabra}` | Cursiva para término en primera aparición |
| `\cdmx` | Ciudad de México |
| `\zmvm` | Zona Metropolitana del Valle de México |

---

## Imágenes

Se buscan en este orden:
1. `img/` — carpeta local de la presentación
2. `../Img/` · `../../Img/` · `../../../Img/` — carpeta `Img/` en la raíz del proyecto

El logo `sotm-latam-logo.png` vive en `Img/` y se referencia solo por nombre:
```latex
\includegraphics[height=1.5cm]{sotm-latam-logo.png}
```

---

## Nota sobre `\pause`

`\pause` genera una página PDF por cada overlay. Los `\pause` están **comentados** por defecto.
Descomentar solo cuando se presente en proyector con Beamer interactivo.
