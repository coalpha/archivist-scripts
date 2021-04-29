import sys
import json

[script_name, new_format, obj_wire] = sys.argv
obj = json.loads(obj_wire)

print(new_format % obj, end = "")
