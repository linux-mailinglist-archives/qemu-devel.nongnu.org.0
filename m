Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B23E3C04
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:36:49 +0200 (CEST)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmjA-0005LL-93
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdS-0005ZJ-4J
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdQ-0006ij-IP
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so9850445wmg.4
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlITcWvKtEGGVZKHYKZHunb1G6swgMp1SxF5Lviv8u4=;
 b=F7EnGP1oZIE7cbo5v/FqqVdNEpmg4ldfUiR+q6QcA7WzaK1O3NKcin+mseIHD3cb8U
 ZrchcHUzbge2K8ACeYTjaz1IIgmOIWMs46N8iC6Uu6XgQuX/mkMz6YpvOzIkFfK/e7zC
 /0y/F3bxsLbd7NpidFJefrSS/B+gkljEEiGCtGAcJRYu4OpYwtsuWos9J/YnuHKVsuJI
 XQ8cwuPA/nnjpKHxAzrwAy7MiEhBLrqQGjZdBCCIoT+/LMURw5Yj9jWsGWLvikj9ZLEK
 hbLSUlyZ45PnUB5siqJ+1i+LY2Ueds5LsQlvtYKV028QBgZkYW7ygK/cjTh3WflJRpqb
 ZEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hlITcWvKtEGGVZKHYKZHunb1G6swgMp1SxF5Lviv8u4=;
 b=E6DDUlvRCo5jdLR8CX4u+ttTjynltNnntS4GuKQJ3ql9bxaBFDDseV6fCyb+vzGoxm
 /8BwiW82sw+6bFETPyFj89EySBlvwA0BKT+Br6kVWOVio7becDXt75Jmg04fzefj/Mp2
 PD4CnhQWkSl7ycI2iiAy2FzIEoyrBTj7lAJNJbdvS4+HDkfes8cf7SGPj0mwC0YjFjGB
 kCjA4dPAQZ9LWZdvGbnBza74qw6//zHSl8w6vuL01KN9cPlYTwMmgUFyh7zBN21e6dPi
 /7wKQd0wBe7g3fQSnBason1m1puwHQ3tigWKkon7cy4lCSYnrdAizyHpN8TTuJIZm7Us
 sXGA==
X-Gm-Message-State: AOAM530sk98wVtTjS05FOAgiYi88G66ayVxzAFL69AJoUkzHoKfE8VKl
 IzSOtaeL+Mtk3Wg4FD3QCHiFSM2eWPs=
X-Google-Smtp-Source: ABdhPJzjTwkDv6prk3/r6XmA2YnXLiEme5hMBY9xJMPI10pyRi3JL7uDIX+AG17mHdhEl2YrqVt61g==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr30082784wmc.39.1628443850864; 
 Sun, 08 Aug 2021 10:30:50 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j14sm17159682wru.58.2021.08.08.10.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 6/7] target/mips: Convert Vr54xx MUL* opcodes to
 decodetree
Date: Sun,  8 Aug 2021 19:30:17 +0200
Message-Id: <20210808173018.90960-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
References: <20210808173018.90960-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

 * MULHI        Multiply and move HI
 * MULHIU       Unsigned multiply and move HI
 * MULS         Multiply, negate, and move LO
 * MULSHI       Multiply, negate, and move HI
 * MULSHIU      Unsigned multiply, negate, and move HI
 * MULSU        Unsigned multiply, negate, and move LO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  6 ++++++
 target/mips/tcg/translate.c        | 24 ------------------------
 target/mips/tcg/vr54xx_translate.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index 73778f101a5..79bb5175eab 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -11,7 +11,13 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r
 
+MULS            000000 ..... ..... ..... 00011011000    @rs_rt_rd
+MULSU           000000 ..... ..... ..... 00011011001    @rs_rt_rd
 MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
 MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MULHI           000000 ..... ..... ..... 01001011000    @rs_rt_rd
+MULHIU          000000 ..... ..... ..... 01001011001    @rs_rt_rd
+MULSHI          000000 ..... ..... ..... 01011011000    @rs_rt_rd
+MULSHIU         000000 ..... ..... ..... 01011011001    @rs_rt_rd
 MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
 MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index fd8ffadf06e..4b7f2d9ae8b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -298,14 +298,8 @@ enum {
 #define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
 
 enum {
-    OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
-    OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
     OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
     OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
-    OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
-    OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
     OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
     OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
 };
@@ -3770,30 +3764,12 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case OPC_VR54XX_MULS:
-        gen_helper_muls(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSU:
-        gen_helper_mulsu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSAC:
         gen_helper_msac(t0, cpu_env, t0, t1);
         break;
     case OPC_VR54XX_MSACU:
         gen_helper_msacu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MULHI:
-        gen_helper_mulhi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULHIU:
-        gen_helper_mulhiu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSHI:
-        gen_helper_mulshi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSHIU:
-        gen_helper_mulshiu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSACHI:
         gen_helper_msachi(t0, cpu_env, t0, t1);
         break;
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 0e2d460c985..9f35b2c7e5d 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -25,6 +25,12 @@
  * MACCHI       Multiply, accumulate, and move HI
  * MACCHIU      Unsigned multiply, accumulate, and move HI
  * MACCU        Unsigned multiply, accumulate, and move LO
+ * MULHI        Multiply and move HI
+ * MULHIU       Unsigned multiply and move HI
+ * MULS         Multiply, negate, and move LO
+ * MULSHI       Multiply, negate, and move HI
+ * MULSHIU      Unsigned multiply, negate, and move HI
+ * MULSU        Unsigned multiply, negate, and move LO
  */
 
 static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
@@ -50,3 +56,9 @@ TRANS(MACC,     trans_mult_acc, gen_helper_macc);
 TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
 TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
 TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
+TRANS(MULHI,    trans_mult_acc, gen_helper_mulhi);
+TRANS(MULHIU,   trans_mult_acc, gen_helper_mulhiu);
+TRANS(MULS,     trans_mult_acc, gen_helper_muls);
+TRANS(MULSHI,   trans_mult_acc, gen_helper_mulshi);
+TRANS(MULSHIU,  trans_mult_acc, gen_helper_mulshiu);
+TRANS(MULSU,    trans_mult_acc, gen_helper_mulsu);
-- 
2.31.1


