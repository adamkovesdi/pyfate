#!/usr/bin/env python3
import random
import time
rollstring = '++++++++--------        '

# Understanding help
# ------------------
# rollcmd: !3
# resultstring: "++ -"
# rollobject["cmd"] Textual representation of the roll command e.g. !3
# rollobject["fate"] Fate dices e.g. "++ -" 
# rollobject["roll"] Roll value e.g.  1 
# rollobject["mod"]  Modifier value e.g. 3
# rollobject["result"] Result of the roll e.g. roll + mod = 4 

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
    return [ x for x in text.split() if x[0]=='!' ]

def create_rollresults(line):
    return [ roll_fatedice() for _ in get_rollcmds(line) ]

def create_rollobject(rollstring, result):
    if rollstring is None: return
    rollobject = {}
    rollobject["cmd"] = rollstring
    rollobject["fate"] = result
    rollobject["roll"] = evaluate_rollcmd(rollobject["fate"])
    rollobject["mod"] = calculate_mod(rollstring)
    rollobject["result"] = evaluate_rollcmd(rollobject["fate"],
        rollobject["mod"])
    return rollobject

def diff_rollobjects(rollobjects):
    if len(rollobjects) == 2:
        return rollobjects[0]["result"] - rollobjects[1]["result"]
    else:
        return 0

def produce_rollobjects(text, results):
    rollstrings = get_rollcmds(text)
    return [ create_rollobject(rstr, res) for rstr, res in zip(rollstrings,
        results) ]

def rollobjects_from_entry(entry):
    return produce_rollobjects(entry["text"], entry["results"])

def create_logentry(text, results):
    logentry = {}
    logentry["timestamp"] = time.time()
    logentry["text"] = text
    logentry["results"] = results
    return logentry

def submit(text):
    # This is the time when the dice gets rolled
    results = create_rollresults(text)
    return create_logentry(text, results)

