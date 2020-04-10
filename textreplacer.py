# Replace Fate dice symbols in text strings
import re

def repsymbols(s):
    s = s.replace("[","")
    s = s.replace("]","")
    s = s.replace("-","#")
    s = s.replace(" ","@")
    s = s.replace("#", '<i class="fa fa-minus-square-o"></i> ')
    s = s.replace("+", '<i class="fa fa-plus-square-o"></i> ')
    s = s.replace("@", '<i class="fa fa-square-o"></i> ')
    return s

def get_fatestrings(text):
    fat = re.compile(r'\[[-+ ]{4}\]')
    return fat.findall(text)

def replace_fatestrings_faicons(text):
    result = text
    fs = get_fatestrings(text)
    for f in fs:
        result = result.replace(f,repsymbols(f))
    return result
