Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44965BB807
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:53:52 +0200 (CEST)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZWON-0000wO-A5
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZWMJ-0007kR-Dr; Sat, 17 Sep 2022 07:51:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZWMG-0001rS-O9; Sat, 17 Sep 2022 07:51:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DA8ED759B50;
 Sat, 17 Sep 2022 13:51:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A32EF746E06; Sat, 17 Sep 2022 13:51:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] Remove unused MAX_IDE_BUS define
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: richard.henderson@linaro.org, deller@gmx.de, chenhuacai@kernel.org,
 f4bug@amsat.org, 
 jiaxun.yang@flygoat.com,aurelien@aurel32.net,hpoussin@reactos.org,
 mark.cave-ayland@ilande.co.uk
Message-Id: <20220917115136.A32EF746E06@zero.eik.bme.hu>
Date: Sat, 17 Sep 2022 13:51:36 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Several machines have an unused MAX_IDE_BUS define. Remove it from
these machines that don't need it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/alpha/dp264.c    | 2 --
 hw/hppa/machine.c   | 2 --
 hw/mips/fuloong2e.c | 1 -
 hw/mips/malta.c     | 2 --
 hw/ppc/prep.c       | 2 --
 hw/sparc64/sun4u.c  | 1 -
 6 files changed, 10 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f4349eba83..c502c8c62a 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -20,8 +20,6 @@
 #include "qemu/datadir.h"
 #include "net/net.h"
 
-#define MAX_IDE_BUS 2
-
 static uint64_t cpu_alpha_superpage_to_phys(void *opaque, uint64_t addr)
 {
     if (((addr >> 41) & 3) == 2) {
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e53d5f0fa7..355b3aac2e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -30,8 +30,6 @@
 #include "qemu/log.h"
 #include "net/net.h"
 
-#define MAX_IDE_BUS 2
-
 #define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */
 
 #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 5ee546f5f6..8c747ac1a0 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -49,7 +49,6 @@
 
 /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
 #define BIOS_SIZE               (512 * KiB)
-#define MAX_IDE_BUS             2
 
 /*
  * PMON is not part of qemu and released with BSD license, anyone
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..5099ed9592 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -69,8 +69,6 @@
 
 #define FLASH_SIZE          0x400000
 
-#define MAX_IDE_BUS         2
-
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f08714f2ec..fcbe4c5837 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -50,8 +50,6 @@
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
 
-#define MAX_IDE_BUS 2
-
 #define CFG_ADDR 0xf0000510
 
 #define KERNEL_LOAD_ADDR 0x01000000
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0e27715ac4..387181ff77 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -66,7 +66,6 @@
 #define PBM_PCI_IO_BASE      (PBM_SPECIAL_BASE + 0x02000000ULL)
 #define PROM_FILENAME        "openbios-sparc64"
 #define NVRAM_SIZE           0x2000
-#define MAX_IDE_BUS          2
 #define BIOS_CFG_IOPORT      0x510
 #define FW_CFG_SPARC64_WIDTH (FW_CFG_ARCH_LOCAL + 0x00)
 #define FW_CFG_SPARC64_HEIGHT (FW_CFG_ARCH_LOCAL + 0x01)
-- 
2.30.4


