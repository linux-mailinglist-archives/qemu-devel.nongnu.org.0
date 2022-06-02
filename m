Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8EB53C0CD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:28:14 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtIb-0000QT-Un
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwshA-0005AX-PK
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh7-0008Uu-L3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso10610722pjl.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhJvn7lta1l85O0X30U0sb1LNyfda1dipXteH4TF7HU=;
 b=ZgosxLuuS454bCUZqRWGQ/vjx886IWWL9b+2MM5eIiSKYiRmBtVyIpj9cT+F4pk4Dv
 pL0uT8SOVNUjfifkmo90DyBsEQQp3YrZ3LwSZADRtJctV5/x89xiONlTmdCT2aAC6HDE
 63Vd0HOeI9Z0JL4zLE8BNDeK/mooJr+VQIWUXze3Mm8mQ2c4qV5w32OB+rtEkn7IXHri
 Ti/NmV1aUtExCNehxnR+TRaLpj0sm2opHYpF0ukwRNSbOWxHvHuKPF+SwoL1i6P5Qrz9
 AEHQPvQ7VikI2hHltfaZaEQsAjj6p3RokizZrW5G+aIfqxM920cSrfALF3aY6D/f9TK0
 x/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhJvn7lta1l85O0X30U0sb1LNyfda1dipXteH4TF7HU=;
 b=axu6eJwvu//sCpPK00+W4+6WCAqUwJQmw8+q12nltmbJTV3IXwuMOHx3KmnGH8h4dt
 w27I04ZfWs+Lr5FKRpKIlQZr+MfCsnMkmTniA2vaJ9aTiDOiC7GrazqLn5IRPcuP9hZ+
 bm8LkJNq9z3w9C901FkwI1RpXi1TqsSW+XokojuNULelPOhWRgp3rjLWxfpMOLTgZ5Dk
 SIwqQL/9AtQ7DUZl4GD5tXZ5+Sh59NaLp2tbE90JEuows/3NX65rD931h/z87u4aI3vS
 xAhNDg4cU1tJ1JEiwUwHiMvnflurAn0IgtdUP6X74YftCa8nxeBPfp0W4heRcSsGB64J
 M6jQ==
X-Gm-Message-State: AOAM531DKP17ohVlix8a7DmEGknDGPbCQYOHkLaMsOe9w0hlIU99OMuw
 optPQmafpCG5ZisARkuPIIglOTs+UxttpA==
X-Google-Smtp-Source: ABdhPJx1nEf/jfxJN4YdyugQ0ld78xSTm+nclM5Bowt/sFm54MLW827m7KqIeTQGmuQzPClMv+yMvA==
X-Received: by 2002:a17:903:18a:b0:166:ba97:8b19 with SMTP id
 z10-20020a170903018a00b00166ba978b19mr1719240plg.62.1654206567847; 
 Thu, 02 Jun 2022 14:49:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 38/71] target/arm: Introduce sve_vqm1_for_el_sm
Date: Thu,  2 Jun 2022 14:48:20 -0700
Message-Id: <20220602214853.496211-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

When Streaming SVE mode is enabled, the size is taken from
SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
set of vector lengths is not.  Further, Streaming SVE does
not require any particular length to be supported.

Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
to the new function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  9 +++++++--
 target/arm/helper.c | 32 +++++++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d74c06e2f0..e41a75a3a3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1140,13 +1140,18 @@ int sve_exception_el(CPUARMState *env, int cur_el);
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
index 2e7669180f..cb78d2354a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6276,23 +6276,41 @@ int sme_exception_el(CPUARMState *env, int el)
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
2.34.1


