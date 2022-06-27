Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CA55B939
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:41:57 +0200 (CEST)
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mBo-000203-VU
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltR-0002QO-Oe
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltP-0004we-WF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so4526735wmp.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JY/mUAhmGGRxTqGc0ySxNo9o+GOj/TKXdVaiRq7sV+I=;
 b=b451WTlOCtJGE4ndovu4eqgdOHvn57xlvI7tC2dsxibPxyCJfvXCf6s+3bQRsrlJue
 pA4OgL/eTVmUU2e1EULHnYp87KksQhjmg89vhnCh4EIGgp3es0k6wSwrPqiESASEJ5X+
 mqO56p1ULLzm60krcMrTkxpHSDZxhGO1xYtXsyEQQ6I5GweiO0Or/yQ9KhGqxmkMaCm1
 WviPcekz23/AQNGS+4RiqPtW2VHLxg+hyoZqMtzVcE2FSK4AP/ZfcEcH5OolWAXT4Dj+
 2pu73CKiSBpplFAeo2isjA54CNppoqBqrbGR9CMtbWCr5/SPwS/3MuJw5w0SUoBKrrjK
 Qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JY/mUAhmGGRxTqGc0ySxNo9o+GOj/TKXdVaiRq7sV+I=;
 b=DqV+TVGTdd4l8wudzV6nliBzr7rM06oyI8Go+PaIECKZUhtSC76dZKt6VyXDEnmBE1
 NcKAGKdX4ckoHRVfgZFrO+CSWxtIfyGNAy6+A6FED0di3IZrDjAweCZPXHK+rqOPuri/
 gNmt6a+51kp+XHw2q3ZJL6VRFohgsxd7RWqtCYisAlFp+bg87/alOHR0H4eiQT/xR+zy
 wzsQfvXUpu8845GvujnN1OGnMO5TJClEDA/Tt8hbJAeQ6UfMf8jFvzcS0UWHf3URQ9/j
 fCwL62rl6vp/E00f73+rDomffrxJLXB8pZwRmpjRStEdvX3mToUFpxXOGIgzCjWQCAQP
 yepw==
X-Gm-Message-State: AJIora/fwWtMMMn71au8mzOP975pIANRnf4LfIh+k/dDgjvRdOujN3i5
 Hk6zEI120m6Gd0mNp3IunUanb3WCBoqMVA==
X-Google-Smtp-Source: AGRyM1ujITxFKaFNqRq5NbAe0JcBvGtRiGj3xcbqCJkqTeNu/41SZ+ggCHpg8uPMVpryfEXvGQ5qcw==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr19169552wmq.202.1656325374704; 
 Mon, 27 Jun 2022 03:22:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] target/arm: Add SVL to TB flags
Date: Mon, 27 Jun 2022 11:22:33 +0100
Message-Id: <20220627102236.3097629-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

We need SVL separate from VL for RDSVL et al, as well as
ZA storage loads and stores, which do not require PSTATE.SM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        |  8 +++++++-
 target/arm/translate-a64.c |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0295e854838..4a4342f2622 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3182,6 +3182,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
+FIELD(TBFLAG_A64, SVL, 24, 4)
 
 /*
  * Helpers for using the above.
@@ -3227,6 +3228,17 @@ static inline int sve_vq(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, VL) + 1;
 }
 
+/**
+ * sme_vq
+ * @env: the cpu context
+ *
+ * Return the SVL cached within env->hflags, in units of quadwords.
+ */
+static inline int sme_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, SVL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 93766649f7f..22fd882368b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -44,6 +44,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
+    int svl;         /* current streaming vector length in bytes */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e4e739969a..d2886a123a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11352,7 +11352,13 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        int sme_el = sme_exception_el(env, el);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+        }
         if (FIELD_EX64(env->svcr, SVCR, SM)) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
         }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c050ebe0053..c86b97b1d49 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14647,6 +14647,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
+    dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.25.1


