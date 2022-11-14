Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D98628E21
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik6-0004th-I3; Mon, 14 Nov 2022 18:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ouiew-0004p5-IW
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:36 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oucHR-0006oe-N5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:25:55 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 8642E3200999;
 Mon, 14 Nov 2022 11:25:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 11:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1668443150; x=1668529550; bh=R2ce4iD8BNlySRNpj4s+MTeji
 A2IFCfe6kBUiWEZonM=; b=CuWNolySNQXyK0v/kd2GzshYcYIPQzxccy5fPvTIU
 CW+rysSid/kWeSZGgBg+xsqH8nG0N/YdqcFOkKwzTScRZanolF2T5x3b2U7UEsY7
 ENRj7iAk2KXamFMpGtgpo4Lb1wrvLy0EOfGm5G7f3TQDW6v+kdoF9UD1aTPLChzf
 QWQb4TrM4Gc1L0gw4Ysz0Pdr2Sylo/vuoRfUiQF4Qu/J/ZcFsXf7NSKJH4zCWLcE
 d+iHRnnq2fPFMvfVSL6rNHlfkY6DPDKRfYysgZLY4/a3JHvcgyB3z4elzWqvcSZW
 jkyFKyH3uDISwZe8X1xnSPehsSsoE2u8Ssh/fTipe8V7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1668443150; x=1668529550; bh=R2ce4iD8BNlySRNpj4s+MTejiA2IFCfe6kB
 UiWEZonM=; b=uKD99qa0WSMhvoCQgF0b2RrePAKd0y5IhdBJCPTTshqXZZgE3ts
 sqKrgTpxlawa+erb5xQ0wkVdnitF+BF7WJt8zORZbOcIZr21/atbdf5K3stTcWKQ
 8sYHZb5g6u7cNhjboZx7ZSyfD+vVVtzpVp/TdB5tEfzA8lDkY09xa9OTAMRsPSFk
 1i8BKYIENEztm1UXKnS500dDYNnaS0zzzuu9pprdnNY0f5pDzpVmZ/5D4LUOmcM4
 MfQhP9N0aXdRqPn5Z3v9FBmazPDCJhBABk4B7T50IeE9go7NgR428SeNXcrD1AuY
 u5B6N29JKXcBrM6sZ9FwzMFnoolIQ8qL9QQ==
X-ME-Sender: <xms:DWxyY7rARKxFm02AMCzB_QOU17W_oDgA895zKiCbgMD8-MPqWOwlmQ>
 <xme:DWxyY1pH2131QkHgPM6M0ipaeqpe4u6oXZFIVUjpd0h2-CDvJ1K9WHbL-jKL_qTyD
 5_yAl8se0W9vlU_eJ4>
X-ME-Received: <xmr:DWxyY4OV0MKXF5YYb8NOX6p_foUaIGZWd2TDIuqS_aHsDWZotfRNYxIF_fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejjeetff
 ehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
 htrdgtohhm
X-ME-Proxy: <xmx:DWxyY-7GygzCflRNjaqVlzmMc82__Sydc_B-gPeYleXKnVxVmcf5Gw>
 <xmx:DWxyY65LvKT1qwPxaVs6pi-_RUq_XcqSqxP2PrY5TVUEK0Mmt7GU5w>
 <xmx:DWxyY2gpeXk-gOJvJOPCZWOU9SiedLO9pn2U69aXrbPYVQ1DHbvo0g>
 <xmx:DmxyYwSCbkXEDcjwyCiDrZKc_ZxoCXfDES1J_lJoEXdN2iIt9DdKwA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 11:25:49 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] target/mips: Properly set C0_CMGCRBase after CPU reset
Date: Mon, 14 Nov 2022 16:25:26 +0000
Message-Id: <20221114162526.355652-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Value of C0_CMGCRBase will be reseted to default when cpu reset
happens. In some cases software may move GCR base and then initiate
a CPU reset, this will leave C0_CMGCRBase of reseted core incorrect.

Implement a callback in CMGCR device to allow C0_CMGCRBase and other
global states to be overriden after CPU reset.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
This fixes SMP boot for Boston board.
I'm not sure if it's the best palce to make such a callback,
but we can add more global states such as BEV here in future.
---
 hw/mips/cps.c        | 3 ++-
 hw/misc/mips_cmgcr.c | 5 +++++
 target/mips/cpu.c    | 4 +++-
 target/mips/cpu.h    | 4 ++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b436700ce..29b10ff8d0 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -98,6 +98,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
         cpu_mips_clock_init(cpu);
 
         env = &cpu->env;
+        env->gcr = &s->gcr;
         if (cpu_mips_itu_supported(env)) {
             itu_present = true;
             /* Attach ITC Tag to the VP */
@@ -158,7 +159,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
-    gcr_base = env->CP0_CMGCRBase << 4;
+    gcr_base = GCR_BASE_ADDR;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
     object_property_set_int(OBJECT(&s->gcr), "num-vp", s->num_vp,
diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
index 3c8b37f700..f2108b7d32 100644
--- a/hw/misc/mips_cmgcr.c
+++ b/hw/misc/mips_cmgcr.c
@@ -19,6 +19,11 @@
 #include "hw/qdev-properties.h"
 #include "hw/intc/mips_gic.h"
 
+void gcr_cpu_reset(struct MIPSGCRState *s, CPUMIPSState *env)
+{
+    env->CP0_CMGCRBase = s->gcr_base >> 4;
+}
+
 static inline bool is_cpc_connected(MIPSGCRState *s)
 {
     return s->cpc_mr != NULL;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index e997c1b9cb..d0a76b95f7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -297,7 +297,9 @@ static void mips_cpu_reset(DeviceState *dev)
         env->CP0_EBase |= (int32_t)0x80000000;
     }
     if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
-        env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
+        if (env->gcr) {
+            gcr_cpu_reset(env->gcr, env);
+        }
     }
     env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
             0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0a085643a3..c345e6b1c7 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1154,6 +1154,7 @@ typedef struct CPUArchState {
     CPUMIPSTLBContext *tlb;
     void *irq[8];
     struct MIPSITUState *itu;
+    struct MIPSGCRState *gcr;
     MemoryRegion *itc_tag; /* ITC Configuration Tags */
 #endif
 
@@ -1310,6 +1311,9 @@ void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 /* mips_itu.c */
 void itc_reconfigure(struct MIPSITUState *tag);
 
+/* mips_cmgcr.c */
+void gcr_cpu_reset(struct MIPSGCRState *s, CPUMIPSState *env);
+
 #endif /* !CONFIG_USER_ONLY */
 
 /* helper.c */
-- 
2.37.4


