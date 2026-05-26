#!/usr/bin/env python3
"""
Generador de Plantillas QPT para QGIS — Cartografía Académica Minimalista
Maestría en Urbanismo UNAM · FES Acatlán

Genera 12 plantillas: 6 paletas × 2 formatos (Horizontal A3 / Vertical A3)
Paletas sincronizadas con las plantillas LaTeX del proyecto.

Autor: Hernán Galileo Cabrera Garibaldi
Fecha: Mayo 2026
"""

import uuid
import os

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

ESCUDO_UNAM = "../Escudo-UNAM-escalable.svg.png"
ESCUDO_FES  = "../posgradoUNAM.png"

# ─── PALETAS (sincronizadas con LaTeX) ────────────────────────────────────────
PALETAS = {
    "Institucional":  {"cp": (0,   56,  147), "ca": (244, 180,   0)},
    "Teal":           {"cp": (0,  105,   92), "ca": (255, 171,   0)},
    "VerdeOlivo":     {"cp": (56,  87,   35), "ca": (188, 143,  60)},
    "Purpura":        {"cp": (106,  27, 154), "ca": (255, 196,   0)},
    "Rojo":           {"cp": (183,  28,  28), "ca": (255, 196,   0)},
    "VerdeEsmeralda": {"cp": (0,  130,   80), "ca": (255, 186,   8)},
}

# ─── COLORES BASE ─────────────────────────────────────────────────────────────
BLANCO     = (255, 255, 255)
NEGRO      = ( 25,  25,  25)
GRIS_PANEL = (240, 242, 245)   # fondo paneles laterales
GRIS_SEP   = (180, 185, 195)   # separadores
GRIS_FOOT  = (245, 246, 248)   # footer


# ─── HELPERS ──────────────────────────────────────────────────────────────────
def uid():
    return "{" + str(uuid.uuid4()) + "}"

def cs(r, g, b, a=255):
    """QGIS color string: R,G,B,A,rgb:Rnorm,Gnorm,Bnorm,Anorm"""
    return f"{r},{g},{b},{a},rgb:{r/255:.7f},{g/255:.7f},{b/255:.7f},{a/255:.7f}"

def fc_attr(r, g, b, a=255):
    """FrameColor / BackgroundColor attributes"""
    return f'alpha="{a}" red="{r}" green="{g}" blue="{b}"'

def lo():
    """LayoutObject with empty dataDefinedProperties"""
    return (
        '<LayoutObject>'
        '<dataDefinedProperties><Option type="Map">'
        '<Option name="name" value="" type="QString"/>'
        '<Option name="properties"/>'
        '<Option name="type" value="collection" type="QString"/>'
        '</Option></dataDefinedProperties>'
        '<customproperties><Option/></customproperties>'
        '</LayoutObject>'
    )

def ddp():
    """Standalone dataDefinedProperties node"""
    return (
        '<data_defined_properties><Option type="Map">'
        '<Option name="name" value="" type="QString"/>'
        '<Option name="properties"/>'
        '<Option name="type" value="collection" type="QString"/>'
        '</Option></data_defined_properties>'
    )

