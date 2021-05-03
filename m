Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8863712C8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:59:19 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUQA-0000wP-84
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4W-0003Pp-DN; Mon, 03 May 2021 04:36:56 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4J-0000lB-Ma; Mon, 03 May 2021 04:36:56 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4yuK-1lTThi1X9w-010soX; Mon, 03
 May 2021 10:36:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] Do not include hw/boards.h if it's not really necessary
Date: Mon,  3 May 2021 10:36:16 +0200
Message-Id: <20210503083623.139700-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cNf5EshaKyczsJJRDEyMWHm7cWcL0NimzWPwy2+vJVfB2lgOuxd
 SnciXrvCv8F2JND9DsbmRS/8FKb1D2TbZUgQj4HUWc3RmXmXnQ000gluuDKU8yE+DDAItrN
 XhbWxOMiQXGN0sidjVTHhMchpOx9rFhQpIlTxJrqLwwsGfPvIMEOthRyOOqLJsSmeazTrtC
 GoK599amyxjXzRztPJLkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0SaSoR6CzIQ=:QIANHGCRgMjCwRdxx+zj3h
 nvNOFn2eXRWZatBYGDIIMzw6ijYoknt+EzEtgRXtHgaRqxNXbZHY+j8KWa8yuFB7Al2kXRKb2
 CYUhgxuoFwdecKsMrAfiqeZDlNRp8HJI7wmYeVepYqi1+eoYUSmGIdkJ7J9aHGQ7YEFv4PBnx
 wmROwTBp5Zfl2Rq90IPaw+a1pq9NRrWHJpypVX4sdskoBKtnrpWXPK5FiYFTleucnDEs4as5v
 l0ak0bEefQpApiFay8sXzwm3BtaXfUTX6M5gWIesZwh7ymXBdrsSfc+TB/UEMBIUhJveKmDdM
 WmDmQwFR5PAA0SGnlwAq0C2H6AslYrAwKod7SKH09EHq78l7cFwSRg/r5Vl+/mE6h1rW899K5
 zN/1IAfFs/IAfS9IVn3WKJZw0hjeCXlbMB7DSECF1kGJ4TZZ+QHUJ2o0lefhXyKlK2SHVwO1U
 acwYfFov1ClpPyclJ3eQPQGEugKtdO1kj3N4dMzi7qjHeFXD+mvusA8jwiENQzdb/EJFNak6R
 VL6IP2zxD0IaKsUm2hqRS8=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Stop including hw/boards.h in files that don't need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210416171314.2074665-3-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/tcg/tcg-accel-ops-icount.c | 1 -
 accel/tcg/tcg-accel-ops-rr.c     | 1 -
 accel/tcg/tcg-accel-ops.c        | 1 -
 hw/acpi/cpu.c                    | 1 -
 hw/acpi/memory_hotplug.c         | 1 -
 hw/alpha/typhoon.c               | 1 -
 hw/arm/aspeed.c                  | 1 -
 hw/arm/omap1.c                   | 1 -
 hw/arm/omap2.c                   | 1 -
 hw/arm/strongarm.c               | 1 -
 hw/arm/virt.c                    | 1 -
 hw/avr/arduino.c                 | 1 -
 hw/avr/atmega.c                  | 1 -
 hw/display/next-fb.c             | 1 -
 hw/hppa/machine.c                | 1 -
 hw/i386/acpi-build.c             | 1 -
 hw/i386/acpi-microvm.c           | 1 -
 hw/i386/intel_iommu.c            | 1 -
 hw/i386/pc.c                     | 1 -
 hw/i386/x86-iommu.c              | 1 -
 hw/intc/sifive_plic.c            | 1 -
 hw/mips/loongson3_virt.c         | 1 -
 hw/ppc/e500.c                    | 1 -
 hw/ppc/mac_newworld.c            | 1 -
 hw/ppc/mac_oldworld.c            | 1 -
 hw/ppc/pnv.c                     | 1 -
 hw/ppc/ppc4xx_devs.c             | 1 -
 hw/ppc/rs6000_mc.c               | 1 -
 hw/ppc/spapr.c                   | 1 -
 hw/ppc/spapr_rtas.c              | 1 -
 hw/remote/iohub.c                | 1 -
 hw/s390x/s390-virtio-ccw.c       | 2 --
 hw/tricore/tc27x_soc.c           | 1 -
 hw/tricore/triboard.c            | 1 -
 softmmu/vl.c                     | 1 -
 35 files changed, 36 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 13b8fbeb699d..ea42d1d51b10 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -30,7 +30,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
-#include "hw/boards.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-icount.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 018b54c508fa..c02c061ecb35 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -30,7 +30,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
-#include "hw/boards.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 6cdcaa2855c8..7191315aeed4 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,7 +32,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
-#include "hw/boards.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index e2317be546b3..f82e9512fdf5 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include "hw/boards.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/cpu.h"
 #include "qapi/error.h"
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 0bdcf15528f3..af3788942350 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -2,7 +2,6 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/pc-hotplug.h"
 #include "hw/mem/pc-dimm.h"
