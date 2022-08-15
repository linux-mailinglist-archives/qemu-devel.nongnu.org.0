Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E3593EB9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 23:37:53 +0200 (CEST)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNhmR-0001PT-Pt
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 17:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C7z6YggKCowCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oNhjv-0005aW-Pz
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 17:35:15 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C7z6YggKCowCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1oNhjr-0003jO-TB
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 17:35:15 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 q193-20020a632aca000000b0041d95d7ee81so3013212pgq.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
 bh=R/RKbEDeWYV+VonQAg9pdVD04PJy9FUG+uuZBibfjtQ=;
 b=BKx0iArG1l0avpAgG5jIFMOkKA5o75xG8pKAtI5gFScUansM5fXBwgh/OocL82x+V/
 2yYky6u8tTWeI9dNyDaww1AYSCcc0hf4PPzNNzLUGc7MH21OWDWjRwroi7IutYUKvXs9
 MUO8EPjh+WCtFQmcan1h2gbMAm3pi/3/aH93+VuTPycK0PEQCLYP6WTonnTATpM3f7a5
 dNDIKE1s02eNRxmgyxn7d9rq0sJwAAL0BiDS5xCNoZuc60DzM+xe3bZm+sTd+9pkQkDJ
 0QiwJRbFWMAXS/XmySVAsLEbqBUN1kEVB1rOTHC0HSFNivUPVIEHTox82rm6aH84LCi9
 AauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc;
 bh=R/RKbEDeWYV+VonQAg9pdVD04PJy9FUG+uuZBibfjtQ=;
 b=aa3VnCP6JnB/Tf0eiWPu1QAAjCm0zN9LkEt4pPWBXqL06Qh4DgNoqt4SWKtFRuu3eE
 +2fsO9EC3LsvM5Fs7Ycwfs7aQ9b+/Ppy35D+8a7dN6EGdDBpeP81WdSyGgmKsXz+fYgk
 Ema9y19L4GK72AX56qnwQY2c90n0A5sp9Z2KOaOEYb+zKmW+V4fTcrPXiF3XBexbA/Y9
 VDX9H9zpxw/va1dC3uvh8R4XbYnCFI+vEeHVRYl5aaYt6TiS/JmGlcu7JqzqqQXxi0Tf
 TnuiCnqwkx9lyzPExIor5h923lh5wosW1UHISCCQHrKFr1w1Zkds+iWja87pJYqgnUy1
 GP7w==
X-Gm-Message-State: ACgBeo04APhrB2mhpVlpyXF27K714LYcYkGO2uBPuX9Ix3bwqWcCqBIk
 vco4ykD/BMy3T437FlMYN6XznFlOKlwNsA==
X-Google-Smtp-Source: AA6agR5FiAKV8uryB9AIcXNuv+OkOJQapr6vDqzb0fcxsynFctpfVvlm2CTjfaRJnGR3175SVMeNBN0id9MGGQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:df03:b0:1f3:396c:dd94 with SMTP
 id gp3-20020a17090adf0300b001f3396cdd94mr34335pjb.1.1660599307097; Mon, 15
 Aug 2022 14:35:07 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:34:57 -0700
Message-Id: <20220815213458.733701-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH] target/arm: Add cortex-a35
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3C7z6YggKCowCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Add cortex A35 core and enable it for virt board.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 69 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3b6ba69a9a..20442ea2c1 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -52,6 +52,7 @@ Supported guest CPU types:
 
 - ``cortex-a7`` (32-bit)
 - ``cortex-a15`` (32-bit; the default)
+- ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..ee06003aed 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,6 +199,7 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+    ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778a..4f96b80ffb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,6 +36,74 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 
+static void aarch64_a35_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a35";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* From B2.2 AArch64 identification registers. */
+    cpu->midr = 0x410fd042;
+    cpu->revidr = 0;
+    cpu->ctr = 0x84448004;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_aa64pfr0 = 0x00002222;
+    cpu->isar.id_aa64pfr1 = 0;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr1 = 0;
+    cpu->isar.id_aa64isar0 = 0x00011120;
+    cpu->isar.id_aa64isar1 = 0;
+    cpu->isar.id_aa64mmfr0 = 0x00101122;
+    cpu->isar.id_aa64mmfr1 = 0;
+    cpu->clidr = 0x0a200023;
+    cpu->dcz_blocksize = 4;
+
+    /* From B2.4 AArch64 Virtual Memory control registers */
+    cpu->reset_sctlr = 0x00c50838;
+
+    /* From B2.29 Cache ID registers */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+
+    /* From B3.5 VGIC Type register */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+
+    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
+    /* From 3.2 AArch32 register summary */
+    cpu->reset_fpsid = 0x41034043;
+
+    /* From 2.2 AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* These values are the same with A53/A57/A72. */
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
 
 static void aarch64_a57_initfn(Object *obj)
 {
@@ -1158,6 +1226,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
+    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-- 
2.37.1.595.g718a3a8f04-goog


