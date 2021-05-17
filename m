Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB035382B5C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:43:52 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libf5-0002iE-Ua
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9w-0004In-8Y
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9r-0000Vo-G5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so1091114wmc.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F3xT3Oufi0Stl9YtwAKlM/UewCKyojtDIt7fPqgzDQ4=;
 b=s5QwHIwsXM24DwAdKJIJQPfAODSPP3xfLQhXKSnf7lzcmnG9Bhv+Ob+ZZ1ocEKaSZI
 OsDNG0hwkPVSadU1V70CJ/ynk2EJ9hZzRr5izsUcTi1OIBA+EBp+bB9HG/HunMfGAw+f
 DMkRuIW/KoqKEqgInC7tksPGk0ABEFwQT14RU2tn21vroUSpbIWrcDvppLDTgIoZwl1+
 ZBNE31+7YJBfYk0n3+F/1jMfw4vQNTt5QJNmL2BfFkH+J2E3OiGZnsbjCnmzjZ1v2/Ob
 6VK7tDr+LKiovwMbwiCD9ijSaDZuS/zOKmBQ+9iLDG9DX8pIFVI/ql4kcTvG2Os9L6in
 cE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F3xT3Oufi0Stl9YtwAKlM/UewCKyojtDIt7fPqgzDQ4=;
 b=DDST2vlMuR4vu7o7k5gz0WfyO0zB9JAOHkrl+tUOUMBMajkhDV91VXlDZqMxhwzvQM
 GLPppLuXVXpqTCMW0M0csrniXz0TSY3ZmpneseC1ggSAbsjASwW51Ib31PcVN0SRid2x
 /yNaxBhcVqjNrQBw2qmaJ9B6DyHoYlwKmLyjKFj4LHVT6OOTmfoIyHQMF182v1oJzzx+
 /dcVuqJKFKlundZL5oXqdZm0Mg/bMugx0mmpIq4Sdb/OsKa28SA3xfUx4vj58w1Ev2Dc
 9B8zkA7qI8AI+2GaE6TTwNhk30DJYDxFOMjf+yi2VBrLL/y4J95xrVKR3pjBC5ZYmenp
 CTJg==
X-Gm-Message-State: AOAM532QxzGRBJtFrmeE/IdIGWmWyBjqEYxzWO7udI3HR6HGTxrPwv9W
 ojyUjniZcBFxPL1SrIa8RmtXDiP4l2EvrQ==
X-Google-Smtp-Source: ABdhPJygypIRdX//GvhiByc5Q9EM2lCQbPIkqOKCGBbJ+6lKKG1uZ1/IMARBxvuV13U/bGMVq99O3g==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr22218661wma.173.1621249893032; 
 Mon, 17 May 2021 04:11:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f1sm18871811wrr.63.2021.05.17.04.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] exec: Restrict memory.h to sysemu/
