#!/usr/bin/env python3

from bottle import route, run, template, get, request, redirect
import bottle
import random
import time
import core
import os

def stringify(logbook):
    logbook.reverse()
    entries = []
    for logentry in logbook:
        s = logentry["timestring"] + "\n"
        s = s + logentry["message"] + "\n"
        rollobjects = logentry["rollobjects"]
        for r in rollobjects:
            s = s + '[{0}] {1} + {2} = {3}\n'.format(r["fatestring"], r["rollvalue"], r["mod"], r["result"])
        if len(rollobjects) == 2:
            s = s + 'Rolls difference: {0}\n'.format(core.diff_rollobjects(rollobjects))
        entries.append(s)
    return entries


@route('/')
def docroot():
    lb = core.load_logbook()
    data = stringify(lb)
    return template('rolls', entries = data)

@get('/roll', method='GET')
def process_roll():
    line = request.query.message
    rollobjects = core.get_rollobjects(line)
    logentry = core.create_logentry(rollobjects, line)
    core.appendentry_save(logentry)
    redirect('/')

application = bottle.default_app()
