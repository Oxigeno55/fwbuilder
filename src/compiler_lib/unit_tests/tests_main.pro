#-*- mode: makefile; tab-width: 4; -*-

include(../../../qmake.inc)

# exists(../../qmake.inc):include( ../../qmake.inc)

QMAKE_CXX = g++

TEMPLATE = app
TARGET =
DEPENDPATH += .

SOURCES	 =  ../CompilerDriver.cpp \
    ../CompilerDriver_compile.cpp \
    ../CompilerDriver_generators.cpp \
    ../Configlet.cpp \
    ../interfaceProperties.cpp \
    ../linux24Interfaces.cpp \
    ../bsdInterfaces.cpp \
    ../iosInterfaces.cpp \
    ../pixInterfaces.cpp \
    ../interfacePropertiesObjectFactory.cpp

HEADERS	 = ../../../config.h \
    ../CompilerDriver.h \
    ../Configlet.h \
    ../interfaceProperties.h \
    ../linux24Interfaces.h \
    ../bsdInterfaces.h \
    ../iosInterfaces.h \
    ../pixInterfaces.h \
    ../interfacePropertiesObjectFactory.h

# Actual tests
HEADERS += interfacePropertiesTest.h
SOURCES += tests_main.cpp interfacePropertiesTest.cpp

CONFIG -= release
CONFIG += debug
OBJECTS_DIR = .
QMAKE_CXXFLAGS += $$CPPUNIT_CFLAGS

LIBS += $$LIBS_FWCOMPILER $$LIBS_FWBUILDER $$CPPUNIT_LIBS

!win32:LIBS += ../../common/libcommon.a
!win32:PRE_TARGETDEPS = ../../common/libcommon.a

win32:CONFIG += console

win32:LIBS += ../../common/release/common.lib
win32:PRE_TARGETDEPS = ../../common/release/common.lib

run.commands = echo "Running tests..." && \
    ./${TARGET} && \
    echo "OK" || { echo "FAILED"; exit 1; }
run.depends = all

run_test.depends = run
build_test.depends = all
clean_test.depends = all
QMAKE_EXTRA_TARGETS += run run_test build_test clean_test


