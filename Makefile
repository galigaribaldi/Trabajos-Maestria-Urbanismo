# =============================================================================
# Makefile — Compilación y scaffolding de documentos académicos de Maestría
# UNAM — Maestría en Urbanismo, FES Acatlán
#
# ─── COMPILACIÓN (requiere main.tex ya existente) ────────────────────────────
#   make Document     DIR=<ruta>   → compila ensayo/artículo en <ruta>
#   make Presentacion DIR=<ruta>   → compila presentación Beamer en <ruta>
#
# ─── SCAFFOLDING — crea documento nuevo desde plantilla ──────────────────────
#   make EnsayosConPortada    DIR=<ruta> [COLOR=Teal]  → ensayo con portada institucional
#   make EnsayosSinPortada    DIR=<ruta> [COLOR=Teal]  → ensayo sin portada (con TOC e índices)
#   make ArticulosConPortada  DIR=<ruta> [COLOR=Teal]  → artículo con portada minimalista
#   make ArticulosSinPortada  DIR=<ruta> [COLOR=Teal]  → artículo sin portada (con palabras clave)
#   make RegistroDiffDoc      DIR=<ruta> [COLOR=Teal]  → registro de avances con diff latexdiff
#   make nuevo-ensayo-teal    DIR=<ruta>  → ensayo con tema Teal
#   make nuevo-ensayo-olivo   DIR=<ruta>  → ensayo con tema VerdeOlivo
#   make nuevo-ensayo-purpura DIR=<ruta>  → ensayo con tema Purpura
#   make nuevo-ensayo-rojo    DIR=<ruta>  → ensayo con tema Rojo
#   make nueva-presentacion   DIR=<ruta> [COLOR=Teal]  → presentación Beamer UNAM
#   make nueva-infografia     DIR=<ruta> [COLOR=Teal] [TAMANIO=A4Portrait] → infografía TikZ UNAM
#   make nueva-infografia-a3  DIR=<ruta> [COLOR=Teal] → infografía A3 Portrait
#   make nueva-infografia-landscape DIR=<ruta> [COLOR=Teal] → infografía A4 Landscape
#
# ─── ALIASES DE MATERIAS CONOCIDAS ───────────────────────────────────────────
#   make desarrollo            → compila Ensayo_Humedales
#   make pres-humedales        → compila Presentacion_Humedales
#   make pres-movilidad        → compila Movilidad_Sustentable_Presentacion
#   make sociologia            → compila SociologiaUrbana (si existe)
#
# ─── RELEASES (requiere gh CLI autenticado) ──────────────────────────────────
#   make release DIR=<ruta> TAG=<tag> TITULO="..." [TIPO=Document|Presentacion]
#                              → compila + publica GitHub Release con el PDF
#
#   Aliases prefabricados (3er semestre 2026-2):
#   make release-ens-humedales   → v2026-2-dsma-ens-humedales
#   make release-pres-humedales  → v2026-2-urbs-pres-humedales
#   make release-pres-movilidad  → v2026-2-dsu-pres-movilidad
#
# ─── UTILIDADES ──────────────────────────────────────────────────────────────
#   make limpiar               → borra auxiliares LaTeX en todo el proyecto
#   make limpiar-dir DIR=<ruta>→ borra auxiliares solo en <ruta>
#
# ─── LATEXDIFF ───────────────────────────────────────────────────────────────
#   make latexdiff-tesis   CHAPTER=<archivo> REV1=<commit> DIR=<ruta>
#                              → diff de un capítulo específico
#   make latexdiff-commit  REV1=<commit> DIR=<ruta> [REV2=HEAD]
#                              → diff de TODOS los .tex cambiados entre commits
# =============================================================================

MOTOR  := pdflatex
BIBTEX := bibtex
FLAGS  := -interaction=nonstopmode -halt-on-error

# Color del tema — override con COLOR=Teal, COLOR=VerdeOlivo, COLOR=Purpura, COLOR=Rojo, COLOR=VerdeEsmeralda
# Default: Institucional (Azul UNAM + Oro UNAM)
COLOR   ?= Institucional

# Tamaño de hoja para infografías — override con TAMANIO=A3Portrait, TAMANIO=A4Landscape
# Default: A4Portrait (210×297 mm vertical)
TAMANIO ?= A4Portrait

