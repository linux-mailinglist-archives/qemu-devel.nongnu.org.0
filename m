Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E3E390C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:58:50 +0200 (CEST)
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNgRk-0003UO-5Q
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxg-0007A6-0C
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNfxe-0000jA-L0
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:43 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNfxe-0000iF-EB
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 12:27:42 -0400
Received: by mail-wm1-x341.google.com with SMTP id v6so3230483wmj.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Mk85QypYDHQ0fOkvmDB53SsHXryn+nYp39hNgWX4kxU=;
 b=AGMo3tQg390u3lF2ARQ4IHu8IMm0Oucb0mlsrmZGQJgUmJup0tAahvuUteScU3QzKy
 I7X9PQCuME9zG3AdqdaSwB1xXSNBbfyRN89AUmuQdHcgtGvRD2pupSIFleJP/nWowIc1
 ZQPaEGZozLONvbxnPM7gfMgpmCKgY+tLYbLSkQX+MYOwaQQM/2fCqAWE4ttCzp/RWAFt
 boF1XMu0a8T7wRPKDwzzYSWwogeWZ2RJycCiT2ebuie1wHbFE22EqNslClh8GdYKxnYZ
 69RBlITJG6Gz+4qQdeY/hOMKOi1mCNR5XNY+tLzmNK3eQlTdI75mWfjRKP6uaUx5qh5K
 cFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mk85QypYDHQ0fOkvmDB53SsHXryn+nYp39hNgWX4kxU=;
 b=bQ+NiFe2/LkYQDIiBSD8Y3a7UrVbLKlmTGBqtF4qbVSF/25ynS6/v+BLXdheGufng3
 ekvBcOOG5rafUQnsp7QZHUrLTjQUfc9r1xw4BHkaiBHRu1djAyqIOgc6AIOEa16A1jTe
 a9QUZ2UFh0jxSIpL+bPzwigegtqq/6FItPiEo19RhMK47B/abBZqO4KVbWkDTD3REguU
 X7EQgxZ/qpMxVW9UyHhE5751n60trdyxMGwoLo5VzZS2spMjsRZX/WayQcjLdiYrWHMT
 s7PFE+U1Dpd88m1q9hIflP1xxxP3GN6idgrwCNtsBfNkCNq2I/0Y5wz+dwhKYS6a2mOx
 tAoQ==
X-Gm-Message-State: APjAAAWUuWrwjTcnRx27eAl1xELqWFRprkwlv2Y8ihVfJLHlAKLgkgYz
 jGPTw685iN2HWvDP1nR3M3bb0fQZ/ho=
X-Google-Smtp-Source: APXvYqziKxTBvSMWvjoY5FSX3G0yJ1Qsc0ImpXX8ZUNmUMcC3E2lQjgAoT+M8hCqOh9Zj1yzUcHpKA==
X-Received: by 2002:a1c:7719:: with SMTP id t25mr5530502wmi.56.1571934456271; 
 Thu, 24 Oct 2019 09:27:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r27sm42606124wrc.55.2019.10.24.09.27.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:27:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/51] target/arm: Split out rebuild_hflags_m32
Date: Thu, 24 Oct 2019 17:26:40 +0100
Message-Id: <20191024162724.31675-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024162724.31675-1-peter.maydell@linaro.org>
References: <20191024162724.31675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a function to compute the values of the TBFLAG_A32 bits
that will be cached, and are used by M-profile.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191023150057.25731-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 45 ++++++++++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4c65476d936..d4303420daf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11083,6 +11083,29 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    uint32_t flags = 0;
+
+    if (arm_v7m_is_handler_mode(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
+    }
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
+          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11168,7 +11191,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     } else {
         *pc = env->regs[15];
-        flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+        } else {
+            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+        }
+
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
         flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
@@ -11204,20 +11233,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_v7m_is_handler_mode(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
-    }
-
-    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
-     * suppressing them because the requested execution priority is less than 0.
-     */
-    if (arm_feature(env, ARM_FEATURE_V8) &&
-        arm_feature(env, ARM_FEATURE_M) &&
-        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
-    }
-
     if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
         FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
         flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-- 
2.20.1


