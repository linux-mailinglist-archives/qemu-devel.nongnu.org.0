Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE4C3F759D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:08:34 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsdt-0003iA-V0
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYD-0006OX-RN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYB-0002KW-8e
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4529530wms.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6xnaiIUmUl+DsFrI4M2FV6+eRUriPvolShiSG06CRw=;
 b=Of4+7bWpePA1p05JWfqf9XLA6pPrwoe7Yoiivv9KTNgRkKAjSX8FjrwO1UeAjo/oZ9
 8Ix3u/nvHwRcKb0cFP9LYx7NU+Fltg/Up+GlZdPIsInYIWwZvX1WUlrBJ24kpLXYZA0e
 8iV8GEZ1UjRMohgRWbz/NjLVf7HzWNFy71GUmIk8dH60KojLQKVTNiLJDvN+lj8Vh3qA
 Xl+aI8xXClyUtb9u6SnyhGsOSlt5PPvYSyyQZ7mJJLDOnOlkMKiP0v01/HtjnN4yHQR3
 3mEaGeClk1hMuWn2U1wYfT8mIEqRAxLnVLTV8G+i67ywrmFDSuImUheeeUHzT2UWK3uA
 q0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W6xnaiIUmUl+DsFrI4M2FV6+eRUriPvolShiSG06CRw=;
 b=ciGZBfScA7qWVRjxkWjY0DGPxuFaH0FDZuQQzLOIe8es5aPSMbzrRgD3ORj5lnLNGx
 a+3XJf3rmzeDOv1vsR1qbFcCEtgoz/zZ/zFnuokOdxoWGJjEy2stvZbrNM73i59nBs1n
 22qYPqAPWkHZxC2HfwoQKX/8PBwFu4XZ8v9KkE6SJy/3Res+gfVkKnc9N7IE1HieKyRi
 NP1eBm+5SYPvsqjFVeggrEHfBIt4tZlJ7fy4/XVQ8jqqkWSdsp0VCEIvzTGVADbUlZ2f
 Pk6GfgCzWjYqzoLycJWj4GMdiHI4FPVuJKW3tBNwuMVAOpjfe8+mhiISC6vQ1UjAQX61
 TMNQ==
X-Gm-Message-State: AOAM5330CDTvYudNKY8Wxklo18rGx/eRV3MrRJy3P7HctXYt98BYXRqM
 eYvx6e0GCCe2Ej1GTiYXg/x2p2YNF0U=
X-Google-Smtp-Source: ABdhPJz3iJB80guNEn2n9wMvOM2+aJXH0V3n72ALqaROFaVkTEaQGPbG6+Nl/NjgSORCNKtxI5xLcw==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr9131781wmc.75.1629896557724; 
 Wed, 25 Aug 2021 06:02:37 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b10sm18177167wrt.43.2021.08.25.06.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] target/mips: Rename 'rtype' as 'r'
Date: Wed, 25 Aug 2021 15:01:48 +0200
Message-Id: <20210825130211.1542338-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll soon have more opcode and decoded arguments, and 'rtype'
is not very helpful. Naming it simply 'r' ease reviewing the
.decode files when we have many opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210801234202.3167676-5-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa.decode       |  4 +--
 target/mips/tcg/rel6.decode      |  4 +--
 target/mips/tcg/tx79.decode      | 14 ++++----
 target/mips/tcg/msa_translate.c  |  4 +--
 target/mips/tcg/rel6_translate.c |  4 +--
 target/mips/tcg/tx79_translate.c | 62 ++++++++++++++++----------------
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index bf132e36b9b..74d99f6862c 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -11,11 +11,11 @@
 #       - The MIPS64 SIMD Architecture Module, Revision 1.12
 #         (Document Number: MD00868-1D-MSA64-AFP-01.12)
 
-&rtype              rs rt rd sa
+&r                  rs rt rd sa
 
 &msa_bz             df wt s16
 
-@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
diff --git a/target/mips/tcg/rel6.decode b/target/mips/tcg/rel6.decode
index ed069c51662..d6989cf56e8 100644
--- a/target/mips/tcg/rel6.decode
+++ b/target/mips/tcg/rel6.decode
@@ -14,9 +14,9 @@
 #       The MIPS64 Instruction Set Reference Manual, Revision 6.06
 #       (Document Number: MD00087-2B-MIPS64BIS-AFP-6.06)
 
-&rtype              rs rt rd sa
+&r                  rs rt rd sa
 
-@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 03a25a5096d..57d87a2076a 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -11,20 +11,20 @@
 # when creating helpers common to those for the individual
 # instruction patterns.
 
-&rtype           rs rt rd sa
+&r               rs rt rd sa
 
