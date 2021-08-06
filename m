Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3753E30A9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:07:57 +0200 (CEST)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC74O-0006ec-IJ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72e-0003t5-QQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72d-00006g-8m
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so9849245wms.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4eNL5vlstr5sC3CKhsVnI67HiIe5/y+7mwzwSb1Sy4=;
 b=jFRferOD7QTyei7IkLBFZBNM1QZnrDWZ9LXIXJMqa5W6NpBaw1Dsz/x6R8ZLAQ/KVf
 a+L7PeOJ2jKUZAZOK6dQIiFv3a+agGwhtu8f7aQhDNpnGdSODIrqVJkcvPNGsnWS0tUC
 z5gJ84V6pQrRddL4osJtrKauRfbaM50DQU9BJKfgLIKgCYQI5xbwbc61aCI2/hMYEwY5
 W7cqozbrMTWFWvPK69ovJB+yNwzoBq2KEJuth7EWgD25RAvRP9IiumzGmiAnRrxqJTFW
 vgiieI0BqB04gt+I4Yura4fcON4UJQ3rehkYdcXMD1PiO6jmVNb9zqEDmbBF/nO9EQZs
 XDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X4eNL5vlstr5sC3CKhsVnI67HiIe5/y+7mwzwSb1Sy4=;
 b=LDv2qlDNZH98W5A0YgVRivW1HX7yuFEe4DQMOi3DU7CyCWg/A0BsEImu6ZGzWLHUUm
 Xo45EfvwD3Pf37hsxrztgg7Ps/j4DGOQuYHcxoZdrDaoy0B+MdwMEnhQbgQeIc7LJcOR
 tl3SkIl5NbUo8ApwWI+26rduN1AYwQHxIKB42Wbd3tSKv5TmlfzGrscrekEXsU1RUAwx
 gZNc/aErCSVoAZSuSR4argsPghB9cTASWUwa5KKGCqF7ZRxwxni/CUZTPlyrI0Co5ngk
 nJwlS0c/TwF2A4BynfoErAZk/wbcBn2IEub9u3k1oMsF38nmlT2Ew0+uVUnRJjfyAkZ9
 TNoQ==
X-Gm-Message-State: AOAM5301y5ntTPEvJS1hOdJNybQmmVzlUw0UI7Q2RPcU3jU1KVCZr+rx
 f0BYFsRoadMk/q1zU4CkJgX4eS/n1qvjXdSu73Q=
X-Google-Smtp-Source: ABdhPJwacufkWFHtKedvGKn4GyxiGBfug9gMdYpbEH2O+HzVVixEksozHsIpj3r7ksJ5W3XwEiLrSw==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr5080415wml.152.1628283965655; 
 Fri, 06 Aug 2021 14:06:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x15sm10419324wrs.57.2021.08.06.14.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:06:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 3/5] target/mips: Convert Vr54xx MACC* opcodes to
 decodetree
Date: Fri,  6 Aug 2021 23:05:46 +0200
Message-Id: <20210806210548.8568-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806210548.8568-1-f4bug@amsat.org>
References: <20210806210548.8568-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MACC         Multiply, accumulate, and move LO
 * MACCHI       Multiply, accumulate, and move HI
 * MACCHIU      Unsigned multiply, accumulate, and move HI
 * MACCU        Unsigned multiply, accumulate, and move LO

Since all opcodes are generated using the same pattern, we
add the gen_helper_mult_acc_t typedef and MULT_ACC() macro
to remove boilerplate code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  9 +++++++
 target/mips/tcg/translate.c        | 16 -----------
 target/mips/tcg/vr54xx_translate.c | 43 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index f6b3e42c999..73778f101a5 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -6,3 +6,12 @@
 #
 # Reference: VR5432 Microprocessor User’s Manual
 #            (Document Number U13751EU5V0UM00)
+
+&r              rs rt rd
+
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r
+
+MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
+MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
+MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 71a9a2df0a9..76e153d61aa 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -300,16 +300,12 @@ enum {
 enum {
     OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
     OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
-    OPC_VR54XX_MACC    = (0x05 << 6) | OPC_MULT,
-    OPC_VR54XX_MACCU   = (0x05 << 6) | OPC_MULTU,
     OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
     OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
     OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
     OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
     OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
     OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
-    OPC_VR54XX_MACCHI  = (0x0D << 6) | OPC_MULT,
-    OPC_VR54XX_MACCHIU = (0x0D << 6) | OPC_MULTU,
     OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
     OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
 };
@@ -3780,12 +3776,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSU:
         gen_helper_mulsu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACC:
-        gen_helper_macc(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCU:
-        gen_helper_maccu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSAC:
         gen_helper_msac(t0, cpu_env, t0, t1);
         break;
@@ -3804,12 +3794,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSHIU:
         gen_helper_mulshiu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACCHI:
-        gen_helper_macchi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCHIU:
-        gen_helper_macchiu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSACHI:
         gen_helper_msachi(t0, cpu_env, t0, t1);
         break;
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 13e58fdd8df..f749fc588b7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -17,3 +17,46 @@
 
 /* Include the auto-generated decoder. */
 #include "decode-vr54xx.c.inc"
+
+/*
+ * Integer Multiply-Accumulate Instructions
+ *
+ * MACC         Multiply, accumulate, and move LO
+ * MACCHI       Multiply, accumulate, and move HI
+ * MACCHIU      Unsigned multiply, accumulate, and move HI
+ * MACCU        Unsigned multiply, accumulate, and move LO
+ */
+
+typedef void gen_helper_mult_acc_t(TCGv, TCGv_ptr, TCGv, TCGv);
+
+static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
+                           gen_helper_mult_acc_t *gen_helper_mult_acc)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    gen_helper_mult_acc(t0, cpu_env, t0, t1);
+
+    gen_store_gpr(t0, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return false;
+}
+
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return FUNC(ctx, a, __VA_ARGS__); }
+
+TRANS(MACC,     trans_mult_acc, gen_helper_macc);
+TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
+TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
+TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
-- 
2.31.1


