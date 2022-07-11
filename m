Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA295706A1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:09:25 +0200 (CEST)
Received: from localhost ([::1]:39772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAv2K-0005eK-2m
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvt-00071U-TJ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvh-0002qz-Td
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id r10so972991wrv.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v+KpABCiERhEMgs7leq7TSMjJyDNMo+se3mODEwafVE=;
 b=vLBYM+P0gHjlS8+mJgvn4d9dDAouNdzgQfc1sutxElNyW/hVbDmbxclVU4UjWEMRMA
 bpKPFrgE5HnOPw28N/BRv8xYQRmihvRFWnwbOt9SEo4SnUd54FpurJrmrM7fpYH49J8O
 Dix8GqeTBV6gn7t+T0XxocW7/Z0uymrTuUH1zF6IBPEFFYW4mE1d7GJ7a7K5MYOC6BCb
 CGAyjjh0r692A8ZkuVy7bULtouRlH7Q1fGIhtRh9yXUiT5zYWb/xU5u3TMf9CeRlsbvJ
 JnhJQpnDiUNarHR8PAkWyIYRnweH02xhthEaebXe3V4J7+xwsdKnJYh9Kf625tzfRdLa
 eAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+KpABCiERhEMgs7leq7TSMjJyDNMo+se3mODEwafVE=;
 b=szmH1WBh1x4pknv+lSHizEdSc+E6Yh+tHn45EUE9DumcsNIRwoNTIKGjjbzY+Y1Dt7
 tuZSBb4UdnbP3q9SOR4lI5nG0H5qDs8n9HdAmmhqHyHLwKO9b3u0pwCd0sWx8Zr31p7h
 RgWGvcjR+9FUiwo4irRWQ5yTTnFCvOycqsb4hDIi6/2+I821YrXbpvpsC2J6PB+dIria
 4nSli6TsRna2/x5o/2aakvybeRyYTtFPED6zrL7hE2YWHSjQ17ut6Ik97sr18H289MCu
 HLexm+FMvCLBo0XtsWkLN6+4oPH2PwShtSqH058DdUo4vY+50su57Fqcddeb48yXf/zB
 vP5Q==
X-Gm-Message-State: AJIora9FpsCS9cl+vl2QS/XEZ4pKoShOZPexU11Yu/IokmVVYGIuas88
 jNQCs9w72+aTKp2FNOV9bpN72hFndmnP3A==
X-Google-Smtp-Source: AGRyM1tN4A2cb+l5vkZUyeWj7MRp13zQiJ0LipfsmHhypcFpFRRA5QXvKBWRmDT+bQMAEb87cazVBQ==
X-Received: by 2002:adf:dc0d:0:b0:21d:ea5:710f with SMTP id
 t13-20020adfdc0d000000b0021d0ea5710fmr17032110wri.48.1657547908036; 
 Mon, 11 Jul 2022 06:58:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Mon, 11 Jul 2022 14:57:47 +0100
Message-Id: <20220711135750.765803-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

These prctl set the Streaming SVE vector length, which may
be completely different from the Normal SVE vector length.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-43-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 54 +++++++++++++++++++++++++++++++
 linux-user/syscall.c              | 16 +++++++++
 2 files changed, 70 insertions(+)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 40481e66635..907c3141466 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,6 +10,7 @@ static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
+        /* PSTATE.SM is always unset on syscall entry. */
         return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
@@ -27,6 +28,7 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
         uint32_t vq, old_vq;
 
+        /* PSTATE.SM is always unset on syscall entry. */
         old_vq = sve_vq(env);
 
         /*
@@ -49,6 +51,58 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 }
 #define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
+static abi_long do_prctl_sme_get_vl(CPUArchState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        return sme_vq(env) * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_get_vl do_prctl_sme_get_vl
+
+static abi_long do_prctl_sme_set_vl(CPUArchState *env, abi_long arg2)
+{
+    /*
+     * We cannot support either PR_SME_SET_VL_ONEXEC or PR_SME_VL_INHERIT.
+     * Note the kernel definition of sve_vl_valid allows for VQ=512,
+     * i.e. VL=8192, even though the architectural maximum is VQ=16.
+     */
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))
+        && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
+        int vq, old_vq;
+
+        old_vq = sme_vq(env);
+
+        /*
+         * Bound the value of vq, so that we know that it fits into
+         * the 4-bit field in SMCR_EL1.  Because PSTATE.SM is cleared
+         * on syscall entry, we are not modifying the current SVE
+         * vector length.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, 16);
+        env->vfp.smcr_el[1] =
+            FIELD_DP64(env->vfp.smcr_el[1], SMCR, LEN, vq - 1);
+
+        /* Delay rebuilding hflags until we know if ZA must change. */
+        vq = sve_vqm1_for_el_sm(env, 0, true) + 1;
+
+        if (vq != old_vq) {
+            /*
+             * PSTATE.ZA state is cleared on any change to SVL.
+             * We need not call arm_rebuild_hflags because PSTATE.SM was
+             * cleared on syscall entry, so this hasn't changed VL.
+             */
+            env->svcr = FIELD_DP64(env->svcr, SVCR, ZA, 0);
+            arm_rebuild_hflags(env);
+        }
+        return vq * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_set_vl do_prctl_sme_set_vl
+
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
     ARMCPU *cpu = env_archcpu(env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cbde82c9076..991b85e6b4d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6343,6 +6343,12 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 #ifndef PR_SET_SYSCALL_USER_DISPATCH
 # define PR_SET_SYSCALL_USER_DISPATCH 59
 #endif
+#ifndef PR_SME_SET_VL
+# define PR_SME_SET_VL  63
+# define PR_SME_GET_VL  64
+# define PR_SME_VL_LEN_MASK  0xffff
+# define PR_SME_VL_INHERIT   (1 << 17)
+#endif
 
 #include "target_prctl.h"
 
@@ -6383,6 +6389,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_unalign
 #define do_prctl_set_unalign do_prctl_inval1
 #endif
+#ifndef do_prctl_sme_get_vl
+#define do_prctl_sme_get_vl do_prctl_inval0
+#endif
+#ifndef do_prctl_sme_set_vl
+#define do_prctl_sme_set_vl do_prctl_inval1
+#endif
 
 static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
                          abi_long arg3, abi_long arg4, abi_long arg5)
@@ -6434,6 +6446,10 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
         return do_prctl_sve_set_vl(env, arg2);
+    case PR_SME_GET_VL:
+        return do_prctl_sme_get_vl(env);
+    case PR_SME_SET_VL:
+        return do_prctl_sme_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.25.1