# ─── latexdiff-tesis ────────────────────────────────────────────────────────
# Parámetros con valores por defecto (se pueden sobreescribir en el llamado):
#   TESIS_DIR — repositorio fuente de la tesis  (default: ../Tesis_Latex)
#   REV2      — tag/commit de la versión nueva   (default: HEAD)
#   OUT       — nombre del .tex de salida sin extensión (default: diff_evidencia)
TESIS_DIR ?= ../Tesis_Latex
REV2      ?= HEAD
OUT       ?= diff_evidencia

# Plantillas base — documentos
PLANTILLA_ENSAYO_CON_PORTADA   := DocumentosPlantilla/Ensayos/ConPortada
PLANTILLA_ENSAYO_SIN_PORTADA   := DocumentosPlantilla/Ensayos/SinPortada
PLANTILLA_ARTICULO_CON_PORTADA := DocumentosPlantilla/Articulos/ConPortada
PLANTILLA_ARTICULO_SIN_PORTADA := DocumentosPlantilla/Articulos/SinPortada
PLANTILLA_REGISTRO_DIFF        := DocumentosPlantilla/Articulos/RegistroDiff

# Plantilla base — presentaciones
PLANTILLA_BEAMER     := PresentacionPlantilla

# Plantilla base — infografías
PLANTILLA_INFOGRAFIA := InfografiaPlantilla

# Rutas conocidas
DIR_DUS_HUMEDALES      := TercerSemestre/DesarrolloUrbanoSostenible/Ensayo_Humedales
DIR_DUS_PRES_HUMEDALES := TercerSemestre/DesarrolloUrbanoSostenible/Presentacion_Humedales
DIR_DSU_MOVILIDAD      := TercerSemestre/DesarrolloUrbanoSostenible/Movilidad_Sustentable_Presentacion
DIR_SOCIOLOGIA         := TercerSemestre/SociologiaUrbana
DIR_EXTRACURR_STATEMAP := Extracurriculares/StateMap
DIR_EXTRACURR_TALLER   := Extracurriculares/StateMapTaller

# Variable de ruta arbitraria (override con DIR=...)
DIR ?=

.PHONY: all Document Presentacion Infografia \
        EnsayosConPortada EnsayosSinPortada \
        ArticulosConPortada ArticulosSinPortada RegistroDiffDoc \
        nuevo-ensayo \
        nuevo-ensayo-teal nuevo-ensayo-olivo \
        nuevo-ensayo-purpura nuevo-ensayo-rojo \
        nueva-presentacion \
        nueva-presentacion-teal nueva-presentacion-olivo \
        nueva-presentacion-purpura nueva-presentacion-rojo \
        nueva-infografia \
        nueva-infografia-a3 nueva-infografia-landscape \
        nueva-infografia-teal nueva-infografia-olivo \
        nueva-infografia-purpura nueva-infografia-rojo \
        desarrollo pres-humedales pres-movilidad sociologia state-map state-map-taller \
        release release-ens-humedales release-pres-humedales release-pres-movilidad \
        latexdiff-tesis \
        limpiar limpiar-dir _compile _compile-infografia _scaffold _release

# =============================================================================
# ALIASES — materias conocidas
# =============================================================================

all: desarrollo

desarrollo:
	@echo "========================================================"
	@echo " Compilando: Desarrollo Urbano Sostenible — Ensayo Humedales"
	@echo "========================================================"
	$(MAKE) Document DIR=$(DIR_DUS_HUMEDALES)

pres-humedales:
	@echo "========================================================"
	@echo " Compilando: Presentación Humedales"
	@echo "========================================================"
	$(MAKE) Presentacion DIR=$(DIR_DUS_PRES_HUMEDALES)

pres-movilidad:
	@echo "========================================================"
	@echo " Compilando: Movilidad Sustentable — Presentación"
	@echo "========================================================"
	$(MAKE) Presentacion DIR=$(DIR_DSU_MOVILIDAD)

sociologia:
	@echo "========================================================"
	@echo " Compilando: Sociología Urbana"
	@echo "========================================================"
	@if [ -f "$(DIR_SOCIOLOGIA)/main.tex" ]; then \
	    $(MAKE) Document DIR=$(DIR_SOCIOLOGIA); \
	else \
	    echo "[AVISO] No se encontró main.tex en $(DIR_SOCIOLOGIA). Omitiendo."; \
	fi

