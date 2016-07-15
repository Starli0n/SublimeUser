# -*- coding: utf-8 -*-

from datetime import datetime
import time
import sublime_plugin


class TimestampCommand(sublime_plugin.EventListener):
    """Expand `isoD`, `now`, `datetime`, `utcnow`, `utcdatetime`,
       `date` and `time`
    """
    def on_query_completions(self, view, prefix, locations):
        if prefix in ('datet'):
            val = datetime.now().strftime('%d/%m/%Y %H:%M')
        elif prefix in ('dts'):
            val = datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        elif prefix in ('isoD', 'now', 'datetime'):
            val = datetime.now().strftime('%Y-%m-%dT%H:%M:%S')
        elif prefix in ('utcnow', 'utcdatetime'):
            val = datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%S')
        elif prefix == 'date':
            val = datetime.now().strftime('%Y-%m-%d')
        elif prefix == 'time':
            val = str(int(time.time()))
        else:
            val = None

        return [(prefix, prefix, val)] if val else []
