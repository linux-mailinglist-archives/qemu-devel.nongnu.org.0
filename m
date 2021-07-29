Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0593D9C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 05:43:52 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8wxc-0005CS-1A
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 23:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuJ-0000Gi-6J
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:27 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1m8wuF-00028Q-QI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 23:40:26 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 63A0B5C00F8;
 Wed, 28 Jul 2021 23:40:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Jul 2021 23:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lEw7sMuU2drlN
 gwiR5R+AMXiEFyrHRsCq1MaUAu3oaI=; b=U/IpfkshiP0ACtGrYGW3FyampWKEz
 /yMzAKLTElL8QfXH2x1iHdlyXviHDMQeXai/ModzP5hz6C0/pdII5PwMial5Pepq
 hHnS/Q52G3g9dBtvg5RKwhpjudHNeCq2F+M8eHxVEyh///lm+80vxXt5aK6mGUJd
 yftOUhUnjwjCBxwwPyz/DsffAISdtEKzav+LgvOl2lNHthWEF7iBn20rGiXAcD2Y
 4yA9Z7XjwQukipMvC7gXS6YkoSAt8+tYQyas+Ec4+OyKL15Rggw2oRwDXD5X/aZb
 ZrJifh4Z/b37TSmQTkrIV8HkgUKpIt2ri/yM5alEWQAnzMd7ClPLTMfSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lEw7sMuU2drlNgwiR5R+AMXiEFyrHRsCq1MaUAu3oaI=; b=A8n9fk7o
 fEA0ZJPW64QZufNNYGIPP7s1R3dVpuLACcFUNmxanlrjhT7geY3JamsL1pX7tSPW
 6H6GmEnlw4hZBLE80+qiyFuJFLGwADKMUpnDPuGeMqp94rb7ScGioDRW9TW4lS7F
 VIQYu+etuww3N0/4rWxP8vgHnaOrc0LRbB8uYefv5heivE1YsnVUiWiDZbIthbun
 vpyF1LVK5GlO6f/456i+fhNYXyoE096UvqM+eGCAVS0diD4I7IcI5Vq+xBSXG5vd
 TGiWwznhr9JASFdnJ+Yk/GWFzdGHG2O4vwf7jLy1zxkIwf8wUnty8SPjpiBlCENm
 k7jO8KXcCCkE8g==
X-ME-Sender: <xms:JyMCYVjf2bU2BgfazFfrwFiI4UR1EMrQVQR25yNrAhQALFfFbzdwQA>
 <xme:JyMCYaBEg6naz0ybF-Cwof2i1kEfvLOwh9Glqr4D_-XGAvz4wK8_o9uuWwlNA8Vtq
 PcVlOUSdtVcMnAYHgI>
X-ME-Received: <xmr:JyMCYVFQbBd0M05Ibibl69L7Yi0LaQX7nm24yKETjdOTtecAK6h8DPoHSzmlOCbPgKBW8JDW_OP1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
 dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:JyMCYaRk1tbh-hnghhZvD0_dMdWHs42u6vikaA3RwH3EqLS3InxrOA>
 <xmx:JyMCYSz2J1PApp7zCNlZrqQOekhwkP3TNr77UqNr2OIbNaEUcMFPag>
 <xmx:JyMCYQ71pejVHD0maVGAXKH0lhD7b9YSdQBT85OZnrVRs7SbbS2dKw>
 <xmx:JyMCYW-uRhPfEf_RIGFcI4ngRFVgVbyUJsWSYsWEFmY1Qr2VHxkXgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 23:40:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/mips/boston: Allow loading elf kernel and dtb
Date: Thu, 29 Jul 2021 11:39:58 +0800
Message-Id: <20210729033959.6454-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ELF kernel allows us debugging much easier with DWARF symbols.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a5746ede65..42b31a1ce4 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
+#include "elf.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/ide/pci.h"
@@ -546,10 +547,39 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-        if (fit_err) {
-            error_report("unable to load FIT image");
-            exit(1);
+        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
+
+        kernel_size = load_elf(machine->kernel_filename, NULL,
+                           cpu_mips_kseg0_to_phys, NULL,
+                           (uint64_t *)&kernel_entry,
+                           (uint64_t *)&kernel_low, (uint64_t *)&kernel_high,
+                           NULL, 0, EM_MIPS, 1, 0);
+
+        if (kernel_size) {
+            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
+            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
+
+            s->kernel_entry = kernel_entry;
+            if (machine->dtb) {
+                int dt_size;
+                const void *dtb_file_data, *dtb_load_data;
+
+                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
+                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
+
+                /* Calculate real fdt size after filter */
+                dt_size = fdt_totalsize(dtb_load_data);
+                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+                g_free((void *) dtb_file_data);
+                g_free((void *) dtb_load_data);
+            }
+        } else {
+            /* Try to load file as FIT */
+            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
+            if (fit_err) {
+                error_report("unable to load kernel image");
+                exit(1);
+            }
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-- 
2.32.0


