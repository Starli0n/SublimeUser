import sublime, sublime_plugin
import subprocess
import os
import shutil


class UserInstallCommand(sublime_plugin.TextCommand):
	m_installed_files = []
	m_existing_files = []
	m_error_files = []
	m_log = ''

	def run(self, edit):
		self.m_installed_files = []
		self.m_existing_files = []
		self.m_error_files = []
		self.m_log = ''

		user_dir = os.path.join(sublime.packages_path(), 'User')
		window = self.view.window()

		src = os.path.join(user_dir, 'Resources/Any/Default/exec.py')
		dst = os.path.join(sublime.packages_path(), 'Default/exec.py')
		self.copy_file_bak(src, dst)

		if sublime.platform() == "windows":
			src=os.path.join(user_dir, 'Resources/Any/src')
			dst=os.path.join(user_dir, 'Resources/Any/bin')
			self.compile(src, dst)

		if sublime.platform() == "osx":
			# Alias
			src = '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'
			dst = '/usr/local/bin/subl'
			self.alias(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/.gitconfig')
			dst = os.path.expandvars('$HOME/.gitconfig')
			self.alias(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/.bash_profile')
			dst = os.path.expandvars('$HOME/.bash_profile')
			self.alias(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/.MacOSX')
			dst = os.path.expandvars('$HOME/.MacOSX')
			self.alias(src, dst)

			# Files to copy
			src = os.path.join(user_dir, 'Resources/OSX/Applications/Sublime Add.app')
			dst = '/Applications/Sublime Add.app'
			self.copy_dir(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/Library/Services/Copy Path to Clipboard.workflow')
			dst = os.path.expandvars('$HOME/Library/Services/Copy Path to Clipboard.workflow')
			self.copy_dir(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/Library/Services/Open Terminal Here....workflow')
			dst = os.path.expandvars('$HOME/Library/Services/Open Terminal Here....workflow')
			self.copy_dir(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/Library/Widgets/HiddenFiles.wdgt')
			dst = os.path.expandvars('$HOME/Library/Widgets/HiddenFiles.wdgt')
			self.copy_dir(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/Library/Keyboard Layouts/French X-Coding.keylayout')
			dst = os.path.expandvars('$HOME/Library/Keyboard Layouts/French X-Coding.keylayout')
			self.copy_file(src, dst)

			src = os.path.join(user_dir, 'Resources/OSX/HOME/Library/Keyboard Layouts/French X-Coding.icns')
			dst = os.path.expandvars('$HOME/Library/Keyboard Layouts/French X-Coding.icns')
			self.copy_file(src, dst)

		# Log installed files
		self.log('Installed files', self.m_installed_files)
		self.log('Existing files (Not installed)', self.m_existing_files)
		self.log('Failed to copy files', self.m_error_files)

		# Files to manually update
		window.open_file(os.path.join(user_dir, 'FileDiffs.sublime-settings'))
		window.open_file(os.path.join(user_dir, 'Preferences.sublime-settings'))
		self.log('Manually update', ['FileDiffs.sublime-settings (cmd)', 'Preferences.sublime-settings (font_size)'])

		# Write log in a new file
		v = window.new_file()
		v.set_name('User: Install')
		v.set_scratch(True)
		edit = v.begin_edit()
		v.insert(edit, 0, self.m_log)
		v.end_edit(edit)


	def compile(self, src, dst):
		try:
			# Use ST Python Version
			# compileall.compile_dir(src, force=True)
			# Use OS Python Version
			cmd = ['python', '-m', 'compileall', '-f', src]
			subprocess.call(cmd, shell=True)
			# Remove dst
			if os.path.isdir(dst):
				shutil.rmtree(dst)
			# Copy compiled pyc files
			shutil.copytree(src, dst, ignore=shutil.ignore_patterns('*.py'))
			# Remove compiled pyc files from src
			for root, dirs, files in os.walk(src):
				for f in files:
					fileName, fileExtension = os.path.splitext(f)
					if fileExtension == '.pyc':
						os.remove(os.path.join(root, f))
		except:
			print 'User: Install - Compile Error'


	def alias(self, src, dst):
		sAlias = ' (alias)'
		if os.path.islink(dst):
			self.m_existing_files.append(dst + sAlias)
		else:
			try:
				os.symlink(src, dst)
			except:
				pass
			if os.path.islink(dst):
				self.m_installed_files.append(dst + sAlias)
			else:
				self.m_error_files.append(dst + sAlias)


	def copy_dir(self, src, dst):
		if os.path.isdir(dst):
			self.m_existing_files.append(dst)
		else:
			try:
				shutil.copytree(src, dst)
			except:
				pass
			if os.path.isdir(dst):
				self.m_installed_files.append(dst)
			else:
				self.m_error_files.append(dst)


	def copy_file(self, src, dst):
		if os.path.isfile(dst):
			self.m_existing_files.append(dst)
		else:
			try:
				shutil.copyfile(src, dst)
			except:
				pass
			if os.path.isfile(dst):
				self.m_installed_files.append(dst)
			else:
				self.m_error_files.append(dst)


	def copy_file_bak(self, src, dst):
		dst_bak = dst + '.bak'
		if os.path.isfile(dst_bak):
			self.m_existing_files.append(dst)
		else:
			try:
				shutil.copyfile(dst, dst_bak)
				shutil.copyfile(src, dst)
			except:
				pass
			if os.path.isfile(dst_bak):
				self.m_installed_files.append(dst)
			else:
				self.m_error_files.append(dst)


	def log(self, sDescription, file_list):
		if len(file_list) > 0:
			self.log_title(sDescription)
			for file_name in file_list:
				self.m_log += file_name + '\n'
			self.m_log += '\n'


	def log_title(self, sTitle):
		self.m_log += sTitle + '\n'
		for index in range(len(sTitle)):
			self.m_log += '='
		self.m_log += '\n'