def text_style(size, color, bold=False, italic=False, family="Arial"):
    """Full text-style element for label items"""
    weight = 75 if bold else 50
    tc = cs(*color)
    buf = (
        '<text-buffer bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" '
        'bufferNoFill="1" bufferSizeUnits="MM" bufferBlendMode="0" '
        'bufferColor="255,255,255,255,rgb:1,1,1,1" bufferOpacity="1" '
        'bufferDraw="0" bufferJoinStyle="128"/>'
    )
    mask = (
        '<text-mask maskSize2="1.5" maskJoinStyle="128" maskType="0" maskSize="1.5" '
        'maskSizeUnits="MM" maskEnabled="0" maskedSymbolLayers="" '
        'maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1"/>'
    )
    bg = (
        '<background shapeDraw="0" shapeType="0" shapeSizeX="0" shapeSizeY="0" '
        'shapeSizeUnit="MM" shapeSizeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" '
        'shapeOffsetX="0" shapeOffsetY="0" shapeOffsetUnit="MM" '
        'shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeRadiiY="0" '
        'shapeRadiiUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" '
        'shapeBlendMode="0" shapeRotation="0" shapeRotationType="0" shapeSVGFile="" '
        'shapeBorderWidth="0" shapeBorderWidthUnit="MM" '
        'shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" '
        'shapeFillColor="255,255,255,255,rgb:1,1,1,1" '
        'shapeBorderColor="128,128,128,255,rgb:0.5,0.5,0.5,1" '
        'shapeJoinStyle="64">'
        '<symbol name="fillSymbol" type="fill" alpha="1" force_rhr="0" '
        'clip_to_extent="1" is_animated="0" frame_rate="10">'
        + ddp() +
        '<layer class="SimpleFill" pass="0" enabled="1" locked="0" id="">'
        '<Option type="Map">'
        '<Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>'
        '<Option name="style" value="solid" type="QString"/>'
        '<Option name="outline_style" value="no" type="QString"/>'
        '<Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        '<Option name="offset" value="0,0" type="QString"/>'
        '<Option name="offset_unit" value="MM" type="QString"/>'
        '<Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        '</Option>' + ddp() + '</layer>'
        '</symbol></background>'
    )
    shadow = (
        '<shadow shadowDraw="0" shadowUnder="0" shadowOffsetAngle="135" '
        'shadowOffsetDist="1" shadowOffsetUnit="MM" '
        'shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" '
        'shadowRadius="1.5" shadowRadiusUnit="MM" '
        'shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" '
        'shadowOpacity="0.7" shadowScale="100" '
        'shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6"/>'
    )
    dd = '<dd_properties>' + ddp().replace('data_defined_properties', 'Option type="Map"').replace('<Option type="Map">','') + '</dd_properties>'
    # simpler dd_properties:
    dd = (
        '<dd_properties><Option type="Map">'
        '<Option name="name" value="" type="QString"/>'
        '<Option name="properties"/>'
        '<Option name="type" value="collection" type="QString"/>'
        '</Option></dd_properties>'
    )
    return (
        f'<text-style fontWordSpacing="0" fontLetterSpacing="0" fontItalic="{1 if italic else 0}" '
        f'multilineHeightUnit="Percentage" fontSize="{size}" forcedItalic="0" '
        f'tabStopDistanceUnit="Percentage" forcedBold="0" stretchFactor="100" '
        f'fontStrikeout="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" blendMode="0" '
        f'textOpacity="1" textOrientation="horizontal" allowHtml="0" multilineHeight="1.2" '
        f'fontKerning="1" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" '
        f'fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontFamily="{family}" fontSizeUnit="Point" '
        f'fontUnderline="0" tabStopDistance="6" capitalization="0" namedStyle="" '
        f'fontWeight="{weight}" textColor="{tc}">'
        '<families/>'
        + buf + mask + bg + shadow + dd +
        '</text-style>'
    )

def fill_symbol(fill, outline=None, outline_style="no", ow="0.26"):
    """SimpleFill symbol for shapes"""
    oc = outline if outline else NEGRO
    return (
        '<symbol name="" type="fill" alpha="1" force_rhr="0" clip_to_extent="1" '
        'is_animated="0" frame_rate="10">'
        + ddp() +
        f'<layer class="SimpleFill" pass="0" enabled="1" locked="0" id="">'
        f'<Option type="Map">'
        f'<Option name="color" value="{cs(*fill)}" type="QString"/>'
        f'<Option name="style" value="solid" type="QString"/>'
        f'<Option name="outline_color" value="{cs(*oc)}" type="QString"/>'
        f'<Option name="outline_style" value="{outline_style}" type="QString"/>'
        f'<Option name="outline_width" value="{ow}" type="QString"/>'
        f'<Option name="outline_width_unit" value="MM" type="QString"/>'
        f'<Option name="joinstyle" value="miter" type="QString"/>'
        f'<Option name="offset" value="0,0" type="QString"/>'
        f'<Option name="offset_unit" value="MM" type="QString"/>'
        f'<Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        f'<Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        f'</Option>' + ddp() +
        '</layer></symbol>'
    )

# ─── ITEM CONSTRUCTORS ────────────────────────────────────────────────────────

def item_shape(x, y, w, h, fill, outline=None, outline_style="no", ow="0.26",
               z=5, frm=False, shape_type=0):
    u = uid()
    oc = outline if outline else NEGRO
    return (
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="{"true" if frm else "false"}" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="true" id="" position="{x},{y},mm" '
        f'type="65640" uuid="{u}" excludeFromExports="0" outlineWidthM="{ow},mm" '
        f'size="{w},{h},mm" zValue="{z}" positionOnPage="{x},{y},mm" '
        f'positionLock="false" shapeType="{shape_type}" cornerRadiusX="0" cornerRadiusY="0">'
        f'<FrameColor {fc_attr(*oc)}/>'
        f'<BackgroundColor {fc_attr(*fill)}/>'
        + lo() + fill_symbol(fill, outline, outline_style, ow) +
        '</LayoutItem>'
    )

