Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293405FA0CF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:01:00 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuH4-0001IM-Du
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlF-0006fo-51
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlC-0005cH-9Q
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id iv17so6953191wmb.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4WEyc+UOMjigXkaKxU362KXr8MSgbNuL5VrZCUOmcFw=;
 b=LCE2VdkCPFL1kqB6MT5jioEr9HR5/lalnFjCdn4G/XPeMwqpMK6i40bg8l7N5tLxx3
 WpUq2VUDv/lwgds4CaGedYX13XBgELsJnB7Gdl+mt0dki9oa5BCf4171xAkVgMedBiC9
 oWijOdzn5PZ4wdMhDvT5FNWCF3+8IuwRojqQaq/zQ+RoR+VsfWi98FFmzmSNPpesrgvG
 ItW3/Cl2jB/Fd9iofGCdLoI3Z0zRKWNFSgtzSMngvaQs5nm5tt4w6tPGe3nITBAhbgG1
 NIYU617WQ6XiEqasH9R67iaH/plxEof44CqbGnQ4714Re1CL2MoqcvrVl90qRHx2wq7M
 4NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WEyc+UOMjigXkaKxU362KXr8MSgbNuL5VrZCUOmcFw=;
 b=SUA3rQPC5mxeQz9mwJ9/txvKpBUMd9maSVtDw2naRJYXEJLOaaBXBjBqvhmd/k6hMd
 LWgAfTeNCy/QiKGmvp+lWukgglRt1JOOG/MF9uR2xIgDu+TXwfUN/K1GcEwN1KN/6kU8
 HjdSCGvYp0Cn8JG2RdwYHTzgDak581ldUrAuQV1a3ThEQNejqmWzt75LZsJW6WQvUCWC
 MfdywBXixYCkGxdFTjJ2ktyuspwbreUFF6eyw8+eihTO4GVecMny+X8peQrk3h/6sqrK
 C/KuBomva/8ZP7WxqrefdvCqI2XRIiEf/Jmfsz+5ZX4lSbeZH3uHUgUfkaipFnU7jlWu
 jpZg==
X-Gm-Message-State: ACrzQf3svx4UU/IE/mPy1jBlTTaTNR8Fs8qJenD+QV7rTFNpsAZ5TXvS
 11EDBQGyey0xvJgilgp+LnfuWDql02AANQ==
X-Google-Smtp-Source: AMsMyM6IF1uaUzsAgWcZyoLjPXdcNb/VYdUTycM+AiHZj7L4RuFRcMbNwUmWECntT4IEqXX8GnJHBg==
X-Received: by 2002:a05:600c:12c6:b0:3bd:eeec:309 with SMTP id
 v6-20020a05600c12c600b003bdeeec0309mr20583446wmd.167.1665412080665; 
 Mon, 10 Oct 2022 07:28:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:28:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] target/arm: Use ARMGranuleSize in ARMVAParameters
Date: Mon, 10 Oct 2022 15:27:29 +0100
Message-Id: <20221010142730.502083-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have an enum for the granule size, use it in the
ARMVAParameters struct instead of the using16k/using64k bools.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221003162315.2833797-3-peter.maydell@linaro.org
---
 target/arm/internals.h | 23 +++++++++++++++++++++--
 target/arm/helper.c    | 39 ++++++++++++++++++++++++++++-----------
 target/arm/ptw.c       |  8 +-------
 3 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6166ac0a98f..9566364dcae 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1007,6 +1007,26 @@ typedef enum ARMGranuleSize {
     GranInvalid,
 } ARMGranuleSize;
 
+/**
+ * arm_granule_bits: Return address size of the granule in bits
+ *
+ * Return the address size of the granule in bits. This corresponds
+ * to the pseudocode TGxGranuleBits().
+ */
+static inline int arm_granule_bits(ARMGranuleSize gran)
+{
+    switch (gran) {
+    case Gran64K:
+        return 16;
+    case Gran16K:
+        return 14;
+    case Gran4K:
+        return 12;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Parameters of a given virtual address, as extracted from the
  * translation control register (TCR) for a given regime.
@@ -1019,10 +1039,9 @@ typedef struct ARMVAParameters {
     bool tbi        : 1;
     bool epd        : 1;
     bool hpd        : 1;
-    bool using16k   : 1;
-    bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7f578f2baa..dde64a487ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4473,6 +4473,24 @@ typedef struct {
     uint64_t length;
 } TLBIRange;
 
+static ARMGranuleSize tlbi_range_tg_to_gran_size(int tg)
+{
+    /*
+     * Note that the TLBI range TG field encoding differs from both
+     * TG0 and TG1 encodings.
+     */
+    switch (tg) {
+    case 1:
+        return Gran4K;
+    case 2:
+        return Gran16K;
+    case 3:
+        return Gran64K;
+    default:
+        return GranInvalid;
+    }
+}
+
 static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
                                      uint64_t value)
 {
@@ -4481,17 +4499,19 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     uint64_t select = sextract64(value, 36, 1);
     ARMVAParameters param = aa64_va_parameters(env, select, mmuidx, true);
     TLBIRange ret = { };
+    ARMGranuleSize gran;
 
     page_size_granule = extract64(value, 46, 2);
+    gran = tlbi_range_tg_to_gran_size(page_size_granule);
 
     /* The granule encoded in value must match the granule in use. */
-    if (page_size_granule != (param.using64k ? 3 : param.using16k ? 2 : 1)) {
+    if (gran != param.gran) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
                       page_size_granule);
         return ret;
     }
 
-    page_shift = (page_size_granule - 1) * 2 + 12;
+    page_shift = arm_granule_bits(gran);
     num = extract64(value, 39, 5);
     scale = extract64(value, 44, 2);
     exponent = (5 * scale) + 1;
@@ -10375,7 +10395,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10419,11 +10439,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     }
 
     gran = sanitize_gran_size(cpu, gran, stage2);
-    using64k = gran == Gran64K;
-    using16k = gran == Gran16K;
 
     if (cpu_isar_feature(aa64_st, cpu)) {
-        max_tsz = 48 - using64k;
+        max_tsz = 48 - (gran == Gran64K);
     } else {
         max_tsz = 39;
     }
@@ -10433,7 +10451,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
      * adjust the effective value of DS, as documented.
      */
     min_tsz = 16;
-    if (using64k) {
+    if (gran == Gran64K) {
         if (cpu_isar_feature(aa64_lva, cpu)) {
             min_tsz = 12;
         }
@@ -10442,14 +10460,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         switch (mmu_idx) {
         case ARMMMUIdx_Stage2:
         case ARMMMUIdx_Stage2_S:
-            if (using16k) {
+            if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
             break;
         default:
-            if (using16k) {
+            if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
@@ -10486,10 +10504,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .tbi = tbi,
         .epd = epd,
         .hpd = hpd,
-        .using16k = using16k,
-        .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .gran = gran,
     };
 }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ddacffa7ee6..23f16f4ff7f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1062,13 +1062,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
     }
 
-    if (param.using64k) {
-        stride = 13;
-    } else if (param.using16k) {
-        stride = 11;
-    } else {
-        stride = 9;
-    }
+    stride = arm_granule_bits(param.gran) - 3;
 
     /*
      * Note that QEMU ignores shareability and cacheability attributes,
-- 
2.25.1


