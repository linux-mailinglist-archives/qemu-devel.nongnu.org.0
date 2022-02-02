Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9B4A7B30
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 23:40:05 +0100 (CET)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOI8-0002Cr-Ml
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 17:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEF-0008Pq-5T
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEA-0004RF-20
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:54 -0500
Received: from quad ([82.142.10.94]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1Ok1-1mD11U2J6x-012s4f; Wed, 02
 Feb 2022 23:35:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] m68k: virt: add a firmware (petitboot)
Date: Wed,  2 Feb 2022 23:35:28 +0100
Message-Id: <20220202223528.1260154-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202223528.1260154-1-laurent@vivier.eu>
References: <20220202223528.1260154-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:izDziK0JtG0Iu4KPKNkcBa1/EIxK66NSbrtNkI056vkrY5227NL
 sJX2WpMrEW4gAQ1svr3hK0xkewt0hkA9DLU4+uqOezjnKAopuT/yd9tb0YEgEf1pB5dvilP
 7IE5uTze3X4+YyDMfjcxbUv2He/MkD34KXNl09e42zQXzLaCsKiafJtmPpwhW0ZKYuuVs3C
 0D0gsOHoiNdfX127V7W6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RFzXA24dwUw=:d6P58QQPWA6KmA8gL4iLW+
 lkIhTLzhKRd9OHet6SyFQ0NrPE14H8p8HqJQZd1Rn5BemNfPBPNjnRCPx7cBDAWCLYZVfxgeq
 BmH3xYsx4nglF8VoDlL6BlnZlyUQjo5NnVN3s4lHoelu1QAXFvS/kO810NGItDK9vmPowiB7c
 NLD8IozoTyQpXonO8sr9P6yz1hxoVIPG74wqgvUKAQFj//XDmCE1eUfNBqvGJI7BFHJrTMhGa
 HlupIl4NSDUQtbqQf3zBW2R/5dlA7sSM2bYbIMyq1YghbSqk1BNcvnZXMsPM6nb7Ha8ZtMdYU
 kFjsgjId5L3LPeuusVghxFjs3ZT3S88LRcljignqgWQZFa3qdIBHL/rC2XIbxJUbSvL4kHiZG
 ofrY4Gxbwqqi/t5I6L2Rql+93B7j6ZRBoT4FXHBZ10BHqtvrTB30QNye3KOVi4yAGCIRGX99+
 uEIl1PByY+r4IHV2DK6XoGjwmFhg/B8A+myDJdSRHkmkJKFA4nRAhA6rMLYTMsOzXrd0GFLd7
 bPl3NMsurHn2M2A5OCNhP4W9ldAZm2P8thiPg+oNM+g17+76Md3AJ59HoZPzBxdGMkMiG/20V
 YJ6Un6rauNHR+uFw3wtGj3oWaBsy/ex2OiV/Ew59rOXbrimn0CBm+BYOEfIp54Gcf+5tqbUmY
 yDWdqJqAL3HySaTzeV4aZlNeb7TsXN2xMMhMkGC6wVvMEmujFNGt9SLSuq8K+iJUzfxg=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a firmware for the m68k virt machine

The firmware is based on petit boot (also used in bare metal POWER
systems)

Petit boot is embedded in a buildroot filesystem.

This patch define the buildroot repository, add make targets to
build and install the kernel and filesystem produced by buildroot.

To build the firmware:

$ git submodule init roms/buildroot
$ git submodule update roms/buildroot
$ make -C roms m68k-virt-firmware

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure                   |   3 +-
 include/hw/misc/virt_ctrl.h |   6 ++
 hw/m68k/virt.c              |  12 +++-
 hw/misc/virt_ctrl.c         | 111 +++++++++++++++++++++++++++++++++++-
 .gitmodules                 |   3 +
 pc-bios/meson.build         |   2 +
 roms/Makefile               |   8 +++
 roms/buildroot              |   1 +
 8 files changed, 140 insertions(+), 6 deletions(-)
 create mode 160000 roms/buildroot

diff --git a/configure b/configure
index e6cfc0e4be6c..5cc3d7029455 100755
--- a/configure
+++ b/configure
@@ -3685,7 +3685,8 @@ for bios_file in \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/palcode-* \
-    $source_path/pc-bios/qemu_vga.ndrv
+    $source_path/pc-bios/qemu_vga.ndrv \
+    $source_path/pc-bios/m68k-virt.*
 
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
diff --git a/include/hw/misc/virt_ctrl.h b/include/hw/misc/virt_ctrl.h
index 25a237e51874..e1a3f027ab03 100644
--- a/include/hw/misc/virt_ctrl.h
+++ b/include/hw/misc/virt_ctrl.h
@@ -17,6 +17,12 @@ struct VirtCtrlState {
     qemu_irq irq;
 
     uint32_t irq_enabled;
+
+    MachineState *machine;
+    char *fw_elf;
+    char *fw_ramfs;
+    uint32_t fw_bootinfo_size;
+    uint8_t *fw_bootinfo;
 };
 
 #endif
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 11aff6d93865..d6af84d1a3f6 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -89,9 +89,11 @@
 /*
  * At the end of the memory address space we have a 1 MB ROM
  */
