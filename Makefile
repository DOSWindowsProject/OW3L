ASM     = nasm
SRC     = Boot/stage1.asm
IMG     = Build/OW3L.img

all: $(IMG)

$(IMG): $(SRC)
	@mkdir -p $(dir $@)
	$(ASM) -f bin $< -o $@

run: $(IMG)
	qemu-system-x86_64 -drive format=raw,file=$(IMG)

clean:
	rm -f $(IMG)