def item_label(x, y, w, h, text, size, color, bold=False, italic=False,
               ha=4, va=32, bg=None, frm=False, z=10, mx=1, my=0.5,
               family="Arial", html=False):
    u = uid()
    bg_ = bg if bg is not None else BLANCO
    bg_active = "true" if bg is not None else "false"
    html_state = "1" if html else "0"
    # escape XML special chars in text attr
    safe_text = (text.replace("&", "&amp;")
                     .replace("<", "&lt;")
                     .replace(">", "&gt;")
                     .replace('"', "&quot;"))
    return (
        f'<LayoutItem frameJoinStyle="miter" halign="{ha}" referencePoint="0" '
        f'frame="{"true" if frm else "false"}" visibility="1" blendMode="0" '
        f'htmlState="{html_state}" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="{bg_active}" id="" position="{x},{y},mm" '
        f'type="65641" uuid="{u}" excludeFromExports="0" outlineWidthM="0.3,mm" '
        f'marginX="{mx}" labelText="{safe_text}" size="{w},{h},mm" zValue="{z}" '
        f'positionOnPage="{x},{y},mm" marginY="{my}" positionLock="false" valign="{va}">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(*bg_)}/>'
        + lo() + text_style(size, color, bold, italic, family) +
        '</LayoutItem>'
    )

def item_map(x, y, w, h, map_id="MapaPrincipal", z=10):
    """Returns (uuid_str, xml_str) so the UUID can be referenced by legend/scalebar"""
    u = uid()
    return u, (
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="true" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="true" id="{map_id}" position="{x},{y},mm" '
        f'type="65639" uuid="{u}" excludeFromExports="0" outlineWidthM="0.5,mm" '
        f'size="{w},{h},mm" zValue="{z}" positionOnPage="{x},{y},mm" '
        f'positionLock="false" mapRotation="0" keepLayerSet="false" '
        f'followPresetName="" followPreset="false" drawCanvasItems="true" labelMargin="0,mm">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(255,255,255)}/>'
        + lo() +
        '<Extent xmin="-99.32" ymin="19.23" xmax="-99.10" ymax="19.40"/>'
        '<CRS><spatialrefsys nativeFormat="Wkt">'
        '<wkt>GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS 84",6378137,298.257223563]],'
        'PRIMEM["Greenwich",0],UNIT["degree",0.0174532925199433,'
        'AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]</wkt>'
        '<proj4>+proj=longlat +datum=WGS84 +no_defs</proj4>'
        '<srsid>3452</srsid><srid>4326</srid><authid>EPSG:4326</authid>'
        '<description>WGS 84</description><projectionacronym>longlat</projectionacronym>'
        '<ellipsoidacronym>EPSG:7030</ellipsoidacronym>'
        '<geographicflag>true</geographicflag>'
        '</spatialrefsys></CRS>'
        '<AtlasScalingMode>0</AtlasScalingMode>'
        '<Grid resolution="10" resUnits="MM" offsetX="0" offsetY="0" offsetUnits="MM" '
        'annotationEnabled="0"/>'
        '<OverviewStack/>'
        '</LayoutItem>'
    )

def item_picture(x, y, w, h, fpath, z=20):
    u = uid()
    return (
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="false" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="false" id="" position="{x},{y},mm" '
        f'type="65644" uuid="{u}" excludeFromExports="0" outlineWidthM="0.3,mm" '
        f'size="{w},{h},mm" zValue="{z}" positionOnPage="{x},{y},mm" '
        f'positionLock="false" mode="0" pictureAnchor="0" anchorPoint="0" '
        f'file="{fpath}" resizeMode="2">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(255,255,255,0)}/>'
        + lo() +
        '</LayoutItem>'
    )

def item_north_arrow(x, y, w, h, z=16):
    u = uid()
    # QGIS built-in north arrow
    svg = ":/images/north_arrows/NorthArrow_04.svg"
    return (
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="false" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="false" id="" position="{x},{y},mm" '
        f'type="65644" uuid="{u}" excludeFromExports="0" outlineWidthM="0.3,mm" '
        f'size="{w},{h},mm" zValue="{z}" positionOnPage="{x},{y},mm" '
        f'positionLock="false" mode="0" pictureAnchor="0" anchorPoint="0" '
        f'file="{svg}" resizeMode="0">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(255,255,255,0)}/>'
        + lo() +
        '</LayoutItem>'
    )