state-map:
	@echo "========================================================"
	@echo " Compilando: Extracurricular — State of the Map LATAM 2026"
	@echo "========================================================"
	$(MAKE) Document DIR=$(DIR_EXTRACURR_STATEMAP)

state-map-taller:
	@echo "========================================================"
	@echo " Compilando: Extracurricular — Taller SotM LATAM 2026"
	@echo "========================================================"
	$(MAKE) Document DIR=$(DIR_EXTRACURR_TALLER)

# =============================================================================
# COMPILACIÓN — pdflatex → bibtex → pdflatex × 2
# =============================================================================

Document:
ifndef DIR
	$(error Debes indicar la carpeta: make Document DIR=<ruta>)
endif
	@$(MAKE) _compile DIR=$(DIR) TIPO=Ensayo

Presentacion:
ifndef DIR
	$(error Debes indicar la carpeta: make Presentacion DIR=<ruta>)
endif
	@$(MAKE) _compile DIR=$(DIR) TIPO=Presentacion

Infografia:
ifndef DIR
	$(error Debes indicar la carpeta: make Infografia DIR=<ruta> [COLOR=...] [TAMANIO=A4Portrait|A3Portrait|A4Landscape])
endif
	@$(MAKE) _compile-infografia DIR=$(DIR) TIPO=Infografia

_compile-infografia:
	@if [ ! -f "$(DIR)/main.tex" ]; then \
	    echo "[ERROR] No existe $(DIR)/main.tex"; \
	    echo "        Usa: make nueva-infografia DIR=$(DIR)"; \
	    exit 1; \
	fi
	@echo "--- [Infografia] Color: $(COLOR) | Tamaño: $(TAMANIO) ---"
	@echo "--- [Infografia] Pasada 1/2: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) -jobname=main \
	    "\def\ColorTema{$(COLOR)}\def\TamanioHoja{$(TAMANIO)}\input{main}"
	@echo "--- [Infografia] Pasada 2/2: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) -jobname=main \
	    "\def\ColorTema{$(COLOR)}\def\TamanioHoja{$(TAMANIO)}\input{main}"
	@echo ">>> PDF generado: $(DIR)/main.pdf [tema: $(COLOR) | tamaño: $(TAMANIO)]"

_compile:
	@if [ ! -f "$(DIR)/main.tex" ]; then \
	    echo "[ERROR] No existe $(DIR)/main.tex"; \
	    echo "        Usa el comando de scaffolding correspondiente primero."; \
	    exit 1; \
	fi
	@echo "--- [$(TIPO)] Color: $(COLOR) ---"
	@echo "--- [$(TIPO)] Pasada 1/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) -jobname=main "\def\ColorTema{$(COLOR)}\input{main}"
	@echo "--- [$(TIPO)] Pasada BibTeX ---"
	cd $(DIR) && $(BIBTEX) main || true
	@echo "--- [$(TIPO)] Pasada 2/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) -jobname=main "\def\ColorTema{$(COLOR)}\input{main}"
	@echo "--- [$(TIPO)] Pasada 3/3: pdflatex ---"
	cd $(DIR) && $(MOTOR) $(FLAGS) -jobname=main "\def\ColorTema{$(COLOR)}\input{main}"
	@echo ">>> PDF generado: $(DIR)/main.pdf [tema: $(COLOR)]"

# =============================================================================
# SCAFFOLDING — copia la plantilla en DIR (no sobreescribe si ya existe main.tex)
# =============================================================================

EnsayosConPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make EnsayosConPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ENSAYO_CON_PORTADA) DIR=$(DIR) TIPO=Ensayo COLOR=$(COLOR)

EnsayosSinPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make EnsayosSinPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ENSAYO_SIN_PORTADA) DIR=$(DIR) TIPO=Ensayo COLOR=$(COLOR)

ArticulosConPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make ArticulosConPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ARTICULO_CON_PORTADA) DIR=$(DIR) TIPO=Articulo COLOR=$(COLOR)

ArticulosSinPortada:
ifndef DIR
	$(error Debes indicar la carpeta destino: make ArticulosSinPortada DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_ARTICULO_SIN_PORTADA) DIR=$(DIR) TIPO=Articulo COLOR=$(COLOR)

RegistroDiffDoc:
ifndef DIR
	$(error Debes indicar la carpeta destino: make RegistroDiffDoc DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_REGISTRO_DIFF) DIR=$(DIR) TIPO=Articulo COLOR=$(COLOR)

