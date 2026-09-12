---
name: project-apimetro-plantilla
description: Plantilla de documentos oficiales Apimetro — estructura, comandos, colores y flujo de trabajo
metadata:
  type: project
---

Plantilla de documentos membretados para Apimetro creada en agosto 2026.
Ubicación: `DocumentosPlantilla/Apimetro/`

**Why:** Apimetro necesita documentos oficiales (cartas, contratos, autorizaciones) con
identidad visual propia, separados de las plantillas académicas UNAM.

**How to apply:** Al generar o editar documentos oficiales de Apimetro, usar esta plantilla
y el flujo descrito aquí en lugar de las plantillas de Ensayos/Artículos.

## Colores de marca

- `ColorPrincipal`: turquesa `RGB(0, 188, 212)` — borde circular del logo
- `ColorAcento`: naranja `RGB(230, 81, 0)` — color del metro CDMX en el logo
- Tema alternativo `Negro` para contratos formales

## Estructura de archivos

```
DocumentosPlantilla/Apimetro/
├── main.tex                   ← bloque PERSONALIZACIÓN + preámbulo
├── Latex/
│   ├── Comands.tex            ← paquetes, fancyhdr, comandos de carta
│   ├── Membrete.tex           ← logo + nombre + contacto + línea divisoria
│   ├── color-config.tex       ← default: Apimetro
│   └── Colores/
│       ├── Apimetro.tex
│       └── Negro.tex
├── img/logo.png               ← logo del proyecto
└── secciones/
    └── Carta-Ejemplo.tex      ← plantilla de ejemplo con todos los comandos
```

## Comandos LaTeX disponibles

| Comando | Uso |
|---|---|
| `\DatosDestinatario{nombre}{cargo}{org}` | Bloque del destinatario |
| `\Asunto{texto}` | Línea de asunto |
| `\Saludo{Estimado/a ...}` | Apertura de carta |
| `\FirmaBloque{nombre}{cargo}` | Firma única (una columna) |
| `\SeccionCarta{título}` | Separador de sección interno |
| `\RefDoc{APM-2026-XX}` | Referencia de folio estilizada |

Para firma de dos partes usar `minipage` directamente (ver Carta-colaboracion como ejemplo).

## Variables de personalización en main.tex

```latex
\TituloDoc        % encabezado pág 2+
\FolioDoc         % número de documento (ej. APM-2026-001)
\FechaDoc         % fecha en texto largo
\FirmanteName     % quien firma por Apimetro
\FirmanteCargo    % cargo — usar "Fundador y Desarrollador"
\OrganizacionDescripcion
\ContactoEmail    % galigaribaldi0@gmail.com
\ContactoWeb      % apimetro.dev
\ContactoCiudad
```

## Flujo de trabajo

```bash
# Crear nuevo documento
make nueva-carta DIR=Extracurriculares/Apimetro-docs/NombreDocumento

# Compilar
make Document DIR=<ruta> COLOR=Apimetro   # o COLOR=Negro

# Limpiar auxiliares
make limpiar-dir DIR=<ruta>
```

## Primer documento real generado

`Extracurriculares/Apimetro-docs/Carta-colaboracion/` — Folio APM-2026-100.
Carta de autorización de uso comercial de la API para Tony Quezada Vargas (Metro Experto).
Donación $5 USD vía GitHub Sponsors: `github.com/sponsors/galigaribaldi`.
Incluye Anexo I con instrucciones de pago.