def legend_text_style_node(size, bold=False):
    """Compact text-style for legend styles"""
    weight = 75 if bold else 50
    tc = cs(*NEGRO)
    return (
        f'<text-style fontSize="{size}" fontWeight="{weight}" fontFamily="Arial" '
        f'fontSizeUnit="Point" fontItalic="0" textColor="{tc}" '
        f'fontWordSpacing="0" fontLetterSpacing="0" multilineHeightUnit="Percentage" '
        f'forcedItalic="0" tabStopDistanceUnit="Percentage" forcedBold="0" '
        f'stretchFactor="100" fontStrikeout="0" '
        f'tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" blendMode="0" textOpacity="1" '
        f'textOrientation="horizontal" allowHtml="0" multilineHeight="1.2" '
        f'fontKerning="1" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" '
        f'fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontUnderline="0" tabStopDistance="6" '
        f'capitalization="0" namedStyle=""><families/>'
        f'<text-buffer bufferDraw="0" bufferSize="1" '
        f'bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferSizeUnits="MM" '
        f'bufferBlendMode="0" bufferColor="255,255,255,255,rgb:1,1,1,1" bufferOpacity="1" '
        f'bufferJoinStyle="128"/>'
        f'<text-mask maskEnabled="0" maskSize="1.5" maskSizeUnits="MM" '
        f'maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1" maskJoinStyle="128" '
        f'maskType="0" maskSize2="1.5" maskedSymbolLayers=""/>'
        f'<background shapeDraw="0" shapeType="0" shapeSizeX="0" shapeSizeY="0" '
        f'shapeSizeUnit="MM" shapeSizeType="0" shapeOffsetX="0" shapeOffsetY="0" '
        f'shapeOffsetUnit="MM" shapeRadiiX="0" shapeRadiiY="0" shapeRadiiUnit="MM" '
        f'shapeOpacity="1" shapeBlendMode="0" shapeRotation="0" shapeRotationType="0" '
        f'shapeSVGFile="" shapeBorderWidth="0" shapeBorderWidthUnit="MM" '
        f'shapeFillColor="255,255,255,255,rgb:1,1,1,1" '
        f'shapeBorderColor="128,128,128,255,rgb:0.5,0.5,0.5,1" shapeJoinStyle="64" '
        f'shapeSizeMapUnitScale="3x:0,0,0,0,0,0" '
        f'shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" '
        f'shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" '
        f'shapeRadiiMapUnitScale="3x:0,0,0,0,0,0"/>'
        f'<shadow shadowDraw="0" shadowUnder="0" shadowOffsetAngle="135" '
        f'shadowOffsetDist="1" shadowOffsetUnit="MM" '
        f'shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" '
        f'shadowRadius="1.5" shadowRadiusUnit="MM" '
        f'shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" '
        f'shadowOpacity="0.7" shadowScale="100" '
        f'shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6"/>'
        f'<dd_properties><Option type="Map">'
        f'<Option name="name" value="" type="QString"/>'
        f'<Option name="properties"/>'
        f'<Option name="type" value="collection" type="QString"/>'
        f'</Option></dd_properties>'
        f'</text-style>'
    )

def item_legend(x, y, w, h, map_uuid, z=15):
    u = uid()
    styles = ""
    for s_name, s_size, s_bold, s_align, s_indent in [
        ("title",    8,  True,  1, 0),
        ("group",    7,  True,  0, 0),
        ("subgroup", 7,  False, 0, 0),
        ("symbol",   7,  False, 0, 0),
    ]:
        styles += (
            f'<style marginBottom="2.5" name="{s_name}" '
            f'alignment="{s_align}" indent="{s_indent}">'
            + legend_text_style_node(s_size, s_bold) +
            '</style>'
        )
    return (
        f'<LayoutItem splitLayer="0" rasterBorderColor="0,0,0,255,rgb:0,0,0,1" '
        f'zValue="{z}" legendFilterByAtlas="0" symbolAlignment="1" '
        f'excludeFromExports="0" opacity="1" columnCount="1" outlineWidthM="0.3,mm" '
        f'type="65642" positionOnPage="{x},{y},mm" boxSpace="2" titleAlignment="1" '
        f'blendMode="0" wmsLegendWidth="50" background="true" rasterBorder="1" '
        f'positionLock="false" frame="false" map_uuid="{map_uuid}" title="" '
        f'symbolHeight="3.5" templateUuid="{u}" minSymbolSize="0" columnSpace="2" '
        f'wrapChar="" frameJoinStyle="miter" position="{x},{y},mm" size="{w},{h},mm" '
        f'wmsLegendHeight="25" referencePoint="0" uuid="{u}" equalColumnWidth="0" '
        f'maxSymbolSize="0" groupUuid="" id="" rasterBorderWidth="0" symbolWidth="6" '
        f'visibility="1" itemRotation="0" resizeToContents="1">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(*GRIS_PANEL)}/>'
        + lo() +
        f'<filterByMaps><map uuid="{map_uuid}"/></filterByMaps>'
        f'<styles>{styles}</styles>'
        '</LayoutItem>'
    )

