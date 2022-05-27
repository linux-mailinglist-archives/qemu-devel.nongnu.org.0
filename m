Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC15367FF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:23:07 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugUE-0006D9-Dh
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0001xA-NC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefb-0005Nm-Oi
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id y199so4979126pfb.9
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Qx3xfNnFRj3mRZ+xrWUd8t9kdyC1v10woKkh4xhoEg=;
 b=aW9ryXWl4r2bQca72xS4LysZn+gIyM+qsBrOapSKfvCsEZDCoPS8rKAgiujgZtBXXE
 c3RmwwM7JmvvshQ1BTBj48dcuTv3zzTZXrOgcEGlTXKQSnK9I9JA0jffyaHhNUTfv9Ok
 wDluYSTqfCLssy2+Srt3e3HBZ4191n+VYhPJlR2lfmXlGx+YJHEpZNjXgUmLWPcFQWBP
 dAFiQaiZaTtwkFSGqQ9Y7tvg4/mxP3CVeZ0Pafy5Qfv53uIsZ57Skx7jJQMMzoN0mZDF
 qtj0/HP/QD1ZBQdzAn8YgmPdxu02hSaYWugBqGEhb7o0OEK69nsBbQaZlzQJaR6b8h9g
 qJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Qx3xfNnFRj3mRZ+xrWUd8t9kdyC1v10woKkh4xhoEg=;
 b=S+5+AYndbbrqdNJTi1Nqxh1TkvG+km3rWaD6sMEpHHeUbQlX9r1TS3JpcOgOzljoqN
 v5F2f+pkt1UK+s9Ot/FG3hNY7TCxiOk+xorPxlX7UumdZa2KTMDpI/pqKk2rpo86pOAH
 JhLwsrVAobzXtK/fgCQPlHZ1Npe10tJXUTRLDQ0BDlZ9UOmxf9lxXOlG13BLajJDaURH
 hXvBJlsWm1gVSgJm/d2z3rWi2B1vZliROlcQGcZLWG4hLkUN5gYkbNAgVC1NU1W1Z3yC
 oiqEZ+47tK+aDlF7ea03x6/KYm0FXwzHBFpSeDnIrhTF8w3Wb92qdg5hf2M3jfk7qxDq
 ow9A==
X-Gm-Message-State: AOAM531OAafa38iKgGgIc9K8peGF6G0HZoFPkAHmJTnES77CTQwswn6L
 22ENJgrM9eURH30DbbWwasTEApN00G0bmQ==
X-Google-Smtp-Source: ABdhPJwnQJfGCKzhKj7+pl22ibl7uo2j8cTsOnZuu2cSL/LOJiIysYoGhiWleC9VZZb9x8e1CYk2AQ==
X-Received: by 2002:aa7:939a:0:b0:518:9843:86cb with SMTP id
 t26-20020aa7939a000000b00518984386cbmr28253566pfe.37.1653676002398; 
 Fri, 27 May 2022 11:26:42 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 100/114] target/arm: Use TRANS_FEAT for FCADD
Date: Fri, 27 May 2022 11:18:53 -0700
Message-Id: <20220527181907.189259-101-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1108494919..e323b2d6d5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3966,29 +3966,13 @@ DO_FPCMP(FACGT, facgt)
 
 #undef DO_FPCMP
 
-static bool trans_FCADD(DisasContext *s, arg_FCADD *a)
-{
-    static gen_helper_gvec_4_ptr * const fns[3] = {
-        gen_helper_sve_fcadd_h,
-        gen_helper_sve_fcadd_s,
-        gen_helper_sve_fcadd_d
-    };
-
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, a->rot, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_4_ptr * const fcadd_fns[] = {
+    NULL,                   gen_helper_sve_fcadd_h,
+    gen_helper_sve_fcadd_s, gen_helper_sve_fcadd_d,
+};
+TRANS_FEAT(FCADD, aa64_sve, gen_gvec_fpst_zzzp, fcadd_fns[a->esz],
+           a->rd, a->rn, a->rm, a->pg, a->rot,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 static bool do_fmla(DisasContext *s, arg_rprrr_esz *a,
                     gen_helper_gvec_5_ptr *fn)
-- 
2.34.1


