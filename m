Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4E513748
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:49:40 +0200 (CEST)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Sd-0003O9-Qw
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JX-00059C-Pa
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JW-0006Eh-1R
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w4so7049695wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cGgb/v0MiLrD1oH6Hdxco6KrRlasCjPtjrJBks8RRZk=;
 b=F/km8AECmYTlqAzVyZOKpBefKSk2Sa2eRDFhBx/WqNGDsk/gYSA7lL53cy6PjQlbWL
 dv0Hd1LwzjjgxluBnwz48RZ8EYF+/m51EEw5LezeucoE5ofoP+8CScMKri5UUCAADQ2x
 1MVBBt4PI7yfD/UgIuoXLpAeb6m9Q09ARR71D00CcfWTk27cTBHrRlupXXLVCN41QzcU
 Fald3G9/nIOI4bSGhQM/e2rAkDdjevJsQBkJxZEEXHkSb3tmjzl+dnide5V8/F8cGRVM
 gyItPBsd0cpzctpi8BQ0Ji4URhxLJdHU3qg6mTwhDJQxfjtgqS3NDQ6I/q4/ubOmb5TU
 Opfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGgb/v0MiLrD1oH6Hdxco6KrRlasCjPtjrJBks8RRZk=;
 b=XGdBSYSTipPYipD5vwebzIi4JY/kczQ8OeaMMZ1eUCoWiPPLkM7VYhVhC3Rlw7kjmS
 VMiKCTXrf0sfX8+EAR9Jc61AQEja4jW1ivsos80lELLXtEG45ka1L2mY54XNccQlm7Wi
 bLjwa7FKdgWCG0fvuadQ3QAgwtNCPmGBdm5eB0uY/BFlUNjN30eMsms1FfNeRDlM2pcs
 oyNHLfGfpRAljqf3fedWPJOa6iPvd+axq7VjQpuFH2zRG4ezgz2UKRKLGnpNz/fIngIq
 qw/dERGkX1iZMFZGP9kUhO3EDIkIG3mxQsA0enRhPBqNo44/vuXqfM5m8XZ3gyMcBIXm
 57eQ==
X-Gm-Message-State: AOAM5305j0k5J2z96RlXusAKFrocNbL4gM5aSieMs+lII1Ewn5XlgkRB
 ppuoq9sE/8wPpqXyND3+yQA2BP0uqQswNw==
X-Google-Smtp-Source: ABdhPJwH2TOyjVPqhwuKwrDzFwSW7IXByReDCb1bCF9H7mO/uhpF6AXNRXduK1QKMQ0J7u1sa6IWXA==
X-Received: by 2002:a05:6000:1814:b0:20a:cb21:8781 with SMTP id
 m20-20020a056000181400b0020acb218781mr24884317wrh.488.1651156812761; 
 Thu, 28 Apr 2022 07:40:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/54] target/arm: Use tcg_constant in disas_ldst_*
Date: Thu, 28 Apr 2022 15:39:14 +0100
Message-Id: <20220428143958.2451229-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-11-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1caca38a798..4cdc869d522 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3693,7 +3693,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     mop = endian | size | align;
 
     elements = (is_q ? 16 : 8) >> size;
-    tcg_ebytes = tcg_const_i64(1 << size);
+    tcg_ebytes = tcg_constant_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3709,7 +3709,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             }
         }
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (!is_store) {
         /* For non-quad operations, setting a slice of the low
@@ -3839,7 +3838,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
                                 total);
     mop = finalize_memop(s, scale);
 
-    tcg_ebytes = tcg_const_i64(1 << scale);
+    tcg_ebytes = tcg_constant_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3861,7 +3860,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
         rt = (rt + 1) % 32;
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (is_postidx) {
         if (rm == 31) {
@@ -4052,7 +4050,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         int mem_index = get_mem_index(s);
         int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
 
@@ -4062,7 +4060,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
             tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
         }
-        tcg_temp_free_i64(tcg_zero);
     }
 
     if (index != 0) {
-- 
2.25.1