-#define VIRT_ROM_ADDR 0xfff00000
-#define VIRT_ROM_SIZE 0x00100000
-#define VIRT_ROM_NAME "m68k-virt.rom"
+#define VIRT_ROM_ADDR      0xfff00000
+#define VIRT_ROM_SIZE      0x00100000
+#define VIRT_ROM_NAME      "m68k-virt.rom"
+#define VIRT_FW_ELF_NAME   "m68k-virt.vmlinux"
+#define VIRT_FW_RAMFS_NAME "m68k-virt.petitboot"
 
 typedef struct {
     M68kCPU *cpu;
@@ -202,6 +204,10 @@ static void virt_init(MachineState *machine)
 
     /* virt controller */
     dev = qdev_new(TYPE_VIRT_CTRL);
+    object_property_set_link(OBJECT(dev), "machine", OBJECT(machine),
+                             &error_abort);
+    qdev_prop_set_string(dev, "fw.elf", VIRT_FW_ELF_NAME);
+    qdev_prop_set_string(dev, "fw.ramfs", VIRT_FW_RAMFS_NAME);
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, VIRT_CTRL_MMIO_BASE);
diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
index e75d1e7e17b3..2ac725f1570b 100644
--- a/hw/misc/virt_ctrl.c
+++ b/hw/misc/virt_ctrl.c
@@ -5,28 +5,98 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/datadir.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
+#include "hw/loader.h"
+#include "hw/boards.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "trace.h"
+#include "elf.h"
 #include "sysemu/runstate.h"
 #include "hw/misc/virt_ctrl.h"
 
 enum {
     REG_FEATURES = 0x00,
     REG_CMD      = 0x04,
+    REG_PARAM    = 0x08,
 };
 
 #define FEAT_POWER_CTRL 0x00000001
+#define FEAT_FW_CTRL    0x00000002
+
+#define FEAT_SUPPORTED (FEAT_POWER_CTRL | FEAT_FW_CTRL)
 
 enum {
+    /* Power Control */
     CMD_NOOP,
     CMD_RESET,
     CMD_HALT,
     CMD_PANIC,
+    /* Firmware Control */
+    CMD_FW_MACHINE_ID,
+    CMD_FW_LOAD,
+    CMD_FW_RAMSIZE,
+    CMD_FW_QEMU_VERSION
+};
+
+enum {
+   FW_M68K,
 };
 