-&itype           base rt offset
+&i               base rt offset
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
-@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &rtype sa=0
-@rt_rd          ...... ..... rt:5  rd:5  ..... ......   &rtype rs=0 sa=0
-@rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
-@rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r sa=0
+@rt_rd          ...... ..... rt:5  rd:5  ..... ......   &r sa=0 rs=0
+@rs             ...... rs:5  ..... ..........  ......   &r sa=0      rt=0 rd=0
+@rd             ...... ..........  rd:5  ..... ......   &r sa=0 rs=0 rt=0
 
-@ldst            ...... base:5 rt:5 offset:16            &itype
+@ldst            ...... base:5 rt:5 offset:16           &i
 
 ###########################################################################
 
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index eed2eca6c92..8170a8df26b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -2261,12 +2261,12 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
-static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
+static bool trans_LSA(DisasContext *ctx, arg_r *a)
 {
     return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
 }
 
-static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
+static bool trans_DLSA(DisasContext *ctx, arg_r *a)
 {
     if (TARGET_LONG_BITS != 64) {
         return false;
diff --git a/target/mips/tcg/rel6_translate.c b/target/mips/tcg/rel6_translate.c
index ae2e023a817..d631851258a 100644
--- a/target/mips/tcg/rel6_translate.c
+++ b/target/mips/tcg/rel6_translate.c
@@ -23,12 +23,12 @@ bool trans_REMOVED(DisasContext *ctx, arg_REMOVED *a)
     return true;
 }
 
-static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
+static bool trans_LSA(DisasContext *ctx, arg_r *a)
 {
     return gen_lsa(ctx, a->rd, a->rt, a->rs, a->sa);
 }
 
-static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
+static bool trans_DLSA(DisasContext *ctx, arg_r *a)
 {
     if (TARGET_LONG_BITS != 64) {
         return false;
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 395d6afa1f1..6d51fe17c1a 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -64,28 +64,28 @@ bool decode_ext_tx79(DisasContext *ctx, uint32_t insn)
  * MTLO1   rs                Move To LO1 Register
  */
 
-static bool trans_MFHI1(DisasContext *ctx, arg_rtype *a)
+static bool trans_MFHI1(DisasContext *ctx, arg_r *a)
 {
     gen_store_gpr(cpu_HI[1], a->rd);
 
     return true;
 }
 
-static bool trans_MFLO1(DisasContext *ctx, arg_rtype *a)
+static bool trans_MFLO1(DisasContext *ctx, arg_r *a)
 {
     gen_store_gpr(cpu_LO[1], a->rd);
 
     return true;
 }
 
-static bool trans_MTHI1(DisasContext *ctx, arg_rtype *a)
+static bool trans_MTHI1(DisasContext *ctx, arg_r *a)
 {
     gen_load_gpr(cpu_HI[1], a->rs);
 
     return true;
 }
 
-static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
+static bool trans_MTLO1(DisasContext *ctx, arg_r *a)
 {
     gen_load_gpr(cpu_LO[1], a->rs);
 
@@ -116,7 +116,7 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
  */
 
-static bool trans_parallel_arith(DisasContext *ctx, arg_rtype *a,
+static bool trans_parallel_arith(DisasContext *ctx, arg_r *a,
                                  void (*gen_logic_i64)(TCGv_i64, TCGv_i64, TCGv_i64))
 {
     TCGv_i64 ax, bx;
@@ -146,19 +146,19 @@ static bool trans_parallel_arith(DisasContext *ctx, arg_rtype *a,
 }
 
 /* Parallel Subtract Byte */
-static bool trans_PSUBB(DisasContext *ctx, arg_rtype *a)
+static bool trans_PSUBB(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_vec_sub8_i64);
 }
 
 /* Parallel Subtract Halfword */
-static bool trans_PSUBH(DisasContext *ctx, arg_rtype *a)
+static bool trans_PSUBH(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_vec_sub16_i64);
 }
 
 /* Parallel Subtract Word */
-static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PSUBW(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_vec_sub32_i64);
 }
@@ -189,25 +189,25 @@ static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
  */
 
 /* Parallel And */
-static bool trans_PAND(DisasContext *ctx, arg_rtype *a)
+static bool trans_PAND(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_and_i64);
 }
 
 /* Parallel Or */
-static bool trans_POR(DisasContext *ctx, arg_rtype *a)
+static bool trans_POR(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_or_i64);
 }
 
 /* Parallel Exclusive Or */
-static bool trans_PXOR(DisasContext *ctx, arg_rtype *a)
+static bool trans_PXOR(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_xor_i64);
 }
 
 /* Parallel Not Or */
-static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
+static bool trans_PNOR(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_arith(ctx, a, tcg_gen_nor_i64);
 }