def scalebar_line_symbol():
    return (
        '<symbol name="" type="line" alpha="1" force_rhr="0" clip_to_extent="1" '
        'is_animated="0" frame_rate="10">'
        + ddp() +
        '<layer class="SimpleLine" pass="0" enabled="1" locked="0" id="">'
        f'<Option type="Map">'
        f'<Option name="line_color" value="{cs(*NEGRO)}" type="QString"/>'
        f'<Option name="line_width" value="0.3" type="QString"/>'
        f'<Option name="line_style" value="solid" type="QString"/>'
        f'</Option>' + ddp() + '</layer></symbol>'
    )

def scalebar_fill_symbol(white=False):
    color = "255,255,255,255,rgb:1,1,1,1" if white else cs(*NEGRO)
    return (
        '<symbol name="" type="fill" alpha="1" force_rhr="0" clip_to_extent="1" '
        'is_animated="0" frame_rate="10">'
        + ddp() +
        '<layer class="SimpleFill" pass="0" enabled="1" locked="0" id="">'
        f'<Option type="Map">'
        f'<Option name="color" value="{color}" type="QString"/>'
        f'<Option name="style" value="solid" type="QString"/>'
        f'<Option name="outline_style" value="no" type="QString"/>'
        f'</Option>' + ddp() + '</layer></symbol>'
    )

def item_scalebar(x, y, w, h, map_uuid, z=15, per_seg=500):
    u = uid()
    ts_sb = legend_text_style_node(6.5, False)
    return (
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="false" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{u}" background="false" id="" position="{x},{y},mm" '
        f'type="65643" uuid="{u}" excludeFromExports="0" outlineWidthM="0.3,mm" '
        f'size="{w},{h},mm" zValue="{z}" positionOnPage="{x},{y},mm" '
        f'positionLock="false" unitLabel="m" numberOfSegments="3" '
        f'numberOfSegmentsLeft="1" numUnitsPerSegment="{per_seg}" '
        f'mapUnitsPerBarUnit="1" height="3" lineWidth="0.3" style="Single Box" '
        f'boxContentSpace="1" segmentSizeMode="0" minBarWidth="50" maxBarWidth="150" '
        f'labelBarSpace="1.5" map_uuid="{map_uuid}" unitType="m" alignment="0">'
        f'<FrameColor {fc_attr(*NEGRO)}/>'
        f'<BackgroundColor {fc_attr(255,255,255)}/>'
        + lo() + ts_sb +
        '<lineSymbol>' + scalebar_line_symbol() + '</lineSymbol>'
        '<fillSymbol>' + scalebar_fill_symbol(False) + '</fillSymbol>'
        '<fillSymbol2>' + scalebar_fill_symbol(True) + '</fillSymbol2>'
        '</LayoutItem>'
    )


