Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68B10F63C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 05:18:48 +0100 (CET)
Received: from localhost ([::1]:48272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibzeA-0002c0-IG
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 23:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ibzZ3-0005hW-GU
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 23:13:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ibzZ1-0001FJ-0o
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 23:13:29 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56831)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ibzYy-00019R-9q; Mon, 02 Dec 2019 23:13:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F2E39C28;
 Mon,  2 Dec 2019 23:13:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 02 Dec 2019 23:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=rb9NcXkJ9zfKj
 9uToigm9zdKRmguNiX84tLrvX+4KtM=; b=rxWOCAb4QrTYOHw+AOy9CHaP5yQDu
 ds+pxsIFfO9BFgBI7FoLLK0qXoKMCesOvXF1pj3ogu+akepRTdud9P5IyiDf6E9I
 HYoKDLKa7qRu9+aNbSBmCBnxV82dR7xbjwjrMz4zUlOtqT6jdqM2BiKRvrGhBKs0
 2AlmCWFeiZIbsHqfjDDrq4HDm7AaIyl8KX2m9mu195yT6/CdI/MO0M3j2u1FYkVY
 blZ9DmDe7az8dkBE5TNDLMGY+Yr2au8jFekLESI4N+3uBlOPl8wJF2IkT28TA7J3
 bQn+/y3rcladJtUYeXMGy+BstGRWwxLFVFa4Q9lCkwcya3sGsTm5eYB+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=rb9NcXkJ9zfKj9uToigm9zdKRmguNiX84tLrvX+4KtM=; b=WkWYouxI
 5CUu77WyTFyO2M6zDePAr/jScj+GR/8I3O1OKS/wMkCJcoao/7xt+pkb5ceAQRw0
 Cs74PJMWZ8/x4LXr5vZh5UGHxKxSTKsOJC/LrjYC+f+OAIJgvDTN4kbJSyBQysnD
 u81Cv8VAA+18JaHK085JNmtcLYPRk9755gp2tjWOc3FweK5GROnQXSfNVD3K0pP6
 BYw8nLFQnIuDGG+tvH/6tVVh9ZmQ+n06c4UcvATaD9gCfGZ2irydJv9OELuxfsO/
 KrDa+9GKXmi+FoalFwcjtIwHahZ6a/vbgJR90NOdcKFXPxrs2tdFm2aCCagTNpED
 L3Akb93Vzv5wKA==
X-ME-Sender: <xms:4uDlXWeoiQ0yLw6ICzeAiEgMF9JqL1llktRxtbePxK80V5O26KIYAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtvd
 drkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:4uDlXUczAqMuYt8lCNKLlJfd1vBLMS0rPVgyainGXS8MTxMEMQi0yA>
 <xmx:4uDlXSiMIPsejHjsM-TXqyTMaZF3fTq1u8AoXfk5z9BWCTtqHxWQyA>
 <xmx:4uDlXYSmph7QTjLmpVx-V3E1y2WB0GC3rjbKy4d-W4wqm6d6BES1EA>
 <xmx:4uDlXeufxVmFIzmHGq7TnlI8ARfOdHd3fp8EKjtfGwgPjkWBN3F05A>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id E375C80060;
 Mon,  2 Dec 2019 23:13:19 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/4] target/arm: Abstract the generic timer frequency
Date: Tue,  3 Dec 2019 14:44:38 +1030
Message-Id: <20191203041440.6275-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203041440.6275-1-andrew@aj.id.au>
References: <20191203041440.6275-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.24
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for SoCs such as the ASPEED AST2600 whose firmware configures
CNTFRQ to values significantly larger than the static 62.5MHz value
currently derived from GTIMER_SCALE. As the OS potentially derives its
timer periods from the CNTFRQ value the lack of support for running
QEMUTimers at the appropriate rate leads to sticky behaviour in the
guest.

Substitute the GTIMER_SCALE constant with use of a helper to derive the
period from gt_cntfrq stored in struct ARMCPU. Initially set gt_cntfrq
to the frequency associated with GTIMER_SCALE so current behaviour is
maintained.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    |  2 ++
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/helper.c | 10 +++++++---
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7a4ac9339bf9..5698a74061bb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -974,6 +974,8 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
+
+    cpu->gt_cntfrq = NANOSECONDS_PER_SECOND / GTIMER_SCALE;
 }
 
 static Property arm_cpu_reset_cbar_property =
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 83a809d4bac4..666c03871fdf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -932,8 +932,18 @@ struct ARMCPU {
      */
     DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
     DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
+
+    /* Generic timer counter frequency, in Hz */
+    uint64_t gt_cntfrq;
 };
 
+static inline unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
+{
+    /* XXX: Could include qemu/timer.h to get NANOSECONDS_PER_SECOND? */
+    const unsigned int ns_per_s = 1000 * 1000 * 1000;
+    return ns_per_s > cpu->gt_cntfrq ? ns_per_s / cpu->gt_cntfrq : 1;
+}
+
 void arm_cpu_post_init(Object *obj);
 
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65c4441a3896..2622a9a8d02f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2409,7 +2409,9 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
 
 static uint64_t gt_get_countervalue(CPUARMState *env)
 {
-    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
+    ARMCPU *cpu = env_archcpu(env);
+
+    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
 }
 
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
@@ -2445,7 +2447,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
          */
-        if (nexttick > INT64_MAX / GTIMER_SCALE) {
+        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
             timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
         } else {
             timer_mod(cpu->gt_timer[timeridx], nexttick);
@@ -2874,11 +2876,13 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
 
 static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     /* Currently we have no support for QEMUTimer in linux-user so we
      * can't call gt_get_countervalue(env), instead we directly
      * call the lower level functions.
      */
-    return cpu_get_clock() / GTIMER_SCALE;
+    return cpu_get_clock() / gt_cntfrq_period_ns(cpu);
 }
 
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
-- 
2.20.1


