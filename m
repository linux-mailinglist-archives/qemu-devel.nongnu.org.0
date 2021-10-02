Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2641FDD0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 20:52:13 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWk7I-0004wE-Am
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 14:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1L-0007Ho-M5
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:32957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mWk1I-0006iS-P4
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 14:46:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 480F05C0076;
 Sat,  2 Oct 2021 14:45:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 02 Oct 2021 14:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 jIwh+7gmCAvojJea0E5dpKqvBYQSTtxbcQ948WxkKbQ=; b=oj7JIpAFWoR/i+gz
 KjWASvuYd8BpA5Y3lbJOUi6PwmgkEfSplFqwvGlBAsK/rHeMmOXUD44GSjG9NB9D
 YJYDcUINlK3sh0xMNgpQDXw6NHp3jAn7M3+7LzqGXenrLt4cisqMy8Xh+eFLTAAD
 aDlx8+bsNIuUk+NNhho9tCNCgIfUrCRiHVSubOFpR7ZPaq6QCWIv24t15ljfLbit
 zIR6Iyr2TycZrUnEohWC1l79JC9A6Nl0h0qUeCSuByfzSylGnd6NzFof+KCbgf98
 eRO7n/LBbScMj0EfdzBfn6NIGYcLexw7qBUbLmo6iUlcHJdYM6uOgZhzJHwqG9HH
 TcUcFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=jIwh+7gmCAvojJea0E5dpKqvBYQSTtxbcQ948WxkK
 bQ=; b=GML53DXRRDo2Gy6gYjqCJNu07WPUU8FnhFtoQcrOTimHpfsw6nVqp9wvU
 SCB+RPTmyUDL+DtNC/r9zWuen6Eklbne2kh0mK5voAxOKkxz1m7iSBFxG/H319bw
 VDyE9Ls+1jk+ahnW7jjZHyLpGymr8Vn0JDqYOqNJydL3vQGSL0KIJ3rM1d8WvQQJ
 xs6uJ/M4u4orGuTzAZYCHFApIg0CqheRzQhaBKgLZijaIWr8wHMolQwEyTSAqbsI
 VBNGvaHHCGi8PKxF8LFZDbHAidMoFdHXZi8VMHVq37+VAp+e6IYIe5+vbGyszEsc
 OmzUflWmcHYk24dftrb2v7ERkfeQA==
X-ME-Sender: <xms:5qhYYVKgoRFYg1udj7yakPFMMbnBPOkLOdLmyylthbbvYEspTTa5aA>
 <xme:5qhYYRILaedVHnRTL3qdYNvQ4dekE3swK3brKiNciKs-EgVKEz96SXrsf1cgdPzdd
 vbzptNx8k_16NW7rds>
X-ME-Received: <xmr:5qhYYds6pK_IqLaMDpJW5tbUN6CZG0lsGBamH0SW0CH46q26E7hg9scdpQLYr5CJsLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekkedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeehuddvtedtleehhe
 fggeevteekkefhjedvjedtgfeugfekjedtvdevueejveekleenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:5qhYYWY9lcY3tfOk4FuOWz2dp1oqvbgr2V7WZWIOXNsXGGij7RvOPQ>
 <xmx:5qhYYcaMAO1l3UfAEf4S4Wf5R-IJl9vh2tHhNP6ejl2StJkv3xthBQ>
 <xmx:5qhYYaBwJGMoqtMoleacmh3uBu8MvjnUh9HswKSuemxt-gPvImJXEg>
 <xmx:5qhYYTWjK66sy49uYc4qbCF4lqG-5EG9YKqWoc7dvXm91dfFBbpB-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Oct 2021 14:45:57 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/mips/boston: Allow loading elf kernel and dtb
Date: Sat,  2 Oct 2021 19:45:38 +0100
Message-Id: <20211002184539.169-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002184539.169-1-jiaxun.yang@flygoat.com>
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ELF kernel allows us debugging much easier with DWARF symbols.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
--
v2: Use g_autofree
v3: Remove unused kernel_low and uint64_t cast (BALATON)
---
 hw/mips/boston.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 5c720440fb..e6d5cc2d22 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
+#include "elf.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/ide/pci.h"
@@ -546,10 +547,36 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-        if (fit_err) {
-            error_report("unable to load FIT image");
-            exit(1);
+        uint64_t kernel_entry, kernel_high, kernel_size;
+
+        kernel_size = load_elf(machine->kernel_filename, NULL,
+                           cpu_mips_kseg0_to_phys, NULL,
+                           &kernel_entry, NULL, &kernel_high,
+                           NULL, 0, EM_MIPS, 1, 0);
+
+        if (kernel_size) {
+            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
+            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
+
+            s->kernel_entry = kernel_entry;
+            if (machine->dtb) {
+                int dt_size;
+                g_autofree const void *dtb_file_data, *dtb_load_data;
+
+                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
+                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
+
+                /* Calculate real fdt size after filter */
+                dt_size = fdt_totalsize(dtb_load_data);
+                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
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
2.30.2