+static uint32_t param;
+
+#define RESULT_ERROR (-1)
+
+static uint32_t fw_load_m68k(VirtCtrlState *s)
+{
+    char *elf_filename, *ramfs_filename;
+    int32_t kernel_size;
+    uint64_t elf_entry, high;
+    int32_t ramfs_size;
+    ram_addr_t ramfs_base;
+    void *ram_ptr;
+
+    elf_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, s->fw_elf);
+    if (elf_filename == NULL) {
+        error_report("Cannot find %s", s->fw_elf);
+        return RESULT_ERROR;
+    }
+    ramfs_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, s->fw_ramfs);
+    if (ramfs_filename == NULL) {
+        error_report("Cannot find %s", s->fw_ramfs);
+        return RESULT_ERROR;
+    }
+
+    kernel_size = load_elf_ram(elf_filename, NULL, NULL, NULL,
+                               &elf_entry, NULL, &high, NULL, 1,
+                               EM_68K, 0, 0, NULL, false);
+    if (kernel_size < 0) {
+        error_report("could not load kernel '%s'", elf_filename);
+        return RESULT_ERROR;
+    }
+
+    ramfs_size = get_image_size(ramfs_filename);
+    if (ramfs_size < 0) {
+        error_report("could not load initial ram disk '%s'",
+                     ramfs_filename);
+        return RESULT_ERROR;
+    }
+
+    ram_ptr = memory_region_get_ram_ptr(s->machine->ram);
+
+    ramfs_base = (s->machine->ram_size - ramfs_size) & ~0xfff;
+    load_image_size(ramfs_filename, ram_ptr + ramfs_base, ramfs_size);
+
+    high = (high + 1) & ~1;
+    *(uint32_t *)(ram_ptr + high) = cpu_to_be32(elf_entry);
+    *(uint32_t *)(ram_ptr + high + 4) = cpu_to_be32(ramfs_base);
+    *(uint32_t *)(ram_ptr + high + 8) = cpu_to_be32(ramfs_size);
+
+    return high;
+}
+
 static uint64_t virt_ctrl_read(void *opaque, hwaddr addr, unsigned size)
 {
     VirtCtrlState *s = opaque;
@@ -34,7 +104,10 @@ static uint64_t virt_ctrl_read(void *opaque, hwaddr addr, unsigned size)
 
     switch (addr) {
     case REG_FEATURES:
-        value = FEAT_POWER_CTRL;
+        value = FEAT_SUPPORTED;
+        break;
+    case REG_PARAM:
+        value = param;
         break;
     default:
         qemu_log_mask(LOG_UNIMP,
@@ -43,7 +116,7 @@ static uint64_t virt_ctrl_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    trace_virt_ctrl_write(s, addr, size, value);
+    trace_virt_ctrl_read(s, addr, size, value);
 
     return value;
 }
@@ -69,8 +142,32 @@ static void virt_ctrl_write(void *opaque, hwaddr addr, uint64_t value,
         case CMD_PANIC:
             qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
             break;
+        case CMD_FW_LOAD:
+            switch (param) {
+            case FW_M68K:
+                param = fw_load_m68k(s);
+                break;
+            default:
+                qemu_log_mask(LOG_UNIMP, "%s: unimplemented FW type %d\n",
+                              __func__, param);
+                break;
+            }
+            break;
+        case CMD_FW_RAMSIZE:
+            param = s->machine->ram_size;
+            break;
+        case CMD_FW_QEMU_VERSION:
+            param = (QEMU_VERSION_MAJOR << 24) | (QEMU_VERSION_MINOR << 16) |
+                    (QEMU_VERSION_MICRO << 8);
+            break;
+        case CMD_FW_MACHINE_ID:
+            param = 0;
+            break;
         }
         break;
+    case REG_PARAM:
+        param = value;
+        break;
     default:
         qemu_log_mask(LOG_UNIMP,
                       "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
@@ -114,6 +211,14 @@ static const VMStateDescription vmstate_virt_ctrl = {
     }
 };
 
+static Property virt_ctl_properties[] = {
+    DEFINE_PROP_LINK("machine", VirtCtrlState, machine,
+                     TYPE_MACHINE, MachineState *),
+    DEFINE_PROP_STRING("fw.elf", VirtCtrlState, fw_elf),
+    DEFINE_PROP_STRING("fw.ramfs", VirtCtrlState, fw_ramfs),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void virt_ctrl_instance_init(Object *obj)
 {
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
@@ -132,6 +237,8 @@ static void virt_ctrl_class_init(ObjectClass *oc, void *data)
     dc->reset = virt_ctrl_reset;
     dc->realize = virt_ctrl_realize;
     dc->vmsd = &vmstate_virt_ctrl;
+
+    device_class_set_props(dc, virt_ctl_properties);
 }
 
 static const TypeInfo virt_ctrl_info = {
diff --git a/.gitmodules b/.gitmodules
index 315d597d057a..b45269f896cf 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -70,3 +70,6 @@
 [submodule "roms/m68k-virt"]
 	path = roms/m68k-virt
 	url = https://github.com/vivier/m68k-virt-bootstrap.git
+[submodule "roms/buildroot"]
+	path = roms/buildroot
+	url = https://github.com/vivier/buildroot.git
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index ffec6decdc4c..c94b63d17d7b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -82,6 +82,8 @@ blobs = files(
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'npcm7xx_bootrom.bin',
   'm68k-virt.rom',
+  'm68k-virt.vmlinux',
+  'm68k-virt.petitboot',
 )
 
 if get_option('install_blobs')
diff --git a/roms/Makefile b/roms/Makefile
index f9f84e8efb1b..8275083444ef 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -71,6 +71,7 @@ default help:
 	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
 	@echo "  qboot              -- update qboot"
 	@echo "  m68k-virt-bootrom  -- update m68k-virt bootrom"
+	@echo "  m68k-virt-firmware -- update m68k-virt firmware (petitboot)"
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
 
@@ -203,6 +204,12 @@ m68k-virt-bootrom:
 	$(MAKE) -C m68k-virt CROSS_COMPILE=$(m68k_cross_prefix)
 	cp m68k-virt/rom.bin ../pc-bios/m68k-virt.rom
 
+m68k-virt-firmware:
+	$(MAKE) -C buildroot qemu_m68k_virt_petitboot_defconfig
+	$(MAKE) -C buildroot -j $$(( $$(getconf _NPROCESSORS_ONLN) * 2 + 1))
+	cp buildroot/output/images/vmlinux ../pc-bios/m68k-virt.vmlinux
+	cp buildroot/output/images/rootfs.cpio.xz ../pc-bios/m68k-virt.petitboot
+
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
 	$(MAKE) -C sgabios clean
@@ -218,3 +225,4 @@ clean:
 	$(MAKE) -C qboot clean
 	$(MAKE) -C vbootrom clean
 	$(MAKE) -C m68k-virt clean
+	$(MAKE) -C buildroot clean
diff --git a/roms/buildroot b/roms/buildroot
new file mode 160000
index 000000000000..5590654699e4
--- /dev/null
+++ b/roms/buildroot
@@ -0,0 +1 @@
+Subproject commit 5590654699e4926bee834ae99f90c8062bc418eb
-- 
2.34.1


