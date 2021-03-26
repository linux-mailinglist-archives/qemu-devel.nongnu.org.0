Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD034AB59
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:21:09 +0100 (CET)
Received: from localhost ([::1]:40382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoGq-0004nR-EO
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPoEx-0003Xa-RQ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lPoEv-0008KF-Jy
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616771949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3SkKvwTtPHdsy10fzaX38+CySrD6uI4St7cl+EGaC+0=;
 b=HOgNzcP1xoBw+sJ5qvfek4ASj7SG8i/o2NrZn1og2UpreSSPjLKyGPey56DEQNiJwLnHGR
 rYCdOVDPR9THtP39NahKi1xiCPBR9Z3OwXREVCy0p4eTZV48LaaE34RRMKlcXjrOQPDwDL
 ZS4Xl3P9C3TlNYbR+OJloWNVQrN0LMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-YZQmpglnML24qx4QsJXTmw-1; Fri, 26 Mar 2021 11:19:07 -0400
X-MC-Unique: YZQmpglnML24qx4QsJXTmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0D96189CD14;
 Fri, 26 Mar 2021 15:18:54 +0000 (UTC)
Received: from thuth.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A3C35C541;
 Fri, 26 Mar 2021 15:18:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Remove superfluous includes of hw/hw.h
Date: Fri, 26 Mar 2021 16:18:48 +0100
Message-Id: <20210326151848.2217216-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The include/hw/hw.h header only has a prototype for hw_error(),
so it does not make sense to include this in files that do not
use this function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/musicpal.c                  | 1 -
 hw/char/sifive_uart.c              | 1 -
 hw/display/next-fb.c               | 1 -
 hw/dma/sifive_pdma.c               | 1 -
 hw/dma/xlnx_csu_dma.c              | 1 -
 hw/hppa/lasi.c                     | 1 -
 hw/input/lasips2.c                 | 1 -
 hw/m68k/mcf_intc.c                 | 1 -
 hw/m68k/next-kbd.c                 | 1 -
 hw/m68k/q800.c                     | 1 -
 hw/m68k/virt.c                     | 1 -
 hw/misc/mchp_pfsoc_dmc.c           | 1 -
 hw/misc/mchp_pfsoc_ioscb.c         | 1 -
 hw/misc/mchp_pfsoc_sysreg.c        | 1 -
 hw/misc/sifive_e_prci.c            | 1 -
 hw/misc/sifive_test.c              | 1 -
 hw/rx/rx-gdbsim.c                  | 1 -
 hw/rx/rx62n.c                      | 1 -
 hw/vfio/pci-quirks.c               | 1 -
 include/hw/char/avr_usart.h        | 1 -
 include/hw/misc/avr_power.h        | 1 -
 include/hw/misc/stm32f4xx_exti.h   | 1 -
 include/hw/misc/stm32f4xx_syscfg.h | 1 -
 include/hw/pci-host/i440fx.h       | 1 -
 include/hw/timer/avr_timer16.h     | 1 -
 25 files changed, 25 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9cebece2de..7d67dc7254 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -19,7 +19,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
-#include "hw/hw.h"
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 3a00ba7f00..ee7adb8e30 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -22,7 +22,6 @@
 #include "hw/sysbus.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/char/sifive_uart.h"
 
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index e2d895109d..cc134c2d5b 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "ui/console.h"
-#include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "framebuffer.h"
diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index e1f6fedbda..9b2ac2017d 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -24,7 +24,6 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 98324dadcd..797b4fed8f 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 1a85657948..a8f5defcd0 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -15,7 +15,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "trace.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0786e57338..60afb94c78 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
-#include "hw/hw.h"
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
 #include "hw/sysbus.h"
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index cf02f57a71..4cd30188c0 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -11,7 +11,6 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/m68k/mcf.h"
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index c11b5281f1..bee40e25bc 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -30,7 +30,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/m68k/next-cube.h"
 #include "ui/console.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 4d2e866eec..1c7f7aa07f 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -26,7 +26,6 @@
 #include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
-#include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/or-irq.h"
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e9a5d4c69b..18e6f11041 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -12,7 +12,6 @@
 #include "qemu-common.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
-#include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/misc/mchp_pfsoc_dmc.c b/hw/misc/mchp_pfsoc_dmc.c
index 15cf3d7725..43d8e970ab 100644
--- a/hw/misc/mchp_pfsoc_dmc.c
+++ b/hw/misc/mchp_pfsoc_dmc.c
@@ -24,7 +24,6 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_dmc.h"
 
diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
index 8b0d1cacd7..f4fd55a0e5 100644
--- a/hw/misc/mchp_pfsoc_ioscb.c
+++ b/hw/misc/mchp_pfsoc_ioscb.c
@@ -24,7 +24,6 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_ioscb.h"
 
diff --git a/hw/misc/mchp_pfsoc_sysreg.c b/hw/misc/mchp_pfsoc_sysreg.c
index 248a313345..89571eded5 100644
--- a/hw/misc/mchp_pfsoc_sysreg.c
+++ b/hw/misc/mchp_pfsoc_sysreg.c
@@ -24,7 +24,6 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/misc/mchp_pfsoc_sysreg.h"
 
diff --git a/hw/misc/sifive_e_prci.c b/hw/misc/sifive_e_prci.c
index 8ec4ee4b41..a8702c6a5d 100644
--- a/hw/misc/sifive_e_prci.c
+++ b/hw/misc/sifive_e_prci.c
@@ -23,7 +23,6 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "hw/hw.h"
 #include "hw/misc/sifive_e_prci.h"
 
 static uint64_t sifive_e_prci_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/misc/sifive_test.c b/hw/misc/sifive_test.c
index 2deb2072cc..56df45bfe5 100644
--- a/hw/misc/sifive_test.c
+++ b/hw/misc/sifive_test.c
@@ -24,7 +24,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
-#include "hw/hw.h"
 #include "hw/misc/sifive_test.h"
 
 static uint64_t sifive_test_read(void *opaque, hwaddr addr, unsigned int size)
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index b1d7c2488f..8c611b0a59 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -22,7 +22,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 9c34ce14de..31ddccf2cd 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/hw.h"
 #include "hw/rx/rx62n.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index b90cf3d37c..e21a6ede11 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -22,7 +22,6 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include <sys/ioctl.h>
-#include "hw/hw.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/qdev-properties.h"
 #include "pci.h"
diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index bb57532403..62eaa1528e 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -24,7 +24,6 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 /* Offsets of registers. */
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index 707df030b1..388e421aa7 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -26,7 +26,6 @@
 #define HW_MISC_AVR_POWER_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index 24b6fa7724..ea6b0097b0 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -26,7 +26,6 @@
 #define HW_STM_EXTI_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 #define EXTI_IMR   0x00
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index 8c31feccd3..6f8ca49228 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -26,7 +26,6 @@
 #define HW_STM_SYSCFG_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 #define SYSCFG_MEMRMP  0x00
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 24fd53942c..7fcfd9485c 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -11,7 +11,6 @@
 #ifndef HW_PCI_I440FX_H
 #define HW_PCI_I440FX_H
 
-#include "hw/hw.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/pam.h"
 #include "qom/object.h"
diff --git a/include/hw/timer/avr_timer16.h b/include/hw/timer/avr_timer16.h
index 0536254337..a1a032a24d 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -30,7 +30,6 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 enum NextInterrupt {
-- 
2.27.0