# ─── PAGE COLLECTION ──────────────────────────────────────────────────────────
def page_collection(w, h):
    pu = uid()
    page_sym = (
        '<symbol alpha="1" name="" force_rhr="0" type="fill" is_animated="0" '
        'frame_rate="10" clip_to_extent="1">'
        + ddp() +
        '<layer class="SimpleFill" locked="0" pass="0" id="" enabled="1">'
        '<Option type="Map">'
        '<Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        '<Option name="color" value="255,255,255,255,rgb:1,1,1,1" type="QString"/>'
        '<Option name="joinstyle" value="miter" type="QString"/>'
        '<Option name="offset" value="0,0" type="QString"/>'
        '<Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>'
        '<Option name="offset_unit" value="MM" type="QString"/>'
        '<Option name="outline_color" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" type="QString"/>'
        '<Option name="outline_style" value="no" type="QString"/>'
        '<Option name="outline_width" value="0.26" type="QString"/>'
        '<Option name="outline_width_unit" value="MM" type="QString"/>'
        '<Option name="style" value="solid" type="QString"/>'
        '</Option>' + ddp() + '</layer></symbol>'
    )
    return (
        '<PageCollection>'
        + page_sym +
        f'<LayoutItem frameJoinStyle="miter" referencePoint="0" frame="false" '
        f'visibility="1" blendMode="0" groupUuid="" opacity="1" itemRotation="0" '
        f'templateUuid="{pu}" background="true" id="" position="0,0,mm" '
        f'type="65638" uuid="{pu}" excludeFromExports="0" outlineWidthM="0.3,mm" '
        f'size="{w},{h},mm" zValue="0" positionOnPage="0,0,mm" positionLock="false">'
        '<FrameColor alpha="255" red="0" green="0" blue="0"/>'
        '<BackgroundColor alpha="255" red="255" green="255" blue="255"/>'
        '<LayoutObject>'
        '<dataDefinedProperties><Option type="Map">'
        '<Option name="name" value="" type="QString"/>'
        '<Option name="properties"/>'
        '<Option name="type" value="collection" type="QString"/>'
        '</Option></dataDefinedProperties>'
        '<customproperties><Option/></customproperties>'
        '</LayoutObject>'
        + page_sym +
        '</LayoutItem>'
        '<GuideCollection visible="1"/>'
        '</PageCollection>'
    )


# ─── LAYOUT HORIZONTAL A3 ─────────────────────────────────────────────────────
# 420 × 297 mm
# Zonas:
#   Header (0,0) → 420×24   ColorPrincipal
#   Accent (0,24) → 420×1.5 ColorAcento
#   MapaPrincipal (8,27.5) → 272×255.5
#   Panel derecho (284,27.5) → 130×255.5  Gris panel
#     MapaBase label (286,29) → 126×5.5
#     MapaBase (286,35.5) → 126×66
#     Div (284,103) → 130×0.4
#     Simbología label (286,104.5) → 126×5.5
#     Legend (286,111) → 126×88
#     Div (284,201) → 130×0.4
#     Escala label (286,202.5) → 126×5.5
#     ScaleBar (288,209) → 88×10
#     North (378,202.5) → 16×16
#     Div (284,220) → 130×0.4
#     Datos label (286,221.5) → 126×5.5
#     Datos text (286,228) → 126×46
#   Footer (0,285.5) → 420×11.5  Gris footer
# ─────────────────────────────────────────────────────────────────────────────
def make_horizontal(name, cp, ca):
    W, H = 420, 297
    layout_name = f"PlantillaBase_{name}_Horizontal"

    mapa_uuid,    xml_mapa    = item_map(8,    27.5, 272,   255.5, "MapaPrincipal", z=10)
    mapabase_uuid, xml_mapabase = item_map(286, 35.5, 126,    66,  "MapaBase",      z=10)

    items = [
        # ── FONDOS ESTRUCTURALES ──────────────────────────────────────────
        item_shape(0,   0,   W,   24,   cp,         z=2),          # header
        item_shape(0,   24,  W,   1.5,  ca,         z=3),          # accent
        item_shape(284, 27.5, 130, 255.5, GRIS_PANEL, z=2),       # panel der.
        item_shape(0,   285.5, W,  11.5, GRIS_FOOT, z=2),          # footer

        # ── HEADER: texto institucional ───────────────────────────────────
        item_label(28, 2.5, 360, 11,
                   "TÍTULO PRINCIPAL DEL PLANO",
                   13.5, BLANCO, bold=True, ha=4, va=32, z=22, mx=0, my=0),
        item_label(28, 14, 360, 8,
                   "UNAM · FES Acatlán · Maestría en Urbanismo · Temas Selectos IV",
                   7, BLANCO, bold=False, ha=4, va=32, z=22, mx=0, my=0),

        # ── ESCUDOS ───────────────────────────────────────────────────────
        item_picture(5,   3.5, 18, 18, ESCUDO_UNAM, z=25),
        item_picture(397, 3.5, 18, 18, ESCUDO_FES,  z=25),

        # ── MAPAS ─────────────────────────────────────────────────────────
        xml_mapa,
        xml_mapabase,

        # ── PANEL DERECHO: secciones ──────────────────────────────────────
        item_label(286, 29,  126, 5.5, "MAPA BASE — LOCALIZACIÓN",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.5),

        item_shape(284, 103, 130, 0.4, GRIS_SEP, z=8),             # div 1

        item_label(286, 104.5, 126, 5.5, "SIMBOLOGÍA",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.5),

        item_legend(286, 111, 126, 88, mapa_uuid, z=15),

        item_shape(284, 201, 130, 0.4, GRIS_SEP, z=8),             # div 2

        item_label(286, 202.5, 126, 5.5, "ESCALA Y ORIENTACIÓN",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.5),

        item_scalebar(288, 209, 88, 10, mapa_uuid, z=15, per_seg=500),
        item_north_arrow(378, 202.5, 16, 16, z=16),

        item_shape(284, 220, 130, 0.4, GRIS_SEP, z=8),             # div 3

        item_label(286, 221.5, 126, 5.5, "DATOS DEL PLANO",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.5),

        item_label(288, 228, 122, 46,
                   ("Alumno: Hernán Galileo Cabrera Garibaldi\n"
                    "Profesora: Mtra. Ma. de los Ángeles Miranda Olguín\n"
                    "Materia: Temas Selectos IV\n"
                    "Semestre: 2026-2\n"
                    "Fecha: [Fecha de entrega]\n"
                    "Proyección: WGS 84 / UTM Z14N"),
                   6.5, NEGRO, bold=False, ha=1, va=32, bg=GRIS_PANEL, z=12, mx=2, my=1),

        # ── FOOTER ───────────────────────────────────────────────────────
        item_label(8, 287, W-16, 8,
                   "Fuente: INEGI / Elaboración propia  |  "
                   "Sistema: WGS 84 UTM Zona 14N (EPSG:32614)  |  "
                   "Escala: 1:[Escala]  |  [Materia] — Sem. 2026-2",
                   6, NEGRO, bold=False, ha=4, va=64, z=12, mx=1, my=0.5),
    ]

    items_xml = "\n".join(items)

    return (
        f'<Layout worldFileMap="{mapa_uuid}" printResolution="300" '
        f'name="{layout_name}" units="mm">\n'
        ' <Snapper snapToGuides="1" tolerance="5" snapToGrid="0" snapToItems="1"/>\n'
        ' <Grid offsetY="0" offsetX="0" resUnits="mm" offsetUnits="mm" resolution="5"/>\n'
        + " " + page_collection(W, H) + "\n"
        + items_xml + "\n"
        ' <Atlas coverageLayer="" enabled="0" filterFeatures="0" sortAscending="1" '
        'filenamePattern="\'output_\'||@atlas_featurenumber" hideCoverage="0" '
        'sortFeatures="0"/>\n'
        '</Layout>'
    )