Date: Mon, 17 May 2021 13:11:04 +0200
Message-Id: <20210517111111.1068153-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the memory.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/memory.h,exec/sysemu/memory.h, $(git grep -l exec/memory.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/memory.rst                     | 2 +-
 hw/arm/strongarm.h                        | 2 +-
 hw/display/framebuffer.h                  | 2 +-
 hw/display/vga_int.h                      | 2 +-
 hw/net/i82596.h                           | 2 +-
 hw/net/pcnet.h                            | 2 +-
 hw/ppc/mac.h                              | 2 +-
 hw/usb/hcd-uhci.h                         | 2 +-
 hw/vfio/pci.h                             | 2 +-
 include/exec/address-spaces.h             | 2 +-
 include/exec/cpu-all.h                    | 4 +++-
 include/exec/ioport.h                     | 2 +-
 include/exec/{ => sysemu}/memory.h        | 6 +++---
 include/hw/acpi/acpi.h                    | 2 +-
 include/hw/acpi/tco.h                     | 2 +-
 include/hw/arm/fsl-imx25.h                | 2 +-
 include/hw/arm/fsl-imx31.h                | 2 +-
 include/hw/arm/fsl-imx6.h                 | 2 +-
 include/hw/arm/fsl-imx6ul.h               | 2 +-
 include/hw/arm/omap.h                     | 2 +-
 include/hw/arm/pxa.h                      | 2 +-
 include/hw/boards.h                       | 2 +-
 include/hw/char/riscv_htif.h              | 2 +-
 include/hw/char/serial.h                  | 2 +-
 include/hw/display/macfb.h                | 2 +-
 include/hw/gpio/npcm7xx_gpio.h            | 2 +-
 include/hw/i2c/npcm7xx_smbus.h            | 2 +-
 include/hw/i2c/pm_smbus.h                 | 2 +-
 include/hw/i386/apic_internal.h           | 2 +-
 include/hw/i386/ioapic_internal.h         | 2 +-
 include/hw/ide.h                          | 2 +-
 include/hw/ipmi/ipmi.h                    | 2 +-
 include/hw/isa/apm.h                      | 2 +-
 include/hw/isa/isa.h                      | 2 +-
 include/hw/mem/npcm7xx_mc.h               | 2 +-
 include/hw/mem/pc-dimm.h                  | 2 +-
 include/hw/mips/mips.h                    | 2 +-
 include/hw/misc/auxbus.h                  | 2 +-
 include/hw/misc/mac_via.h                 | 2 +-
 include/hw/misc/mos6522.h                 | 2 +-
 include/hw/misc/npcm7xx_clk.h             | 2 +-
 include/hw/misc/npcm7xx_gcr.h             | 2 +-
 include/hw/misc/npcm7xx_mft.h             | 2 +-
 include/hw/net/msf2-emac.h                | 2 +-
 include/hw/nvram/npcm7xx_otp.h            | 2 +-
 include/hw/pci-host/pam.h                 | 2 +-
 include/hw/pci-host/remote.h              | 2 +-
 include/hw/pci/pci.h                      | 2 +-
 include/hw/pci/pcie_host.h                | 2 +-
 include/hw/pci/shpc.h                     | 2 +-
 include/hw/ppc/mac_dbdma.h                | 2 +-
 include/hw/ppc/ppc4xx.h                   | 2 +-
 include/hw/ppc/xics.h                     | 2 +-
 include/hw/register.h                     | 2 +-
 include/hw/remote/proxy-memory-listener.h | 2 +-
 include/hw/sh4/sh_intc.h                  | 2 +-
 include/hw/sysbus.h                       | 2 +-
 include/hw/timer/npcm7xx_timer.h          | 2 +-
 include/hw/tricore/tricore.h              | 2 +-
 include/hw/usb.h                          | 2 +-
 include/hw/vfio/vfio-common.h             | 2 +-
 include/hw/virtio/vhost-backend.h         | 2 +-
 include/hw/virtio/vhost.h                 | 2 +-
 include/hw/virtio/virtio.h                | 2 +-
 include/hw/xtensa/mx_pic.h                | 2 +-
 include/qemu/iova-tree.h                  | 2 +-
 include/sysemu/dma.h                      | 2 +-
 include/sysemu/hostmem.h                  | 2 +-
 include/sysemu/kvm_int.h                  | 2 +-
 include/sysemu/memory_mapping.h           | 2 +-
 include/sysemu/vhost-user-backend.h       | 2 +-
 target/arm/kvm_arm.h                      | 2 +-
 accel/kvm/kvm-all.c                       | 2 +-
 accel/tcg/cputlb.c                        | 2 +-
 backends/tpm/tpm_util.c                   | 2 +-
 hw/avr/atmega.c                           | 2 +-
 hw/block/nvme.c                           | 2 +-
 hw/block/onenand.c                        | 2 +-
 hw/core/loader-fit.c                      | 2 +-
 hw/core/loader.c                          | 2 +-
 hw/display/edid-region.c                  | 2 +-
 hw/display/tc6393xb.c                     | 2 +-
 hw/i386/acpi-common.c                     | 2 +-
 hw/i386/acpi-microvm.c                    | 2 +-
 hw/i386/pc.c                              | 2 +-
 hw/i386/pc_piix.c                         | 2 +-
 hw/intc/mips_gic.c                        | 2 +-
 hw/intc/ompic.c                           | 2 +-
 hw/misc/omap_gpmc.c                       | 2 +-
 hw/net/ne2000.c                           | 2 +-
 hw/nios2/10m50_devboard.c                 | 2 +-
 hw/nios2/generic_nommu.c                  | 2 +-
 hw/pci-bridge/pci_bridge_dev.c            | 2 +-
 hw/pci-host/remote.c                      | 2 +-
 hw/ppc/pnv_homer.c                        | 2 +-
 hw/ppc/ppc440_uc.c                        | 2 +-
 hw/ppc/sam460ex.c                         | 2 +-
 hw/remote/machine.c                       | 2 +-
 hw/remote/proxy-memory-listener.c         | 2 +-
 hw/timer/sh_timer.c                       | 2 +-
 hw/vfio/common.c                          | 2 +-
 hw/vfio/platform.c                        | 2 +-
 hw/xtensa/sim.c                           | 2 +-
 hw/xtensa/virt.c                          | 2 +-
 hw/xtensa/xtensa_memory.c                 | 2 +-
 hw/xtensa/xtfpga.c                        | 2 +-
 migration/rdma.c                          | 2 +-
 migration/savevm.c                        | 2 +-
 monitor/misc.c                            | 2 +-
 softmmu/ioport.c                          | 2 +-
 softmmu/memory.c                          | 2 +-
 softmmu/memory_mapping.c                  | 2 +-
 softmmu/physmem.c                         | 2 +-
 softmmu/qtest.c                           | 2 +-
 stubs/ram-block.c                         | 2 +-
 target/s390x/misc_helper.c                | 2 +-
 tests/qtest/fuzz/generic_fuzz.c           | 2 +-
 tests/qtest/fuzz/qos_fuzz.c               | 2 +-
 ui/console.c                              | 2 +-
 util/vfio-helpers.c                       | 2 +-
 MAINTAINERS                               | 2 +-
 scripts/analyze-inclusions                | 2 +-
 122 files changed, 126 insertions(+), 124 deletions(-)
 rename include/exec/{ => sysemu}/memory.h (99%)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 5dc8a126829..69d8d81f8ee 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -365,4 +365,4 @@ callbacks are called:
 API Reference
 -------------
 
-.. kernel-doc:: include/exec/memory.h
+.. kernel-doc:: include/exec/sysemu/memory.h
diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
index 192821f6aab..a4d881b5b42 100644
--- a/hw/arm/strongarm.h
+++ b/hw/arm/strongarm.h
@@ -1,7 +1,7 @@
 #ifndef STRONGARM_H
 #define STRONGARM_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "target/arm/cpu-qom.h"
 
 #define SA_CS0          0x00000000
diff --git a/hw/display/framebuffer.h b/hw/display/framebuffer.h
index 38fa0dcec61..04bcf53ed59 100644
--- a/hw/display/framebuffer.h
+++ b/hw/display/framebuffer.h
@@ -1,7 +1,7 @@
 #ifndef QEMU_FRAMEBUFFER_H
 #define QEMU_FRAMEBUFFER_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* Framebuffer device helper routines.  */
 
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 847e784ca6a..b923633cc4f 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -26,7 +26,7 @@
 #define HW_VGA_INT_H
 
 #include "exec/ioport.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "ui/console.h"
 
 #include "hw/display/bochs-vbe.h"
diff --git a/hw/net/i82596.h b/hw/net/i82596.h
index f0bbe810eb2..de5cc7d0c5b 100644
--- a/hw/net/i82596.h
+++ b/hw/net/i82596.h
@@ -3,7 +3,7 @@
 
 #define I82596_IOPORT_SIZE       0x20
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 
 #define PORT_RESET              0x00    /* reset 82596 */
diff --git a/hw/net/pcnet.h b/hw/net/pcnet.h
index f49b213c57f..0ad6bab1f90 100644
--- a/hw/net/pcnet.h
+++ b/hw/net/pcnet.h
@@ -7,7 +7,7 @@
 #define PCNET_LOOPTEST_CRC	1
 #define PCNET_LOOPTEST_NOCRC	2
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/irq.h"
 
 /* BUS CONFIGURATION REGISTERS */
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 22c8408078d..104fab63ccf 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -27,7 +27,7 @@
 #define PPC_MAC_H
 
 #include "qemu/units.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/input/adb.h"
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e61d8fcb192..04a9a517318 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -28,7 +28,7 @@
 #ifndef HW_USB_HCD_UHCI_H
 #define HW_USB_HCD_UHCI_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/timer.h"
 #include "hw/pci/pci.h"
 #include "hw/usb.h"
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 64777516d16..ee647a03d6c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -12,7 +12,7 @@
 #ifndef HW_VFIO_VFIO_PCI_H
 #define HW_VFIO_VFIO_PCI_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/pci/pci.h"
 #include "hw/vfio/vfio-common.h"
 #include "qemu/event_notifier.h"
diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
index db8bfa9a92b..b7533b33f72 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/address-spaces.h
@@ -19,7 +19,7 @@
  * you're one of them.
  */
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 #ifndef CONFIG_USER_ONLY
 
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 3e7edddead5..8f897b4fec6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -20,7 +20,9 @@
 #define CPU_ALL_H
 
 #include "exec/cpu-common.h"
-#include "exec/memory.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "exec/sysemu/memory.h"
+#endif
 #include "qemu/thread.h"
 #include "hw/core/cpu.h"
 #include "qemu/rcu.h"
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index e34f668998d..d5ca8abff76 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -24,7 +24,7 @@
 #ifndef IOPORT_H
 #define IOPORT_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 #define MAX_IOPORTS     (64 * 1024)
 #define IOPORTS_MASK    (MAX_IOPORTS - 1)
diff --git a/include/exec/memory.h b/include/exec/sysemu/memory.h
similarity index 99%
rename from include/exec/memory.h
rename to include/exec/sysemu/memory.h
index 52a2659b396..13288b110e0 100644
--- a/include/exec/memory.h
+++ b/include/exec/sysemu/memory.h
@@ -14,7 +14,9 @@
 #ifndef MEMORY_H
 #define MEMORY_H
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
 #include "exec/cpu-common.h"
 #include "exec/sysemu/hwaddr.h"
@@ -2632,5 +2634,3 @@ bool ram_block_discard_is_disabled(void);
 bool ram_block_discard_is_required(void);
 
 #endif
-
-#endif
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 9e8a76f2e2a..485cab42a93 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -21,7 +21,7 @@
  */
 
 #include "qemu/notify.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/acpi/acpi_dev_interface.h"
 
 /*
diff --git a/include/hw/acpi/tco.h b/include/hw/acpi/tco.h
index a1e0da82134..2bed10d1ab1 100644
--- a/include/hw/acpi/tco.h
+++ b/include/hw/acpi/tco.h
@@ -10,7 +10,7 @@
 #ifndef HW_ACPI_TCO_H
 #define HW_ACPI_TCO_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* As per ICH9 spec, the internal timer has an error of ~0.6s on every tick */
 #define TCO_TICK_NSEC 600000000LL
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 1b1086e9458..e37e1c3afbd 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -30,7 +30,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/usb/chipidea.h"
 #include "hw/watchdog/wdt_imx2.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index c116a73e0b3..28c819b6cde 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -26,7 +26,7 @@
 #include "hw/i2c/imx_i2c.h"
 #include "hw/gpio/imx_gpio.h"
 #include "hw/watchdog/wdt_imx2.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 83291457cf2..3b6e5b086ca 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -32,7 +32,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 7812e516a52..0dbd6e74861 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -36,7 +36,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index ff6a173f8a6..5e60cd3f0d5 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -20,7 +20,7 @@
 #ifndef HW_ARM_OMAP_H
 #define HW_ARM_OMAP_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/input/tsc2xxx.h"
 #include "target/arm/cpu-qom.h"
 #include "qemu/log.h"
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 1095504b86f..91360a1973f 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -10,7 +10,7 @@
 #ifndef PXA_H
 #define PXA_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "target/arm/cpu-qom.h"
 #include "hw/pcmcia.h"
 #include "qom/object.h"
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3d55d2bd62c..e209b8ff3d0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -3,7 +3,7 @@
 #ifndef HW_BOARDS_H
 #define HW_BOARDS_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/blockdev.h"
 #include "qemu/accel.h"
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index fb9452cf51d..d7c6e0cce35 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -22,7 +22,7 @@
 
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "target/riscv/cpu.h"
 
 #define TYPE_HTIF_UART "riscv.htif.uart"
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 8ba7eca3d67..09310c27658 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -27,7 +27,7 @@
 #define HW_SERIAL_H
 
 #include "chardev/char-fe.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/fifo8.h"
 #include "chardev/char.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 80806b0306a..34dde745fa9 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -13,7 +13,7 @@
 #ifndef MACFB_H
 #define MACFB_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "ui/console.h"
 #include "qom/object.h"
 
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index b1d771bd776..fd7a98174db 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -15,7 +15,7 @@
 #ifndef NPCM7XX_GPIO_H
 #define NPCM7XX_GPIO_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 
 /* Number of pins managed by each controller. */
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index 7d59ee917eb..f2092e37e34 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_SMBUS_H
 #define NPCM7XX_SMBUS_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/i2c/pm_smbus.h b/include/hw/i2c/pm_smbus.h
index 0d74207efb5..c52e79de5e4 100644
--- a/include/hw/i2c/pm_smbus.h
+++ b/include/hw/i2c/pm_smbus.h
@@ -1,7 +1,7 @@
 #ifndef PM_SMBUS_H
 #define PM_SMBUS_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/i2c/smbus_master.h"
 
 #define PM_SMBUS_MAX_MSG_SIZE 32
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index c175e7e7181..ecf7cc3d156 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -22,7 +22,7 @@
 #define QEMU_APIC_INTERNAL_H
 
 #include "cpu.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/timer.h"
 #include "target/i386/cpu-qom.h"
 #include "qom/object.h"
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 021e715f113..c824b7d138a 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -22,7 +22,7 @@
 #ifndef QEMU_IOAPIC_INTERNAL_H
 #define QEMU_IOAPIC_INTERNAL_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index c5ce5da4f47..50d07d7e6fe 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -2,7 +2,7 @@
 #define HW_IDE_H
 
 #include "hw/isa/isa.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* ide-isa.c */
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 77a7213ed93..03f71e6b9bd 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -25,7 +25,7 @@
 #ifndef HW_IPMI_H
 #define HW_IPMI_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/include/hw/isa/apm.h b/include/hw/isa/apm.h
index b6e070c00e9..e66f27badeb 100644
--- a/include/hw/isa/apm.h
+++ b/include/hw/isa/apm.h
@@ -1,7 +1,7 @@
 #ifndef APM_H
 #define APM_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 #define APM_CNT_IOPORT  0xb2
 #define ACPI_PORT_SMI_CMD APM_CNT_IOPORT
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index ddaae89a853..9c9aabfc3b0 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -3,7 +3,7 @@
 
 /* ISA bus */
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/ioport.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
index 7ed38be2431..a10a29cea41 100644
--- a/include/hw/mem/npcm7xx_mc.h
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_MC_H
 #define NPCM7XX_MC_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 
 /**
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 1473e6db625..5a88c767631 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -16,7 +16,7 @@
 #ifndef QEMU_PC_DIMM_H
 #define QEMU_PC_DIMM_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 6c9c8805f3f..dc9fbea121e 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -7,7 +7,7 @@
 /* Kernels can be configured with 64KB pages */
 #define INITRD_PAGE_SIZE (64 * KiB)
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* gt64xxx.c */
 PCIBus *gt64120_register(qemu_irq *pic);
diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index b05799d2f7a..4e2db11d705 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -25,7 +25,7 @@
 #ifndef HW_MISC_AUXBUS_H
 #define HW_MISC_AUXBUS_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 3058b30685a..56f44198e2e 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -9,7 +9,7 @@
 #ifndef HW_MISC_MAC_VIA_H
 #define HW_MISC_MAC_VIA_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mos6522.h"
 #include "qom/object.h"
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index fc95d22b0fd..9ae8d861c8e 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -27,7 +27,7 @@
 #ifndef MOS6522_H
 #define MOS6522_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 #include "hw/input/adb.h"
 #include "qom/object.h"
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index d5c8d16ca42..9a425b5cba6 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_CLK_H
 #define NPCM7XX_CLK_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d324..e1f0ebdef38 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_GCR_H
 #define NPCM7XX_GCR_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 
 /*
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
index 36785e3ba81..dd6ec3dba94 100644
--- a/include/hw/misc/npcm7xx_mft.h
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_MFT_H
 #define NPCM7XX_MFT_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/clock.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/net/msf2-emac.h b/include/hw/net/msf2-emac.h
index 846ba6e6dce..eea742f9758 100644
--- a/include/hw/net/msf2-emac.h
+++ b/include/hw/net/msf2-emac.h
@@ -23,7 +23,7 @@
  */
 
 #include "hw/sysbus.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "net/net.h"
 #include "net/eth.h"
 #include "qom/object.h"
diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 156bbd151ab..f7700a2a8e7 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_OTP_H
 #define NPCM7XX_OTP_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 
 /* Each OTP module holds 8192 bits of one-time programmable storage */
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index c1fd06ba2ae..5814a9dbc09 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -50,7 +50,7 @@
  * 0xf0000 - 0xfffff System BIOS Area Memory Segments
  */
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 #define SMRAM_C_BASE    0xa0000
 #define SMRAM_C_END     0xc0000
diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
index 3dcf6aa51d1..1f71b9af138 100644
--- a/include/hw/pci-host/remote.h
+++ b/include/hw/pci-host/remote.h
@@ -11,7 +11,7 @@
 #ifndef REMOTE_PCIHOST_H
 #define REMOTE_PCIHOST_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/pci/pcie_host.h"
 
 #define TYPE_REMOTE_PCIHOST "remote-pcihost"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460c..331421d02f5 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -1,7 +1,7 @@
 #ifndef QEMU_PCI_H
 #define QEMU_PCI_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "sysemu/dma.h"
 
 /* PCI includes legacy ISA access.  */
diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 076457b270e..a084c4b2e81 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -22,7 +22,7 @@
 #define PCIE_HOST_H
 
 #include "hw/pci/pci_host.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qom/object.h"
 
 #define TYPE_PCIE_HOST_BRIDGE "pcie-host-bridge"
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b73990..a51d47b5b9f 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -1,7 +1,7 @@
 #ifndef SHPC_H
 #define SHPC_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/hotplug.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/ppc/mac_dbdma.h b/include/hw/ppc/mac_dbdma.h
index 4a3f644516b..09cee8eff45 100644
--- a/include/hw/ppc/mac_dbdma.h
+++ b/include/hw/ppc/mac_dbdma.h
@@ -23,7 +23,7 @@
 #ifndef HW_MAC_DBDMA_H
 #define HW_MAC_DBDMA_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/iov.h"
 #include "sysemu/dma.h"
 #include "hw/sysbus.h"
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 980f964b5a9..f6360ea1218 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -26,7 +26,7 @@
 #define PPC4XX_H
 
 #include "hw/ppc/ppc.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* PowerPC 4xx core initialization */
 PowerPCCPU *ppc4xx_init(const char *cpu_model,
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 00b80b08c27..7ee4c6bb4a9 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -28,7 +28,7 @@
 #ifndef XICS_H
 #define XICS_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/include/hw/register.h b/include/hw/register.h
index b480e3882cd..e5d3ac63494 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -12,7 +12,7 @@
 #define REGISTER_H
 
 #include "hw/qdev-core.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/registerfields.h"
 #include "qom/object.h"
 
diff --git a/include/hw/remote/proxy-memory-listener.h b/include/hw/remote/proxy-memory-listener.h
index c4f3efb9285..0158b9d599c 100644
--- a/include/hw/remote/proxy-memory-listener.h
+++ b/include/hw/remote/proxy-memory-listener.h
@@ -9,7 +9,7 @@
 #ifndef PROXY_MEMORY_LISTENER_H
 #define PROXY_MEMORY_LISTENER_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "io/channel.h"
 
 typedef struct ProxyMemoryListener {
diff --git a/include/hw/sh4/sh_intc.h b/include/hw/sh4/sh_intc.h
index 65f34250572..0a1b8ae6edb 100644
--- a/include/hw/sh4/sh_intc.h
+++ b/include/hw/sh4/sh_intc.h
@@ -1,7 +1,7 @@
 #ifndef SH_INTC_H
 #define SH_INTC_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 typedef unsigned char intc_enum;
 
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 3564b7b6a22..79a757d8c90 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -4,7 +4,7 @@
 /* Devices attached directly to the main system bus.  */
 
 #include "hw/qdev-core.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qom/object.h"
 
 #define QDEV_MAX_MMIO 32
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index d45c051b56a..ad80f8be284 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -16,7 +16,7 @@
 #ifndef NPCM7XX_TIMER_H
 #define NPCM7XX_TIMER_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 
diff --git a/include/hw/tricore/tricore.h b/include/hw/tricore/tricore.h
index c19ed3f013e..f12edcc390b 100644
--- a/include/hw/tricore/tricore.h
+++ b/include/hw/tricore/tricore.h
@@ -1,7 +1,7 @@
 #ifndef HW_TRICORE_H
 #define HW_TRICORE_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 struct tricore_boot_info {
     uint64_t ram_size;
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 436e07b3040..81936ea296e 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -25,7 +25,7 @@
  * THE SOFTWARE.
  */
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "qemu/iov.h"
 #include "qemu/queue.h"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7ae..d9153b59eb9 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -21,7 +21,7 @@
 #ifndef HW_VFIO_VFIO_COMMON_H
 #define HW_VFIO_VFIO_COMMON_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/queue.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a3..92e09ab4cd2 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -11,7 +11,7 @@
 #ifndef VHOST_BACKEND_H
 #define VHOST_BACKEND_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 typedef enum VhostBackendType {
     VHOST_BACKEND_TYPE_NONE = 0,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415f..58c61d44da0 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -3,7 +3,7 @@
 
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 /* Generic structures common for any vhost based device. */
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb750..c0e7dec20ca 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -14,7 +14,7 @@
 #ifndef QEMU_VIRTIO_H
 #define QEMU_VIRTIO_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-core.h"
 #include "net/net.h"
 #include "migration/vmstate.h"
diff --git a/include/hw/xtensa/mx_pic.h b/include/hw/xtensa/mx_pic.h
index 500424c8d35..a2baeb4bbbd 100644
--- a/include/hw/xtensa/mx_pic.h
+++ b/include/hw/xtensa/mx_pic.h
@@ -28,7 +28,7 @@
 #ifndef XTENSA_MX_PIC_H
 #define XTENSA_MX_PIC_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 struct XtensaMxPic;
 typedef struct XtensaMxPic XtensaMxPic;
diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index 1530cf0e95e..6cced122ac3 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -23,7 +23,7 @@
  * for the thread safety issue.
  */
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/sysemu/hwaddr.h"
 
 #define  IOVA_OK           (0)
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3201e7901db..d06482d8c54 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -10,7 +10,7 @@
 #ifndef DMA_H
 #define DMA_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "block/block.h"
 #include "block/accounting.h"
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index df5644723a3..1693e762e15 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -16,7 +16,7 @@
 #include "sysemu/numa.h"
 #include "qapi/qapi-types-machine.h"
 #include "qom/object.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/bitmap.h"
 
 #define TYPE_MEMORY_BACKEND "memory-backend"
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ccb8869f01b..974179cbc4a 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -9,7 +9,7 @@
 #ifndef QEMU_KVM_INT_H
 #define QEMU_KVM_INT_H
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/accel.h"
 #include "sysemu/kvm.h"
 
diff --git a/include/sysemu/memory_mapping.h b/include/sysemu/memory_mapping.h
index 4b20f1a639e..435e99988d8 100644
--- a/include/sysemu/memory_mapping.h
+++ b/include/sysemu/memory_mapping.h
@@ -16,7 +16,7 @@
 
 #include "qemu/queue.h"
 #include "exec/cpu-defs.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 typedef struct GuestPhysBlock {
     /* visible to guest, reflects PCI hole, etc */
diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
index 327b0b84f1f..7c8bcfd4fc9 100644
--- a/include/sysemu/vhost-user-backend.h
+++ b/include/sysemu/vhost-user-backend.h
@@ -13,7 +13,7 @@
 #define QEMU_VHOST_USER_BACKEND_H
 
 #include "qom/object.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/option.h"
 #include "qemu/bitmap.h"
 #include "hw/virtio/vhost.h"
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa3775..8aea3cd9171 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -12,7 +12,7 @@
 #define QEMU_KVM_ARM_H
 
 #include "sysemu/kvm.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/error-report.h"
 
 #define KVM_ARM_VGIC_V2   (1 << 0)
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e0168e88b9..204fc0403ca 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -31,7 +31,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
 #include "qemu/bswap.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/ram_addr.h"
 #include "qemu/event_notifier.h"
 #include "qemu/main-loop.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 452029e8193..9ecc45180a5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -21,7 +21,7 @@
 #include "qemu/main-loop.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/sysemu/cputlb.h"
 #include "exec/tb-hash.h"
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index a6e6d3e72f1..9a7ee6281db 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -24,7 +24,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "tpm_int.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 80b8a41cb5a..7ccbb80194c 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -12,7 +12,7 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34c..486a1a00f6d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -147,7 +147,7 @@
 #include "qapi/visitor.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/block-backend.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index afc0cd3a0ff..15f18871344 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -26,7 +26,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sysemu/block-backend.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index b7c7b3ba94d..37266aa19ee 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
 #include "qemu/cutils.h"
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a541..8807367dd9e 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -56,7 +56,7 @@
 #include "uboot_image.h"
 #include "hw/loader.h"
 #include "hw/nvram/fw_cfg.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/boards.h"
 #include "qemu/cutils.h"
 #include "sysemu/runstate.h"
diff --git a/hw/display/edid-region.c b/hw/display/edid-region.c
index 675429dc18b..174e26066f7 100644
--- a/hw/display/edid-region.c
+++ b/hw/display/edid-region.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/display/edid.h"
 
 static uint64_t edid_region_read(void *ptr, hwaddr addr, unsigned size)
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 1f28223c7be..f1dfa7f0b6b 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -16,7 +16,7 @@
 #include "qemu/host-utils.h"
 #include "hw/irq.h"
 #include "hw/display/tc6393xb.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf96..2c89ac4b53d 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 1a0f77b9111..dd6eeead376 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -24,7 +24,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8cfaf216e7b..c56dc38fde7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -64,7 +64,7 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/start_info.h"
 #include "ui/qemu-spice.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "sysemu/arch_init.h"
 #include "qemu/bitmap.h"
 #include "qemu/config-file.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea92..a310cd6d608 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,7 +46,7 @@
 #include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/acpi/acpi.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index bda45499258..4f51fc5a1cc 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -14,7 +14,7 @@
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "kvm_mips.h"
diff --git a/hw/intc/ompic.c b/hw/intc/ompic.c
index 1f10314807d..6a899eef19d 100644
--- a/hw/intc/ompic.c
+++ b/hw/intc/ompic.c
@@ -13,7 +13,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qom/object.h"
 
 #define TYPE_OR1K_OMPIC "or1k-ompic"
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 10de7a55236..cec48723d63 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -23,7 +23,7 @@
 #include "hw/irq.h"
 #include "hw/block/flash.h"
 #include "hw/arm/omap.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 
 /* General-Purpose Memory Controller */
diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae21..1cfdb8bb8ed 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "net/eth.h"
 #include "qemu/module.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "ne2000.h"
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd7..1efc61ee7c4 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -30,7 +30,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "qemu/config-file.h"
 
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index fbc18dbd04c..2888de27086 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -32,7 +32,7 @@
 
 #include "hw/char/serial.h"
 #include "hw/boards.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "qemu/config-file.h"
 
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe8..36e3abea0e2 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -28,7 +28,7 @@
 #include "hw/pci/shpc.h"
 #include "hw/pci/slotid_cap.h"
 #include "hw/qdev-properties.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
index eee45444ef7..b1efe292f75 100644
--- a/hw/pci-host/remote.c
+++ b/hw/pci-host/remote.c
@@ -29,7 +29,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/remote.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 static const char *remote_pcihost_root_bus_path(PCIHostState *host_bridge,
                                                 PCIBus *rootbus)
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index 394425232ed..164106d0628 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -20,7 +20,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "exec/sysemu/hwaddr.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "sysemu/cpus.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 993e3ba955d..56cbec984a6 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -15,7 +15,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/irq.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0737234d66e..0f3bf1c5e42 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -24,7 +24,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "ppc440.h"
 #include "ppc405.h"
 #include "hw/block/flash.h"
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5a..3adac7186f5 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -17,7 +17,7 @@
 #include "qemu-common.h"
 
 #include "hw/remote/machine.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index 901dbf13573..d9bed35fa2f 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -12,7 +12,7 @@
 #include "qemu/compiler.h"
 #include "qemu/int128.h"
 #include "qemu/range.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/cpu-common.h"
 #include "exec/ram_addr.h"
 #include "qapi/error.h"
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 58af1a1edbd..c40c1fd7467 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb8..472ab394109 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -28,7 +28,7 @@
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
 #include "exec/address-spaces.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
 #include "qemu/error-report.h"
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index cc3f66f7e44..ea9bcdf2bf7 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -26,7 +26,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "qemu/queue.h"
 #include "hw/sysbus.h"
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 2028fe793d9..5571f96728d 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -32,7 +32,7 @@
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/error-report.h"
 #include "xtensa_memory.h"
 #include "xtensa_sim.h"
diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index a18e3fc910e..c184919958c 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -33,7 +33,7 @@
 #include "hw/pci-host/gpex.h"
 #include "net/net.h"
 #include "elf.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/error-report.h"
 #include "xtensa_memory.h"
 #include "xtensa_sim.h"
diff --git a/hw/xtensa/xtensa_memory.c b/hw/xtensa/xtensa_memory.c
index 2c1095f0170..1793869a96e 100644
--- a/hw/xtensa/xtensa_memory.c
+++ b/hw/xtensa/xtensa_memory.c
@@ -27,7 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/error-report.h"
 #include "xtensa_memory.h"
 
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 17f087b3951..caaf223a997 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -34,7 +34,7 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "elf.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
 #include "hw/sysbus.h"
diff --git a/migration/rdma.c b/migration/rdma.c
index 00eac34232e..7c541ffae0e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -29,7 +29,7 @@
 #include "qemu/sockets.h"
 #include "qemu/bitmap.h"
 #include "qemu/coroutine.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include <sys/socket.h>
 #include <netdb.h>
 #include <arpa/inet.h>
diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72e4b0..83f3df249f1 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -48,7 +48,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "sysemu/cpus.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/target_page.h"
 #include "trace.h"
 #include "qemu/iov.h"
diff --git a/monitor/misc.c b/monitor/misc.c
index f3a393ea590..c1fcd995805 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -59,7 +59,7 @@
 #ifdef CONFIG_TRACE_SIMPLE
 #include "trace/simple.h"
 #endif
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/exec-all.h"
 #include "qemu/option.h"
 #include "qemu/thread.h"
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b936..dfb9fbc7ffa 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -28,7 +28,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/ioport.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3bb533c0bce..d5ab46d76a9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index e7af2765466..60ff72790ea 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -15,7 +15,7 @@
 #include "qapi/error.h"
 
 #include "sysemu/memory_mapping.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/address-spaces.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e1da81ed2f9..20e69b09d68 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -41,7 +41,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
 #include "sysemu/hostmem.h"
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 130c3666154..f1ee4fbc369 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -18,7 +18,7 @@
 #include "sysemu/runstate.h"
 #include "chardev/char-fe.h"
 #include "exec/ioport.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "hw/irq.h"
 #include "qemu/accel.h"
 #include "sysemu/cpu-timers.h"
diff --git a/stubs/ram-block.c b/stubs/ram-block.c
index 108197683bb..02ebd94ebaf 100644
--- a/stubs/ram-block.c
+++ b/stubs/ram-block.c
@@ -1,7 +1,7 @@
 #include "qemu/osdep.h"
 #include "exec/ramlist.h"
 #include "exec/cpu-common.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 
 void *qemu_ram_get_host_addr(RAMBlock *rb)
 {
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 7ea90d414aa..286460bcc05 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -23,7 +23,6 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
-#include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
@@ -34,6 +33,7 @@
 #include "s390-tod.h"
 
 #if !defined(CONFIG_USER_ONLY)
+#include "exec/sysemu/memory.h"
 #include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
 #include "hw/s390x/ebcdic.h"
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e8..05f9c9b06f9 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -20,7 +20,7 @@
 #include "fuzz.h"
 #include "fork_fuzz.h"
 #include "string.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "exec/ramblock.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 7a244c951e5..8301c1d9c69 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -20,7 +20,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "qemu/main-loop.h"
 
 #include "tests/qtest/libqos/libqtest.h"
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b5..e9728a816d0 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -32,7 +32,7 @@
 #include "qemu/timer.h"
 #include "chardev/char-fe.h"
 #include "trace.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "io/channel-file.h"
 #include "qom/object.h"
 
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 911115b86e6..28cca261c2c 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -16,7 +16,7 @@
 #include "qapi/error.h"
 #include "exec/ramlist.h"
 #include "exec/cpu-common.h"
-#include "exec/memory.h"
+#include "exec/sysemu/memory.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "standard-headers/linux/pci_regs.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 4378ec47a2c..d515a954b2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2400,7 +2400,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-F: include/exec/memory.h
+F: include/exec/sysemu/memory.h
 F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
 F: softmmu/dma-helpers.c
diff --git a/scripts/analyze-inclusions b/scripts/analyze-inclusions
index 14806e18c6e..28e60791a61 100644
--- a/scripts/analyze-inclusions
+++ b/scripts/analyze-inclusions
@@ -54,7 +54,7 @@ echo $(grep_include -F 'trace/generated-tracers.h') files include generated-trac
 echo $(grep_include -F 'qapi/error.h') files include qapi/error.h
 echo $(grep_include -F 'qom/object.h') files include qom/object.h
 echo $(grep_include -F 'block/aio.h') files include block/aio.h
-echo $(grep_include -F 'exec/memory.h') files include exec/memory.h
+echo $(grep_include -F 'exec/sysemu/memory.h') files include exec/memory.h
 echo $(grep_include -F 'fpu/softfloat.h') files include fpu/softfloat.h
 echo $(grep_include -F 'qemu/bswap.h') files include qemu/bswap.h
 echo
-- 
2.26.3


