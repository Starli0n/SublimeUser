import os
import sublime
import sublime_plugin
import json
import codecs


class PackageOpenUrlCommand(sublime_plugin.WindowCommand):
	def run(self):
		if self.package_file is None:
			self.package_file = self.get_package_file(self.get_working_dir())
		print self.package_file
		with codecs.open(self.package_file, encoding='utf-8', mode='r') as f:
			data = json.load(f)
			url = data["url"]
			self.window.run_command('open_url', {"url": url})

	def get_package_file(self, directory):
		while directory:
			package_file = os.path.join(directory, 'package-metadata.json')
			if os.path.isfile(package_file):
				retval = package_file
				break
			parent = os.path.realpath(os.path.join(directory, os.path.pardir))
			if parent == directory:
				# /.. == /
				retval = False
				break
			directory = parent
		return retval

	# If there is a file in the active view use that file's directory to
	# search for the Package Control root.  Otherwise, use the only folder that is open.
	def get_working_dir(self):
		file_name = self._active_file_name()
		if file_name:
			return os.path.realpath(os.path.dirname(file_name))
		else:
			try: # handle case with no open folder
				return self.window.folders()[0]
			except IndexError:
				return ''

	def _active_file_name(self):
		view = self.active_view()
		if view and view.file_name() and len(view.file_name()) > 0:
			return view.file_name()

	def active_view(self):
		return self.window.active_view()

	def is_visible(self):
		self.package_file = self.get_package_file(self.get_working_dir())
		return self.package_file
