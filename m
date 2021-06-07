Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70539E70F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:02:57 +0200 (CEST)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKWV-0005CW-Kr
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRf-0003yX-7H; Mon, 07 Jun 2021 14:57:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:36131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRX-0005r7-MF; Mon, 07 Jun 2021 14:57:54 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mbiak-1lDPNp0Lsc-00dGde; Mon, 07
 Jun 2021 20:57:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] misc: Correct relative include path
Date: Mon,  7 Jun 2021 20:57:22 +0200
Message-Id: <20210607185730.346641-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jw3HQtxNiKPDJMtUHxgYRSZuZy7t4+BPFfUmvx00JH26+BANwLa
 aPyRtu4y30IciCY4W4tbQ3AO3X/rsQxUVb5fU0tKI5jCWCfIFqXXaYiqcB+SsjdMI35WQSZ
 CLF8J5G3i+b/Tt1mseAo5LD4JvtwL0oSddfzPZ4fKwcgzJJSpOUK4PItLObHTmkovj2ge44
 Ro6pw0c1W4etxh7aVow0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:idTwRSoV58s=:5Wc+ZHyt5fX+vyutrhVQnD
 jCFXJh1GPTDPUU8VEIiFHbPsiH9M2/lBCY5RNe9ZOpg87OWJVprhiYyxrcH0FD6da0zaroRwm
 fmr1kaLMXmr0BQuQLETzRtcqhx+VXWkFI2AICJQK5Z2E0zglBXsPRcNjOwjh9QwCvGGjjF1qW
 L+zg9Y836pRalEvqpwGgSL3YcVDZIw5QgY+4kYgiXqrWfvD48OF76+GXI0zcoGflpF9t6F1oI
 SeZxjOzlBmaCJ4Rn46nZUm1MBXNBScoiWwKNzJ63JpduMhn8a0B3id+hx9UeQOLR0q/PZNQgm
 SZfYrAnnhLKGuzbl0kCQnjNUHNWV096aFFQ2WnBkMuh/3oS2idwV53eL5DesPw3VPuutgHVYR
 7abj2fcHHUwYghDGPH4XfqGoOA1gv91cQJdLSxurRPbgnA8wTJ8lWqlGpikFCdj/2Gj+ruIt0
 BADa36FDIF891qnY+bgxU59cO9qxqABcrqPoIMCH5LiGcNdIMjrbF7vGfWgSlSOjHJHjqoS/Z
 XRziy91CUNoj6aFlnGwIhM=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Headers should be included from the 'include/' directory,
not from the root directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210516205034.694788-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/gpio/aspeed_gpio.c     | 2 +-
 hw/i386/acpi-common.h     | 6 +++---
 hw/intc/ppc-uic.c         | 2 +-
 include/monitor/monitor.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 34d8acb0e37a..6ae0116be70b 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -10,7 +10,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/log.h"
 #include "hw/gpio/aspeed_gpio.h"
-#include "include/hw/misc/aspeed_scu.h"
+#include "hw/misc/aspeed_scu.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "hw/irq.h"
diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index b12cd73ea5de..a68825acf50b 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -1,9 +1,9 @@
 #ifndef HW_I386_ACPI_COMMON_H
 #define HW_I386_ACPI_COMMON_H
-#include "include/hw/acpi/acpi_dev_interface.h"
 
-#include "include/hw/acpi/bios-linker-loader.h"
-#include "include/hw/i386/x86.h"
+#include "hw/acpi/acpi_dev_interface.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "hw/i386/x86.h"
 
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
index 7171de7b3558..60013f2dde34 100644
--- a/hw/intc/ppc-uic.c
+++ b/hw/intc/ppc-uic.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "include/hw/intc/ppc-uic.h"
+#include "hw/intc/ppc-uic.h"
 #include "hw/irq.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index af3887bb71d5..1211d6e6d69f 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -4,7 +4,7 @@
 #include "block/block.h"
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
-#include "include/exec/hwaddr.h"
+#include "exec/hwaddr.h"
 
 typedef struct MonitorHMP MonitorHMP;
 typedef struct MonitorOptions MonitorOptions;
-- 
2.31.1


