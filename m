Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F53712B7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:54:45 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldULk-0002rk-TM
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4Q-0003L1-Np; Mon, 03 May 2021 04:36:50 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0000jg-1T; Mon, 03 May 2021 04:36:50 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPowd-1lyhyT0Sah-00Mqh8; Mon, 03
 May 2021 10:36:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] hw: Remove superfluous includes of hw/hw.h
Date: Mon,  3 May 2021 10:36:11 +0200
Message-Id: <20210503083623.139700-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qJJcNkkoNDU0b17yiRgPKwXfpJgvZy81hUIw2fiu/sSlD5M2Iok
 2wUgo+byFsh3rUieISg1+od0eeHbOvbV+Ewc02ou8QBmJk6ov7eZ/2YdLVYLSBcvoqmf8Cy
 kQR/Y0wwyNqT8C4hzKsEdm+Y5Vle6bzFmp7pKfN1cEXHPlvgVbB2qN53FQ/hI853102hB1h
 NXsHYWTguSk8aFzSjU/vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJIgmlEO6IQ=:vbUsUc5nYHbGaIWX25EZZr
 tWxUb1XFDghLQGfknznCeMYM6CJiQ18wGjz8PH7wqdagDnggxnqKEvMlHEkzZn0ZNHT0Z1Mff
 gK15eW5WfWdab6Jmg5LdtoFjirs+5sNxUU6coK9xPnGk4q1srBbzZpCDGkeBlYiKRipNx9xhR
 MlqUwOvddxeQJhddUcEnw3FHVlJ7QGnfAXyt4NDXJmYsxZ4SQnafgvNejVXUGxUpI2Z3wQAUC
 GxiKIMecz92HThp3VbHWCj0RBTGrQUksY1j3CQ29GhFtnetEeE5EsqtZ3DG2jfJGdXhyaC/Cm
 htw4FwvbZ+MwnDQ1nrblptkN7fCX8T3Z+2XZQA4YiDnHkhvhxpl9mcO7vB9+nYIllQswDz1i4
 SBszL1Wd4bHqoQx5H+5W+hgF7fcYSYsRIz5w7HziYDUaPZAbIQCnYIYzk3g3qtt/31/tBXz3U
 4qAnsrrUxwIYKfG1zKmip0u9WsLfja7DuVXKXMuXLOgxEF0q3LpNr9fBsnG3zn1L0YHB0Wv8/
 ZP0WbpJ4gd/cmxnLlAbQ5U=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

The include/hw/hw.h header only has a prototype for hw_error(),
so it does not make sense to include this in files that do not
use this function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210326151848.2217216-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
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
index 9cebece2de0b..7d67dc72542e 100644
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
index 3a00ba7f006c..ee7adb8e3083 100644
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
index e2d895109dbe..cc134c2d5beb 100644
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
index e1f6fedbda73..9b2ac2017d9d 100644
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
index 98324dadcd4c..797b4fed8f5f 100644
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
index 1a8565794846..a8f5defcd01e 100644
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
index 0786e5733880..60afb94c780e 100644
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
index cf02f57a7117..4cd30188c053 100644
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
index c11b5281f199..bee40e25bca0 100644
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
index 4d2e866eec7f..1c7f7aa07f07 100644
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
index e9a5d4c69b97..18e6f11041da 100644
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
index 15cf3d77252c..43d8e970abc0 100644
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
index 8b0d1cacd7ef..f4fd55a0e5c7 100644
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
index 248a3133455c..89571eded53f 100644
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
index 8ec4ee4b41fc..a8702c6a5d44 100644
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
index 2deb2072cc8e..56df45bfe592 100644
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
index b1d7c2488ff3..8c611b0a59ea 100644
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
index 9c34ce14de64..31ddccf2cdbb 100644
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
index b90cf3d37c30..e21a6ede1140 100644
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
index bb5753240367..62eaa1528eff 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -24,7 +24,6 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 /* Offsets of registers. */
diff --git a/include/hw/misc/avr_power.h b/include/hw/misc/avr_power.h
index 707df030b187..388e421aa7ba 100644
--- a/include/hw/misc/avr_power.h
+++ b/include/hw/misc/avr_power.h
@@ -26,7 +26,6 @@
 #define HW_MISC_AVR_POWER_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 
diff --git a/include/hw/misc/stm32f4xx_exti.h b/include/hw/misc/stm32f4xx_exti.h
index 24b6fa7724b1..ea6b0097b0eb 100644
--- a/include/hw/misc/stm32f4xx_exti.h
+++ b/include/hw/misc/stm32f4xx_exti.h
@@ -26,7 +26,6 @@
 #define HW_STM_EXTI_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 #define EXTI_IMR   0x00
diff --git a/include/hw/misc/stm32f4xx_syscfg.h b/include/hw/misc/stm32f4xx_syscfg.h
index 8c31feccd379..6f8ca49228b6 100644
--- a/include/hw/misc/stm32f4xx_syscfg.h
+++ b/include/hw/misc/stm32f4xx_syscfg.h
@@ -26,7 +26,6 @@
 #define HW_STM_SYSCFG_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 #define SYSCFG_MEMRMP  0x00
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 24fd53942cab..7fcfd9485c0f 100644
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
index 053625433789..a1a032a24dc8 100644
--- a/include/hw/timer/avr_timer16.h
+++ b/include/hw/timer/avr_timer16.h
@@ -30,7 +30,6 @@
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
-#include "hw/hw.h"
 #include "qom/object.h"
 
 enum NextInterrupt {
-- 
2.31.1


