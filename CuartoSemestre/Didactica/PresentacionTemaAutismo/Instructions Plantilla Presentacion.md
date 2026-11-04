# Instrucciones — Plantilla de Presentaciones Beamer

**Maestría en Urbanismo · UNAM – FES Acatlán**

---

## Crear una nueva presentación

Desde la raíz del repositorio:

```bash
make nueva-presentacion DIR=TercerSemestre/NombreMateria/NombrePresentacion
```

Copia la plantilla completa al destino. **No sobreescribe** si ya existe `main.tex`.

---

## Personalizar

Abre `main.tex` y edita solo el bloque `PERSONALIZACIÓN`:

```latex
\newcommand{\TituloPresent}{Mi Título}
\newcommand{\SubtituloPresent}{Subtítulo descriptivo}
\newcommand{\Autor}{Hernán Galileo Cabrera Garibaldi}
\newcommand{\MateriaCorta}{Materia — Semestre 2026-2}
\newcommand{\ProfesorAsignado}{Nombre del Profesor}
\newcommand{\Semestre}{2026-2}
\newcommand{\ProgramaCorto}{Maestría y Doctorado en Urbanismo}
\newcommand{\Facultad}{FES Acatlán}
\newcommand{\FechaPresent}{Naucalpan, Abril 2026}
```

---

## Compilar

```bash
make Presentacion DIR=<ruta/a/la/presentacion>
```

Ejecuta: `pdflatex → bibtex → pdflatex → pdflatex`. El PDF se genera en `<ruta>/main.pdf`.

---

## Colores institucionales

En `Latex/BeamerTheme.tex`, sección `PALETA DE COLORES`:

```latex
\definecolor{ColorPrincipal}{RGB}{0, 56, 147}    % Azul UNAM
\definecolor{ColorAcento}   {RGB}{244, 180, 0}   % Oro UNAM
\definecolor{ColorFondo}    {RGB}{248, 250, 255}  % Blanco azulado
\definecolor{ColorTexto}    {RGB}{20, 20, 20}     % Casi negro
\definecolor{ColorAlerta}   {RGB}{183, 28, 28}    % Rojo énfasis
```

---

## Catálogo de tipos de diapositiva

Todos los ejemplos están en `secciones/`. Copia el bloque y adapta el contenido.

### Portada institucional
```latex
\begin{frame}[plain]
  \titlepage
\end{frame}
```
Muestra automáticamente escudos UNAM/FES Acatlán + datos del bloque PERSONALIZACIÓN.

---

### Índice
```latex
\begin{frame}{Contenido}
  \tableofcontents
\end{frame}
```

---

### Transición de sección
Generada **automáticamente** al declarar `\section{Nombre}`. Solo aparece a partir de la segunda sección (la primera arranca después del índice, sin transición adicional).

---

### Dos columnas + bloque de dato clave
```latex
\begin{frame}{Contexto y Problemática}
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
      {\color{ColorPrincipal}\Large\textbf{01}}\\[0.1cm]
      {\small Descripción del objetivo 1}
    \end{column}
    % Repetir para 02, 03...
  \end{columns}
\end{frame}
```

---

### Tres bloques horizontales (comparativa)
```latex
\begin{frame}{Modelos Evaluados}
  \begin{columns}[T]
    \begin{column}{0.32\textwidth}
      \begin{block}{Modelo A}
        Descripción breve.
      \end{block}
    \end{column}
    \begin{column}{0.32\textwidth}
      \begin{block}{Modelo B}
        Descripción breve.
      \end{block}
    \end{column}
    \begin{column}{0.32\textwidth}
      \begin{block}{Modelo C}
        Descripción breve.
      \end{block}
    \end{column}
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

### Tres imágenes con texto explicativo
```latex
\begin{frame}{Análisis Comparativo}
  \begin{columns}[T]
    \begin{column}{0.32\textwidth}
      \centering
      \includegraphics[width=\textwidth, height=3.5cm, keepaspectratio]{img/fig1.png}\\[0.1cm]
      {\scriptsize Texto explicativo imagen 1.}\\[0.05cm]
      \fuentefigura{Fuente 1.}
    \end{column}
    \begin{column}{0.32\textwidth}
      \centering
      \includegraphics[width=\textwidth, height=3.5cm, keepaspectratio]{img/fig2.png}\\[0.1cm]
      {\scriptsize Texto explicativo imagen 2.}\\[0.05cm]
      \fuentefigura{Fuente 2.}
    \end{column}
    \begin{column}{0.32\textwidth}
      \centering
      \includegraphics[width=\textwidth, height=3.5cm, keepaspectratio]{img/fig3.png}\\[0.1cm]
      {\scriptsize Texto explicativo imagen 3.}\\[0.05cm]
      \fuentefigura{Fuente 3.}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Cita destacada centrada
