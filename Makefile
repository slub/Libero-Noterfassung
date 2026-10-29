JAVAC ?= javac
JAVA ?= java
JAR ?= jar
JAVA_RELEASE ?= 11

CLASSES_DIR := build/classes
JAR_FILE := build/SEC.jar
SOURCES := $(wildcard src/sec/*.java)
RESOURCES := src/sec/logo.png
MAIN_CLASS := sec.MainWindow

.PHONY: all compile jar run clean

all: jar

compile: $(CLASSES_DIR)/.stamp

$(CLASSES_DIR)/.stamp: $(SOURCES) $(RESOURCES) Makefile
	mkdir -p "$(CLASSES_DIR)"
	$(JAVAC) -encoding UTF-8 --release $(JAVA_RELEASE) -d "$(CLASSES_DIR)" $(SOURCES)
	cp $(RESOURCES) "$(CLASSES_DIR)/"
	touch "$@"

jar: $(JAR_FILE) build/config.properties

build/config.properties: config.properties
	mkdir -p build
	cp "$<" "$@"

$(JAR_FILE): $(CLASSES_DIR)/.stamp
	$(JAR) --create --file "$@" --main-class $(MAIN_CLASS) -C "$(CLASSES_DIR)" .

run: compile
	$(JAVA) -cp "$(CLASSES_DIR)" $(MAIN_CLASS)

clean:
	$(RM) -r "$(CLASSES_DIR)" "$(JAR_FILE)"
