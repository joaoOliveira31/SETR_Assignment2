# Paulo Pedreiras, Mar/2022
# Adapted from the ThrowTheSwitch.org   
# 
# This makefile assumes that test source and test files are in folders 
#   "src" and "test", respectively
# Moreover, this makefile, "src" and "test" are within the root Unity 
#	folder.
# Finaly, the SW module name has a MODULE_NAME.c file and MODULE_NAME.h
# 	file, and the test file is testMODULENAME.c
# If the rules above are obeyed only MODULE_NAME needs to be adjusted

MODULE_NAME = cmdproc

# Paths
UNITY_ROOT = ../Unity-master
SRC_FOLDER = 
TEST_FOLDER = 

# Commands
CLEANUP = rm -f
MKDIR = mkdir -p

#Compiler
C_COMPILER = gcc
CFLAGS=-std=c89
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Wpointer-arith
CFLAGS += -Wcast-align
CFLAGS += -Wwrite-strings
CFLAGS += -Wswitch-default
CFLAGS += -Wunreachable-code
CFLAGS += -Winit-self
CFLAGS += -Wmissing-field-initializers
CFLAGS += -Wno-unknown-pragmas
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wundef
CFLAGS += -Wold-style-definition
#CFLAGS += -Wno-misleading-indentation

TARGET=main
SRC_FILES=$(UNITY_ROOT)/src/unity.c $(MODULE_NAME).c  $(TEST_FOLDER)main.c
INC_DIRS= -I$(UNITY_ROOT)/src
SYMBOLS=

all: clean default

.PHONY: clean

default: $(SRC_FILES)
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES) -o $(TARGET)	
	- ./$(TARGET)
	
clean:
	$(CLEANUP) $(TARGET)
	


