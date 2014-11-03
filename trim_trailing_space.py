import sublime, sublime_plugin, trim_trailing_white_space

class TrimTrailingSpace(sublime_plugin.TextCommand):
	def run(self, edit):
		ttws = trim_trailing_white_space.TrimTrailingWhiteSpace()
		ttws.on_pre_save(self.view)
