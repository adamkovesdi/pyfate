#!/usr/bin/env python3
import random
import time
rollstring = '++++++++--------        '

def roll():
    return ''.join(random.sample(rollstring,4))

def evaluate_roll(rolled, mod=0):
    return rolled.count('+') - rolled.count('-') + mod

def calculate_mod(rollstring):
    if len(rollstring) == 1: return 0
    try:
        return int(rollstring[1:])
    except ValueError:
        return -9999

def create_rollobject(rollstring):
    if rollstring is None: return
    rollobject = {}
    rollobject["rollcommand"] = rollstring
    rollobject["fatestring"] = roll()
    rollobject["rollvalue"] = evaluate_roll(rollobject["fatestring"])
    rollobject["mod"] = calculate_mod(rollstring)
    rollobject["result"] = evaluate_roll(rollobject["fatestring"],
        rollobject["mod"])
    return rollobject

def diff_rollobjects(rollobjects):
    if len(rollobjects) == 2:
        return rollobjects[0]["result"] - rollobjects[1]["result"]
    else:
        return 0

def dorolls(rollstrings):
    if rollstrings is None: return
    results = []
    for rollstring in rollstrings:
        rollobject = create_rollobject(rollstring)
        results.append(rollobject)
    return results

def getrolls(tokens):
    rollcmds = list(filter(lambda x: x[0] == '!', tokens))
    return rollcmds

def get_rollobjects(line):
    tokens = line.split()
    rolls = getrolls(tokens)
    rollobjects = dorolls(rolls)
    return rollobjects

def create_logentry(rollobjects, message):
    logentry = {}
    logentry["timestamp"] = time.time()
    logentry["timestring"] = time.ctime()
    logentry["message"] = message
    logentry["rollobjects"] = rollobjects
    return logentry
