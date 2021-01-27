Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3187A3053BF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:59:25 +0100 (CET)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4enU-0007mI-5F
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4ej0-00047g-8A
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:46 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eiy-0000wP-FJ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E98965807FE;
 Wed, 27 Jan 2021 01:54:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Jan 2021 01:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QtatUkRBvp19n
 21lJT7urCwMg1o5Ctr05LfED+qicRw=; b=jGaUTUSRCDs953I2kBIdIeszNMkIT
 r8Y4rIWDuSclgFQQGtm8+IzftcJZU34MeeHpRx9+dWZjbmlyxFNByVodsDToS4mp
 F2tLMgB7sDVzL2SAh12UZhPCwNz5iYkwjbV7stPvFTJruO3LpeHI8WODGZe/IiWo
 Q+/j4TJcXvDQvPvMr4DbDw9cuG9YemnBEFAU05Yw69s7xeGGAaAAsdNFtYoZwcBV
 ERxLteBUs5DuYKYYRrDNDoTbuT8yrnoWbAe6dg2PXa0KJy4RpI3V9FoC8l15KCDV
 jIu/4e52SOiu253PvrxV3c4lnIz77pQVOa94Ax83pN0Zcr6W9uMzUn7bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QtatUkRBvp19n21lJT7urCwMg1o5Ctr05LfED+qicRw=; b=gGjEt2cF
 hRd9yutB7SUO3W7ySBK/LnfkMzQ5YjHx579Ctzl7oQY+2SGcnQiWlSTLwZMbnOn/
 3BfWbvUzDDOk4MsscWto1ZVv6dZMdbHVLARlQQVGcrivLYFnjoxjmIKUB7wj685U
 GY3Cls3xcAiPIqRiFtIvgVjbLAQnZk5R0zWPHoHwK4/RWPHC+vsKdgBwbBVD+8DD
 k6dl8NlkXT4RmkDvkVuRXthKbkwevyvqBcqmTJk3Jp+q8V7G3LJTkYQMz5gLSyZy
 FhN7PISJG7GJ9lADAq59NFgqqf2GPQTep7K5jZFfgXSSFVYqQG5+IWpb9HDQxe9q
 ZPajeqjR8NQtHQ==
X-ME-Sender: <xms:Mw4RYG-MNw5Hy5Cz6niOdzvNRUudUsD8b4RPlQNYA8AqHnMzvVAiqg>
 <xme:Mw4RYGuhHPaGoumvu5X9LS75OsRKk_1AeCHW65tNwFB4VCulk6JqLMiohsYaDDsZR
 Ncvgay3YuZ7ivq-P2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppeduudehrdduleejrddvvdegrddvvdefnecuvehluhhsthgvrh
 fuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Mw4RYMA0OxP0e_AoNnSLvY5yJpcggXhIeqAilK1kfUVgH2kFqvIzUw>
 <xmx:Mw4RYOdhfcf5w_1sm9b0mdgzRMFNa_4oRu0iEP9e88byQ-OKci5RXQ>
 <xmx:Mw4RYLP9j2UeBMt6fi-2TzdhXUweA4I9HDwxeBcaDEZWQRIYC3P7Pw>
 <xmx:Mw4RYAqIMytOigJsGsUALIfhuNEpQlUfbbNlAGy3lxP5PBrOLA0spg>
Received: from strike.202.net.flygoat.com (unknown [115.197.224.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B29D240064;
 Wed, 27 Jan 2021 01:54:39 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] hw/mips/malta: Use bootloader helper to set BAR
 resgiters
Date: Wed, 27 Jan 2021 14:54:23 +0800
Message-Id: <20210127065424.114125-4-jiaxun.yang@flygoat.com>
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

Translate embedded assembly into IO writes which is more
readable.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/malta.c | 68 ++++++++++++++++---------------------------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ffd67b8293..9466fd1058 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -875,55 +875,31 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     p = (uint32_t *) (base + 0x580);
 
     /* Load BAR registers as done by YAMON */
-    stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08df00);                  /* lui t0, 0xdf00 */
-#else
-    stl_p(p++, 0x340800df);                  /* ori t0, r0, 0x00df */
-#endif
-    stl_p(p++, 0xad280068);                  /* sw t0, 0x0068(t1) */
-
-    stl_p(p++, 0x3c09bbe0);                  /* lui t1, 0xbbe0 */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08c000);                  /* lui t0, 0xc000 */
-#else
-    stl_p(p++, 0x340800c0);                  /* ori t0, r0, 0x00c0 */
-#endif
-    stl_p(p++, 0xad280048);                  /* sw t0, 0x0048(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c084000);                  /* lui t0, 0x4000 */
-#else
-    stl_p(p++, 0x34080040);                  /* ori t0, r0, 0x0040 */
-#endif
-    stl_p(p++, 0xad280050);                  /* sw t0, 0x0050(t1) */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c088000);                  /* lui t0, 0x8000 */
-#else
-    stl_p(p++, 0x34080080);                  /* ori t0, r0, 0x0080 */
-#endif
-    stl_p(p++, 0xad280058);                  /* sw t0, 0x0058(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c083f00);                  /* lui t0, 0x3f00 */
-#else
-    stl_p(p++, 0x3408003f);                  /* ori t0, r0, 0x003f */
-#endif
-    stl_p(p++, 0xad280060);                  /* sw t0, 0x0060(t1) */
-
-#ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
-#else
-    stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
-#endif
-    stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
+    /* Bus endianess is always reversed */
 #ifdef TARGET_WORDS_BIGENDIAN
-    stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
+#define cpu_to_gt32 cpu_to_le32
 #else
-    stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
+#define cpu_to_gt32 cpu_to_be32
 #endif
-    stl_p(p++, 0xad280088);                  /* sw t0, 0x0088(t1) */
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&p, cpu_to_gt32(0xdf000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x14000068));
+    /* setup MEM-to-PCI0 mapping */
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(&p, cpu_to_gt32(0xc0000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00048));
+    bl_gen_write_u32(&p, cpu_to_gt32(0x40000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00050));
+    /* setup PCI0 mem windows */
+    bl_gen_write_u32(&p, cpu_to_gt32(0x80000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00058));
+    bl_gen_write_u32(&p, cpu_to_gt32(0x3f000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00060));
+    bl_gen_write_u32(&p, cpu_to_gt32(0xc1000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00080));
+    bl_gen_write_u32(&p, cpu_to_gt32(0x5e000000),
+                        cpu_mips_phys_to_kseg1(NULL, 0x1be00088));
+#undef cpu_to_gt32
 
     if (semihosting_get_argc()) {
         a0 = 0;
-- 
2.30.0


