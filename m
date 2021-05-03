Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A037129D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:48:16 +0200 (CEST)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUFT-0003ca-2n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4c-0003VG-2t; Mon, 03 May 2021 04:37:02 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0000la-Qt; Mon, 03 May 2021 04:36:57 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYvse-1m8IdB1kJc-00UrS5; Mon, 03
 May 2021 10:36:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] Do not include sysemu/sysemu.h if it's not really
 necessary
Date: Mon,  3 May 2021 10:36:15 +0200
Message-Id: <20210503083623.139700-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vW4MRfiZcAc813CNqgJEBPwNncDnUXMDISbiF60hLVSR4HZs4VQ
 RfGUb45cfLEEwuU1KGXMFVqPlXHe/jIxJ7Ms396Xi9FTdEUrvf6HCX+Wq4x/coEaDXo6UQb
 sJWiqmzNIv406mkmGxyFfmuYxfKLsgLF1hmkaX9y+k4q6al4s9NFuNCEDotAbn5fQDp8f9n
 vPnX074x0PLpqgb1JuuHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ncmPnq226Z4=:DrSoGmO5kCeyJpp+ydbx8a
 UHc8UIIu8gR4qIYG4Wc8rrVsuX4yTpPPcpn2L/RxzlaiU1bVvuwRcN8k3M3pQAZWQdSFW7esD
 rjrMkWTKu3cDRyK7Zkz3E559F8Xyl742hiEbizJWOFsZhNbg5iSIFnjWWlJLeNR7kGqNIdUK8
 4m9LANUf33h3rYPSzv/IqHiRnCnKFC1gf3WZDHrdJXHvXxn+w3/jewtVxAUBtHX5KYVRvZxCG
 hF6zGD+Kg37HDoOFdNm+NSReWezh1Ry/oxYG0oNKerR3YNpdpw0HQlFiLUGAUrkLjCm7L1YCG
 ObskrI3zZmNQeuk9yoY1QWmvUiZ4aZidS5LIVpeMoCv33w+3ckH+LzAvN+UaEas9XPpsfomIY
 THxPxchCkBhKVV0KhOtSOGpO2Q2rs8Q7HaPCXfS/ggKybMfu2oavj6VU+utWxk2dXlNpKjI+f
 I10z3sPWtB1uMB9VFzzcRN8gPdTIL7PEf2PLY0KOyzcpcZMZlsuU+DkJYFno8+lww9DM5RU3C
 W6RfLa3wRBu5/akpd2XWUA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Stop including sysemu/sysemu.h in files that don't need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210416171314.2074665-2-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/kvm/kvm-all.c          | 1 -
 accel/tcg/user-exec-stub.c   | 1 -
 backends/hostmem-file.c      | 1 -
 backends/hostmem-memfd.c     | 1 -
 backends/hostmem.c           | 1 -
 block.c                      | 1 -
 block/block-backend.c        | 1 -
 block/nfs.c                  | 1 -
 chardev/char-mux.c           | 1 -
 chardev/char.c               | 1 -
 gdbstub.c                    | 1 -
 hw/alpha/dp264.c             | 1 -
 hw/arm/aspeed.c              | 1 -
 hw/arm/cubieboard.c          | 1 -
 hw/arm/digic_boards.c        | 1 -
 hw/arm/exynos4_boards.c      | 1 -
 hw/arm/mcimx6ul-evk.c        | 1 -
 hw/arm/mcimx7d-sabre.c       | 1 -
 hw/arm/npcm7xx_boards.c      | 1 -
 hw/arm/orangepi.c            | 1 -
 hw/arm/raspi.c               | 1 -
 hw/arm/sabrelite.c           | 1 -
 hw/arm/virt.c                | 1 -
 hw/block/nvme-subsys.c       | 1 -
 hw/core/machine-qmp-cmds.c   | 1 -
 hw/core/null-machine.c       | 1 -
 hw/core/numa.c               | 1 -
 hw/i386/pc_piix.c            | 1 -
 hw/i386/pc_sysfw.c           | 1 -
 hw/input/lasips2.c           | 1 -
 hw/intc/sifive_plic.c        | 1 -
 hw/isa/isa-superio.c         | 1 -
 hw/isa/piix3.c               | 1 -
 hw/m68k/next-kbd.c           | 1 -
 hw/microblaze/boot.c         | 1 -
 hw/mips/malta.c              | 1 -
 hw/misc/macio/macio.c        | 1 -
 hw/net/can/xlnx-zynqmp-can.c | 1 -
 hw/net/i82596.c              | 1 -
 hw/net/lasi_i82596.c         | 1 -
 hw/nios2/boot.c              | 1 -
 hw/ppc/ppc405_boards.c       | 1 -
 hw/ppc/prep.c                | 1 -
 hw/rx/rx-gdbsim.c            | 1 -
 hw/s390x/ipl.c               | 1 -
 hw/s390x/sclp.c              | 1 -
 hw/sh4/shix.c                | 1 -
 hw/ssi/sifive_spi.c          | 1 -
 hw/vfio/display.c            | 1 -
 hw/vfio/pci.c                | 1 -
 hw/xtensa/virt.c             | 1 -
 migration/ram.c              | 1 -
 monitor/monitor.c            | 1 -
 net/net.c                    | 2 --
 net/netmap.c                 | 1 -
 plugins/api.c                | 1 -
 plugins/core.c               | 1 -
 semihosting/config.c         | 1 -
 semihosting/console.c        | 1 -
 softmmu/arch_init.c          | 1 -
 softmmu/device_tree.c        | 1 -
 softmmu/physmem.c            | 1 -
 softmmu/qdev-monitor.c       | 1 -
 stubs/semihost.c             | 1 -
 target/arm/cpu.c             | 1 -
 target/openrisc/sys_helper.c | 1 -
 target/rx/helper.c           | 1 -
 target/s390x/cpu.c           | 1 -
 target/s390x/excp_helper.c   | 1 -
 tcg/tcg.c                    | 1 -
 tests/qtest/fuzz/fuzz.c      | 1 -
 tests/qtest/fuzz/qos_fuzz.c  | 1 -
 util/oslib-win32.c           | 1 -
 73 files changed, 74 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 93d7cbfeaf88..50e56664cc6d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -30,7 +30,6 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
