# Persistent storage module for pyfate

import os
import json

def save_logbook(logbook):
    THIS_FOLDER = os.path.dirname(os.path.abspath(__file__))
    my_file = os.path.join(THIS_FOLDER, 'logbook.json')
    with open(my_file, 'w+') as fp:
        for l in logbook:
            s = json.dumps(l)
            s = s + "\n"
            fp.write(s)

def appendentry_save(l):
    THIS_FOLDER = os.path.dirname(os.path.abspath(__file__))
    my_file = os.path.join(THIS_FOLDER, 'logbook.json')
    with open(my_file, 'a+') as fp:
        s = json.dumps(l)
        s = s + "\n"
        fp.write(s)

def load_logbook():
    logbook = []
    THIS_FOLDER = os.path.dirname(os.path.abspath(__file__))
    my_file = os.path.join(THIS_FOLDER, 'logbook.json')
    with open(my_file, 'r') as fp:
        lines = fp.readlines()
        for l in lines:
            logbook.append(json.loads(l))
    return logbook