# Alias heredado (apunta a EnsayosConPortada por compatibilidad)
nuevo-ensayo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR) COLOR=$(COLOR)

nuevo-ensayo-teal:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo-teal DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR) COLOR=Teal

nuevo-ensayo-olivo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo-olivo DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR) COLOR=VerdeOlivo

nuevo-ensayo-purpura:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo-purpura DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR) COLOR=Purpura

nuevo-ensayo-rojo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nuevo-ensayo-rojo DIR=<ruta>)
endif
	@$(MAKE) EnsayosConPortada DIR=$(DIR) COLOR=Rojo

nueva-presentacion:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion COLOR=$(COLOR)

nueva-presentacion-teal:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion-teal DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion COLOR=Teal

nueva-presentacion-olivo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion-olivo DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion COLOR=VerdeOlivo

nueva-presentacion-purpura:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion-purpura DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion COLOR=Purpura

nueva-presentacion-rojo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-presentacion-rojo DIR=<ruta>)
endif
	@$(MAKE) _scaffold PLANTILLA=$(PLANTILLA_BEAMER) DIR=$(DIR) TIPO=Presentacion COLOR=Rojo

# ── Infografías TikZ ─────────────────────────────────────────────────────────
nueva-infografia:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia DIR=<ruta> [COLOR=...] [TAMANIO=A4Portrait|A3Portrait|A4Landscape])
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=$(COLOR) TAMANIO=$(TAMANIO)

nueva-infografia-a3:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-a3 DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=$(COLOR) TAMANIO=A3Portrait

nueva-infografia-landscape:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-landscape DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=$(COLOR) TAMANIO=A4Landscape

nueva-infografia-teal:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-teal DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=Teal TAMANIO=$(TAMANIO)

nueva-infografia-olivo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-olivo DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=VerdeOlivo TAMANIO=$(TAMANIO)

nueva-infografia-purpura:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-purpura DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=Purpura TAMANIO=$(TAMANIO)

nueva-infografia-rojo:
ifndef DIR
	$(error Debes indicar la carpeta destino: make nueva-infografia-rojo DIR=<ruta>)
endif
	@$(MAKE) _scaffold-infografia PLANTILLA=$(PLANTILLA_INFOGRAFIA) DIR=$(DIR) COLOR=Rojo TAMANIO=$(TAMANIO)

_scaffold-infografia:
	@if [ -f "$(DIR)/main.tex" ]; then \
	    echo "[AVISO] $(DIR)/main.tex ya existe — no se sobreescribe."; \
	    echo "        Borra el directorio o elige otro nombre si quieres empezar de cero."; \
	    exit 1; \
	fi
	@echo ">>> Creando Infografia en: $(DIR) [tema: $(COLOR) | tamaño: $(TAMANIO)]"
	mkdir -p "$(DIR)"
	cp -r $(PLANTILLA)/. "$(DIR)/"
	@printf '%% color-config.tex — Temas: Institucional | Teal | VerdeOlivo | Purpura | Rojo | VerdeEsmeralda\n\\providecommand{\\ColorTema}{$(COLOR)}\n' \
	    > "$(DIR)/Latex/color-config.tex"
	@printf '%% size-config.tex — Tamaños: A4Portrait | A3Portrait | A4Landscape\n\\providecommand{\\TamanioHoja}{$(TAMANIO)}\n' \
	    > "$(DIR)/Latex/size-config.tex"
	@echo ">>> Plantilla de infografía copiada. Próximos pasos:"
	@echo "    1. Edita el bloque PERSONALIZACIÓN en $(DIR)/main.tex"
	@echo "    2. Tema de color activo: $(COLOR) (cambia en $(DIR)/Latex/color-config.tex)"
	@echo "    3. Tamaño de hoja activo: $(TAMANIO) (cambia en $(DIR)/Latex/size-config.tex)"
	@echo "    4. Coloca tus imágenes en $(DIR)/img/"
	@echo "    5. Compila con: make Infografia DIR=$(DIR) [COLOR=$(COLOR)] [TAMANIO=$(TAMANIO)]"

