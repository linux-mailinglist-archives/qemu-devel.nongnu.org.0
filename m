Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2915570576
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:23:00 +0200 (CEST)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuJP-00057b-Q1
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvS-0006Wi-Oc
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0002bg-3W
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id v14so7135092wra.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eWXMTGlXUgB42hymanetwXDWMolb+Ga7HqnDSm4JcUg=;
 b=jiVOr/BLuJ3vQuajPip4tMXdolyVvZ3LuO7lA5ORUJOZi57fzV1oevvF3xSKXOO3Ug
 yeBLOryv3sQOzPuZbyXTwCxY9aYujSGO2F0hP3vk4PF48ZMBc3ZAFZs6dZUgIdBk5LAx
 EWW222pPmWh7haW7ChlDAkCwfLCOxaIBkOXgcKm171vl1Sr8gTprIK2zJhU7GnVGbRZi
 kbFEByO/eMaljGZKkXd0tdlRRh78hH5DRTGbOaBjreLoTiz1eOfORWfitFqPU4wVjLNY
 nGf48IRBgJgWlkDz38cpFvjv8PoK6ceWzdhpEU17XmSU/wbLTy7ejqnBKS8k5Ur2z50H
 HmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWXMTGlXUgB42hymanetwXDWMolb+Ga7HqnDSm4JcUg=;
 b=5Ok0CG2kBwJGawPMRIywuDIM7hyxKsd5tlfj4JUAQMsjd/nQp1K5hSH6X9DQp+0vAu
 CcD/UPqxEvlhMMJn9Tr1y5tQbfKCvOw45zlCgYp9Q8PgTf507VcJQtKrSpmescT1xEBc
 lIInpu7C/XMg4fINR0DKHCyNkjlyW6KtBXbg56hRAmNkaoZflLGucJgrfyxMZSdXxJWn
 lWwWCnPzKh7uSnVdrOSr/Dl4C4Po+87niHHHTWwOEy7vNVEWNFwgS+IBbUNDyyjXg5aC
 mesN5KOqhIIBhZf9VkM7iXbV3EIS5FDH6YhJFqjsNZK49qq60Q/Y6wdpjEPtfIbegct6
 E0eQ==
X-Gm-Message-State: AJIora/IHnK0EVH4EN5HJhuiJeZA4wFt+Jyg4RxnA36pijFV5VAZnqjS
 Fl6eQRSDx8o2mAMmQ3M7Gzd6iXxTvw8Nnw==
X-Google-Smtp-Source: AGRyM1sC8KAkSd0xwX7B5ShrWOU/Kjqbll1lXXh63NR9BBfCNBAtgruShbsdo521BzfJhw0Xi7QIWA==
X-Received: by 2002:adf:f7c3:0:b0:21d:6d21:f704 with SMTP id
 a3-20020adff7c3000000b0021d6d21f704mr17152601wrq.590.1657547884426; 
 Mon, 11 Jul 2022 06:58:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] target/arm: Add SME enablement checks
Date: Mon, 11 Jul 2022 14:57:20 +0100
Message-Id: <20220711135750.765803-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

These functions will be used to verify that the cpu
is in the correct state for a given instruction.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h | 21 +++++++++++++++++++++
 target/arm/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 789b6e8e781..02fb95e0199 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -29,6 +29,27 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+bool sme_enabled_check(DisasContext *s);
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned);
+
+/* This function corresponds to CheckStreamingSVEEnabled. */
+static inline bool sme_sm_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK);
+}
+
+/* This function corresponds to CheckSMEAndZAEnabled. */
+static inline bool sme_za_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_ZA_MASK);
+}
+
+/* Note that this function corresponds to CheckStreamingSVEAndZAEnabled. */
+static inline bool sme_smza_enabled_check(DisasContext *s)
+{
+    return sme_enabled_check_with_svcr(s, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
+}
+
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7fab7f64f86..b16d81bf197 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1216,6 +1216,40 @@ static bool sme_access_check(DisasContext *s)
     return true;
 }
 
+/* This function corresponds to CheckSMEEnabled. */
+bool sme_enabled_check(DisasContext *s)
+{
+    /*
+     * Note that unlike sve_excp_el, we have not constrained sme_excp_el
+     * to be zero when fp_excp_el has priority.  This is because we need
+     * sme_excp_el by itself for cpregs access checks.
+     */
+    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+        s->fp_access_checked = true;
+        return sme_access_check(s);
+    }
+    return fp_access_check_only(s);
+}
+
+/* Common subroutine for CheckSMEAnd*Enabled. */
+bool sme_enabled_check_with_svcr(DisasContext *s, unsigned req)
+{
+    if (!sme_enabled_check(s)) {
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, SM) && !s->pstate_sm) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_NotStreaming, false));
+        return false;
+    }
+    if (FIELD_EX64(req, SVCR, ZA) && !s->pstate_za) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_InactiveZA, false));
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
-- 
2.25.1


