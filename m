Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6063712B3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:52:43 +0200 (CEST)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUJm-0000mN-DW
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4T-0003OU-LC; Mon, 03 May 2021 04:36:53 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4I-0000l4-1u; Mon, 03 May 2021 04:36:53 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6sSV-1lUqLc3N79-018JTS; Mon, 03
 May 2021 10:36:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] hw: Do not include hw/irq.h if it is not necessary
Date: Mon,  3 May 2021 10:36:13 +0200
Message-Id: <20210503083623.139700-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rlrBx81wL3KTeKUP6/g1BLkp9fv+MPODuBpCnPbR9Axgoiqg//N
 dESAeoTGqGC/MfFVwX7Bcfa5iiQ/4tHZA1/rUwUP5LO/gjgEj1ezDt3+2z4q5WWjqRAJVKv
 qBh9nO7E2uACVod6CEfMTNwFfy6S5FpA/9dol1sy3vg93rtaiqIqza+zKtAZ8nt0yZY3mQ+
 sJMhQYAU4bdbhRYZL0HEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BCoM4Nl+kAY=:3HkADyjtVEzh4nFgihdndl
 gdQNa7hHr3Le2YDUgNw1b6VGcQ0Mlchk9pBbVN4Nj17b51Jzgz2goA6D00TB/YK/yChf/57Q3
 hOkl8uk8FJ1CB6PvibVMFOvnQVP3oTt3fY/QL1TkPcHJtZCHTjk980nBuVqezBjKaKk/dx2VJ
 LG6UDKiQm16yaBm6XzbVUWAbaxTON4GLaHKOEZD4ryCSGfgvGnIyHrrlMU8BnLc4pWKZj+yZR
 W3Qdy3bge0YOzAI5lZhuQQbRzL1+1wcnVNmmFT3wTfW7PS5a7FY4B+8OXv2AP2PMTXD7AXtsM
 ZhbMMA9c4DhyIGrRVqD7Fyz9ANsxXrZ/8XHf8CnbFT6B+o9I2NdyTKvWG6HvbURuQA0ykDsZ3
 hzI1IZ7GJwDwqRqyTzq+p/QhqrubcCHiPyVeCrhJ/4gf7sB13dgURvrT1D2fJljVc+nAb67Eh
 joMlsuF+dZue3C3YAKzJCBqVAOGjjQsNdr6wLt6T1+YhjB4yjEXbhJCWH3bqSpFjijiLXeFlj
 cMZyXkX2G9Xlfg2iXwWzgo=
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Many files include hw/irq.h without needing it. Remove the superfluous
include statements.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210327050236.2232347-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/msf2-soc.c           | 1 -
 hw/i386/kvm/ioapic.c        | 1 -
 hw/i386/xen/xen_platform.c  | 1 -
 hw/m68k/q800.c              | 1 -
 hw/m68k/virt.c              | 1 -
 hw/misc/led.c               | 1 -
 hw/misc/virt_ctrl.c         | 1 -
 hw/ppc/prep.c               | 1 -
 hw/riscv/microchip_pfsoc.c  | 1 -
 hw/sd/cadence_sdhci.c       | 1 -
 hw/timer/sse-counter.c      | 1 -
 hw/usb/xlnx-usb-subsystem.c | 1 -
 12 files changed, 12 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index d2c29e82d13a..5cfe7caf8349 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -27,7 +27,6 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "hw/char/serial.h"
-#include "hw/irq.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index dfc3c9800574..71a563181e03 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
 #include "hw/i386/x86.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/ioapic_internal.h"
 #include "hw/i386/apic_internal.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 01ae1fb16184..bf4f20e92b6f 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -27,7 +27,6 @@
 #include "qapi/error.h"
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
-#include "hw/irq.h"
 #include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
 #include "hw/xen/xen-legacy-backend.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1c7f7aa07f07..d1ab1ff77d5c 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 18e6f11041da..9469f82800c9 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -13,7 +13,6 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/misc/led.c b/hw/misc/led.c
index f552b8b6483c..f6d6d68bce59 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -10,7 +10,6 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/led.h"
-#include "hw/irq.h"
 #include "trace.h"
 
 #define LED_INTENSITY_PERCENT_MAX   100
diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
index 2ea01bd7a1f0..3552d7a09abd 100644
--- a/hw/misc/virt_ctrl.c
+++ b/hw/misc/virt_ctrl.c
@@ -5,7 +5,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f1b1efdcef9f..af4ccb9f431f 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -38,7 +38,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/isa/pc87312.h"
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c4146b7a6b38..01537b30ebc9 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -41,7 +41,6 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "chardev/char.h"
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
index 0b371c843d8e..c89538b491f7 100644
--- a/hw/sd/cadence_sdhci.c
+++ b/hw/sd/cadence_sdhci.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
-#include "hw/irq.h"
 #include "hw/sd/cadence_sdhci.h"
 #include "sdhci-internal.h"
 
diff --git a/hw/timer/sse-counter.c b/hw/timer/sse-counter.c
index 0384051f1511..16c0e8ad15db 100644
--- a/hw/timer/sse-counter.c
+++ b/hw/timer/sse-counter.c
@@ -33,7 +33,6 @@
 #include "trace.h"
 #include "hw/timer/sse-counter.h"
 #include "hw/sysbus.h"
-#include "hw/irq.h"
 #include "hw/registerfields.h"
 #include "hw/clock.h"
 #include "hw/qdev-clock.h"
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
index 568257370cb0..c760c3058a42 100644
--- a/hw/usb/xlnx-usb-subsystem.c
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "hw/irq.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
-- 
2.31.1


