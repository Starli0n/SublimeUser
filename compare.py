import sublime, sublime_plugin, os

class CompareCommand(sublime_plugin.WindowCommand):
    def run(self):
        views = self.window.views()
        if views:
            self.window.focus_view(views[-1])
        dir_name = os.path.join(sublime.packages_path(), 'User/Resources')
        self.window.open_file(os.path.join(dir_name, "FileA"))
        self.window.open_file(os.path.join(dir_name, "FileB"))
        self.window.open_file(os.path.join(dir_name, "FileA"))
