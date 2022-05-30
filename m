Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD198538694
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:08:35 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvisc-0003Kw-TD
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvn-0003Ul-2m
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0007BB-EQ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k16so10940533wrg.7
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1QczMceUhbOmMC6Z06ersGWW4O9X6WPEX2DvnlUzW2g=;
 b=iJndOhUcP1m1mub3QeEBGFWwgC7ixw0kdpA7P8e3uJYJwn9KoxQOsZWneWJsNZVvfC
 nAt5ztjgaySkeSBuVB1r6DN1j8KQeX4xu5g8IQILZeqeoZBXVcF6titIO5B+viy2AXPg
 2PTU6RQj9/OWicGK4UIMTHpCul7IQkW6vz7zxwreHdUI//295eTypbNuSQwB7/EHO+BM
 vpIqKdETG/tEo1D3e96D3oYxFxmbp/LbgASnCXYPyLz9pZJ6mmk+SH21g3qA1BPkJvSZ
 0UAQxH7pH1L9C47IYfE1YQhfF4M1g6hfq1jkmwSn9YVfAEX/lQpyW1MxExeZCfL8M1SA
 U6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1QczMceUhbOmMC6Z06ersGWW4O9X6WPEX2DvnlUzW2g=;
 b=uATiL0APhxBX+HAR4L9c68ScOCKN0ol1yD2nFTjEtohOq6FY4KAcSuuukDKPH3YyWD
 MzYf9g/dcGs6IcssgFgzk/8duAn2/tVsQZzGKEJ7/h2+DJ9LNLPxOrAXOM1Txoc/9cbh
 RctHpCFlbJvw6uLx7zSczuaDcz+YTgKmw3VY4Fqk1WzcB/vdtgXV1YXd7q02XG4gg9hg
 OduoOD8Le3Z6eD8yc0CzCmG/50Jrk9ll4mtKm39hUEo6rrqiUXPcmlXCsQv8nycZFry+
 ru+GdEyMEcUX0gLmFj4bQwfUSQGLAj4Gnfmxezj6bR+Avc07CGAx+n0toOPmCfJn6kW9
 EXBA==
X-Gm-Message-State: AOAM5319rXZFDSqvkFp245ty5Us8nnubpi8Ivfut7RfTQSktunuwjPzS
 7wAuLCAQ+NXtVyDTBxndPhVZ0HPjRsRx2w==
X-Google-Smtp-Source: ABdhPJwTgDm2F7dHmbJeh2qfkVLTN7iDKfBqh1P8UzlBSOFTRmbHJDVenzGju7efzeKvO0LIpiDdmA==
X-Received: by 2002:a05:6000:16ca:b0:210:3d2:9bae with SMTP id
 h10-20020a05600016ca00b0021003d29baemr20315680wrf.311.1653926864501; 
 Mon, 30 May 2022 09:07:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 043/117] target/arm: Hoist sve access check through do_sel_z
Date: Mon, 30 May 2022 17:05:54 +0100
Message-Id: <20220530160708.726466-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The check is already done in gen_gvec_ool_zzzp,
which is called by do_sel_z; remove from callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-41-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6fa721eca62..62bfc6fe7c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -697,13 +697,13 @@ TRANS_FEAT(UQSUB_zzz, aa64_sve, gen_gvec_fn_arg_zzz, tcg_gen_gvec_ussub, a)
 /* Select active elememnts from Zn and inactive elements from Zm,
  * storing the result in Zd.
  */
-static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
+static bool do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
 {
     static gen_helper_gvec_4 * const fns[4] = {
         gen_helper_sve_sel_zpzz_b, gen_helper_sve_sel_zpzz_h,
         gen_helper_sve_sel_zpzz_s, gen_helper_sve_sel_zpzz_d
     };
-    gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
+    return gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
 }
 
 #define DO_ZPZZ(NAME, FEAT, name) \
@@ -749,10 +749,7 @@ TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 {
-    if (sve_access_check(s)) {
-        do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
-    }
-    return true;
+    return do_sel_z(s, a->rd, a->rn, a->rm, a->pg, a->esz);
 }
 
 /*
@@ -6343,10 +6340,7 @@ static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a)
 
 static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a)
 {
-    if (sve_access_check(s)) {
-        do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
-    }
-    return true;
+    return do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
 }
 
 static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
-- 
2.25.1


