Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA051371295
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:46:34 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUDp-0001Jb-Nf
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4R-0003Nx-S3; Mon, 03 May 2021 04:36:52 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:37335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0000kO-Fp; Mon, 03 May 2021 04:36:51 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqK2d-1lGTFx3NpL-00nUIc; Mon, 03
 May 2021 10:36:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] hw: Do not include hw/sysbus.h if it is not necessary
Date: Mon,  3 May 2021 10:36:12 +0200
Message-Id: <20210503083623.139700-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hLc2k7+qpnEn0vtD7y3ZhXTZFheQxDQvbXMvLc1vy1IlpQFSON5
 k7bNTCt0Fqvbg6pC4GgONKjQMB0YwoGy+2YbdJBeCfxIobQVXizmxVpwEOj6+NmG5AJ889b
 8Zf2QCT4pkLHTWhHj/VlJH6PLf7s+KvATOT7of99wApPs+O3SrSRaZPjLvmiBEue3EjZkZH
 f+q6L3iPIF0Ur/fDAG7kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UEXh5LBM06o=:ckKQaGg/U4M35Y2vCx+IgH
 NPN59zgLq78E1xH7vgBXfrJBEYRStVxDZeG+mZBRiUWzp1ogjpqfbxbr4gd20XsDJzOWpyLlT
 ZKTIBvla3Qpeidh/VrZ2do1EElTW82x/OPe0gPJoQMfzmjQr7o0divdl8cUmzbhQWL+uM9MER
 Qnwtnh0H5IENHDg18YyW4yy2KJdevw2TehTrOM5S9EcLVJGMUedA7/wK9ivie5+craRK+Ufoh
 +aHCzYdoogDYv2Oz4CUcg1CtgwDhuefzUvaSMi9SJQniqZzu95/vcJuip7AC8Q43C66rh3hRR
 1oIy5cxDaVgjJDXOUt4N0HSJwd2Cv9EplJeSOpfhaHRXLbF2L35NE4ncPuspHeudcX8Jhqu4B
 m1BuqrhVIcI6WRRPbxVdoGmGzhG+BqYqjj8cwG2e/G1cdDZqyn42kN1fvFUhWVd7YeE1x+LCD
 ojm01iQHmdiJ2y4inVqaOxIVUsJ4L7T9YHYnzlNB/+dFySVeAg854f9aGTIxyKGQHdF0fkMSJ
 koZYlCwcVf/6AvQWUA/g+U=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Many files include hw/sysbus.h without needing it. Remove the superfluous
include statements.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210327082804.2259480-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/cubieboard.c         | 1 -
 hw/arm/orangepi.c           | 1 -
 hw/char/riscv_htif.c        | 1 -
 hw/char/sifive_uart.c       | 1 -
 hw/char/virtio-serial-bus.c | 1 -
 hw/core/generic-loader.c    | 1 -
 hw/core/guest-loader.c      | 1 -
 hw/ide/ahci_internal.h      | 1 -
 hw/input/lasips2.c          | 1 -
 hw/intc/arm_gic_kvm.c       | 1 -
 hw/intc/arm_gicv3.c         | 1 -
 hw/intc/arm_gicv3_kvm.c     | 1 -
 hw/intc/s390_flic_kvm.c     | 1 -
 hw/isa/lpc_ich9.c           | 1 -
 hw/isa/piix4.c              | 1 -
 hw/moxie/moxiesim.c         | 1 -
 hw/nios2/generic_nommu.c    | 1 -
 hw/nubus/nubus-bus.c        | 1 -
 hw/nvram/spapr_nvram.c      | 1 -
 hw/rx/rx-gdbsim.c           | 1 -
 hw/s390x/s390-ccw.c         | 1 -
 hw/s390x/virtio-ccw.c       | 1 -
 hw/timer/mips_gictimer.c    | 1 -
 hw/usb/xen-usb.c            | 1 -
 hw/vfio/ap.c                | 1 -
 hw/vfio/ccw.c               | 1 -
 hw/xen/xen-bus-helper.c     | 1 -
 27 files changed, 27 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 9d0d728180bc..3ec30ca5afa4 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,7 +20,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
