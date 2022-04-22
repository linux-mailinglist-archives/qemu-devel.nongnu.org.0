Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF050B60C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:18:55 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrJN-0008NW-JN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAN-0005cB-6R
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAL-0002x4-1b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e2so4044207wrh.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h5cbU++jOseQZg+uHAX8kICA8i+7LryH4hXcFQtNTbo=;
 b=TBRGzsiFrgB293Bb0K7JvRw/MbMBJ1QIpq2AgAdaLa17cJhVTbMH4Z5LelkUMMOxcr
 CEGXsB7TWyqRbZVgXY1XppE7AqyzMrY1RlpJryzugggy2j5qzYSdPduWI67jBgqzg02j
 Nr1MqZDLzg2FL9ljJ0/FAmTJmOCMOlOPP72B3B7tcQLtct7ACiq7TeJpkdfS5iruNOIO
 wYGuUccromIgEXX1EPYq/4Y7yAXh3HBiHPMiO/pv8qRdtSLLn+EI9+3J4AkNPQ49VPQo
 G8dwbcTdza6anrt4kI5t9N8gLFNWi1SSEhQLNZIy2Wjo9MIkU7k+zhNmonMrAqe7Kf4T
 5uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5cbU++jOseQZg+uHAX8kICA8i+7LryH4hXcFQtNTbo=;
 b=cc2vF+SpyqimcAsyoFSrk3fye/Hy8BzWTdWvDW+k6yy0OelBKcXhDJ2M296d7YRb3p
 BaKhF7HYvjK5BZRoW3d+I9QC9vnEkHjaXcr5iclXYVLKMnX4hqrRNKvGS2dfEgpAwVg5
 +ddaXQ1j2ghhEXXysjJirZxHsaH5kJa68tsem3ZzrkJlHtv/8AB9JLdoTFGyZt8x39mM
 1JwzmLvq7kCwa6m56YceRaZNJYq8j0MwZm+fQyHSXSobJM3+YJVYGsILfDMpUivvwwlm
 dMlkTXl6BJdZSeJmuqjQbVTxupyDSLMi4o7Qhm13o3yt498pXMdNVcyWXS9r4vK0TEs9
 BdoA==
X-Gm-Message-State: AOAM532RjMMQ/Bg3NDdSRXWiD8qn85ea8cxEKUUmtz27Wune0udd6tuF
 JKBV5QiHPlKO05fIG2DQbilVS59FxMwNOg==
X-Google-Smtp-Source: ABdhPJzLgQIiTxBl5yMFO7rYnxDzwo+Mido7EE9Ruq+di7eTeoD8ckZWafLv8iwDYpRxH9gl4xkZAQ==
X-Received: by 2002:adf:d1ce:0:b0:20a:992a:3b54 with SMTP id
 b14-20020adfd1ce000000b0020a992a3b54mr3007286wrd.270.1650621927254; 
 Fri, 22 Apr 2022 03:05:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 56/61] target/arm: Use tcg_constant in translate-m-nocp.c
Date: Fri, 22 Apr 2022 11:04:27 +0100
Message-Id: <20220422100432.2288247-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
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

Use tcg_constant_{i32,i64} as appropriate throughout.
This fixes a bug in trans_VSCCLRM() where we were leaking a TCGv.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-m-nocp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index d9e144e8eb3..27363a7b4ec 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -173,7 +173,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     }
 
     /* Zero the Sregs from btmreg to topreg inclusive. */
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
     if (btmreg & 1) {
         write_neon_element64(zero, btmreg >> 1, 1, MO_32);
         btmreg++;
@@ -187,8 +187,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     }
     assert(btmreg == topreg + 1);
     if (dc_isar_feature(aa32_mve, s)) {
-        TCGv_i32 z32 = tcg_const_i32(0);
-        store_cpu_field(z32, v7m.vpr);
+        store_cpu_field(tcg_constant_i32(0), v7m.vpr);
     }
 
     clear_eci_state(s);
@@ -512,7 +511,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
     }
     case ARM_VFP_FPCXT_NS:
     {
-        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
+        TCGv_i32 control, sfpa, fpscr, fpdscr;
         TCGLabel *lab_active = gen_new_label();
 
         lookup_tb = true;
@@ -552,10 +551,9 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
         fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        zero = tcg_const_i32(0);
-        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
+        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, tcg_constant_i32(0),
+                            fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(zero);
         tcg_temp_free_i32(sfpa);
         tcg_temp_free_i32(fpdscr);
         tcg_temp_free_i32(fpscr);
-- 
2.25.1


