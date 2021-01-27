Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF553053AF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:57:25 +0100 (CET)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4elY-0005QK-3d
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eiw-000408-Et
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:42 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eiu-0000v0-M6
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3D8625807F9;
 Wed, 27 Jan 2021 01:54:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 01:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nPP3ZAHOqb3cF
 SukGTwesi89qqAe/XOZSgK7Axjo7EA=; b=bqFjb+3OZXiYjvhAywFXmxci0SKb8
 7TrbzgMWKR3Fs1lKMyJJ2vuyrGa9xkfVjL8jX/tYSp4XLRvKiOTXd8o7QulKfRsD
 7S+QrTApg2xwve+h5JBIZLA9uYJB3DdEcXgrcG/3zdGHPKMolf39lJkkJCXn7TEQ
 60L1REG19+XE8YXtEecvEMl800ijjhpS6Wuc5wO2ChlIIFzdOILEPNrXck1TqReK
 KSGYSKWDisd4Y8bpdmEvR8ugaCZ2yBxUHPR6iLlGEq9LgyiTuIwetv1hru4dJnzd
 x7KJZjRaTE5EmacOXt7BD9aiIdTaQrG1BleO5rZUngrZjOD+PQs7IYKaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=nPP3ZAHOqb3cFSukGTwesi89qqAe/XOZSgK7Axjo7EA=; b=e/Fc1ga+
 9WyltnkOnT7r9iL9aMwtL0dhJzC32ISKLbM2+8bkahJAFV40O0/x2J1b0ESpVIhJ
 BC2IY+7y0NRTbpxEefW8rw6sg7SwvhBfg0cdiy9KlhE5djM6FPigknnh6lsuovlN
 +BZAknfqspzLbAO28gxVc6C/qDCIt3mEU1APnewQW9GGHQTj6AMKtBPN7pmBNlxf
 UELqgiOpjHRDAnQ8cZdp/NRsz19D2raxmU6lhT8dq7MeCp1XvhZAj7br0N0gHDMc
 F6XF3TR+GOZo8EllxHR76TPvk9ihBH/NNzpQduoxwmgSanMg/sd84YlgnButBroD
 49lSZcDFZkjM3w==
X-ME-Sender: <xms:Lw4RYCbbrF-B-hS8OwgwwY4sKaaZKrAcP8wCzn0uQ60S9QhGEnltEA>
 <xme:Lw4RYM1qV7ZEb7R6fXaAD-T6e7L0uyF3cBiqiEZz3H6bkH4iZ9q4pTOQZU7TocLDv
 fr62RgrI4oSfkMhOUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppeduudehrdduleejrddvvdegrddvvdefnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Lw4RYKWvppxl9xBtlX5TuUb4gRMJiDFbqcZp6vclggG_YXUXhFULpA>
 <xmx:Lw4RYOWKrV8ryLNvzcvWVk04vhBnXBM3uLikBnpgYnvyiUlUhMX_Hw>
 <xmx:Lw4RYBddK7MLLZ9RrB_gDUJCqhcrJH5oAgqC0DqPXwz1rAxEFNRRSw>
 <xmx:MA4RYD-N_kSofeKxCFdxHugMt6DoWPpxXsHyxutKi99JxHUmj5Qw8Q>
