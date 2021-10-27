Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8B43D0C8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:32:14 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnif-0001QM-LA
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLy-0004um-KX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLw-000446-Gj
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso7028682wmd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uElesMQVD3bhC5YLVgJyV44WXCUQXJKdsCqdLpq2BLU=;
 b=J0MpoAikh5rvNDZHV0HGkZilK0pvl1bFLGllKdTo5Vk68rNVMdPQYcgLXwgMuT7+qg
 ePTLQ3urSCPz/N7t6R3RQo8Bx/BXBEmfcs0Xvkk/pQFCNIv5ewOHxaSuPiU//Ri5FMzs
 Co4NjfbcEqPuEDuWDcpfMMctXhW05KmKuRw74ynULfNz0uk4t1cjULiT/nAQsQgxT+sQ
 vST/4I77gRyxZxK4YMR141PtQgvry4tEs0qwiHGwhGut/1K3ZoSHwwldCkpkq6eeNk6W
 v66pTcL13PTUgNgW/Srf/sPQfdeNZ59gpELAOWDcMoDAEM4jBztQDW6vS3pAEEpJvdoN
 zuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uElesMQVD3bhC5YLVgJyV44WXCUQXJKdsCqdLpq2BLU=;
 b=oi0Nnm22n1c1tK06x959QxXlWmN9oZxO3B+3VQrCGq7BUjHujxAN0GfYVPDVeF9Tlt
 tkjYQ8OtYIR9RqSC6jtGXIBnq3Kyz8qV/+7D6oZczhRjdFQbidTwLNpLTX9UplO1oeIa
 chLkhJ6OnFxvJuDYwil1h2ZeEEjEINHnIiSFT15r6+JHrwgWbi7XVGe/7tMvLN0T2Oxd
 AOPH6CIvqTAXtWeb9N0PZ+s+3ufEFDgmOKWUMjIwtCktgYYrMNlKyFR8WDK4uwmVhxIf
 ogP/YlHEzuO8Mbuq1b6EAnWpPbPONzP/g2ej1ICjxpP1LsHH5fMeYlatUu8Fov14HSBy
 tmXA==
X-Gm-Message-State: AOAM5331ApUEkLELd7bo+O2Jyjq7DkqR8A1GZw8x8JDrWYn38dh0VxKl
 8sPmjmeR3ymcMitovRPtkkYNOD8jOj0=
X-Google-Smtp-Source: ABdhPJwW2tf7mkUfwFAo4dzTVytcSzg4X7u9qqxIgFiqBvC2gIlxpSnceIJ6WWNdx+u4778pzj1pXQ==
X-Received: by 2002:a1c:a984:: with SMTP id s126mr7281196wme.156.1635358123092; 
 Wed, 27 Oct 2021 11:08:43 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m15sm464521wmq.0.2021.10.27.11.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/32] target/mips: Convert MSA FILL opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:13 +0200
Message-Id: <20211027180730.1551932-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the FILL opcode (Vector Fill from GPR) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- check TARGET_LONG_BITS != 64 before check_msa_access()
- !check_msa_access returns true
- Use tcg_constant_i32()
---
 target/mips/tcg/msa.decode      |  2 ++
 target/mips/tcg/msa_translate.c | 32 ++++++++++++++++++++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 395a2cbafeb..030ffa9321b 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -28,6 +28,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
@@ -83,6 +84,7 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FILL              011110 11000000 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index a61ba9a4db8..004eb0b7700 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -56,7 +56,6 @@ enum {
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
     OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
     OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
     OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
@@ -1843,17 +1842,6 @@ static void gen_msa_2r(DisasContext *ctx)
     TCGv_i32 tws = tcg_const_i32(ws);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_FILL_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
-                               twd, tws); /* trs */
-        break;
     case OPC_NLOC_df:
         switch (df) {
         case DF_BYTE:
@@ -1912,6 +1900,26 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
+static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
+{
+    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
+        /* Double format valid only for MIPS64 */
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_fill_df(cpu_env,
+                           tcg_constant_i32(a->df),
+                           tcg_constant_i32(a->wd),
+                           tcg_constant_i32(a->ws));
+
+    return true;
+}
+
 static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
                           gen_helper_piii *gen_msa_2rf)
 {
-- 
2.31.1


