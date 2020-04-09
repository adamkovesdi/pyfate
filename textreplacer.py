# Replace Fate dice symbols in text strings
import re

def findfate(s):
    s = s.replace("\n", '<br />')
    s = s.replace("[+]", '<i class="fa fa-plus-square-o"></i> ')
    s = s.replace("[-]", '<i class="fa fa-minus-square-o"></i> ')
    s = s.replace("[ ]", '<i class="fa fa-square-o"></i> ')
    spin = '<i class="fa fa-spinner fa-spin"></i> '
    return spin + s

fatestr='''This is a new roll
[+ --] + 3 = 2 [ez meg nem] [+3]
[-++ ] + 4 = 5
Ez nagyobb
'''
def get_fatestrings(text):
    fat = re.compile(r'\[[-+ ]{4}\]')
    strings = fat.findall(text)
    return list(map(lambda x: x[1:-1], strings))

print(fatestr)
print(get_fatestrings(fatestr))