@@ -237,7 +237,7 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PCEQW   rd, rs, rt        Parallel Compare for Equal Word
  */
 
-static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
+static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
                                    TCGCond cond, unsigned wlen)
 {
     TCGv_i64 c0, c1, ax, bx, t0, t1, t2;
@@ -286,37 +286,37 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
 }
 
 /* Parallel Compare for Greater Than Byte */
-static bool trans_PCGTB(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCGTB(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_GE, 8);
 }
 
 /* Parallel Compare for Equal Byte */
-static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCEQB(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
 }
 
 /* Parallel Compare for Greater Than Halfword */
-static bool trans_PCGTH(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCGTH(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_GE, 16);
 }
 
 /* Parallel Compare for Equal Halfword */
-static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCEQH(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
 }
 
 /* Parallel Compare for Greater Than Word */
-static bool trans_PCGTW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCGTW(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_GE, 32);
 }
 
 /* Parallel Compare for Equal Word */
-static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PCEQW(DisasContext *ctx, arg_r *a)
 {
     return trans_parallel_compare(ctx, a, TCG_COND_EQ, 32);
 }
@@ -334,7 +334,7 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
  * SQ      rt, offset(base)  Store Quadword
  */
 
-static bool trans_LQ(DisasContext *ctx, arg_itype *a)
+static bool trans_LQ(DisasContext *ctx, arg_i *a)
 {
     TCGv_i64 t0;
     TCGv addr;
@@ -369,7 +369,7 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
-static bool trans_SQ(DisasContext *ctx, arg_itype *a)
+static bool trans_SQ(DisasContext *ctx, arg_i *a)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv addr = tcg_temp_new();
@@ -437,7 +437,7 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
  */
 
 /* Parallel Pack to Word */
-static bool trans_PPACW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PPACW(DisasContext *ctx, arg_r *a)
 {
     TCGv_i64 a0, b0, t0;
 
@@ -473,7 +473,7 @@ static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_deposit_i64(dh, a, b, 0, 32);
 }
 
-static bool trans_PEXTLx(DisasContext *ctx, arg_rtype *a, unsigned wlen)
+static bool trans_PEXTLx(DisasContext *ctx, arg_r *a, unsigned wlen)
 {
     TCGv_i64 ax, bx;
 
@@ -514,19 +514,19 @@ static bool trans_PEXTLx(DisasContext *ctx, arg_rtype *a, unsigned wlen)
 }
 
 /* Parallel Extend Lower from Byte */
-static bool trans_PEXTLB(DisasContext *ctx, arg_rtype *a)
+static bool trans_PEXTLB(DisasContext *ctx, arg_r *a)
 {
     return trans_PEXTLx(ctx, a, 8);
 }
 
 /* Parallel Extend Lower from Halfword */
-static bool trans_PEXTLH(DisasContext *ctx, arg_rtype *a)
+static bool trans_PEXTLH(DisasContext *ctx, arg_r *a)
 {
     return trans_PEXTLx(ctx, a, 16);
 }
 
 /* Parallel Extend Lower from Word */
-static bool trans_PEXTLW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PEXTLW(DisasContext *ctx, arg_r *a)
 {
     TCGv_i64 ax, bx;
 
@@ -549,7 +549,7 @@ static bool trans_PEXTLW(DisasContext *ctx, arg_rtype *a)
 }
 
 /* Parallel Extend Upper from Word */
-static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
+static bool trans_PEXTUW(DisasContext *ctx, arg_r *a)
 {
     TCGv_i64 ax, bx;
 
@@ -593,7 +593,7 @@ static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
  */
 
 /* Parallel Copy Halfword */
-static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
+static bool trans_PCPYH(DisasContext *s, arg_r *a)
 {
     if (a->rd == 0) {
         /* nop */
@@ -615,7 +615,7 @@ static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
 }
 
 /* Parallel Copy Lower Doubleword */
-static bool trans_PCPYLD(DisasContext *s, arg_rtype *a)
+static bool trans_PCPYLD(DisasContext *s, arg_r *a)
 {
     if (a->rd == 0) {
         /* nop */
@@ -638,7 +638,7 @@ static bool trans_PCPYLD(DisasContext *s, arg_rtype *a)
 }
 
 /* Parallel Copy Upper Doubleword */
-static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
+static bool trans_PCPYUD(DisasContext *s, arg_r *a)
 {
     if (a->rd == 0) {
         /* nop */
@@ -657,7 +657,7 @@ static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
 }
 
 /* Parallel Rotate 3 Words Left */
-static bool trans_PROT3W(DisasContext *ctx, arg_rtype *a)
+static bool trans_PROT3W(DisasContext *ctx, arg_r *a)
 {
     TCGv_i64 ax;
 
-- 
2.31.1


