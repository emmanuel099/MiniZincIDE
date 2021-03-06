#-------------------------------------------------
#
# Project created by QtCreator 2013-12-12T09:32:30
#
#-------------------------------------------------

QT       += core gui widgets

greaterThan(QT_MAJOR_VERSION, 4): {
  greaterThan(QT_MINOR_VERSION, 5): {
    QT += webenginewidgets
    DEFINES += MINIZINC_IDE_HAVE_WEBENGINE
  }
  !greaterThan(QT_MINOR_VERSION, 5): {
    QT += webkitwidgets
  }
}

TARGET = MiniZincIDE
TEMPLATE = app

VERSION = 2.2.0
DEFINES += MINIZINC_IDE_VERSION=\\\"$$VERSION\\\"

bundled {
    DEFINES += MINIZINC_IDE_BUNDLED
}

macx {
    ICON = mznide.icns
    OBJECTIVE_SOURCES += rtfexporter.mm
    QT += macextras
    LIBS += -framework Cocoa
}

macx:bundled {
    QMAKE_INFO_PLIST = mznide-bundled.plist
}
macx:!bundled {
    QMAKE_INFO_PLIST = mznide.plist
}

RC_ICONS = mznide.ico

CONFIG += embed_manifest_exe

SOURCES += main.cpp\
        mainwindow.cpp \
    codeeditor.cpp \
    highlighter.cpp \
    fzndoc.cpp \
    solverdialog.cpp \
    gotolinedialog.cpp \
    finddialog.cpp \
    paramdialog.cpp \
    outputdockwidget.cpp \
    checkupdatedialog.cpp \
    project.cpp \
    htmlwindow.cpp \
    htmlpage.cpp \
    moocsubmission.cpp \
    solverconfiguration.cpp \
    esclineedit.cpp

HEADERS  += mainwindow.h \
    codeeditor.h \
    highlighter.h \
    fzndoc.h \
    solverdialog.h \
    gotolinedialog.h \
    finddialog.h \
    paramdialog.h \
    outputdockwidget.h \
    checkupdatedialog.h \
    project.h \
    rtfexporter.h \
    htmlwindow.h \
    htmlpage.h \
    moocsubmission.h \
    solverconfiguration.h \
    esclineedit.h

FORMS    += \
    mainwindow.ui \
    solverdialog.ui \
    gotolinedialog.ui \
    finddialog.ui \
    paramdialog.ui \
    checkupdatedialog.ui \
    htmlwindow.ui \
    moocsubmission.ui

RESOURCES += \
    minizincide.qrc

target.path = $$PREFIX/bin
INSTALLS += target