-#include "sysemu/sysemu.h"
 #include "qemu/bswap.h"
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index b876f5c1e45d..968cd3ca60d7 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -1,7 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
 #include "sysemu/replay.h"
-#include "sysemu/sysemu.h"
 
 bool enable_cpu_pm = false;
 
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index b683da9daf81..9b1b9f0a5604 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -15,7 +15,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/hostmem.h"
-#include "sysemu/sysemu.h"
 #include "qom/object_interfaces.h"
 #include "qom/object.h"
 
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 69b0ae30bb08..da75e270573f 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/hostmem.h"
-#include "sysemu/sysemu.h"
 #include "qom/object_interfaces.h"
 #include "qemu/memfd.h"
 #include "qemu/module.h"
diff --git a/backends/hostmem.c b/backends/hostmem.c
index c6c1ff5b99c2..aab3de84083e 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/hostmem.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "qapi/qapi-builtin-visit.h"
diff --git a/block.c b/block.c
index 874c22c43e3d..9ad725d2057d 100644
--- a/block.c
+++ b/block.c
@@ -42,7 +42,6 @@
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/sysemu.h"
 #include "qemu/notify.h"
 #include "qemu/option.h"
 #include "qemu/coroutine.h"
diff --git a/block/block-backend.c b/block/block-backend.c
index 6fca9853e125..de5496af66fc 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -18,7 +18,6 @@
 #include "hw/qdev-core.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-block.h"
diff --git a/block/nfs.c b/block/nfs.c
index 8c1968bb415d..7dff64f48962 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -39,7 +39,6 @@
 #include "qemu/option.h"
 #include "qemu/uri.h"
 #include "qemu/cutils.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/replay.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "qapi/qmp/qdict.h"
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 72beef29d21c..5baf41901083 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -28,7 +28,6 @@
 #include "qemu/option.h"
 #include "chardev/char.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/sysemu.h"
 #include "chardev-internal.h"
 
 /* MUX driver for serial I/O splitting */
