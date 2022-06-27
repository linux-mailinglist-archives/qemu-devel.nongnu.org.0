Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F33755B93A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:42:25 +0200 (CEST)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mCG-0002ND-JJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltQ-0002P2-8k
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:56 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltO-0004rv-MY
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k22so12340593wrd.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+S+ij/JQ6BulpHI6mAQb2Jx6jbogpzOBoVPGxRe8ARY=;
 b=Dn4C12xOln0TZLa+62Y6fTKUAogiLAtQvuofcV7nnOybkWoHRHoT9gaKzZhpPR2ZqF
 7USdDFq8xf6lAqcu7b2QjMo3w4XmTvqIQ2Xnr3uH4Achj2rjAuRp4L3PwIF2VGUUKD3G
 6XF58MncAH5ekdKGUk9rA38zWLItU5amzgxACZ1/dutTq1vfCuPugqpT/B+TteUWtoqk
 XBh0xkzIBRDHRUNOlorkOARmv7kY19kFQBCwDezR1TZujY4JoDGVcoPx0Mglz7sqAgJl
 g2TH5qgy+AHnY11PASkBXA/r0XlYaKgMdf1+1u1T5fQXyymx+KZGgf46iXJKdZh9Jjrq
 BLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+S+ij/JQ6BulpHI6mAQb2Jx6jbogpzOBoVPGxRe8ARY=;
 b=TXn3uRV3rvRI0yX6HlyzlR67u4eGX/XvHY1lZslZL8ANkCIctUsyH+Ip40+6Tp2QjV
 t/ZKxvUFIZiGJuPRoQEWGklOMx611wwXzPzXUZGXf8w0NuJfzAke2lJO/EOZkEP4d18B
 2qwk3U1RsAZDNCxWjsNFXh+U8WaO3ivYmfOmtvIQS+aMItb66fSLCDvLdsd/eyewRaOo
 iWgbN/2ilgtgctoXDkzbMnn3I9hhGiAODwUWgXFX7d84ldqhIXEu9Hv6AapgV1l1evxK
 fYKvdjNxGrwiVSRs0qFk4nO2ITbNOLnmhpTg9ZOPjfq+FAR7hU75RwzOUOC3DuK111VV
 XUzw==
X-Gm-Message-State: AJIora9A2himW7pSlMy7BUpibs//Dc16CwwwaiQk7LT0E+IN/xJO0OL2
 apw8hVmOACbgaOtYAtt++EWADkwNVw2fyg==
X-Google-Smtp-Source: AGRyM1vKSF54YAIH+NxUNlpmKErSuA2GFMncJ0qUfA+TeDRopcBlHay9S/FHUQIf3deqgcQwUTvGAg==
X-Received: by 2002:a5d:67c3:0:b0:21b:8cd4:ad60 with SMTP id
 n3-20020a5d67c3000000b0021b8cd4ad60mr12066569wrw.380.1656325374001; 
 Mon, 27 Jun 2022 03:22:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/25] target/arm: Introduce sve_vqm1_for_el_sm
Date: Mon, 27 Jun 2022 11:22:32 +0100
Message-Id: <20220627102236.3097629-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

When Streaming SVE mode is enabled, the size is taken from
SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
set of vector lengths is not.  Further, Streaming SVE does
not require any particular length to be supported.

Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
to the new function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  9 +++++++--
 target/arm/helper.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c018f97b77b..0295e854838 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1154,13 +1154,18 @@ int sve_exception_el(CPUARMState *env, int cur_el);
 int sme_exception_el(CPUARMState *env, int cur_el);
 
 /**
- * sve_vqm1_for_el:
+ * sve_vqm1_for_el_sm:
  * @env: CPUARMState
  * @el: exception level
+ * @sm: streaming mode
  *
- * Compute the current SVE vector length for @el, in units of
+ * Compute the current vector length for @el & @sm, in units of
  * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ * If @sm, compute for SVL, otherwise NVL.
  */
+uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm);
+
+/* Likewise, but using @sm = PSTATE.SM. */
 uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a80ca461e53..2e4e739969a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6272,23 +6272,41 @@ int sme_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t len = cpu->sve_max_vq - 1;
+    uint64_t *cr = env->vfp.zcr_el;
+    uint32_t map = cpu->sve_vq.map;
+    uint32_t len = ARM_MAX_VQ - 1;
+
+    if (sm) {
+        cr = env->vfp.smcr_el;
+        map = cpu->sme_vq.map;
+    }
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+        len = MIN(len, 0xf & (uint32_t)cr[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+        len = MIN(len, 0xf & (uint32_t)cr[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-        len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+        len = MIN(len, 0xf & (uint32_t)cr[3]);
     }
 
-    len = 31 - clz32(cpu->sve_vq.map & MAKE_64BIT_MASK(0, len + 1));
-    return len;
+    map &= MAKE_64BIT_MASK(0, len + 1);
+    if (map != 0) {
+        return 31 - clz32(map);
+    }
+
+    /* Bit 0 is always set for Normal SVE -- not so for Streaming SVE. */
+    assert(sm);
+    return ctz32(cpu->sme_vq.map);
+}
+
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
+{
+    return sve_vqm1_for_el_sm(env, el, FIELD_EX64(env->svcr, SVCR, SM));
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


