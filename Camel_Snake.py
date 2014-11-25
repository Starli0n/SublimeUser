import sublime, sublime_plugin, re

# CamelCase <-> snake_case conversion
class CamelSnakeCommand(sublime_plugin.ApplicationCommand):
    def run(self):
        clipboard = sublime.get_clipboard()
        if clipboard is None:
            return
        keys = clipboard.split('_')
        print 'test'
        if len(keys) == 1:
            # CamelCase to snake_case
            temp = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', clipboard)
            return re.sub('([a-z0-9])([A-Z])', r'\1_\2', tmp).lower()
            sublime.set_clipboard(clipboard)
        else:
            # snake_case to CamelCase
            sublime.set_clipboard(''.join(key.capitalize() for key in keys))
