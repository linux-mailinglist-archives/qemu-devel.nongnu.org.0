Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C67513722
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:43:10 +0200 (CEST)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5ML-0001Kn-Gb
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JO-00050c-OF
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JM-0006Bh-T7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id s21so7059430wrb.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e1Q9WgAftdgcvhZuy23UXcRReTZSOGMUNPfY3n1EJLM=;
 b=CPebgslO4VqercsRFE0tuCCM1WVq6Ww8vwApTIonbbQPlMa6kEcbEK/FTs6vqDpXSl
 5+VCHRNtajaNadLQuALZ1NROHXMEWjXXpiHDfs6VzD+Muwl5BgNiMCPBFTx9WIHt97Py
 Xn8H4aay1XcdsU5+K4njjK/HAKl8IU+6dGitmimYdviF2aJoN/a+vCZMiL2K7xSgGjoK
 qYMygpRvKRFyWYdFeUISJQ0XGnGF5Od6kOuUn/s2kc2ssRCx0fWXthMQHz0q7mLqDdDA
 YF6ZKF6cgiMuCOs6WQ+f3imD7VwisiBUK0Oq7Ce7WdZtqmoOervc9YLTA5PVHI6vihCz
 rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1Q9WgAftdgcvhZuy23UXcRReTZSOGMUNPfY3n1EJLM=;
 b=nPKMNYm5ijpni5depqeV2GEjGfXi9F02aRrIELM8+z5ra4qNyknqPFFt4xC1PWGtW6
 ffncJSTz0J4dvPzLYPDz9vlsSX8nV20bfBkxXv7sZ+dfKUcH3cS5FAWnJ9L07K3VLa3Z
 /2S994wIfdbXL5xUx7AW4/34wffYY6BwXKonfDoaBKLeOpgwSuAKgzrHhlGNVbn4g7BS
 OiWj01dqJpeoQS+QnuaZoAGb3EJcv3pqotHyK9CKKu9ZMwDyWcFgxJu6S9/H/A8cNg4Y
 bp6VEJXXI7BLoEYEgZOWH7TQ3nwhjk2YVRbGE5qUKS2CD5ngXLFtAulIFBi7DzcFNTXk
 sVlg==
X-Gm-Message-State: AOAM532XdSzoZybVHsDCBW5iztSqRdydhBVhnP1sGLsv73zLe50RMxrA
 7loutzNRYNh+Kr5xgWQzf/YAmeCTctdofQ==
X-Google-Smtp-Source: ABdhPJxguI1cIbGy8rNwaajPNbM1jQDb8r2IoBVrKtcM88fNt7WzdC8vsh9pYXONf876gc97aifrGQ==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr14514180wrw.231.1651156803121; 
 Thu, 28 Apr 2022 07:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/54] target/arm: Use tcg_constant in gen_mte_check*
Date: Thu, 28 Apr 2022 15:39:06 +0100
Message-Id: <20220428143958.2451229-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c6ab0433af1..7b5bfb08893 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -258,7 +258,6 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -267,11 +266,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
@@ -292,7 +289,6 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size)
 {
     if (tag_checked && s->mte_active[0]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -301,11 +297,9 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
-- 
2.25.1