```latex
\begin{frame}{Argumento Central}
  \vfill
  \begin{center}
    \color{ColorPrincipal}
    \Large\itshape
    ``Texto de la cita o argumento central.''
  \end{center}
  \vfill
  \flushright{\small\citet{autor2024}}
\end{frame}
```

---

### Solo texto — mensaje clave (frame plain con banda lateral)
```latex
\begin{frame}[plain]
  \begin{tikzpicture}[remember picture, overlay]
    \fill[ColorPrincipal]
      (current page.north west) rectangle
      ([xshift=0.35cm] current page.south west);
    \fill[ColorAcento]
      ([xshift=0.32cm] current page.north west) rectangle
      ([xshift=0.35cm] current page.south west);
  \end{tikzpicture}
  \hspace{0.8cm}%
  \begin{minipage}{0.88\textwidth}
    \vspace{2.2cm}
    {\color{ColorAcento}\rule{0.5\textwidth}{1.2pt}}\\[0.5cm]
    {\large\bfseries\color{ColorPrincipal} Pregunta o mensaje clave}\\[0.6cm]
    {\normalsize Texto de apoyo o contexto.}\\[0.5cm]
    {\color{ColorAcento}\rule{0.3\textwidth}{0.8pt}}
  \end{minipage}
\end{frame}
```

---

### Título azul visible dentro del frame (comando `\tituloframe`)

Útil en frames `[plain]` donde el header no aparece:

```latex
\begin{frame}[plain]
  \tituloframe{Mi título visible en azul}
  Contenido del frame sin barra de encabezado...
\end{frame}
```

---

### Diagrama de flujo (TikZ)
Ver el ejemplo completo en `secciones/s02_desarrollo.tex`. Estilos reutilizables:

| Estilo | Descripción |
|---|---|
| `caja` | Rectángulo redondeado, borde azul, fondo claro |
| `inicio` | Caja relleno azul sólido, texto blanco |
| `result` | Caja relleno dorado, texto negro |
| `decision` | Rombo, aspecto 2.5 |
| `flecha` | Flecha gruesa azul (`-Stealth`) |
| `lateral` | Flecha dorada punteada (retroalimentación) |

---

### Síntesis dos columnas (block + alertblock)
```latex
\begin{frame}{Síntesis}
  \begin{columns}[T]
    \begin{column}{0.48\textwidth}
      \begin{block}{Lo que funciona}
        \begin{itemize}
          \item Punto positivo 1
        \end{itemize}
      \end{block}
    \end{column}
    \begin{column}{0.48\textwidth}
      \begin{alertblock}{Retos pendientes}
        \begin{itemize}
          \item Reto 1
        \end{itemize}
      \end{alertblock}
    \end{column}
  \end{columns}
\end{frame}
```

---

### Cierre / Gracias
```latex
\begin{frame}[plain]
  \begin{center}
    \vfill
    {\color{ColorAcento}\rule{0.6\textwidth}{1.5pt}}\\[0.5cm]
    {\Large\bfseries\color{ColorPrincipal} Gracias}\\[0.3cm]
    {\normalsize \Autor}\\[0.1cm]
    {\small \MateriaCorta}\\[0.5cm]
    {\color{ColorAcento}\rule{0.6\textwidth}{1.5pt}}
    \vfill
  \end{center}
\end{frame}
```

---

## Comandos de utilidad

| Comando | Uso |
|---|---|
| `\fuentefigura{Texto}` | Pie de figura pequeño: *Fuente: Texto* |
| `\tituloframe{Texto}` | Título azul + línea dorada dentro del frame |
| `\termino{palabra}` | Cursiva para término en primera aparición |
| `\cdmx` | Ciudad de México |
| `\zmvm` | Zona Metropolitana del Valle de México |

---

## Imágenes

Se buscan en este orden:
1. `img/` — carpeta local de la presentación
2. `../Img/` · `../../Img/` · `../../../Img/` — carpeta `Img/` en la raíz del proyecto

Coloca tus figuras en `img/` y referencialas solo por nombre:
```latex
\includegraphics[width=\textwidth]{nombre_figura.png}
```

Los escudos (`UNAM_crest_blue.pdf`, `escudo-fes-azul.png`) se toman automáticamente de `Img/`.

---

## Nota sobre `\pause`

`\pause` genera una página PDF por cada overlay — la misma diapositiva aparece N veces en el visor.
Los `\pause` están **comentados** por defecto en la plantilla.
Descomentar solo cuando se presente en proyector con Beamer interactivo.