_scaffold:
	@if [ -f "$(DIR)/main.tex" ]; then \
	    echo "[AVISO] $(DIR)/main.tex ya existe — no se sobreescribe."; \
	    echo "        Borra el directorio o elige otro nombre si quieres empezar de cero."; \
	    exit 1; \
	fi
	@echo ">>> Creando $(TIPO) en: $(DIR) [tema: $(COLOR)]"
	mkdir -p "$(DIR)"
	cp -r $(PLANTILLA)/. "$(DIR)/"
	@printf '%% color-config.tex — Temas: Institucional | Teal | VerdeOlivo | Purpura | Rojo\n\\providecommand{\\ColorTema}{$(COLOR)}\n' \
	    > "$(DIR)/Latex/color-config.tex"
	@echo ">>> Plantilla copiada. Próximos pasos:"
	@echo "    1. Edita el bloque PERSONALIZACIÓN en $(DIR)/main.tex"
	@if [ "$(TIPO)" = "Presentacion" ]; then \
	    echo "    2. Tema de color activo: $(COLOR) (cambia en $(DIR)/Latex/color-config.tex)"; \
	    echo "    3. Escribe tus slides en $(DIR)/secciones/"; \
	else \
	    echo "    2. Tema de color activo: $(COLOR) (cambia en $(DIR)/Latex/color-config.tex)"; \
	    echo "    3. Escribe tu contenido en $(DIR)/secciones/"; \
	fi
	@echo "    4. Compila con: make $(if $(filter Presentacion,$(TIPO)),Presentacion,Document) DIR=$(DIR)"

# =============================================================================
# RELEASES — compila el PDF y publica en GitHub Releases
#
# Uso genérico:
#   make release DIR=<ruta> TAG=<tag> TITULO="Título completo" \
#                [TIPO=Document|Presentacion] [COLOR=Institucional]
#
# El PDF se sube con el nombre del tag (p. ej. v2026-2-dsma-ens-humedales.pdf)
# para que sea identificable en la página de releases.
# =============================================================================

TIPO   ?= Document
TITULO ?=

release:
ifndef TAG
	$(error Debes indicar el tag: make release TAG=v... DIR=... TITULO="...")
endif
ifndef DIR
	$(error Debes indicar la carpeta: make release TAG=... DIR=<ruta> TITULO="...")
endif
	@if [ -z "$(TITULO)" ]; then echo "[ERROR] Debes indicar TITULO=\"...\""; exit 1; fi
	@$(MAKE) _compile DIR=$(DIR) TIPO=$(TIPO)
	@echo ">>> Preparando release $(TAG)..."
	cp "$(DIR)/main.pdf" "$(DIR)/$(TAG).pdf"
	gh release create "$(TAG)" "$(DIR)/$(TAG).pdf" \
	    --title "$(TITULO)" \
	    --notes "Compilado con LaTeX · Tema de color: $(COLOR) · Maestría en Urbanismo UNAM · FES Acatlán"
	rm "$(DIR)/$(TAG).pdf"
	@echo ">>> Release $(TAG) publicado en GitHub."

# ── Aliases prefabricados — Tercer Semestre 2026-2 ──────────────────────────
# Cada alias compila y publica directamente sin propagar el título por Make
# (los títulos con espacios no viajan bien entre sub-makes).

release-ens-humedales:
	@$(MAKE) _compile DIR=$(DIR_DUS_HUMEDALES) TIPO=Document
	cp "$(DIR_DUS_HUMEDALES)/main.pdf" "$(DIR_DUS_HUMEDALES)/v2026-2-dsma-ens-humedales.pdf"
	gh release create "v2026-2-dsma-ens-humedales" \
	    "$(DIR_DUS_HUMEDALES)/v2026-2-dsma-ens-humedales.pdf" \
	    --title "Humedales Urbanos y Movilidad Sostenible en la ZMVM" \
	    --notes "Compilado con LaTeX · Tema de color: $(COLOR) · Maestría en Urbanismo UNAM · FES Acatlán"
	rm "$(DIR_DUS_HUMEDALES)/v2026-2-dsma-ens-humedales.pdf"
	@echo ">>> Release v2026-2-dsma-ens-humedales publicado en GitHub."