-#include "hw/boards.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
 #include "trace.h"
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index a42b31981216..96c35c5fdbd8 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -11,7 +11,6 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/boards.h"
 #include "hw/irq.h"
 #include "alpha_sys.h"
 #include "exec/address-spaces.h"
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c4f85dab63b3..b1e5bc76e4d2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -16,7 +16,6 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
-#include "hw/boards.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/tmp105.h"
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 02c0f66431b9..180d3788f891 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -24,7 +24,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
-#include "hw/boards.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 16d388fc79d5..02b1aa8c974b 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -27,7 +27,6 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-#include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index e3e3ea61634f..939a57dda558 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -30,7 +30,6 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 881969af6b25..d8cfdf23c622 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -36,7 +36,6 @@
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
-#include "hw/boards.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 3ff31492fa6d..48ef478346e9 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/boards.h"
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 44c6afebbb66..80b8a41cb5a5 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -18,7 +18,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
-#include "hw/boards.h" /* FIXME memory_region_allocate_system_memory for sram */
 #include "hw/misc/unimp.h"
 #include "atmega.h"
 
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index cc134c2d5beb..dd6a1aa8aeeb 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "ui/console.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
 #include "framebuffer.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f2b71db9bd79..2a46af5bc9b7 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -9,7 +9,6 @@
 #include "cpu.h"
 #include "elf.h"
 #include "hw/loader.h"
-#include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750aeff6..bfecb0038cb9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,7 +43,6 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
-#include "hw/boards.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index ccd3303aacac..1a0f77b91111 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,7 +30,6 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
-#include "hw/boards.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6be8f3291854..1c106434325d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -31,7 +31,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic-msidef.h"
-#include "hw/boards.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/pci-host/q35.h"
 #include "sysemu/kvm.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 364816efc9d2..88ca37bb6591 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -74,7 +74,6 @@
 #include "qemu/cutils.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
-#include "hw/boards.h"
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 5f4301639c5b..86ad03972e70 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "hw/boards.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/pc.h"
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 6a53e6329924..78903beb06d3 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -25,7 +25,6 @@
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "hw/pci/msi.h"
-#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index f9c0873a9865..1d6573bc6335 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -32,7 +32,6 @@
 #include "cpu.h"
 #include "elf.h"
 #include "kvm_mips.h"
-#include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/intc/loongson_liointc.h"
 #include "hw/mips/mips.h"
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 79467ac51237..03b3bd322fdf 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -25,7 +25,6 @@
 #include "qemu/config-file.h"
 #include "hw/char/serial.h"
 #include "hw/pci/pci.h"
-#include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 21759628466f..9659857dba8c 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -58,7 +58,6 @@
 #include "hw/pci/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
-#include "hw/boards.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 963d247f5f54..95d3d9515854 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -38,7 +38,6 @@
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
-#include "hw/boards.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6faf1fe4733d..22b1c4f1f3c2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -52,7 +52,6 @@
 #include "hw/ppc/pnv_pnor.h"
 
 #include "hw/isa/isa.h"
-#include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/rtc/mc146818rtc.h"
 
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index fe9d4f7155e1..980c48944fc7 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -29,7 +29,6 @@
 #include "hw/irq.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
-#include "hw/boards.h"
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index 4db5b51a2dd0..c0bc212e9240 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -23,7 +23,6 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
-#include "hw/boards.h"
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 529ff056dd2a..0ee61b312859 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -54,7 +54,6 @@
 #include "cpu-models.h"
 #include "hw/core/cpu.h"
 
-#include "hw/boards.h"
 #include "hw/ppc/ppc.h"
 #include "hw/loader.h"
 
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c6289b..fb64be1150db 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -41,7 +41,6 @@
 #include "hw/ppc/spapr_rtas.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/ppc/ppc.h"
-#include "hw/boards.h"
 
 #include <libfdt.h>
 #include "hw/ppc/spapr_drc.h"
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index e4ff131a6b84..547d597f0feb 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/thread.h"
-#include "hw/boards.h"
 #include "hw/remote/machine.h"
 #include "hw/remote/iohub.h"
 #include "qemu/main-loop.h"
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 56b52d2d3091..0a97310d4239 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -14,10 +14,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "exec/ram_addr.h"
-#include "hw/boards.h"
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/s390_flic.h"
diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
index dea9ba3cca79..dcccdba78623 100644
--- a/hw/tricore/tc27x_soc.c
+++ b/hw/tricore/tc27x_soc.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
 #include "qemu/units.h"
 #include "hw/misc/unimp.h"
diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
index 16e2fd7e27ed..f8d5f7a78761 100644
--- a/hw/tricore/triboard.c
+++ b/hw/tricore/triboard.c
@@ -24,7 +24,6 @@
 #include "hw/qdev-properties.h"
 #include "cpu.h"
 #include "net/net.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "elf.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb52613888..307944aef302 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -27,7 +27,6 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "exec/cpu-common.h"
-#include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
-- 
2.31.1


