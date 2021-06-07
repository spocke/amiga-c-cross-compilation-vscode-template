BUILD_DIR=build
UAE_DIR=uae/dh0
SRCS=$(shell (cd src; find . -name "*.c" -o -name "*.s"))
OBJS=$(addprefix $(BUILD_DIR)/,$(patsubst %.c,%.o,$(patsubst %.s,%.o,$(SRCS))))
CC=vc +kick13
CFLAGS=-c99 -I$(NDK_INC)
LDFLAGS=-L$(NDK_LIB) -ldebug -lamiga -lauto
ASM=vasmm68k_mot
ASM_FLAGS=-Fhunk -devpac
.SUFFIXES = .o .s .c

.PHONY: default build debuglog clean
.DEFAULT_GOAL=default

default: build run

build: $(UAE_DIR)/program

.PRECIOUS: $(BUILD_DIR)/. $(BUILD_DIR)%/.

$(BUILD_DIR)/.:
	mkdir -p $@

$(BUILD_DIR)%/.:
	mkdir -p $@

.SECONDEXPANSION:

$(BUILD_DIR)/%.o: src/%.c | $$(@D)/.
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: src/%.s | $$(@D)/.
	$(ASM) $(ASM_FLAGS) -o $@ $<

$(UAE_DIR)/program: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

run:
	fs-uae .fs-uae

debuglog:
	@socat pty,raw,echo=0,link=/tmp/vser -,raw,echo=0

clean:
	rm -rf $(BUILD_DIR)