release-pres-humedales:
	@$(MAKE) _compile DIR=$(DIR_DUS_PRES_HUMEDALES) TIPO=Presentacion
	cp "$(DIR_DUS_PRES_HUMEDALES)/main.pdf" "$(DIR_DUS_PRES_HUMEDALES)/v2026-2-urbs-pres-humedales.pdf"
	gh release create "v2026-2-urbs-pres-humedales" \
	    "$(DIR_DUS_PRES_HUMEDALES)/v2026-2-urbs-pres-humedales.pdf" \
	    --title "Humedales Urbanos y Movilidad — De la Degradación a la Infraestructura Sustentable" \
	    --notes "Compilado con LaTeX · Tema de color: $(COLOR) · Maestría en Urbanismo UNAM · FES Acatlán"
	rm "$(DIR_DUS_PRES_HUMEDALES)/v2026-2-urbs-pres-humedales.pdf"
	@echo ">>> Release v2026-2-urbs-pres-humedales publicado en GitHub."

release-pres-movilidad:
	@$(MAKE) _compile DIR=$(DIR_DSU_MOVILIDAD) TIPO=Presentacion
	cp "$(DIR_DSU_MOVILIDAD)/main.pdf" "$(DIR_DSU_MOVILIDAD)/v2026-2-dsu-pres-movilidad.pdf"
	gh release create "v2026-2-dsu-pres-movilidad" \
	    "$(DIR_DSU_MOVILIDAD)/v2026-2-dsu-pres-movilidad.pdf" \
	    --title "Movilidad Sustentable — Entre la Teoria y la Realidad Mexicana" \
	    --notes "Compilado con LaTeX · Tema de color: $(COLOR) · Maestría en Urbanismo UNAM · FES Acatlán"
	rm "$(DIR_DSU_MOVILIDAD)/v2026-2-dsu-pres-movilidad.pdf"
	@echo ">>> Release v2026-2-dsu-pres-movilidad publicado en GitHub."

# =============================================================================
# LATEXDIFF — genera diff de un capítulo entre dos revisiones del repo de tesis
#
# Uso:
#   make latexdiff-tesis \
#        CHAPTER=<archivo.tex relativo a TESIS_DIR> \
#        REV1=<tag-o-commit-inicial> \
#        DIR=<directorio-del-documento-destino> \
#        [TESIS_DIR=../Tesis_Latex] \
#        [REV2=HEAD] \
#        [OUT=diff_evidencia]
#
# Ejemplo:
#   make latexdiff-tesis \
#        CHAPTER=3-Conceptos-Indicadores/3-Conceptos-Indicadores.tex \
#        REV1=v0.3.2 REV2=v0.4.1 \
#        DIR=TercerSemestre/SeminarioInvestigacion/RegistroAvances2026-2
#
# Resultado:
#   • DIR/secciones/OUT.tex  — diff listo para \input{} en el documento
#   • DIR/Figures/           — figuras copiadas desde TESIS_DIR/Figures (sin sobreescribir)
#
# Notas:
#   • Usa 'git archive' en lugar de latexdiff-vc para evitar problemas con Git LFS.
#   • Filtra el bloque %DIF PREAMBLE generado por latexdiff (el documento destino
#     ya lo maneja a través de Latex/latexdiff-preamble.tex).
#   • Si CHAPTER no existe en REV1 (capítulo nuevo), se usa un archivo vacío
#     para que el diff muestre todo el contenido como adición.
# =============================================================================

latexdiff-tesis:
ifndef DIR
	$(error [latexdiff-tesis] Debes indicar DIR=<directorio-del-documento>)
endif
ifndef CHAPTER
	$(error [latexdiff-tesis] Debes indicar CHAPTER=<archivo.tex relativo a TESIS_DIR>)
endif
ifndef REV1
	$(error [latexdiff-tesis] Debes indicar REV1=<tag-o-commit-inicial>)