-#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 40cdb5c6d2cb..b8d38c9e8d04 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -22,7 +22,6 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index ba1af1cfc450..ddae738d5631 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-#include "hw/sysbus.h"
 #include "hw/char/riscv_htif.h"
 #include "hw/char/serial.h"
 #include "chardev/char.h"
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index ee7adb8e3083..fe1266678932 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -19,7 +19,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-#include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "hw/irq.h"
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index b20038991a6c..dd6bc27b3b5d 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
 #include "trace.h"
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 2b2a7b5e9aab..d14f932eea2e 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -32,7 +32,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
-#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index bde44e27b432..d3f9d1a06eb3 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -26,7 +26,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
-#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 7f32e87731d9..109de9e2d112 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -26,7 +26,6 @@
 
 #include "hw/ide/ahci.h"
 #include "hw/ide/internal.h"
-#include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 60afb94c780e..275737842e95 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -26,7 +26,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
-#include "hw/sysbus.h"
 #include "exec/hwaddr.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 9494185cf467..49f79a8674b0 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -23,7 +23,6 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "migration/blocker.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa9719828..d63f8af604d6 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/sysbus.h"
 #include "hw/intc/arm_gicv3.h"
 #include "gicv3_internal.h"
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 65a4c880a351..5c09f00dec2b 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -22,7 +22,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/intc/arm_gicv3_common.h"
-#include "hw/sysbus.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index b3fb9f83952e..d1c8fb8016a0 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -17,7 +17,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "sysemu/kvm.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/s390x/adapter.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3963b7352070..160bea447aab 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -34,7 +34,6 @@
 #include "qapi/visitor.h"
 #include "qemu/range.h"
 #include "hw/isa/isa.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index b3b6a4378a33..48c5dda2b659 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -29,7 +29,6 @@
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
-#include "hw/sysbus.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
 #include "hw/timer/i8254.h"
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index f7b57fcae190..196b730589d4 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -29,7 +29,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "net/net.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index 19899e2c1ef8..b70a42dc2fc2 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -31,7 +31,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 
-#include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/boards.h"
 #include "exec/memory.h"
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 942a6d5342d3..5c134523082e 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -10,7 +10,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/nubus/nubus.h"
-#include "hw/sysbus.h"
 #include "qapi/error.h"
 
 
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 01f775201463..3bb4654c5895 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -33,7 +33,6 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
-#include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/nvram/chrp_nvram.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 8c611b0a59ea..9b82feff5284 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -22,7 +22,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "hw/sysbus.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index b497571863f6..242491a1aea0 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -15,7 +15,6 @@
 #include <libgen.h>
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/sysbus.h"
 #include "hw/s390x/css.h"
 #include "hw/s390x/css-bridge.h"
 #include "hw/s390x/s390-ccw.h"
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 8195f3546e43..92b950e09a13 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -17,7 +17,6 @@
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-net.h"
-#include "hw/sysbus.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
diff --git a/hw/timer/mips_gictimer.c b/hw/timer/mips_gictimer.c
index bc44cd934e85..2b0696d4acb5 100644
--- a/hw/timer/mips_gictimer.c
+++ b/hw/timer/mips_gictimer.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/timer/mips_gictimer.h"
 
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 4d266d7bb450..0f7369e7ed64 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -26,7 +26,6 @@
 #include "qemu/config-file.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
-#include "hw/sysbus.h"
 #include "hw/usb.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "monitor/qdev.h"
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 9571c2f91fdc..f9dbec37da20 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -14,7 +14,6 @@
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "hw/vfio/vfio.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/ap-device.h"
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index b2df708e4b01..e752c845e9e4 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -20,7 +20,6 @@
 #include <sys/ioctl.h>
 
 #include "qapi/error.h"
-#include "hw/sysbus.h"
 #include "hw/vfio/vfio.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/s390x/s390-ccw.h"
diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index b459bb939680..5a1e12b374e7 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -6,7 +6,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-bus-helper.h"
-- 
2.31.1


