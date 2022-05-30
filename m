Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0B5386F1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:58:00 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjeR-0000bk-TQ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0003tf-Ql
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwL-0007Hl-91
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so9674574wrb.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8H0O7WP3fZTtNdQhbGwYgO4FNCF8NZfiJ1G4q6YMIBY=;
 b=Ejgy9Odk7RQgM+lYdey81GLfLI6jByNCStGlV0JycTj+aBFEmfwziTnP7DmSft2T3m
 VBQ81/7/ezeCs4C7k4YNjrwtCNuK4QNerI5WBlz335E6ULpbyR9Uk35fyfdX2OrNX2Vl
 cnfcnXfskNOYfNHlgjYsIto9tMQd9Q5euAY6aX0TSx19d/qTvhFze8JvQucjPGAHF5JE
 DXy71C0fmgk2U68MBz7Z7DYpgFPJVLLQuzmUa6yUJLLAE3KWgG/zJcXkVh4CvCVoD20z
 8c2TSNLVagQiQzKXW/RXENeIa2QYdcyKnL0S1qV3IairgNb4JZ7Jaa8nbVnC8UGtZS8l
 U9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8H0O7WP3fZTtNdQhbGwYgO4FNCF8NZfiJ1G4q6YMIBY=;
 b=P3Blvjs105SuAs86/PajHoGU3qXraLAi9hUxwWuXXB2Oka2q9so3vdcuNdeqGW2S3i
 B2fUCyEzNJoW5Nn9DwwEu5eQZvNa7dmCfyorkVPOak0h6tY9bz67J3GtxnH1rULMJIzY
 PI7nSO/glLTUOjdPzlwJgrJl4imui5OaO4lorlmGp+KgtYNjpPdgeLvrZMsEx/oQ7gnk
 8lsKeLNHKlYZVAio9kbU1bO+wMEIHC7aM4UOy0k4vQreWy9X0DqvbKQyp236vXp2zicN
 pKPq2nwTT8n9FJfq3GAxSwRMaE8vexo20HTEXitO+1m1g63cU5dhJpyMfmRgtBkAPqPQ
 0n5g==
X-Gm-Message-State: AOAM533aj2g5x5sJEJ0MbOR/WJzvIIVMwB1li4z6jd3qi6aJJOIybksk
 D68aoYqI8GKHe2E1wMgevqCOkQNP4Z9H/A==
X-Google-Smtp-Source: ABdhPJx0095ta/5gVz+t+b7TLZVQBaWEfA+nepGV/8MJAPhJJboJPUTAyp/8hNibld4IhAIuluavnw==
X-Received: by 2002:a5d:6847:0:b0:20f:c0b6:d783 with SMTP id
 o7-20020a5d6847000000b0020fc0b6d783mr40465321wrw.101.1653926900397; 
 Mon, 30 May 2022 09:08:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 075/117] target/arm: Reject add/sub w/ shifted byte early
Date: Mon, 30 May 2022 17:06:26 +0100
Message-Id: <20220530160708.726466-76-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Remove the unparsed extractions in trans_ADD_zzi, trans_SUBR_zzi,
and do_zzi_sat which are intended to reject an 8-bit shift of an
8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-73-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 35 ++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c |  9 ---------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c02da0a0829..8cff63cf257 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -793,13 +793,34 @@ FDUP            00100101 esz:2 111 00 1110 imm:8 rd:5
 }
 
 # SVE integer add/subtract immediate (unpredicated)
-ADD_zzi         00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
-SUB_zzi         00100101 .. 100 001 11 . ........ .....         @rdn_sh_i8u
-SUBR_zzi        00100101 .. 100 011 11 . ........ .....         @rdn_sh_i8u
-SQADD_zzi       00100101 .. 100 100 11 . ........ .....         @rdn_sh_i8u
-UQADD_zzi       00100101 .. 100 101 11 . ........ .....         @rdn_sh_i8u
-SQSUB_zzi       00100101 .. 100 110 11 . ........ .....         @rdn_sh_i8u
-UQSUB_zzi       00100101 .. 100 111 11 . ........ .....         @rdn_sh_i8u
+{
+  INVALID       00100101 00 100 000 11 1 -------- -----
+  ADD_zzi       00100101 .. 100 000 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 001 11 1 -------- -----
+  SUB_zzi       00100101 .. 100 001 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 011 11 1 -------- -----
+  SUBR_zzi      00100101 .. 100 011 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 100 11 1 -------- -----
+  SQADD_zzi     00100101 .. 100 100 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 101 11 1 -------- -----
+  UQADD_zzi     00100101 .. 100 101 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 110 11 1 -------- -----
+  SQSUB_zzi     00100101 .. 100 110 11 . ........ .....         @rdn_sh_i8u
+}
+{
+  INVALID       00100101 00 100 111 11 1 -------- -----
+  UQSUB_zzi     00100101 .. 100 111 11 . ........ .....         @rdn_sh_i8u
+}
 
 # SVE integer min/max immediate (unpredicated)
 SMAX_zzi        00100101 .. 101 000 110 ........ .....          @rdn_i8s
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 14faef05641..bf988cab3eb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3262,9 +3262,6 @@ static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
 
 static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
 }
 
@@ -3305,9 +3302,6 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
           .scalar_first = true }
     };
 
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
@@ -3321,9 +3315,6 @@ TRANS_FEAT(MUL_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_muli, a)
 
 static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
                           tcg_constant_i64(a->imm), u, d);
-- 
2.25.1


