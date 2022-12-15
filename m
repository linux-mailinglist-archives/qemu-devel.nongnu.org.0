Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F00064DBA3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngw-0006k7-Mf; Thu, 15 Dec 2022 07:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngt-0006iZ-Tl
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:23 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngs-00045o-3Z
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so13711116wmn.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UcEEPbA9TVrn0lA237GLQjyDDGjqynsdLl9q4ZxOLp8=;
 b=fK2KfFjPt3k+yQI1IJJrETktve6iEJfRpRI7wdl4jbmU8XSvQN5HXR3EswRhFiyh6D
 vLRA6D1LInNkbS2RYJVOyiDTwHVilJAgWJ2DvbB/+E1fmhbxY98KirmHo5So9a3pW4Ny
 VgzmrDILdvTM2zLtT4/vzsm983+h7+wVgNq/zres0FWueanKJdnjUhQ9xR9wpAA9Kaou
 457QkwKClUErPqUrnJwlpSyL4KFIIX+GCbBOj/KFmIUbkuGxDH66rLUSqX47pziKxr5j
 mrMtATdSImeMrVH9bxH6efGLAuigwApCwy2JsiEXBgb+w77LyZmFzW/fNiTzRkea0XgL
 ZbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcEEPbA9TVrn0lA237GLQjyDDGjqynsdLl9q4ZxOLp8=;
 b=aR8E+Bq3pxpgi6GC6LhBhj3qh/eaCUo6qNFv3xRzsen01pJTHRkXshlyxzeOQCsz3C
 +uC3bYMzqFbYzuNxHSuXwipHicQtlnbbbS68722FiwYqFG1bMWPXfWI4afdtJPX7GJAI
 yCUShmK9uDT4F6izQzAXkGpjsXTPfopVPeOv/gIA4GLIbgDctwZIaJvPGTcNJlmCWV+L
 OYbZxrmrbzSNTszprVGR/IDzfSoKU+gZpJAbluv5ZooPRLvb+dUagbWc004dERyUswZq
 2bIsvR5ErSXlMYAnuo+HxXnhCV8owBnX9yPfsen7GfAsLuBi6wxj6rDVej3u5GLPhj5B
 4qJg==
X-Gm-Message-State: ANoB5pknynAWD2s7y3mZ9O6C3tcnk+XuA17XjRtWlwA685nWZmdhFGVl
 U3LsU3xHP+pMfFQ1NLWdz6hr5y7ER/I1Sl46
X-Google-Smtp-Source: AA0mqf6Kv3Hk7abZiOIAoiH2PmRqiyUS3kZOZt3E/9E+VaLCZ5C7JprsbNqui95pQkov2ZgJGuE07g==
X-Received: by 2002:a05:600c:6899:b0:3d1:cfcb:7d19 with SMTP id
 fn25-20020a05600c689900b003d1cfcb7d19mr29640840wmb.32.1671108620317; 
 Thu, 15 Dec 2022 04:50:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/29] target/arm: Add Cortex-A55 CPU
Date: Thu, 15 Dec 2022 12:49:49 +0000
Message-Id: <20221215125009.980128-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Timofey Kutergin <tkutergin@gmail.com>

The Cortex-A55 is one of the newer armv8.2+ CPUs; in particular
it supports the Privileged Access Never (PAN) feature. Add
a model of this CPU, so you can use a CPU type on the virt
board that models a specific real hardware CPU, rather than
having to use the QEMU-specific "max" CPU type.

Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
Message-id: 20221121150819.2782817-1-tkutergin@gmail.com
[PMM: tweaked commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 69 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 188a4f211f4..1cab33f02e3 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -54,6 +54,7 @@ Supported guest CPU types:
 - ``cortex-a15`` (32-bit; the default)
 - ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
+- ``cortex-a55`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bf59784aefa..a2dd48dfb80 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -207,6 +207,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3d74f134f57..cec64471b4e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -792,6 +792,74 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a55_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a55";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by B2.4 AArch64 registers by functional group */
+    cpu->clidr = 0x82000023;
+    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
+    cpu->dcz_blocksize = 4; /* 64 bytes */
+    cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
+    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
+    cpu->isar.id_aa64pfr0  = 0x0000000010112222ull;
+    cpu->isar.id_aa64pfr1  = 0x0000000000000010ull;
+    cpu->id_afr0       = 0x00000000;
+    cpu->isar.id_dfr0  = 0x04010088;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x01011121;
+    cpu->isar.id_isar6 = 0x00000010;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_mmfr4 = 0x00021110;
+    cpu->isar.id_pfr0  = 0x10010131;
+    cpu->isar.id_pfr1  = 0x00011011;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->midr = 0x412FD050;          /* r2p0 */
+    cpu->revidr = 0;
+
+    /* From B2.23 CCSIDR_EL1 */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */
+
+    /* From B2.96 SCTLR_EL3 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    /* From B4.45 ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x13211111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* From D5.4 AArch64 PMU register summary */
+    cpu->isar.reset_pmcr_el0 = 0x410b3000;
+}
+
 static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1243,6 +1311,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
-- 
2.25.1


