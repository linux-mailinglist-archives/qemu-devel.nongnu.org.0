Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828395704E9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:03:20 +0200 (CEST)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu0N-00047q-5X
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvV-0006Yc-Mf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0002qA-6J
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v16so7099852wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xU+wxBR/nb5VhvZR6dMFf9W7EuBiUbFbtZKkKknvG9M=;
 b=I3+YpVZmJGcz8r6Tx+fKQJezfhERsRh8glJlDJ8XdzOX28Gn1ut4s3SYBzO/Rbx73e
 ql6CSIcVhqb+cAbF4gwB3qqCFQgb4QluoG1jZhRODSpAQSaJKu+8O3gtOfDeW81eIjUO
 TTOg8ukuRDeUq06RnJWEqmgiuRV2TAZuqQdrD7Yb/mhBbTYScViEXmDyDn+TC9ihqf4P
 97aNugH9Ufu5/GVugf8GdYddhvwo/WVNMfeKC0yiEziSs3NacmkRTPkiyRcMs6ptSpwC
 C0e5ixXhXrZ29YDQzNTbCClrOnQklgZNNXrgfG4vua3YSITftnibwPw+mq4GPisuivfL
 OjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xU+wxBR/nb5VhvZR6dMFf9W7EuBiUbFbtZKkKknvG9M=;
 b=muiXkKO3fGQfBjlKWRvWQGdun3uv1kf9mDMl5WH+318U405pcVX79Cd+ud2b9pitCE
 vZn4eb5IUQ2gpmSLBnap3hJEgCe0vdAAgMKcPFyyhqYRqw/NehzRYmAtfVLZW/QIjDLc
 StiDGZ7LfwlH/bNcwBExC8Ul8HUr97DkMs9tCvYlNHGXXdWxWjYDJRDcxiGX0xzFJLP/
 AyYDl3rEriQhYwwS6BIocnC4XMTkhM2+brQt1XepXTEkuFj1gqC63DHQjnZ1AFfr9iAT
 W8k9QSyJP6aFyUUCbJc0CfoF1sXzWKz5jZYgrf3rWtwYW8otGTFBo0gRJonmHOCAWiP+
 yqew==
X-Gm-Message-State: AJIora/DL5rmOl37a401QcdnlmF73U9lZ6CByWnWYCviSutDwWfddFxb
 heydUztPb+Fv5qXPsp4+8ZJzX1k+yfq+lg==
X-Google-Smtp-Source: AGRyM1vw14UDuF+KC3OMwHfZMgozdN9dEmj1sMnsMo8Z5TKCoxJShGdVdjPuHyQNpQXB7oMMKVNrsw==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id
 d6-20020adffbc6000000b0021d3fc3099emr17158821wrs.550.1657547886560; 
 Mon, 11 Jul 2022 06:58:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/45] target/arm: Implement SME ZERO
Date: Mon, 11 Jul 2022 14:57:23 +0100
Message-Id: <20220711135750.765803-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-19-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  4 ++++
 target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-sme.c | 13 +++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 3bd48c235f0..c4ee1f09e46 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -19,3 +19,5 @@
 
 DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+
+DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index c25c031a71d..6e4483fdcea 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -18,3 +18,7 @@
 #
 # This file is processed by scripts/decodetree.py
 #
+
+### SME Misc
+
+ZERO            11000000 00 001 00000000000 imm:8
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b2157255943..eef2df73e11 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -59,3 +59,28 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         memset(env->zarray, 0, sizeof(env->zarray));
     }
 }
+
+void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
+{
+    uint32_t i;
+
+    /*
+     * Special case clearing the entire ZA space.
+     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
+     * parts of the ZA storage outside of SVL.
+     */
+    if (imm == 0xff) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+        return;
+    }
+
+    /*
+     * Recall that ZAnH.D[m] is spread across ZA[n+8*m],
+     * so each row is discontiguous within ZA[].
+     */
+    for (i = 0; i < svl; i++) {
+        if (imm & (1 << (i % 8))) {
+            memset(&env->zarray[i], 0, svl);
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 786c93fb2db..971504559b3 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -33,3 +33,16 @@
  */
 
 #include "decode-sme.c.inc"
+
+
+static bool trans_ZERO(DisasContext *s, arg_ZERO *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_za_enabled_check(s)) {
+        gen_helper_sme_zero(cpu_env, tcg_constant_i32(a->imm),
+                            tcg_constant_i32(streaming_vec_reg_size(s)));
+    }
+    return true;
+}
-- 
2.25.1


