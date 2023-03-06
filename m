Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BBA6AC5A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:39:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrT-00045D-Mo; Mon, 06 Mar 2023 10:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrQ-00043S-DC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:48 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrO-00029y-Kh
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:48 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h11so9258499wrm.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n3nNUjZBhON55v351EAFbDNEjPLJymf5+GUgr1/Qymw=;
 b=aYAg5obJhI8y9PrLC7CL0XW5lLkP8E8jSM+gK+VEZEVOjdT9D60a8CnkQdS/73Gs/8
 4eib76uVstmW4KXf69WtHV+hc+E9k5ft86Qnape5VvYZ7lmol8a+1YZgykaCjRR1c7Bt
 1CTbOrn+S+gbvENcSukKAy0l/pq2JHRBHy0GKMsC/UDRxNdEzRzx+NGPwj2bVd53pDPf
 fdlRUbb70Jnti6oHMOUT9CL/jZrhngvktAXkxmjrUhUlLiHUztnGJTceGUXCR5K8lcQz
 2BTpLgmG8X3lfLZrLDwudBiIWNhurhCPChCxRtzFnZfG3OXC6hkVJJvGXUH1iWWUqqC7
 xwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3nNUjZBhON55v351EAFbDNEjPLJymf5+GUgr1/Qymw=;
 b=2cEIvqqMXwCRo57489ujTJlJdyqJqGXnXKqlHIHVNAGHDS+M4O7Y5yw8xPqoNZ4SY+
 6X8wt+ELXIsCkW+z4mO4O8J7rG1RdwlhZu8EtkbDls749WCTWsLyUsKu7/kMf91p+50X
 jIeek0LrFQ02iwQV0L5z4pRgva9YXmJ8bbZpPXZkpWeCq9ch0L94o/GY8zGlZdWJmiXU
 bgTP4mpUV5EH3xn+UgSwQgHRHDBABaNwIN55aeBdrinXHB58l5E9HNQFJfdhuzBVM3fI
 zCtxHxsOvpufbaMIpXPd6gE5JBezcMOex6xS1+3k4K88IpLo87A3S2dwppk7WiKSR6yx
 CGXg==
X-Gm-Message-State: AO0yUKUsB4WAWrRWVcD7Cs5ApscscceObjAcoR2k/VZd3JDoWvX0Hv9i
 Qfh5kzSwsKGDCo60PNybrQNL310qp8msGDzFp8U=
X-Google-Smtp-Source: AK7set/X8NdWN/H3YK3g4yJlkweU2QN7iQk3mpSXMvQ1cwWViB6OO5Ns8O+MYxppmffNZdirH4XITQ==
X-Received: by 2002:a5d:4dc5:0:b0:2c5:55cf:b1ab with SMTP id
 f5-20020a5d4dc5000000b002c555cfb1abmr5985682wru.48.1678116885353; 
 Mon, 06 Mar 2023 07:34:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] target/arm: Create pauth_ptr_mask
Date: Mon,  6 Mar 2023 15:34:24 +0000
Message-Id: <20230306153435.490894-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Keep the logic for pauth within pauth_helper.c, and expose
a helper function for use with the gdbstub pac extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h        | 10 ++++++++++
 target/arm/tcg/pauth_helper.c | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 15988768be3..c891c7a3831 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1368,6 +1368,16 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/**
+ * pauth_ptr_mask:
+ * @env: cpu context
+ * @ptr: selects between TTBR0 and TTBR1
+ * @data: selects between TBI and TBID
+ *
+ * Return a mask of the bits of @ptr that contain the authentication code.
+ */
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
 
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index d0483bf051e..20f347332dc 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,14 +339,32 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
 {
-    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
-    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
+static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+{
+    uint64_t mask = pauth_ptr_mask_internal(param);
+
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    if (extract64(ptr, 55, 1)) {
+        return ptr | mask;
+    } else {
+        return ptr & ~mask;
+    }
+}
+
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_ptr_mask_internal(param);
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-- 
2.34.1


