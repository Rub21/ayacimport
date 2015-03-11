import fiona
from shapely.geometry import shape
from shapely.ops import cascaded_union 
orlines = fiona.open("buildings.shp")
shapes = [shape(f['geometry']) for f in orlines]
mergedlines = cascaded_union(shapes)
print mergedlines.type
MultiLineString