endif
	@if [ ! -d "$(TESIS_DIR)" ]; then \
	    echo "[ERROR] No se encontró el repositorio: $(TESIS_DIR)"; \
	    exit 1; \
	fi
	@echo "========================================================"
	@echo " latexdiff-tesis"
	@echo "   Repo  : $(TESIS_DIR)"
	@echo "   Cap.  : $(CHAPTER)"
	@echo "   Rev1  : $(REV1)  →  Rev2: $(REV2)"
	@echo "   Salida: $(DIR)/secciones/$(OUT).tex"
	@echo "========================================================"
	@set -e; \
	ABSDIR="$(CURDIR)/$(DIR)"; \
	TMPDIR=$$(mktemp -d); \
	mkdir -p "$$TMPDIR/old" "$$TMPDIR/new"; \
	echo "--- Extrayendo $(REV1)..."; \
	cd "$(TESIS_DIR)" && git archive $(REV1) 2>/dev/null | tar -x -C "$$TMPDIR/old" || true; \
	echo "--- Extrayendo $(REV2)..."; \
	cd "$(TESIS_DIR)" && git archive $(REV2) 2>/dev/null | tar -x -C "$$TMPDIR/new"; \
	if [ ! -f "$$TMPDIR/old/$(CHAPTER)" ]; then \
	    echo "    ($(CHAPTER) no existe en $(REV1) — se tratará como archivo nuevo)"; \
	    mkdir -p "$$(dirname "$$TMPDIR/old/$(CHAPTER)")"; \
	    touch "$$TMPDIR/old/$(CHAPTER)"; \
	fi; \
	if [ ! -f "$$TMPDIR/new/$(CHAPTER)" ]; then \
	    echo "[ERROR] $(CHAPTER) no existe en $(REV2)"; \
	    rm -rf "$$TMPDIR"; \
	    exit 1; \
	fi; \
	echo "--- Generando diff..."; \
	mkdir -p "$$ABSDIR/secciones"; \
	latexdiff --flatten \
	    "$$TMPDIR/old/$(CHAPTER)" \
	    "$$TMPDIR/new/$(CHAPTER)" \
	    | grep -v '%DIF PREAMBLE$$' \
	    > "$$ABSDIR/secciones/$(OUT).tex"; \
	echo "--- Post-procesando diff..."; \
	sed -i '' \
	    -e 's/\\includegraphics\[/\\figinclude[/g' \
	    -e 's/\\includegraphics{/\\figinclude{/g' \
	    "$$ABSDIR/secciones/$(OUT).tex"; \
	perl -0777 -i -pe \
	    's/\\begin\{forest\}.*?\\end\{forest\}/\\iffalse\n$$&\n\\fi/gs' \
	    "$$ABSDIR/secciones/$(OUT).tex"; \
	rm -rf "$$TMPDIR"; \
	echo ">>> Listo. Archivo generado: $(DIR)/secciones/$(OUT).tex"; \
	echo "    Compila con: make Document DIR=$(DIR) COLOR=<tema>"

# =============================================================================
# LATEXDIFF-COMMIT — diff completo de todos los .tex cambiados entre dos commits
#
# Detecta automáticamente los archivos .tex modificados entre REV1 y REV2,
# genera el diff de cada uno y los concatena en un único diff_evidencia.tex
# con separadores \subsection* por archivo. El resultado es directamente
# compilable con 'make Document'.
#
# Uso:
#   make latexdiff-commit \
#        REV1=<tag-o-commit-inicial> \
#        DIR=<directorio-del-documento-destino> \
#        [TESIS_DIR=../TesisUrbanismo] \
#        [REV2=HEAD] \
#        [OUT=diff_evidencia]
#
# Ejemplo:
#   make latexdiff-commit \
#        TESIS_DIR=../TesisUrbanismo \
#        REV1=45d6f55 REV2=1a1137db \
#        DIR=CuartoSemestre/SeminarioGraduacion/Registro2
# =============================================================================

latexdiff-commit:
ifndef DIR
	$(error [latexdiff-commit] Debes indicar DIR=<directorio-del-documento>)
endif
ifndef REV1
	$(error [latexdiff-commit] Debes indicar REV1=<tag-o-commit-inicial>)
