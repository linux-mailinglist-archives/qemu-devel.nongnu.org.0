Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EA513821
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:19:39 +0200 (CEST)
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5vd-0003c2-Eq
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K3-0005dH-A7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0006TZ-0n
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so3151942wmn.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H7eZqI5jpMHgfDaczikNa3hXuP57vbNiZnPpD8eaZlg=;
 b=rvxqPdP5zM8pRBQATUR5jgG/IshIZJbcFaosAFu3gHbFDqliiTEofnN2QIqRVNriE8
 i4Dhkja0wtafbe/f052149vV2SNAI4Q0tFaYTxSc/wMajPBlFnk3lgEIREbnWg7rpujp
 a9TZlGgUHbpF1jm909snQoDDxT+i0FXJnTfqoBi/DrufM/HYxuox3heSWGpmt71SdCXv
 yatrC7ymrAN4J1Tqzw8/U8ZAuVXfCmS86aN9MC7MICm+pM8H6epWsk36tLbT5vPw+ivI
 sTXkyxdkFmwO/ypo15ZQjRSinvCzhu+Nu5aK7egQLcE9vADnnEsFddYAoYxWlNw6LXK7
 ruNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H7eZqI5jpMHgfDaczikNa3hXuP57vbNiZnPpD8eaZlg=;
 b=FpfnGcc1jfVbSaM+Dyn0BXg9Wk+Ip9InvqW/3tBk5C1zygKv4K1AOF5yeDbck8yJvX
 TpUdqFs4UXExlWfweZ/7DwB/T+3oVKGgNs7w6Aar3TthNQALl6Mb+mTRUG+/EmK2b3KW
 INJ4Fxy5IjeLVUyHk46cOqhevBqcMLJ/RhoT51AQa3TycSLdOcpqWjjtWgedrHgdiJFd
 neqKG/sPlKJ1a3gmOoA4Z49N52lqhVgaFAI7hJ6RuW8yUOtEoAoGlPgB+wgKGWzO9546
 CVTp710sBcuOzfHiOb774DznAFZn1QeQROV0QgBonjRvsuM8oN2JRlVz40FEli8yHx6s
 WRPA==
X-Gm-Message-State: AOAM5320EZnsO8i6yoXD2GyjSpjzH6oWrZMm4bbYZF0ko0pBrD/u6aDv
 GaX56Wiq7vs7Fh80jP4eec4ESWYk8hAptQ==
X-Google-Smtp-Source: ABdhPJxag/Ips4/85MCguvhU0b5rJix71J+Z+2DX45W4pLgvmBX0rX/cxrHID0vHDG+wbDaOsqXtoA==
X-Received: by 2002:a05:600c:1e09:b0:390:f313:bf15 with SMTP id
 ay9-20020a05600c1e0900b00390f313bf15mr40619986wmb.172.1651156842589; 
 Thu, 28 Apr 2022 07:40:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/54] target/arm: Use tcg_constant in do_zzi_{sat, ool},
 do_fp_imm
Date: Thu, 28 Apr 2022 15:39:48 +0100
Message-Id: <20220428143958.2451229-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-id: 20220426163043.100432-45-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 92339a19e33..a684d489d2c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3853,9 +3853,8 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 val = tcg_const_i64(a->imm);
-        do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, u, d);
-        tcg_temp_free_i64(val);
+        do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                          tcg_constant_i64(a->imm), u, d);
     }
     return true;
 }
@@ -3884,12 +3883,9 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
-
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             vec_full_reg_offset(s, a->rn),
-                            c, vsz, vsz, 0, fn);
-        tcg_temp_free_i64(c);
+                            tcg_constant_i64(a->imm), vsz, vsz, 0, fn);
     }
     return true;
 }
@@ -4520,9 +4516,8 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
 static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
-    TCGv_i64 temp = tcg_const_i64(imm);
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16, temp, fn);
-    tcg_temp_free_i64(temp);
+    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                 tcg_constant_i64(imm), fn);
 }
 
 #define DO_FP_IMM(NAME, name, const0, const1) \
-- 
2.25.1