diff --git a/chardev/char.c b/chardev/char.c
index 398f09df19cd..a4ebfcc5ac20 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -25,7 +25,6 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "monitor/monitor.h"
-#include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
diff --git a/gdbstub.c b/gdbstub.c
index 054665e93ea6..9103ffc9028d 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -37,7 +37,6 @@
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "sysemu/sysemu.h"
 #include "exec/gdbstub.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index c8e300d93f61..1017ecf330db 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -13,7 +13,6 @@
 #include "hw/loader.h"
 #include "alpha_sys.h"
 #include "qemu/error-report.h"
-#include "sysemu/sysemu.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
 #include "hw/timer/i8254.h"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c3345fce5366..c4f85dab63b3 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -23,7 +23,6 @@
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 3ec30ca5afa4..9e872135ae72 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -19,7 +19,6 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 6cdc1d83fcac..65d3a9ba740b 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -34,7 +34,6 @@
 #include "hw/arm/digic.h"
 #include "hw/block/flash.h"
 #include "hw/loader.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 56b729141b51..8ae136bbdf36 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index ed69a7b037ad..ce16b6b31744 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -15,7 +15,6 @@
 #include "hw/arm/fsl-imx6ul.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index e57d52b3441c..e896222c34c9 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -17,7 +17,6 @@
 #include "hw/arm/fsl-imx7.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e22fe4bf8f06..d91d6877001e 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,7 +27,6 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
