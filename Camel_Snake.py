import sublime, sublime_plugin, re

# CamelCase <-> snake_case conversion
class CamelSnakeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        non_empty_regions = [region for region in self.view.sel() if not region.empty()]
        if len(non_empty_regions) > 0:
            self.src_selection(edit, non_empty_regions)
        else:
            self.src_clipboard()

    def src_clipboard(self):
        clipboard = sublime.get_clipboard()
        if clipboard is None:
            return
        sublime.set_clipboard(self.convert(clipboard))

    def src_selection(self, edit, regions):
        for region in regions:
            self.view.replace(edit, region, self.convert(self.view.substr(region)))

    def convert(self, src):
        keys = src.split('_')
        if len(keys) == 1:
            # CamelCase to snake_case
            tmp = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', src)
            return re.sub('([a-z0-9])([A-Z])', r'\1_\2', tmp).lower()
        else:
            # snake_case to CamelCase
            return ''.join(key.capitalize() for key in keys)
