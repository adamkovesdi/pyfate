# Replace Fate dice symbols in text strings
import re

fatestr='''This is a new roll
[+ --] + 3 = 2 [ez meg nem] [+3]
[-++ ] + 4 = 5
Ez nagyobb
'''

def repsymbols(s):
    s = s.replace("[","")
    s = s.replace("]","")
    s = s.replace("-","#")
    s = s.replace(" ","@")
    s = s.replace("#", '<i class="fas fa-minus-square-o"></i> ')
    s = s.replace("+", '<i class="fas fa-plus-square-o"></i> ')
    s = s.replace("@", '<i class="fas fa-square-o"></i> ')
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

print(replace_fatestrings_faicons(fatestr))
