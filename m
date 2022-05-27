Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73025536769
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:19:38 +0200 (CEST)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufUn-0000N0-Hy
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYu-00080C-ND
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:48 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYr-0003fO-23
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:48 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j6so4952027pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/y9F7o3DIUaUZkdfIWWkB4RYykgWwMLkMLCMsv2S7ag=;
 b=xjHy4GUECisCwxU1/2nZZljTBnbt6A6fxJ9CjNGgQxD35cKxPwel9VoEJPYYN56bHU
 oQBnWtqVjSgaoAZMQ32DW/8yYP6xX2KQ/zdo8HWCz+fjtBH0s+1+EcHG6249w9Ry5CnO
 ngqkMVGc4Udnyqq0TH0JG/bTJsgw2I9dWotZ0mIThs2dVb7/kNC10/xLK0KcuzbgzEQg
 usZyz3R8+ve2sGM0t+XusYANMfeOju5H0xrGmpZqTg4WalaTkvY0ImO+zRFzv1KQtjln
 s5ShSw9Ug211dDGFJmD7eaY29MAzA3hdzIoDjVzOudVep7liTHcTI8yzYLr7Bl5nhVUw
 Mj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/y9F7o3DIUaUZkdfIWWkB4RYykgWwMLkMLCMsv2S7ag=;
 b=GcSl3ySeeSHcx8ZrULv7we1cDhactysSmJrNed9p9lz2nRvKVrAdQemheVzQEFbvKY
 IqeszolhWi5raQU4OeVhEzHhYZE0gnyARrNy8vAPgRCfA9cFgW0QHpM5pE9flRLyHDGr
 wWnZrtnjM0jyEb2y9c2oz41hdhOOlhgDqmMEH56AhWD+Kk0YDOjGX7iHtRAaB5GCcQse
 FcPzscyCak2Zc/Gz4BWQeqTq2C33roB7i65ycPhiN5ri67lpJVh7KfPo+1LumuQ5+feG
 vZiXmpmm/tWvzqUYImK+18PSxaWDJGeUCd1I4xyzwDCI+Vg4P6iHAdjjp7eh6OztnZYC
 hLjQ==
X-Gm-Message-State: AOAM533G6zBcdCVYDtLtDIIA3kN+1CUJUWHVJ56SkH2Aut9Edoa7A+Qh
 BuVBh6Mo3L7PJ++mS4jusdSm8d2Rl8nmwg==
X-Google-Smtp-Source: ABdhPJxohirdIC/A85imJzBj9pYKr3WeoOwNYlySdwYw/RQotIobkqkNL/pRIyACwBV4KbYB8Yj78A==
X-Received: by 2002:a05:6a00:9a6:b0:518:fb72:5e2e with SMTP id
 u38-20020a056a0009a600b00518fb725e2emr14368710pfg.55.1653675584205; 
 Fri, 27 May 2022 11:19:44 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 038/114] target/arm: Introduce gen_gvec_fn_zzi
Date: Fri, 27 May 2022 11:17:51 -0700
Message-Id: <20220527181907.189259-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

We have two places that perform this particular operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f89c78a23e..7938c5393e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -258,6 +258,21 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
+/* Invoke a vector expander on two Zregs and an immediate.  */
+static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
+                            int esz, int rd, int rn, uint64_t imm)
+{
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn), imm, vsz, vsz);
+    }
+    return true;
+}
+
 /* Invoke a vector expander on three Zregs.  */
 static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -2028,12 +2043,7 @@ static bool do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
                                 extract32(a->dbm, 6, 6))) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        gvec_fn(MO_64, vec_full_reg_offset(s, a->rd),
-                vec_full_reg_offset(s, a->rn), imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_zzi(s, gvec_fn, MO_64, a->rd, a->rn, imm);
 }
 
 static bool trans_AND_zzi(DisasContext *s, arg_rr_dbm *a)
@@ -6835,13 +6845,7 @@ static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
-        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
-        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_zzi(s, fn, a->esz, a->rd, a->rn, a->imm);
 }
 
 static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-- 
2.34.1