endif
	@if [ ! -d "$(TESIS_DIR)" ]; then \
	    echo "[ERROR] No se encontró el repositorio: $(TESIS_DIR)"; \
	    exit 1; \
	fi
	@echo "========================================================"
	@echo " latexdiff-commit"
	@echo "   Repo  : $(TESIS_DIR)"
	@echo "   Rev1  : $(REV1)  →  Rev2: $(REV2)"
	@echo "   Salida: $(DIR)/secciones/$(OUT).tex"
	@echo "========================================================"
	@set -e; \
	ABSDIR="$(CURDIR)/$(DIR)"; \
	TMPDIR=$$(mktemp -d); \
	mkdir -p "$$TMPDIR/old" "$$TMPDIR/new"; \
	echo "--- Extrayendo $(REV1)..."; \
	cd "$(TESIS_DIR)" && git archive $(REV1) 2>/dev/null | tar -x -C "$$TMPDIR/old" || true; \
	echo "--- Extrayendo $(REV2)..."; \
	cd "$(TESIS_DIR)" && git archive $(REV2) 2>/dev/null | tar -x -C "$$TMPDIR/new"; \
	CHANGED=$$(cd "$(TESIS_DIR)" && git diff --name-only $(REV1) $(REV2) -- '*.tex'); \
	if [ -z "$$CHANGED" ]; then \
	    echo "[AVISO] No hay archivos .tex cambiados entre $(REV1) y $(REV2)"; \
	    rm -rf "$$TMPDIR"; \
	    exit 0; \
	fi; \
	echo "--- Archivos .tex con cambios:"; \
	echo "$$CHANGED" | sed 's/^/    /'; \
	mkdir -p "$$ABSDIR/secciones"; \
	OUTFILE="$$ABSDIR/secciones/$(OUT).tex"; \
	> "$$OUTFILE"; \
	for f in $$CHANGED; do \
	    OLD="$$TMPDIR/old/$$f"; \
	    NEW="$$TMPDIR/new/$$f"; \
	    if [ ! -f "$$NEW" ]; then \
	        echo "    ($$f eliminado en $(REV2) — omitido)"; \
	        continue; \
	    fi; \
	    if [ ! -f "$$OLD" ]; then \
	        echo "    ($$f es nuevo en $(REV2))"; \
	        mkdir -p "$$(dirname "$$OLD")"; \
	        touch "$$OLD"; \
	    fi; \
	    echo "--- Diffando $$f..."; \
	    LABEL=$$(basename "$$f" .tex | tr '_-' '  '); \
	    printf '\n%%%% ── %s\n\\subsection*{%s}\n' "$$f" "$$LABEL" >> "$$OUTFILE"; \
	    latexdiff "$$OLD" "$$NEW" | grep -v '%DIF PREAMBLE$$' >> "$$OUTFILE"; \
	done; \
	echo "--- Post-procesando diff..."; \
	sed -i '' \
	    -e 's/\\includegraphics\[/\\figinclude[/g' \
	    -e 's/\\includegraphics{/\\figinclude{/g' \
	    -e 's/\\chapter\*{/\\section*{/g' \
	    -e 's/\\chapter{/\\section*{/g' \
	    -e 's/\\input{\(Figures\/TiKz_Libraries\/[^}]*\)}/\\figplaceholder{\1}/g' \
	    "$$OUTFILE"; \
	perl -0777 -i -pe \
	    's/\\begin\{forest\}.*?\\end\{forest\}/\\iffalse\n$$&\n\\fi/gs' \
	    "$$OUTFILE"; \
	rm -rf "$$TMPDIR"; \
	echo ">>> Listo. Archivo generado: $(DIR)/secciones/$(OUT).tex"; \
	echo "    Compila con: make Document DIR=$(DIR) COLOR=<tema>"

# =============================================================================
# LIMPIEZA
# =============================================================================

limpiar:
	@echo "Limpiando archivos auxiliares de LaTeX en todo el proyecto..."
	find . -not -path './.git/*' -type f \( \
	    -name '*.aux' -o -name '*.log' -o -name '*.out' -o \
	    -name '*.toc' -o -name '*.lof' -o -name '*.bbl' -o -name '*.blg' -o \
	    -name '*.synctex.gz' -o -name '*.fls' -o -name '*.fdb_latexmk' -o \
	    -name '*.bcf' -o -name '*.run.xml' -o -name '*.nav' -o \
	    -name '*.snm' -o -name '*.vrb' \
	\) -delete
	@echo "Limpieza completada."

limpiar-dir:
ifndef DIR
	$(error Debes indicar la carpeta: make limpiar-dir DIR=<ruta>)
endif
	@echo "Limpiando auxiliares en: $(DIR)"
	find "$(DIR)" -type f \( \
	    -name '*.aux' -o -name '*.log' -o -name '*.out' -o \
	    -name '*.toc' -o -name '*.lof' -o -name '*.bbl' -o -name '*.blg' -o \
	    -name '*.synctex.gz' -o -name '*.fls' -o -name '*.fdb_latexmk' -o \
	    -name '*.bcf' -o -name '*.run.xml' -o -name '*.nav' -o \
	    -name '*.snm' -o -name '*.vrb' \
	\) -delete
	@echo "Limpieza de $(DIR) completada."
