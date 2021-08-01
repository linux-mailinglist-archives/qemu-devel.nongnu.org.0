Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E73DCE3F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:03:28 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALQV-0001XH-Ky
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALN0-0003vZ-CT
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMy-0006vR-RS
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso6254822wms.1
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KZSsIN1jAPSfJjntr6AXDXihP2pfitlG1Z2Ag2JAHRo=;
 b=dqhLhTDrL/eq5BQBOJVw+PEpDpjc54NHc3BkEB78/ynHaOQcBV8gH8l04UZrzSssPX
 FYrP/CRn3BGvd4FtH/v7IgT3sVTa8poZmk66kqKCyl/CUCjg+0U80KGcl3SUVTxIxZ6i
 p1xMmsnxONriqfeVYxP9+OXClAnBSHaOhLqUwxBsOY7E3Lg0kRC31j/6JmZ/FYHYIsWe
 Ust1e1qA1J73FMoz6i4M2S3Lk0O41E5Rh6ysG+PIblFlEoHZiW8rY9CLLNc0mu28Zt6c
 aWGIUDt+MAVSsV5vKNOA3foRqWEVBku4+9+K1V8G5vfA5Lwl8dpg1W3QAneyAF1xzccm
 eR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KZSsIN1jAPSfJjntr6AXDXihP2pfitlG1Z2Ag2JAHRo=;
 b=eeZ6tt599hdYVLRNWsBauHQAm6Qd0fpF2GwOVoLFxypOdqcKiybZr862byBwxncLX5
 q8WSokmj9Ba12xCwIbTEJVFwe/c8uJuxM5lL42hkySME9E342TpaMGU/OzRv9MwUr8Mj
 GGHPv1OvUUtbmQ/wM3Nqh+iW+RC4UjRCmxhwd7BdV53Uy80zaK/hUMKKfynuQXen91JG
 YBXegxt3dqDHBHOBjU4StWwfseVkRk6OvJ62j39Y82KruZjF1m4kAwlNYswHTxx6ree6
 vrx56lxSSARBbNLNyX38jzl2/jnbFrsluQfY38sIpdOjTWdcpqcjJ4hD1S+3o8g7JZQK
 rvNw==
X-Gm-Message-State: AOAM532ijhvADCsK+8P2iSPvv8kIm/TuPka6/JDZTuk5IHhm8gLDQ6qh
 PsoyCFztphzAD9ntWmCopj0PEpkO2y2SPQ==
X-Google-Smtp-Source: ABdhPJxpaemegPvI7D18zeQ5OVz8GY4mjtBBohkvP1TerO6oblorVi32byPXGQwc9MEQZXzKqZqe6A==
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr13869674wmd.7.1627862387086; 
 Sun, 01 Aug 2021 16:59:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v15sm8964413wmj.11.2021.08.01.16.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 4/5] target/mips: Convert Vr54xx MUL* opcodes to
 decodetree
Date: Mon,  2 Aug 2021 01:59:25 +0200
Message-Id: <20210801235926.3178085-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801235926.3178085-1-f4bug@amsat.org>
References: <20210801235926.3178085-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MULHI        Multiply and move HI
 * MULHIU       Unsigned multiply and move HI
 * MULS         Multiply, negate, and move LO
 * MULSHI       Multiply, negate, and move HI
 * MULSHIU      Unsigned multiply, negate, and move HI
 * MULSU        Unsigned multiply, negate, and move LO

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
index 8d29a0d4e4b..4196319d827 100644
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
index 85e2ec371b9..1e6000d3d15 100644
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
 
 typedef void gen_helper_mult_acc_t(TCGv, TCGv_ptr, TCGv, TCGv);
@@ -57,3 +63,9 @@ MULT_ACC(MACC,      gen_helper_macc);
 MULT_ACC(MACCHI,    gen_helper_macchi);
 MULT_ACC(MACCHIU,   gen_helper_macchiu);
 MULT_ACC(MACCU,     gen_helper_maccu);
+MULT_ACC(MULHI,     gen_helper_mulhi);
+MULT_ACC(MULHIU,    gen_helper_mulhiu);
+MULT_ACC(MULS,      gen_helper_muls);
+MULT_ACC(MULSHI,    gen_helper_mulshi);
+MULT_ACC(MULSHIU,   gen_helper_mulshiu);
+MULT_ACC(MULSU,     gen_helper_mulsu);
-- 
2.31.1


