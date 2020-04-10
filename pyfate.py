#!/usr/bin/env python3

from bottle import route, template, get, request, redirect
import bottle
import time
import core
import persistentstorage

def prepare_data(logbook):
    logbook.reverse()
    entries = []
    for logentry in logbook:
        entry = {}
        entry["timestamp"] = time.ctime(logentry["timestamp"])
        entry["text"] = logentry["text"]
        rollobjects = core.produce_rollobjects(logentry["text"], logentry["results"])
        entry["rolls"] = rollobjects
        if len(rollobjects) == 2:
            entry["diff"] = '{0}'.format(core.diff_rollobjects(rollobjects))
        entries.append(entry)
    return entries

@route('/')
def docroot():
    lb = persistentstorage.load_logbook()
    data = prepare_data(lb)
    return template('rolls', entries = data)

@get('/roll', method='GET')
def process_roll():
    line = request.query.message
    logentry = core.submit(line)
    persistentstorage.appendentry_save(logentry)
    redirect('/')

application = bottle.default_app()
