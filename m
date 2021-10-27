Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B79C43D0EC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:41:31 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnre-0004on-JU
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMM-0005mU-G8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMK-00047g-Dn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so3065303wmd.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zj4x/v5Ps4y6ZPFdUiEBaIWOnBZnxVVtjnU+CwSUqwc=;
 b=Tuoj2ha/YM8RyMqCtBaE/2g+ukb0kkBKldDuq+bxxEeE78Mr7f5qTnjQdPCmy0pSdj
 hFSQ7lxfXmaA7wqVT0iJMiXrUtjPCLWaC/ViZLRes2I9EKh87pZmSTn9MuDrS0xRIX+c
 aB+pJbbrPHK56fTnEAECL7l8vU57P9jNv5283B1Sd6013rGdInFLknsY06QIDfOlfLbV
 qF2U2Y0NXR9xax37jiw7SpBOEx04Rf5rKP5imJZ+WcH5ZUlscE6RJDS8JokeWs4ZT1YX
 SBW49A1dLYqgYqDcIi/76LhZGiRV/y/RuM4a0tTaJ2cQOzHhokaJijDbZ1eYWHcsAkZ6
 7Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zj4x/v5Ps4y6ZPFdUiEBaIWOnBZnxVVtjnU+CwSUqwc=;
 b=FYnnr2qrk1ISyaLXpquAL4a37ZzQyBPRvcmUeYajGDLgdimYkNS70S9Wom/A1j/EZI
 GWQYwS7eI/FF2puVCNC5c0Sv0M1VE2OQzqEpkAeZcb1OYj53DT1eH5GpuGmbqpyLLXKj
 D1hykeCTs5u8z8oTYPQRnaIfIx4dJ+OwXpSo+mJQxJ4u7VqS3WPoWk1nnuqL+z1xXFfL
 REvR6DWtnUl2aa0r1Ek8BIlmvSrKeu3OVa+vD/SROFXj58icg/bX6POF1f/v0dcILBq4
 wj3mmro4omeoG8t85ipym4TUdhV3qcKIncOFHEv090a3+r2TrfnUc72aTwSQ5I0fmlyf
 IZUA==
X-Gm-Message-State: AOAM530zP62L0jL3f8ZbURnpu+r5ifFSJepLZANUW0Vnaoh4IYYlk8kB
 C/g0m3Gcz7yEmxaHwzmOcEnzJy+JcyQ=
X-Google-Smtp-Source: ABdhPJxZQxQnYQXFa48N/IGFMnBgLesKNPyqO453FRaoRVx0gAR8xcMiHvusBS2QEFdKTjLRnLYcvQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr7127025wmi.115.1635358146218; 
 Wed, 27 Oct 2021 11:09:06 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q18sm4210119wmc.7.2021.10.27.11.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
Date: Wed, 27 Oct 2021 20:07:18 +0200
Message-Id: <20211027180730.1551932-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Convert 3-register operations to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  6 ++++++
 target/mips/tcg/msa_translate.c | 29 +++++++++++++++++------------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index f88ae234cca..7201b821ae0 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -31,6 +31,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
+@3r                 ...... ...  df:2 wt:5 ws:5 wd:5 ......  &msa_r
 @3rf                ...... .... df:1 wt:5 ws:5 wd:5 ......  &msa_r
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
@@ -86,6 +87,11 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  SLD               011110 000 .. ..... ..... ..... 010100  @3r
+  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
+
+  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index f635b49c13c..c7ca629d684 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -48,15 +48,12 @@ enum {
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
-    OPC_SLD_df      = (0x0 << 23) | OPC_MSA_3R_14,
-    OPC_VSHF_df     = (0x0 << 23) | OPC_MSA_3R_15,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
-    OPC_SPLAT_df    = (0x1 << 23) | OPC_MSA_3R_14,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -457,6 +454,23 @@ TRANS_MSA(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS_MSA(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS_MSA(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
 
+static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
+                            gen_helper_piiii *gen_msa_3r_df)
+{
+    gen_msa_3r_df(cpu_env,
+                  tcg_constant_i32(a->df),
+                  tcg_constant_i32(a->wd),
+                  tcg_constant_i32(a->ws),
+                  tcg_constant_i32(a->wt));
+
+    return true;
+}
+
+TRANS_MSA(SLD,          trans_msa_3r_df, gen_helper_msa_sld_df);
+TRANS_MSA(SPLAT,        trans_msa_3r_df, gen_helper_msa_splat_df);
+
+TRANS_MSA(VSHF,         trans_msa_3r_df, gen_helper_msa_vshf_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -1207,12 +1221,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SLD_df:
-        gen_helper_msa_sld_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_VSHF_df:
-        gen_helper_msa_vshf_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBV_df:
         switch (df) {
         case DF_BYTE:
@@ -1245,9 +1253,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SPLAT_df:
-        gen_helper_msa_splat_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUS_U_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


