Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA13053C3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:00:02 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4eo5-0008KY-PG
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4ej3-0004DY-Up
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:49 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4ej2-0000yF-8b
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:49 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C4AF058081C;
 Wed, 27 Jan 2021 01:54:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Jan 2021 01:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 uBVihK/xgV8eg2GcU0h31qSNqnwllH7ORe1zSa2f+Bk=; b=NmehIRjaWrL/cE/R
 tn+DRqtfCiTa4AdW1BjIjxGS7x7tB3ZB5zdYvFtvhoftXRPyy+cGOcgv5HLfeqq9
 9l0pE7owSqpmrTNb9wOtSorBFArNhTHJk5PMuF5gBcwpMFBSmSBG8OTXiE7rjKzT
 gRgFS8jwNduE4Fge5tLlSxXEFdJI/fdf9b0SxBiAyx1rhwziSflmAdCc+G16eZms
 ggsDPxSp7dWpEljmm0TEvcaYNsHuAG1mr0h+erk0kAVtPcTlB24xlJEY2lhLuv+i
 TbttPptzHaRSo8rKA7vaZ+ejk3uYKOvBm18wChse2A0eB5/7ErcB/pu3tF07yL5a
 Nmo64g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=uBVihK/xgV8eg2GcU0h31qSNqnwllH7ORe1zSa2f+
 Bk=; b=JgeVF1NH/BT98F6iUVKZ8e4lzQ+a6SNKHzpqKg1C57n430wu8EpIlHGBO
 VoSUXi1bn3dVhgbLEiTCVnaJOijvc9jiQvRk2hljeLfJIRk/xAGw76QFHwkS2vL+
 1FofJQsPzc7tWawAVYCMF4SbCJsPjFG37yD6G6fEPW2rIC6LsL+8RDthihWv8t1d
 gfaCqroTqlM51ow9VxYJUzj1RTSQ48bMdckw5R9twfzgBm+DDg79dMkAEAps6skw
 68ef7eYN+JPXojmFuHtpwJ3bZ7neVtfAVBcjoviEIjus0D87NPD+jjGV1xvm2f64
 dabWMkgLpArq4sN4116bpgCGMkETQ==
X-ME-Sender: <xms:Nw4RYIVeQMGLch1ndNJCyE5aIT5IGxS_qfSTs4Ct-46NhA1QcBtYxw>
 <xme:Nw4RYMnY5d2Sxj5BwRi9Rd3k0p5dVLk-kjjYSak_RAoV71-rPA4gOqNuQo5D0V7kg
 NJPNIrSw_rJwtdwUew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehuddvtedtleehhefggeevteekkefhjedvjedtgfeugfekjedt
 vdevueejveekleenucfkphepudduhedrudeljedrvddvgedrvddvfeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Nw4RYMY7ThqmcagbsBT9ojIT6n7BVFzMJda_lssOm5N3b3SA7bkUhA>
 <xmx:Nw4RYHXDbpDcwnLSSkJ7XGNQISU5tzMFIJPbDCchpBiTrSCek1Xwqg>
 <xmx:Nw4RYCkb5OS6Wu05QiRsMYwo1ZZrqHBw8RJeX6urhWChpO77_buwxw>
 <xmx:Nw4RYDDA3NQqNajWIm7_UeUMxkZ4hkjHjNsJvg5dZH8zg-aXWK-QOw>
Received: from strike.202.net.flygoat.com (unknown [115.197.224.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1AF3240065;
 Wed, 27 Jan 2021 01:54:43 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] hw/mips/boston: Use bootloader helper to set GCRs
Date: Wed, 27 Jan 2021 14:54:24 +0800
Message-Id: <20210127065424.114125-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Translate embedded assembly into IO writes which is more
readable.

Also hardcode cm_base at boot time instead of reading from CP0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
--
v3: Use bl_gen_write_ulong.
---
 hw/mips/boston.c | 47 ++++++++---------------------------------------
 1 file changed, 8 insertions(+), 39 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index b976c8199a..06e04ef8de 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -274,48 +274,18 @@ static void boston_register_types(void)
 }
 type_init(boston_register_types)
 
-static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
-                         bool is_64b)
+static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
     const uint32_t cm_base = 0x16100000;
     const uint32_t gic_base = 0x16120000;
     const uint32_t cpc_base = 0x16200000;
 
-    /* Move CM GCRs */
-    if (is_64b) {
-        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
-    } else {
-        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
-    }
-    stl_p(p++, 0x3c09a000);                     /* lui  $9, 0xa000 */
-    stl_p(p++, 0x01094025);                     /* or   $8, $9 */
-    stl_p(p++, 0x3c0a0000 | (cm_base >> 16));   /* lui  $10, cm_base >> 16 */
-    if (is_64b) {
-        stl_p(p++, 0xfd0a0008);                 /* sd   $10, 0x8($8) */
-    } else {
-        stl_p(p++, 0xad0a0008);                 /* sw   $10, 0x8($8) */
-    }
-    stl_p(p++, 0x012a4025);                     /* or   $8, $10 */
-
-    /* Move & enable GIC GCRs */
-    stl_p(p++, 0x3c090000 | (gic_base >> 16));  /* lui  $9, gic_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090080);                 /* sd   $9, 0x80($8) */
-    } else {
-        stl_p(p++, 0xad090080);                 /* sw   $9, 0x80($8) */
-    }
-
-    /* Move & enable CPC GCRs */
-    stl_p(p++, 0x3c090000 | (cpc_base >> 16));  /* lui  $9, cpc_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090088);                 /* sd   $9, 0x88($8) */
-    } else {
-        stl_p(p++, 0xad090088);                 /* sw   $9, 0x88($8) */
-    }
+    bl_gen_write_ulong(&p, cm_base,
+                cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS));
+    bl_gen_write_ulong(&p, gic_base | GCR_GIC_BASE_GICEN_MSK,
+                cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS));
+    bl_gen_write_ulong(&p, cpc_base | GCR_CPC_BASE_CPCEN_MSK,
+                cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS));
 
     /*
      * Setup argument registers to follow the UHI boot protocol:
@@ -529,8 +499,7 @@ static void boston_mach_init(MachineState *machine)
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-                     s->kernel_entry, s->fdt_base,
-                     cpu_type_is_64bit(machine->cpu_type));
+                     s->kernel_entry, s->fdt_base);
     } else if (!qtest_enabled()) {
         error_report("Please provide either a -kernel or -bios argument");
         exit(1);
-- 
2.30.0


