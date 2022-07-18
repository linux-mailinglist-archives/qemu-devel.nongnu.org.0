Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F102578569
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:30:09 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRlA-0003es-4P
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHe-00029Q-43
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHZ-0003B8-OH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id id17so97980wmb.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eukvC+6HlCYJEnDc50zk+LTUKV0cWVgf+mK6xiITMuE=;
 b=X9f206kEoBpc4fjMTey1P0v2URTVdccCh80ZKxCmHcagJBKz4E9NEHUdKkTi6V2Raa
 7mMaX8flonuBktLHZMsGuK7c7TRO3xQ9Ns+kpgoO91E0iwDCojQaRlqZSpoWKt43CMBm
 2xPj1ij9OWilzOPf0re1Ca9ZRiyOl0tQsrFYH8qXzy0Kes17MfH9lId5+VATaeJoa7ZP
 6m7uA+2kQmULmDic8JnnWv6H8WA/KWWEraHfD7G1ou78rKJlUUeuFXD/sxfZHTx6HXg5
 dJJM8/tAW14DO6sOke1/UQY8Bmnvf3bdJ3BJqT065Jri14u+V7bN29JPzNgcM+LxVhbI
 viMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eukvC+6HlCYJEnDc50zk+LTUKV0cWVgf+mK6xiITMuE=;
 b=aTRTfgqFwjkycRp0+wlj1Zxm1TJKDo3c1Ej9h1GcmmeV9aNRRGgR55tOk3MOvIdxfq
 8gTP5jk93Xe0srXq5GMyVmrLG6o4LoWoOGs5lLFBg1bBX4rVeyUTd0zNL8BY0shRK/hb
 qDwK0AmRqaY0Gej4ijRuxF4Bbkm/l+pi66fow5DWVMBHGiGMvAOgZiA6iM+67n/mjaq0
 IWf8e8etfnNSQCo+eo4mXq4b9I93iN3R04oT5Or5RPZTTPJ7DwbLodLnnjVkXoZ7OJZ5
 NVF7sSwKdcCD/yoOZADuNlDfC0g+/z9vTnq6dgmvWtQbYD2dnUsmLliAEg+29VMsbDGc
 X7WQ==
X-Gm-Message-State: AJIora8uoNAwZICLYO+Y0LNtNYq3ekmLgq0nI+f69gYEB3A+rGFoc7KR
 pw7m1DKn1tCFfjbAxbzPdNz3UIdtouTe3A==
X-Google-Smtp-Source: AGRyM1srd4gjnAsVblNA4KaVeykh6qBzOriWtI0lcQ6MtwKHl1D/NSKgQqS83vF1T39+REDmwVNpVQ==
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id
 bg34-20020a05600c3ca200b003a018252e6bmr31858625wmb.132.1658152772151; 
 Mon, 18 Jul 2022 06:59:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] target/arm: Honour VTCR_EL2 bits in Secure EL2
Date: Mon, 18 Jul 2022 14:59:16 +0100
Message-Id: <20220718135920.13667-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

In regime_tcr() we return the appropriate TCR register for the
translation regime.  For Secure EL2, we return the VSTCR_EL2 value,
but in this translation regime some fields that control behaviour are
in VTCR_EL2.  When this code was originally written (as the comment
notes), QEMU didn't care about any of those fields, but we have since
added support for features such as LPA2 which do need the values from
those fields.

Synthesize a TCR value by merging in the relevant VTCR_EL2 fields to
the VSTCR_EL2 value.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1103
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-8-peter.maydell@linaro.org
---
 target/arm/cpu.h       | 19 +++++++++++++++++++
 target/arm/internals.h | 22 +++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b43083c5ef5..e890ee074d3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1412,6 +1412,25 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define TTBCR_SH1    (1U << 28)
 #define TTBCR_EAE    (1U << 31)
 
+FIELD(VTCR, T0SZ, 0, 6)
+FIELD(VTCR, SL0, 6, 2)
+FIELD(VTCR, IRGN0, 8, 2)
+FIELD(VTCR, ORGN0, 10, 2)
+FIELD(VTCR, SH0, 12, 2)
+FIELD(VTCR, TG0, 14, 2)
+FIELD(VTCR, PS, 16, 3)
+FIELD(VTCR, VS, 19, 1)
+FIELD(VTCR, HA, 21, 1)
+FIELD(VTCR, HD, 22, 1)
+FIELD(VTCR, HWU59, 25, 1)
+FIELD(VTCR, HWU60, 26, 1)
+FIELD(VTCR, HWU61, 27, 1)
+FIELD(VTCR, HWU62, 28, 1)
+FIELD(VTCR, NSW, 29, 1)
+FIELD(VTCR, NSA, 30, 1)
+FIELD(VTCR, DS, 32, 1)
+FIELD(VTCR, SL2, 33, 1)
+
 /* Bit definitions for ARMv8 SPSR (PSTATE) format.
  * Only these are valid when in AArch64 mode; in
  * AArch32 mode SPSRs are basically CPSR-format.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 742135ef146..b8fefdff675 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -777,6 +777,16 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.sctlr_el[regime_el(env, mmu_idx)];
 }
 
+/*
+ * These are the fields in VTCR_EL2 which affect both the Secure stage 2
+ * and the Non-Secure stage 2 translation regimes (and hence which are
+ * not present in VSTCR_EL2).
+ */
+#define VTCR_SHARED_FIELD_MASK \
+    (R_VTCR_IRGN0_MASK | R_VTCR_ORGN0_MASK | R_VTCR_SH0_MASK | \
+     R_VTCR_PS_MASK | R_VTCR_VS_MASK | R_VTCR_HA_MASK | R_VTCR_HD_MASK | \
+     R_VTCR_DS_MASK)
+
 /* Return the value of the TCR controlling this translation regime */
 static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
@@ -785,10 +795,16 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
     if (mmu_idx == ARMMMUIdx_Stage2_S) {
         /*
-         * Note: Secure stage 2 nominally shares fields from VTCR_EL2, but
-         * those are not currently used by QEMU, so just return VSTCR_EL2.
+         * Secure stage 2 shares fields from VTCR_EL2. We merge those
+         * in with the VSTCR_EL2 value to synthesize a single VTCR_EL2 format
+         * value so the callers don't need to special case this.
+         *
+         * If a future architecture change defines bits in VSTCR_EL2 that
+         * overlap with these VTCR_EL2 fields we may need to revisit this.
          */
-        return env->cp15.vstcr_el2;
+        uint64_t v = env->cp15.vstcr_el2 & ~VTCR_SHARED_FIELD_MASK;
+        v |= env->cp15.vtcr_el2 & VTCR_SHARED_FIELD_MASK;
+        return v;
     }
     return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
-- 
2.25.1


