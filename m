Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFF643D0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:40:07 +0200 (CEST)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnqI-0002i0-4g
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLO-0003ze-5A
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLL-0003xK-Ne
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso3344255wmc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymlJE+GgnCMHylvq3NV60YJEP1f57Nhad4Tc/Po/blQ=;
 b=m2Ct4wu9Nrh5k5EtMIRE3Yw41/kbi8RuMqEPaTKGGw96Ujsv/qgGPIhBKUEUfTEKwZ
 5fnq5ZC+gmMRSi+sbWwpxywOYX0mfhmwoJzAb8Tbn4N2GI7CVPq0p9raAgSbjKWbpc1g
 KLhuiODM8Kfgn0thP8pYDVFx6fYEZH44xfPTctfNlcq1pgGK1YRC1NJ5ysDhtzoERyAW
 TiLMJ4Et3Y+6M2I+HmDXy2Fhw1IEBai2UAK5+oNVGmiwQ3X4QoGR/3LCo/yddMiCN3Sh
 Y64HXDB2/Q2efqtnlyoQrbMJD90a/+lmIfyWXKrAsUbTd7Ownu8MrdTIVDh+m8+NEXhi
 Ediw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ymlJE+GgnCMHylvq3NV60YJEP1f57Nhad4Tc/Po/blQ=;
 b=76YFrJnTQwI8RdcN3bVSA9LD62/lbVe+c+2/pUBM5n8xpasUZfYsYHsTcrL5/7LgeG
 71pdXRGBX2fLnHWp11t1Rh60zwSpv1OZcsbxs4yey8FjgeCE4UCnji+Uya5vhUQbSK0J
 //gSkCFyOHsvy7fVP/WceJ35jkDYMWhj+UKPeNovxw8+ceSH7pTZ4mf8LIbHtfASnp+P
 dNnUW4Mf5couOB7xpE0vvtj+yxTWnVYanFJHhx+w+OHKPCUBlGGe1t0+34TDQkUESTOY
 pofbFwsvt573Zu251BsZYTe2ziOpjzNv73nRX5S8LCDCYg9k/rp6AuNmQC9Ip1OGaKhW
 lItA==
X-Gm-Message-State: AOAM5335skZbCelhyaJ5l3ZdfwrgZNiqSoF1CxDb1MlBrLnUWfp5NaoS
 VUTD3DuHnhAzmdPljMEchlQOa/0jd/M=
X-Google-Smtp-Source: ABdhPJzsj4B/TOXdfyKGCLvieB/apPI0e4GwsCQHDVBCrYLTbrN7MSF7hfVdWxnsFsJp3C+MbBx9ZA==
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr7304688wmq.48.1635358086155; 
 Wed, 27 Oct 2021 11:08:06 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o40sm3953683wms.10.2021.10.27.11.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/32] target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
Date: Wed, 27 Oct 2021 20:07:05 +0200
Message-Id: <20211027180730.1551932-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This 'shift amount' format is not always 16-bit, so name it
generically as 'sa'. This will help to unify the various
arg_msa decodetree generated structures.

Rename the @bz format -> @bz_v (specific @bz with df=3) and
@bz_df -> @bz (generic @bz).

Since we modify &msa_bz, re-align its arguments, so the other
structures added in the following commits stay visually aligned.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 15 +++++++--------
 target/mips/tcg/msa_translate.c | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 74d99f6862c..56419a24eb9 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -13,19 +13,18 @@
 
 &r                  rs rt rd sa
 
-&msa_bz             df wt s16
+&msa_bz             df        wt sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
-@bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
-@bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
+@bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
+@bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
-BZ_V                010001 01011  ..... ................    @bz
-BNZ_V               010001 01111  ..... ................    @bz
-
-BZ_x                010001 110 .. ..... ................    @bz_df
-BNZ_x               010001 111 .. ..... ................    @bz_df
+BZ_V                010001 01011  ..... ................    @bz_v
+BNZ_V               010001 01111  ..... ................    @bz_v
+BZ                  010001 110 .. ..... ................    @bz
+BNZ                 010001 111 .. ..... ................    @bz
 
 MSA                 011110 --------------------------
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 41ade61879e..0aaf441f359 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -338,7 +338,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     tcg_temp_free_i64(t1);
 }
 
-static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
+static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
 {
     TCGv_i64 t0;
 
@@ -356,7 +356,7 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
     tcg_gen_trunc_i64_tl(bcond, t0);
     tcg_temp_free_i64(t0);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
@@ -366,15 +366,15 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 
 static bool trans_BZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_EQ);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_EQ);
 }
 
 static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_NE);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_NE);
 }
 
-static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
+static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int sa, bool if_not)
 {
     if (!check_msa_enabled(ctx)) {
         return true;
@@ -387,21 +387,21 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 
     gen_check_zero_element(bcond, df, wt, if_not ? TCG_COND_EQ : TCG_COND_NE);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
 
     return true;
 }
 
-static bool trans_BZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, false);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, false);
 }
 
-static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
 static void gen_msa_i8(DisasContext *ctx)
-- 
2.31.1


