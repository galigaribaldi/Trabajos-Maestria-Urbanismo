# Extra-Acuerdos — Acuerdos interpersonales (uso personal)

> **Esta carpeta NO forma parte de los entregables académicos de la Maestría en Urbanismo.**
> Contiene documentos de carácter **personal y privado**. Se aloja en este repositorio
> únicamente por practicidad: aprovecha las plantillas LaTeX, el sistema de colores y el
> `Makefile` del proyecto para dar formato a los documentos.

## Naturaleza de los documentos

- Son **acuerdos interpersonales** entre:
  - Martha Rosario De Los Santos González
  - Hernán Galileo Cabrera Garibaldi
- Tienen carácter **bilateral, voluntario y de buena fe**: los derechos y obligaciones aplican
  por igual a ambas partes.
- Están redactados en un estilo **semi-legal** (declaraciones, definiciones, cláusulas y firmas)
  para que los puntos sean claros, pero **no tienen validez jurídica**: son un compromiso
  personal y moral entre las partes.
- No llevan bibliografía, palabras clave ni materia; los campos de la plantilla se reutilizan
  para partes, fecha y título del acuerdo.

## Contenido

| Carpeta     | Acuerdo                                                        | Fecha              | Estado              |
|-------------|----------------------------------------------------------------|--------------------|---------------------|
| `Acuerdo1/` | Derecho a decir no y pausa activa en las conversaciones        | 17 de octubre 2026 | Redactado, en revisión |
| `Acuerdo2/` | —                                                              | —                  | Plantilla sin editar |

### Acuerdo 1 — resumen

1. **Derecho a decir no** sin dar explicaciones.
2. **Opinión clara y motivo**: explica quien abre el tema, no quien dice que no.
3. **Pausa activa** con frases clave («No quiero seguir con la conversación», «No quiero hablar
   sobre ello»): por tiempo (máx. 8 h) o por circunstancia (hasta que haya estabilidad visible).
   No es distanciamiento; se retoma la interacción, no el tema. Puede pedirse sin límite, y la
   parte receptora también puede pedirla si la interacción no es sana.
4. **Excepciones** por integridad, seguridad o salud: se suspende la pausa y se prioriza la ayuda.
5. **Plazos**: el tema se retoma tras 24 h mínimo y 7 días máximo; si no, queda como
   «Conflicto solucionado». Cada nueva pausa reinicia ambos plazos.

## Estructura y compilación

Cada acuerdo parte de la plantilla `DocumentosPlantilla/Articulos/SinPortada/`:

```
AcuerdoN/
├── main.tex                    ← partes, fecha y título (bloque PERSONALIZACIÓN)
├── Latex/Comands.tex           ← \cabeceroacuerdo, \clausula, \fraseclave, \firma
└── secciones/
    ├── 1-Introduccion.tex      ← proemio, declaraciones y definiciones
    ├── 2-Desarrollo.tex        ← cláusulas
    └── 3-Conclusiones.tex      ← aceptación y firmas
```

```bash
make Document DIR=Extra-Acuerdos/Acuerdo1
```

## Privacidad

El repositorio `galigaribaldi/Trabajos-Maestria-Urbanismo` es **público**. Antes de hacer
`git add`/`commit` de esta carpeta, considerar que el contenido (incluidos nombres completos)
quedaría publicado. Opciones: mantenerla sin versionar, agregarla a `.gitignore`, o moverla a
un repositorio privado.
