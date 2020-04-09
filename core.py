#!/usr/bin/env python3
import random
import time
rollstring = '++++++++--------        '

# rollcmd: !3
# resultstring: "++ -"

def roll_fatedice():
    return ''.join(random.sample(rollstring,4))

def evaluate_rollcmd(resultstring, mod=0):
    return resultstring.count('+') - resultstring.count('-') + mod

def calculate_mod(rollstring):
    if len(rollstring) == 1: return 0
    try:
        return int(rollstring[1:])
    except ValueError:
        return 0

def get_rollcmds(text):
    tokens = text.split()
    rollcmds = list(filter(lambda x: x[0] == '!', tokens))
    return rollcmds

def create_rollresults(line):
    rollcmds = get_rollcmds(line)
    results = []
    for r in rollcmds:
        roll = roll_fatedice()
        results.append(roll)
    return results

def get_rollobjects(line):
    return []

def create_logentry(text, results):
    logentry = {}
    logentry["timestamp"] = time.time()
    logentry["text"] = text
    logentry["results"] = results
    return logentry

def submit(text):
    results = create_rollresults(text)
    return create_logentry(text, results)

