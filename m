Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A485B5FA05D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:44:04 +0200 (CEST)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohu0h-0003UM-Cv
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl1-0006Nk-8l
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkv-0005ZE-UH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 bi26-20020a05600c3d9a00b003c1e11f54d2so5421096wmb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7cxLu4UXCoYBUifAO+tW7g0KPLs2vmro0DH/gpL87Mc=;
 b=wo4GKH7wBkW6zy0LLxJyaIJE5iTs1NiQkWiQG/3GVz8VrKIThEtcBZM8MoKmuVCx0Z
 UAX94RJs7xS7DkqL94G7Y9NkfudGBF/zX+zow/59huOzqy8BvyRIi2i0PnaqLZmC017/
 Yb3v5QndEtIDsnnG5FRR7CUvs8sYcTfm1y5+zcTI1sH15LP3vd9BZM4+dCq5M8N23B/j
 lq9W4pKzHZrLud+4AcJ0vXKoFc/i9mjNlEB2air5p+KNk+8glAhNwYF9ynpX+SkK9fKE
 snw0Bnu1/U6ZcYh71FgJ8NCjOu4PJzHEFq95tWgwX70nBOAxF6+gd9YrldDPT/RU43eY
 4sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cxLu4UXCoYBUifAO+tW7g0KPLs2vmro0DH/gpL87Mc=;
 b=M2t49csZqWEerzf6+U22G9XT2rzAiS719DMgcvMqrtgcoJsDqMKTwZRDwJD6vB47gD
 k1+hB9eB4H3QM2a7esbwd1AYZ0HH9rNhmpRbCs5B31Pb8F/xCiLQh2N6k5BiAjjCLxgp
 5MdoeQtnu7e+b54kUsHfZ3zS4YZu5caO9wWn9xBBNcG7Flpn/CzNpwp8JKiiIcFPm8nr
 dhx9h5W0eth+SODD3E2lSYK7Frf0vhv/Vdr5QvR150kgh63g3vxn7i+tAL09FdoxVGDt
 1znGWOjEu0uuIWfKjultd3piLN3KnNf56HIOhZwwV3euFG/JVZSiU/MqXDy0N/8SVSBt
 hFEg==
X-Gm-Message-State: ACrzQf3NApplZgKuwCUwjEH4+PLxr5evfMcUNTPc/tNqQB01c++axtd8
 x+gwmADmP+eu07YaQ676ScjExRriUIEFYw==
X-Google-Smtp-Source: AMsMyM7g5T3Fb6GVUWfoBX18AVk0J9lMI5kqg9Af45dHxoAWwqk6HpBSOZuDmkjQLa36G5e2FJ3Esg==
X-Received: by 2002:a05:600c:1c16:b0:3c6:bb05:702c with SMTP id
 j22-20020a05600c1c1600b003c6bb05702cmr2519110wms.203.1665412064363; 
 Mon, 10 Oct 2022 07:27:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/28] target/arm: Add TBFLAG_M32.SECURE
Date: Mon, 10 Oct 2022 15:27:13 +0100
Message-Id: <20221010142730.502083-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from arm_tr_init_disas_context.
Instead, provide the value of v8m_secure directly from tb_flags.
Rather than use regime_is_secure, use the env->v7m.secure directly,
as per arm_mmu_idx_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 2 ++
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 68d99565ac4..a085c172974 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3203,6 +3203,8 @@ FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 /* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
 FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
+/* Set if in secure mode */
+FIELD(TBFLAG_M32, SECURE, 6, 1)
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c08a7b35a04..8d82c147623 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10948,6 +10948,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5aaccbbf71d..ac647e02628 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9351,8 +9351,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
-        dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-            regime_is_secure(env, dc->mmu_idx);
+        dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
         dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-- 
2.25.1