Received: from strike.202.net.flygoat.com (unknown [115.197.224.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0702E24005A;
 Wed, 27 Jan 2021 01:54:36 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] hw/mips: Use bl_gen_kernel_jump to generate bootloaders
Date: Wed, 27 Jan 2021 14:54:22 +0800
Message-Id: <20210127065424.114125-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace embedded binary with generated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c    | 17 ++---------------
 hw/mips/fuloong2e.c | 28 ++++------------------------
 hw/mips/malta.c     | 41 ++++++++++-------------------------------
 3 files changed, 16 insertions(+), 70 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 467fbc1c8b..b976c8199a 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -27,6 +27,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cps.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "hw/qdev-clock.h"
@@ -324,21 +325,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
      * a2/$6 = 0
      * a3/$7 = 0
      */
-    stl_p(p++, 0x2404fffe);                     /* li   $4, -2 */
-                                                /* lui  $5, hi(fdt_addr) */
-    stl_p(p++, 0x3c050000 | ((fdt_addr >> 16) & 0xffff));
-    if (fdt_addr & 0xffff) {                    /* ori  $5, lo(fdt_addr) */
-        stl_p(p++, 0x34a50000 | (fdt_addr & 0xffff));
-    }
-    stl_p(p++, 0x34060000);                     /* li   $6, 0 */
-    stl_p(p++, 0x34070000);                     /* li   $7, 0 */
-
-    /* Load kernel entry address & jump to it */
-                                                /* lui  $25, hi(kernel_entry) */
-    stl_p(p++, 0x3c190000 | ((kernel_entry >> 16) & 0xffff));
-                                                /* ori  $25, lo(kernel_entry) */
-    stl_p(p++, 0x37390000 | (kernel_entry & 0xffff));
-    stl_p(p++, 0x03200009);                     /* jr   $25 */
+    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
 }
 
 static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index bac2adbd5a..1ae84ecf92 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -33,6 +33,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
@@ -185,30 +186,9 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Second part of the bootloader */
     p = (uint32_t *)(base + 0x040);
 
-    /* lui a0, 0 */
-    stl_p(p++, 0x3c040000);
-    /* ori a0, a0, 2 */
-    stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(env->ram_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
-    /* ori a3, a3, low(env->ram_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_size & 0xffff));
-    /* lui ra, high(kernel_addr) */
-    stl_p(p++, 0x3c1f0000 | ((kernel_addr >> 16) & 0xffff));
-    /* ori ra, ra, low(kernel_addr) */
-    stl_p(p++, 0x37ff0000 | (kernel_addr & 0xffff));
-    /* jr ra */
-    stl_p(p++, 0x03e00008);
-    /* nop */
-    stl_p(p++, 0x00000000);
+    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
+                       ENVP_VADDR + 8, loaderparams.ram_size,
+                       kernel_addr);
 }
 
 static void main_cpu_reset(void *opaque)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427b..ffd67b8293 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -37,6 +37,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
@@ -844,6 +845,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
+    target_ulong a0;
     uint32_t *p;
 
     /* Small bootloader */
@@ -872,30 +874,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     /* Second part of the bootloader */
     p = (uint32_t *) (base + 0x580);
 
-    if (semihosting_get_argc()) {
-        /* Preserve a0 content as arguments have been passed */
-        stl_p(p++, 0x00000000);              /* nop */
-    } else {
-        stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
-    }
-
-    /* lui sp, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
-    /* ori sp, sp, low(ENVP_VADDR) */
-    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a1, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(ram_low_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
-    /* ori a3, a3, low(ram_low_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_low_size & 0xffff));
-
     /* Load BAR registers as done by YAMON */
     stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
 
@@ -947,13 +925,14 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 #endif
     stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
 
-    /* Jump to kernel code */
-    stl_p(p++, 0x3c1f0000 |
-          ((kernel_entry >> 16) & 0xffff));  /* lui ra, high(kernel_entry) */
-    stl_p(p++, 0x37ff0000 |
-          (kernel_entry & 0xffff));          /* ori ra, ra, low(kernel_entry) */
-    stl_p(p++, 0x03e00009);                  /* jalr ra */
-    stl_p(p++, 0x00000000);                  /* nop */
+    if (semihosting_get_argc()) {
+        a0 = 0;
+    } else {
+        a0 = 2;
+    }
+    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, a0, ENVP_VADDR,
+                       ENVP_VADDR + 8, loaderparams.ram_low_size,
+                       kernel_entry);
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
-- 
2.30.0


