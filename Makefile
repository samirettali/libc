# Default targets
all: clean tests

# Test compile and runnning
tests: ctype_test stdlib_test

ctype_test: test_ctype_isdigit

test_ctype_isdigit: bin/ctype/test_isdigit
	@echo "\nRunning isdigit tests"
	@bin/ctype/test_isdigit

stdlib_test: test_stdlib_atoi

test_stdlib_atoi: bin/stdlib/test_atoi
	@echo "\nRunning atoi tests"
	@bin/stdlib/test_atoi

CC = gcc

# Compiler flags
CFLAGS = -g -nostdlib -nodefaultlibs -Wall -Wpedantic -Wno-padded -Werror

# Header files
INCLUDES = include/ctype.h include/stdlib.h unity/unity_internals.h unity/unity.h

# Recompile targets if headers or Makefile changes
COMMON_DEPS = $(INCLUDES) Makefile

# Build object files for each source file
# build/%.o: src/%.c $(COMMON_DEPS)
# 	@echo "Building $<"
# 	@$(CC) $(CFLAGS) -c $< -o $@

build/unity.o:
	@$(CC) $(CFLAGS) -c unity/unity.c -o build/unity.o

# Tests compiling
bin/ctype/test_isdigit: build/unity.o $(COMMON_DEPS)
	@echo "\nCompiling isdigit tests"
	@$(CC) -Iunity -Iinclude/ctype.h -o bin/ctype/test_isdigit test/ctype/test_isdigit.c build/unity.o

bin/stdlib/test_atoi: build/unity.o $(COMMON_DEPS)
	@echo "\nCompiling atoi tests"
	@$(CC) -Iunity -Iinclude/stdlib.h -o bin/stdlib/test_atoi test/stdlib/test_atoi.c build/unity.o

clean:
	@echo "Cleaning directories"
	@rm -rf build/* bin/*
	@mkdir -p bin/ctype
	@mkdir -p bin/stdlib
