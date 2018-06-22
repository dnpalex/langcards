TEMPLATE = subdirs

SUBDIRS = app \
        plugins

app.subdir = source/app
plugins.subdir = source/plugins

app.depends = plugins