# ─── LAYOUT VERTICAL A3 ───────────────────────────────────────────────────────
# 297 × 420 mm
# Zonas:
#   Header (0,0) → 297×30   ColorPrincipal
#   Accent (0,30) → 297×1.5 ColorAcento
#   MapaPrincipal (8,33.5) → 281×237
#   Row2-L MapaBase  (8,273.5) → 112×78  GrisPanel
#   Row2-R Simbología (122,273.5) → 167×78  GrisPanel
#   Escala (8,354) → 281×22  GrisPanel
#   Datos (8,378.5) → 281×30  GrisPanel
#   Footer (0,412) → 297×8   GrisFoot
# ─────────────────────────────────────────────────────────────────────────────
def make_vertical(name, cp, ca):
    W, H = 297, 420
    layout_name = f"PlantillaBase_{name}_Vertical"

    mapa_uuid,     xml_mapa     = item_map(8,  33.5, 281, 237,  "MapaPrincipal", z=10)
    mapabase_uuid, xml_mapabase = item_map(10, 285,  108,  64,  "MapaBase",      z=10)

    items = [
        # ── FONDOS ESTRUCTURALES ──────────────────────────────────────────
        item_shape(0,  0,   W,  30,  cp,         z=2),         # header
        item_shape(0,  30,  W,  1.5, ca,         z=3),         # accent
        item_shape(8,  273.5, 112, 78, GRIS_PANEL, z=2),       # panel MapaBase
        item_shape(122, 273.5, 167, 78, GRIS_PANEL, z=2),      # panel Simbología
        item_shape(8,  354,  281, 22, GRIS_PANEL, z=2),        # strip escala
        item_shape(8,  378.5, 281, 30, GRIS_PANEL, z=2),       # strip datos
        item_shape(0,  412,  W,   8, GRIS_FOOT,  z=2),        # footer

        # ── HEADER ────────────────────────────────────────────────────────
        item_label(30, 3, 233, 14,
                   "TÍTULO PRINCIPAL DEL PLANO",
                   13, BLANCO, bold=True, ha=4, va=32, z=22, mx=0, my=0),
        item_label(30, 17.5, 233, 10,
                   "UNAM · FES Acatlán · Maestría en Urbanismo · Temas Selectos IV · Sem. 2026-2",
                   6.5, BLANCO, bold=False, ha=4, va=32, z=22, mx=0, my=0),

        # ── ESCUDOS ───────────────────────────────────────────────────────
        item_picture(4,  4,  22, 22, ESCUDO_UNAM, z=25),
        item_picture(271, 4, 22, 22, ESCUDO_FES,  z=25),

        # ── MAPA PRINCIPAL ───────────────────────────────────────────────
        xml_mapa,

        # ── PANEL MAPABASE ────────────────────────────────────────────────
        item_label(10, 275, 108, 5.5, "MAPA BASE — LOCALIZACIÓN",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.3),
        xml_mapabase,

        # ── PANEL SIMBOLOGÍA ──────────────────────────────────────────────
        item_label(124, 275, 163, 5.5, "SIMBOLOGÍA",
                   6, NEGRO, bold=True, ha=4, va=32, bg=GRIS_PANEL, z=12, mx=1, my=0.3),
        item_legend(124, 281.5, 163, 68, mapa_uuid, z=15),

        # ── ESCALA + NORTE ────────────────────────────────────────────────
        item_scalebar(13, 359.5, 95, 10, mapa_uuid, z=15, per_seg=200),
        item_north_arrow(116, 354.5, 15, 15, z=16),
        item_label(136, 355, 148, 18,
                   "Proyección: WGS 84 / UTM Zona 14N\nDatum: WGS84  |  EPSG: 32614",
                   6.5, NEGRO, bold=False, ha=1, va=32, bg=GRIS_PANEL, z=12, mx=2, my=1),

        # ── SEPARADOR DATOS ───────────────────────────────────────────────
        item_shape(8, 377, 281, 0.4, GRIS_SEP, z=8),

        # ── DATOS DEL PLANO ───────────────────────────────────────────────
        item_label(10, 379.5, 277, 28,
                   ("Alumno: Hernán Galileo Cabrera Garibaldi   |   "
                    "Profesora: Mtra. Ma. de los Ángeles Miranda Olguín\n"
                    "Materia: Temas Selectos IV   |   Semestre: 2026-2   |   "
                    "Fecha de entrega: [Fecha]"),
                   6.5, NEGRO, bold=False, ha=1, va=32, bg=GRIS_PANEL, z=12, mx=2, my=1.5),

        # ── FOOTER ───────────────────────────────────────────────────────
        item_label(8, 413, W-16, 6,
                   "Fuente: INEGI / Elaboración propia  |  "
                   "Sistema: WGS 84 UTM Zona 14N (EPSG:32614)  |  "
                   "Escala: 1:[Escala]  |  [Materia] — Sem. 2026-2",
                   6, NEGRO, bold=False, ha=4, va=64, z=12, mx=1, my=0.3),
    ]

    items_xml = "\n".join(items)

    return (
        f'<Layout worldFileMap="{mapa_uuid}" printResolution="300" '
        f'name="{layout_name}" units="mm">\n'
        ' <Snapper snapToGuides="1" tolerance="5" snapToGrid="0" snapToItems="1"/>\n'
        ' <Grid offsetY="0" offsetX="0" resUnits="mm" offsetUnits="mm" resolution="5"/>\n'
        + " " + page_collection(W, H) + "\n"
        + items_xml + "\n"
        ' <Atlas coverageLayer="" enabled="0" filterFeatures="0" sortAscending="1" '
        'filenamePattern="\'output_\'||@atlas_featurenumber" hideCoverage="0" '
        'sortFeatures="0"/>\n'
        '</Layout>'
    )


# ─── MAIN: generar todas las plantillas ───────────────────────────────────────
if __name__ == "__main__":
    generados = 0
    for nombre, paleta in PALETAS.items():
        cp = paleta["cp"]
        ca = paleta["ca"]

        for fmt, fn in [("Horizontal", make_horizontal), ("Vertical", make_vertical)]:
            content = '<?xml version="1.0" encoding="UTF-8"?>\n' + fn(nombre, cp, ca)
            fname   = f"PlantillaBase_{nombre}_{fmt}.qpt"
            fpath   = os.path.join(OUTPUT_DIR, fname)
            with open(fpath, "w", encoding="utf-8") as f:
                f.write(content)
            print(f"  ✓  {fname}")
            generados += 1

    print(f"\nGeneradas {generados} plantillas en:\n  {OUTPUT_DIR}")