-#include "sysemu/sysemu.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index b8d38c9e8d04..6ccb61c149ec 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -25,7 +25,6 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
-#include "sysemu/sysemu.h"
 
 static struct arm_boot_info orangepi_binfo = {
     .nb_cpus = AW_H3_NUM_CPUS,
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 990509d38521..1b7e9c4cb418 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -23,7 +23,6 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/arm/boot.h"
-#include "sysemu/sysemu.h"
 #include "qom/object.h"
 
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index a3dbf85e0edb..42348e5cb15b 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -15,7 +15,6 @@
 #include "hw/arm/fsl-imx6.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fee696fb0e34..881969af6b25 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -48,7 +48,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
 #include "hw/loader.h"
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index 283a97b79d57..9604c19117de 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -17,7 +17,6 @@
 #include "hw/block/block.h"
 #include "block/aio.h"
 #include "block/accounting.h"
-#include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "nvme.h"
 #include "nvme-subsys.h"
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 68a942595a26..2ad004430e4a 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -22,7 +22,6 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 
 static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
 {
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 7e693523d752..f586a4bef543 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -14,7 +14,6 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
-#include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
 
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 68cee65f6143..ac6bed5817f8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -26,7 +26,6 @@
 #include "qemu/units.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
-#include "sysemu/sysemu.h"
 #include "exec/cpu-common.h"
 #include "exec/ramlist.h"
 #include "qemu/bitmap.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4e8edffeaf66..ac24f70a5dc7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -42,7 +42,6 @@
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
-#include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 9fe72b370e8e..6ce37a2b052d 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -35,7 +35,6 @@
 #include "hw/i386/pc.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/sysemu.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 275737842e95..e7faf24058b4 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -27,7 +27,6 @@
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
 #include "exec/hwaddr.h"
-#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 97a1a27a9acd..6a53e6329924 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -29,7 +29,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
-#include "sysemu/sysemu.h"
 #include "migration/vmstate.h"
 
 #define RISCV_DEBUG_PLIC 0
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index 179c1856956b..c81bfe58ef8d 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -14,7 +14,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/blockdev.h"
 #include "chardev/char.h"
 #include "hw/block/fdc.h"
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f46ccae25cf7..dab901c9ad99 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,7 +29,6 @@
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/xen.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index bee40e25bca0..30a8c9fbfabf 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -33,7 +33,6 @@
 #include "hw/sysbus.h"
 #include "hw/m68k/next-cube.h"
 #include "ui/console.h"
-#include "sysemu/sysemu.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
 
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index caaba1aa4c1d..8821d009f1a9 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -33,7 +33,6 @@
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 26e7b1bd9f64..5adb67ad2a42 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -39,7 +39,6 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/arch_init.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index e6eeb575d53c..4515296e66a6 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -35,7 +35,6 @@
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
 #include "hw/intc/heathrow_pic.h"
-#include "sysemu/sysemu.h"
 #include "trace.h"
 
 /* Note: this code is strongly inspirated from the corresponding code
diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index affa21a5ed35..22bb8910fa8c 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -37,7 +37,6 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qemu/cutils.h"
-#include "sysemu/sysemu.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "net/can_emu.h"
diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 055c3a1470ca..ec21e2699a18 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -12,7 +12,6 @@
 #include "qemu/timer.h"
 #include "net/net.h"
 #include "net/eth.h"
-#include "sysemu/sysemu.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index 820b63f35098..e37f7fabe952 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -18,7 +18,6 @@
 #include "hw/net/lasi_82596.h"
 #include "hw/net/i82596.h"
 #include "trace.h"
-#include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index d9969ac14828..95bdc18052c8 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -38,7 +38,6 @@
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index f4e804cdb528..8da7bc7af971 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -34,7 +34,6 @@
 #include "ppc405.h"
 #include "hw/rtc/m48t59.h"
 #include "hw/block/flash.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/block-backend.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index af4ccb9f431f..b41570c7472b 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -29,7 +29,6 @@
 #include "hw/char/serial.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
-#include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 9b82feff5284..1f53fdb08289 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -24,7 +24,6 @@
 #include "cpu.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index ff6b55e8167d..f12af5e35b88 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -18,7 +18,6 @@
 #include "qapi/error.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "cpu.h"
 #include "elf.h"
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 0cf229082670..f57340a7d789 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -16,7 +16,6 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/event-facility.h"
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index d9a9fcbc5989..1a44378df421 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -31,7 +31,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sh4/sh.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
index 0c9ebca3c86c..03540cf5ca66 100644
--- a/hw/ssi/sifive_spi.c
+++ b/hw/ssi/sifive_spi.c
@@ -24,7 +24,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ssi/ssi.h"
-#include "sysemu/sysemu.h"
 #include "qemu/fifo8.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index f04473e3cece..89bc90508fb8 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -14,7 +14,6 @@
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
-#include "sysemu/sysemu.h"
 #include "hw/display/edid.h"
 #include "ui/console.h"
 #include "qapi/error.h"
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5c65aa0a98e2..ab4077aad23e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -37,7 +37,6 @@
 #include "qemu/units.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "pci.h"
 #include "trace.h"
 #include "qapi/error.h"
diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index e47e1de67671..bbf6200c4964 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -29,7 +29,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/reset.h"
-#include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
diff --git a/migration/ram.c b/migration/ram.c
index 4682f3625c4d..9e9b7380bf6c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -51,7 +51,6 @@
 #include "qemu/rcu_queue.h"
 #include "migration/colo.h"
 #include "block.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/cpu-throttle.h"
 #include "savevm.h"
 #include "qemu/iov.h"
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 636bcc81c5ba..b90c0f40516f 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -32,7 +32,6 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "sysemu/qtest.h"
-#include "sysemu/sysemu.h"
 #include "trace.h"
 
 /*
diff --git a/net/net.c b/net/net.c
index edf9b954185f..2a472604ecec 100644
--- a/net/net.c
+++ b/net/net.c
@@ -51,9 +51,7 @@
 #include "qemu/option.h"
 #include "qapi/error.h"
 #include "qapi/opts-visitor.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
 
diff --git a/net/netmap.c b/net/netmap.c
index 350f097f91c1..9e0cec58d379 100644
--- a/net/netmap.c
+++ b/net/netmap.c
@@ -33,7 +33,6 @@
 #include "net/net.h"
 #include "net/tap.h"
 #include "clients.h"
-#include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/iov.h"
diff --git a/plugins/api.c b/plugins/api.c
index b22998cd7c91..218e1342cda3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -37,7 +37,6 @@
 #include "qemu/osdep.h"
 #include "qemu/plugin.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/ram_addr.h"
diff --git a/plugins/core.c b/plugins/core.c
index 87b823bbc470..93b595a8d684 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -26,7 +26,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "trace/mem-internal.h" /* mem_info macros */
diff --git a/semihosting/config.c b/semihosting/config.c
index 3548e0f627f4..137171b717b2 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -24,7 +24,6 @@
 #include "qemu/error-report.h"
 #include "semihosting/semihost.h"
 #include "chardev/char.h"
-#include "sysemu/sysemu.h"
 
 QemuOptsList qemu_semihosting_config_opts = {
     .name = "semihosting-config",
diff --git a/semihosting/console.c b/semihosting/console.c
index c9ebd6fdd053..a78af6938727 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -24,7 +24,6 @@
 #include "qemu/log.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "sysemu/sysemu.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
 #include "qemu/fifo8.h"
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 7fd5c09b2b93..8471711c54cc 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -23,7 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/arch_init.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 2691c58cf633..b621f63fbac8 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -23,7 +23,6 @@
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
 #include "sysemu/device_tree.h"
-#include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "qemu/config-file.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11e3..7ed276b9b5f9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -36,7 +36,6 @@
 #include "hw/boards.h"
 #include "hw/xen/xen.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a9955b97a078..721dec2d8200 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -35,7 +35,6 @@
 #include "qemu/qemu-print.h"
 #include "qemu/option_int.h"
 #include "sysemu/block-backend.h"
-#include "sysemu/sysemu.h"
 #include "migration/misc.h"
 #include "migration/migration.h"
 #include "qemu/cutils.h"
diff --git a/stubs/semihost.c b/stubs/semihost.c
index 1b30f38b03d1..4bf2cf71b9b4 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -12,7 +12,6 @@
 #include "qemu/option.h"
 #include "qemu/error-report.h"
 #include "semihosting/semihost.h"
-#include "sysemu/sysemu.h"
 
 /* Empty config */
 QemuOptsList qemu_semihosting_config_opts = {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0dd623e59094..4eb0d2f85c4d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -36,7 +36,6 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #endif
-#include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 41390d046f64..48674231e743 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -23,7 +23,6 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "exception.h"
-#include "sysemu/sysemu.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/target/rx/helper.c b/target/rx/helper.c
index 3e380a94fe60..db6b07e38900 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/log.h"
 #include "exec/cpu_ldst.h"
-#include "sysemu/sysemu.h"
 #include "hw/irq.h"
 
 void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bbd..64455cf309af 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -40,7 +40,6 @@
 #include "hw/s390x/pv.h"
 #include "hw/boards.h"
 #include "sysemu/arch_init.h"
-#include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #endif
 #include "fpu/softfloat-helpers.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index c48cd6b46f49..20625c2c8f6b 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -29,7 +29,6 @@
 #include "exec/address-spaces.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/sysemu.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1fbe0b686d57..cc947bf6f6a2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -64,7 +64,6 @@
 
 #include "elf.h"
 #include "exec/log.h"
-#include "sysemu/sysemu.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 496d11a23131..04b70e114bf9 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -18,7 +18,6 @@
 #include "qemu/datadir.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
-#include "sysemu/sysemu.h"
 #include "qemu/main-loop.h"
 #include "qemu/rcu.h"
 #include "tests/qtest/libqos/libqtest.h"
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index cee1a2a60f62..2bc474645c56 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -22,7 +22,6 @@
 #include "qemu-common.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
-#include "sysemu/sysemu.h"
 #include "qemu/main-loop.h"
 
 #include "tests/qtest/libqos/libqtest.h"
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index f68b8012bb8c..1fc42ec0e388 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -34,7 +34,6 @@
 #include <windows.h>
 #include "qemu-common.h"
 #include "qapi/error.h"
-#include "sysemu/sysemu.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
 #include "qemu/sockets.h"
-- 
2.31.1


