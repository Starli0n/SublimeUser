import sublime, sublime_plugin, sys, os, imp

class DebugCommand(sublime_plugin.ApplicationCommand):
    def run(self, **kwargs):
        sys.stderr.write("Start debug\n")

        window = sublime.active_window()
        view = window.active_view()
        view_settings = view.settings()

        # self.log_commands()

        # self.reload_plugin("<File Path Plugin>")

        cmd = kwargs.pop('cmd', None)
        if cmd != None:
            import spdb ; spdb.start()
            wrun = window.run_command(cmd, kwargs)


    def log_commands(self):
        print "application_command_classes:"
        for app_cmd in sublime_plugin.application_command_classes:
            print app_cmd
        print ""

        print "window_command_classes:"
        for win_cmd in sublime_plugin.window_command_classes:
            print win_cmd
        print ""

        print "text_command_classes:"
        for txt_cmd in sublime_plugin.text_command_classes:
            print txt_cmd
        print ""


    def reload_plugin(self, fname):
        print "Reloading plugin", fname
        path = os.path.dirname(fname)

        # Change the current directory to that of the module. It's not safe to just
        # add the modules directory to sys.path, as that won't accept unicode paths
        # on Windows
        oldpath = os.getcwdu()
        os.chdir(path)

        modulename, ext = os.path.splitext(os.path.basename(fname))

        if modulename in sys.modules:
            print 'unload_module' #unload_module(sys.modules[modulename])
        m_info = imp.find_module(modulename, ["."])
        m = imp.load_module(modulename, *m_info)

        # Restore the current directory
        os.chdir(oldpath)

        module_plugins = []
        dir_m = dir(m)
        for type_name in dir(m):
            try:
                t = m.__dict__[type_name]
                if t.__bases__:
                    is_plugin = False
                    if issubclass(t, sublime_plugin.ApplicationCommand):
                        application_command_classes.append(t)
                        is_plugin = True
                    if issubclass(t, sublime_plugin.WindowCommand):
                        window_command_classes.append(t)
                        is_plugin = True
                    if issubclass(t, sublime_plugin.TextCommand):
                        text_command_classes.append(t)
                        is_plugin = True

                    if is_plugin:
                        module_plugins.append(t)

                    if issubclass(t, sublime_plugin.EventListener):
                        obj = t()
                        for p in sublime_plugin.all_callbacks.iteritems():
                            dir_obj = dir(obj)
                            p0 = p[0]
                            p1 = p[1]
                            if p[0] in dir(obj):
                                p[1].append(obj)

                        module_plugins.append(obj)

            except AttributeError:
                pass

        if len(module_plugins) > 0:
            m.plugins = module_plugins
