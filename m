Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0D5386A0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:12:11 +0200 (CEST)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviw6-0001Gs-8J
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwd-00046c-4Z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007Mu-13
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s24so7959037wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ATzDWQ8y/K2dhpcM3KY3VN3ACEf+1v6c9bKZV/+5haw=;
 b=ozZFIaR239LO2fx1t7+YZIS9LAMIAYNV11/bpYLK3oMyXWKYxEFkYpQ4+f4jtX3KgZ
 5bKHdDLdHJuBFA8DDL2oMyvJG4COjs/4gIB0N337ixizNJ+qRjufCDrJUjXsQ8c4vsSm
 Q922tfyRGZnVb6UmFTCq+SEJ/yc0Ha4//4tqpv4PyM5K1mBt1Z8wbanblnS05H1267W0
 oCq9YauIgVPvvJ4rdBIJSKlekONhcIP7sDrwaFuP/dUpelPXDI9Df5vyhU1kahxRPF83
 1TfNHMtLlF/Dl5LxChEm+MbOtFxDqDldwzTCr4cf3IqbfvejGHV6Ve/lyfxGw9eBGU8T
 mHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATzDWQ8y/K2dhpcM3KY3VN3ACEf+1v6c9bKZV/+5haw=;
 b=cij79UNvsd+REke7VB1/8ydZFJnwDERtNN5eaDzFekPZbwwLwAiXwbZBpX8sZmqdxu
 kynmJ2MjCx5tfk1TEGx0GIgPVpMdtwUhf0WgzpWuY2H503xKWVr9s3f0kQvONUMUMwuu
 yqaYulwsMkH8njol7XoPzWBVjIbclxWUVZY5ChlW/YafwneRdJYwrdPZseKFm+JEobpM
 qN0L9T0GAdLgr6kJq93CXoy7lI6y+38jZC2HEXUBUHnttbySvT1ojR8aSA/lszU5oi1u
 W282Vmb3Ypi1zsoeXzO3Y8f5GrHgsVL50KSIkNUnCle3iRhKi3edh3fC4Fm08CDDEahj
 m9lw==
X-Gm-Message-State: AOAM530C/So0t5T/9cHne8RFxTrF0QSsEEe/GiaGnIsCcI8K5I/DEKBY
 PgkUPKxrC3Bg8D66pkcSdyKlbweGGC+KnQ==
X-Google-Smtp-Source: ABdhPJy9GuoXPm/jNic6qVsvUD9p3Otc5V+L3SKRH9d5pGwDpI41a0E+Ak+ZU6M5R/rup0D1UBRMuQ==
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr26047511wrp.197.1653926911568; 
 Mon, 30 May 2022 09:08:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 090/117] target/arm: Use TRANS_FEAT for FMUL_zzx
Date: Mon, 30 May 2022 17:06:41 +0100
Message-Id: <20220530160708.726466-91-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-id: 20220527181907.189259-88-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d596e7a0277..29fcc8b0141 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3557,25 +3557,13 @@ TRANS_FEAT(FMLS_zzxz, aa64_sve, do_FMLA_zzxz, a, true)
  *** SVE Floating Point Multiply Indexed Group
  */
 
-static bool trans_FMUL_zzx(DisasContext *s, arg_FMUL_zzx *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_gvec_fmul_idx_h,
-        gen_helper_gvec_fmul_idx_s,
-        gen_helper_gvec_fmul_idx_d,
-    };
-
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, a->index, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const fmul_idx_fns[4] = {
+    NULL,                       gen_helper_gvec_fmul_idx_h,
+    gen_helper_gvec_fmul_idx_s, gen_helper_gvec_fmul_idx_d,
+};
+TRANS_FEAT(FMUL_zzx, aa64_sve, gen_gvec_fpst_zzz,
+           fmul_idx_fns[a->esz], a->rd, a->rn, a->rm, a->index,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Fast Reduction Group
-- 
2.25.1


