import os
import sublime
import sublime_plugin
import codecs


class SaveEolCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		self.lines = []
		with codecs.open(self.view.file_name(), encoding='utf-8', mode='r') as f:
			self.lines = f.readlines()
		menu_items = []
		crlf_eol = True
		crlf_lines = [line for line in self.lines if line.endswith('\r\n')]
		if len(crlf_lines) > 0:
			menu_items.append(['Yes', 'Switch to OSX/Linux line endings (LF)'])
			menu_items.append(['No', 'Keep Windows line endings (CRLF)'])
		else:
			menu_items.append(['Yes', 'Switch to Windows line endings (CRLF)'])
			menu_items.append(['No', 'Keep OSX/Linux line endings (LF)'])
			crlf_eol = False
		def on_done(index):
			if index != 0:
				return
			with codecs.open(self.view.file_name(), encoding='utf-8', mode='w+') as f:
				self.lines = [line.replace("\n", "").replace("\r", "") for line in self.lines]
				if crlf_eol:
					# Switch to LF
					f.writelines('\n'.join(self.lines))
					f.write('\n')
				else:
					# Switch to CRLF
					f.writelines('\r\n'.join(self.lines))
					f.write('\r\n')
		self.view.window().show_quick_panel(menu_items, on_done)

	def is_enabled(self):
		return self.view.file_name() and len(self.view.file_name())
