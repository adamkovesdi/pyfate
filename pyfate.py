#!/usr/bin/env python3

from bottle import route, run, template, get, request, redirect
import bottle
import random
import time
import core
import persistentstorage
import os

def stringify(logbook):
    logbook.reverse()
    entries = []
    for logentry in logbook:
        s = time.ctime(logentry["timestamp"]) + "\n"
        s = s + logentry["text"] + "\n"
        rollobjects = core.produce_rollobjects(logentry["text"],
                logentry["results"])
        for r in rollobjects:
            s = s + '[{0}] {1} + {2} = {3}\n'.format(r["fate"], r["roll"], r["mod"], r["result"])
        if len(rollobjects) == 2:
            s = s + 'Rolls difference: {0}\n'.format(core.diff_rollobjects(rollobjects))
        entries.append(s)
    return entries

@route('/')
def docroot():
    lb = persistentstorage.load_logbook()
    data = stringify(lb)
    return template('rolls', entries = data)

@get('/roll', method='GET')
def process_roll():
    line = request.query.message
    logentry = core.submit(line)
    persistentstorage.appendentry_save(logentry)
    redirect('/')

application = bottle.default_app()
