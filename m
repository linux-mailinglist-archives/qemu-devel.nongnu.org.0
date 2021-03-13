Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88F33A0CA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:56:21 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAN2-00066a-Um
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGJ-0007S8-9y
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGF-00074a-5Y
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l19so5751741wmh.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qv+ek4gJlon/VRjqa0yiW9aP8XMNZk3Sab+R6Xka1F0=;
 b=e0XtMkB/HxclQG0of4s1kJrR1H8/Tlld3yWUsRKQO//BxgVMU1JhTgD7+pHNn6EV0X
 RC4c/JDZ3cqjVebRyQ13Qi/CUUB9wnKeXFBXScWpnDVgrltn1yxNwXkemfxBG0DB55fY
 gGknNDZ+w2zZ2cYE1aCmT+NS+YkhH/MEXfZOqcAI+6g+7xXkp/5Lv8YsoO2ebXRTPjVc
 ypZsN8iCUWUvL68ktlB68hIQYL7r8rVdJd17WACKtLQ+34RyADI7DxirV4OnxF3SYJ04
 5OrtmwjgWmB/O7JXqPFDtpY6006A63kjfemXWa6D6eHhsb3UKhFb80nwYJ20SCht31wK
 d3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qv+ek4gJlon/VRjqa0yiW9aP8XMNZk3Sab+R6Xka1F0=;
 b=Yh6ARw0mXQhwKEfP4P2vyxzhSq6nX85ZjiuxH8cnaRBlBa41GzqH50hohF737dQlye
 Sow69nM+Qv/6/O1EeXUGcugFinWuNQT2wBYw2KDB6gtkX7X8p6sx5wxOCQVibtZFUqKf
 WYvmrSDZk9/z0ufzyStnUEep7Cx8UCwygbK+AsAVDT9tdoPqAHvHVUFhIPgvt57Bcdg1
 35kJIO8n606lRv5hlFh4eXfhzFLAr9tSGijitq+aTk2aC5QS4InfOMIlbk8O0L/4ticg
 uqqnQJL7ccX+Gln78llRAo+asZ+weNuavJ0btoum9z6lUOhQZccNnRJb59CJg8j4sQ6Y
 +KlA==
X-Gm-Message-State: AOAM531bqeC3NnDVYV7U6ycTTrkxgnEAveGZFh0/3kCwWZGzZtXHk2ji
 4/EcYLpmR8UiVxcjcVbBpMXZdJou5o3ARA==
X-Google-Smtp-Source: ABdhPJw8WcLDKdYRSjwEawn2Nzzg8f82foOfvLkHptBHIx9xzBwfimqbG+Vi0P8M0MWIpmyhKRj1ig==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr19072923wma.80.1615664956976; 
 Sat, 13 Mar 2021 11:49:16 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s18sm14943414wrr.27.2021.03.13.11.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] target/mips: Remove XBurst Media eXtension Unit dead code
Date: Sat, 13 Mar 2021 20:48:11 +0100
Message-Id: <20210313194829.2193621-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these unimplemented MXU opcodes end up calling
gen_reserved_instruction() which is the default switch
case in decode_opc_mxu().

The translate.c file is already big enough and hard to maintain,
remove 1300 lines of unnecessary code and /* TODO */ comments.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 1286 ---------------------------------------
 1 file changed, 1286 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index ceb77a3a7ca..2b9438eaff2 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1464,70 +1464,16 @@ enum {
  */
 
 enum {
-    OPC_MXU_S32MADD  = 0x00,
-    OPC_MXU_S32MADDU = 0x01,
     OPC__MXU_MUL     = 0x02,
     OPC_MXU__POOL00  = 0x03,
-    OPC_MXU_S32MSUB  = 0x04,
-    OPC_MXU_S32MSUBU = 0x05,
-    OPC_MXU__POOL01  = 0x06,
-    OPC_MXU__POOL02  = 0x07,
     OPC_MXU_D16MUL   = 0x08,
-    OPC_MXU__POOL03  = 0x09,
     OPC_MXU_D16MAC   = 0x0A,
-    OPC_MXU_D16MACF  = 0x0B,
-    OPC_MXU_D16MADL  = 0x0C,
-    OPC_MXU_S16MAD   = 0x0D,
-    OPC_MXU_Q16ADD   = 0x0E,
-    OPC_MXU_D16MACE  = 0x0F,
     OPC_MXU__POOL04  = 0x10,
-    OPC_MXU__POOL05  = 0x11,
-    OPC_MXU__POOL06  = 0x12,
-    OPC_MXU__POOL07  = 0x13,
-    OPC_MXU__POOL08  = 0x14,
-    OPC_MXU__POOL09  = 0x15,
-    OPC_MXU__POOL10  = 0x16,
-    OPC_MXU__POOL11  = 0x17,
-    OPC_MXU_D32ADD   = 0x18,
-    OPC_MXU__POOL12  = 0x19,
-    /* not assigned 0x1A */
-    OPC_MXU__POOL13  = 0x1B,
-    OPC_MXU__POOL14  = 0x1C,
-    OPC_MXU_Q8ACCE   = 0x1D,
-    /* not assigned 0x1E */
-    /* not assigned 0x1F */
-    /* not assigned 0x20 */
-    /* not assigned 0x21 */
     OPC_MXU_S8LDD    = 0x22,
-    OPC_MXU_S8STD    = 0x23,
-    OPC_MXU_S8LDI    = 0x24,
-    OPC_MXU_S8SDI    = 0x25,
-    OPC_MXU__POOL15  = 0x26,
     OPC_MXU__POOL16  = 0x27,
-    OPC_MXU__POOL17  = 0x28,
-    /* not assigned 0x29 */
-    OPC_MXU_S16LDD   = 0x2A,
-    OPC_MXU_S16STD   = 0x2B,
-    OPC_MXU_S16LDI   = 0x2C,
-    OPC_MXU_S16SDI   = 0x2D,
     OPC_MXU_S32M2I   = 0x2E,
     OPC_MXU_S32I2M   = 0x2F,
-    OPC_MXU_D32SLL   = 0x30,
-    OPC_MXU_D32SLR   = 0x31,
-    OPC_MXU_D32SARL  = 0x32,
-    OPC_MXU_D32SAR   = 0x33,
-    OPC_MXU_Q16SLL   = 0x34,
-    OPC_MXU_Q16SLR   = 0x35,
-    OPC_MXU__POOL18  = 0x36,
-    OPC_MXU_Q16SAR   = 0x37,
     OPC_MXU__POOL19  = 0x38,
-    OPC_MXU__POOL20  = 0x39,
-    OPC_MXU__POOL21  = 0x3A,
-    OPC_MXU_Q16SCOP  = 0x3B,
-    OPC_MXU_Q8MADL   = 0x3C,
-    OPC_MXU_S32SFL   = 0x3D,
-    OPC_MXU_Q8SAD    = 0x3E,
-    /* not assigned 0x3F */
 };
 
 
@@ -1541,39 +1487,6 @@ enum {
     OPC_MXU_D16MIN   = 0x03,
     OPC_MXU_Q8MAX    = 0x04,
     OPC_MXU_Q8MIN    = 0x05,
-    OPC_MXU_Q8SLT    = 0x06,
-    OPC_MXU_Q8SLTU   = 0x07,
-};
-
-/*
- * MXU pool 01
- */
-enum {
-    OPC_MXU_S32SLT   = 0x00,
-    OPC_MXU_D16SLT   = 0x01,
-    OPC_MXU_D16AVG   = 0x02,
-    OPC_MXU_D16AVGR  = 0x03,
-    OPC_MXU_Q8AVG    = 0x04,
-    OPC_MXU_Q8AVGR   = 0x05,
-    OPC_MXU_Q8ADD    = 0x07,
-};
-
-/*
- * MXU pool 02
- */
-enum {
-    OPC_MXU_S32CPS   = 0x00,
-    OPC_MXU_D16CPS   = 0x02,
-    OPC_MXU_Q8ABD    = 0x04,
-    OPC_MXU_Q16SAT   = 0x06,
-};
-
-/*
- * MXU pool 03
- */
-enum {
-    OPC_MXU_D16MULF  = 0x00,
-    OPC_MXU_D16MULE  = 0x01,
 };
 
 /*
@@ -1584,136 +1497,17 @@ enum {
     OPC_MXU_S32LDDR  = 0x01,
 };
 
-/*
- * MXU pool 05
- */
-enum {
-    OPC_MXU_S32STD   = 0x00,
-    OPC_MXU_S32STDR  = 0x01,
-};
-
-/*
- * MXU pool 06
- */
-enum {
-    OPC_MXU_S32LDDV  = 0x00,
-    OPC_MXU_S32LDDVR = 0x01,
-};
-
-/*
- * MXU pool 07
- */
-enum {
-    OPC_MXU_S32STDV  = 0x00,
-    OPC_MXU_S32STDVR = 0x01,
-};
-
-/*
- * MXU pool 08
- */
-enum {
-    OPC_MXU_S32LDI   = 0x00,
-    OPC_MXU_S32LDIR  = 0x01,
-};
-
-/*
- * MXU pool 09
- */
-enum {
-    OPC_MXU_S32SDI   = 0x00,
-    OPC_MXU_S32SDIR  = 0x01,
-};
-
-/*
- * MXU pool 10
- */
-enum {
-    OPC_MXU_S32LDIV  = 0x00,
-    OPC_MXU_S32LDIVR = 0x01,
-};
-
-/*
- * MXU pool 11
- */
-enum {
-    OPC_MXU_S32SDIV  = 0x00,
-    OPC_MXU_S32SDIVR = 0x01,
-};
-
-/*
- * MXU pool 12
- */
-enum {
-    OPC_MXU_D32ACC   = 0x00,
-    OPC_MXU_D32ACCM  = 0x01,
-    OPC_MXU_D32ASUM  = 0x02,
-};
-
-/*
- * MXU pool 13
- */
-enum {
-    OPC_MXU_Q16ACC   = 0x00,
-    OPC_MXU_Q16ACCM  = 0x01,
-    OPC_MXU_Q16ASUM  = 0x02,
-};
-
-/*
- * MXU pool 14
- */
-enum {
-    OPC_MXU_Q8ADDE   = 0x00,
-    OPC_MXU_D8SUM    = 0x01,
-    OPC_MXU_D8SUMC   = 0x02,
-};
-
-/*
- * MXU pool 15
- */
-enum {
-    OPC_MXU_S32MUL   = 0x00,
-    OPC_MXU_S32MULU  = 0x01,
-    OPC_MXU_S32EXTR  = 0x02,
-    OPC_MXU_S32EXTRV = 0x03,
-};
-
 /*
  * MXU pool 16
  */
 enum {
-    OPC_MXU_D32SARW  = 0x00,
-    OPC_MXU_S32ALN   = 0x01,
     OPC_MXU_S32ALNI  = 0x02,
-    OPC_MXU_S32LUI   = 0x03,
     OPC_MXU_S32NOR   = 0x04,
     OPC_MXU_S32AND   = 0x05,
     OPC_MXU_S32OR    = 0x06,
     OPC_MXU_S32XOR   = 0x07,
 };
 
-/*
- * MXU pool 17
- */
-enum {
-    OPC_MXU_LXB      = 0x00,
-    OPC_MXU_LXH      = 0x01,
-    OPC_MXU_LXW      = 0x03,
-    OPC_MXU_LXBU     = 0x04,
-    OPC_MXU_LXHU     = 0x05,
-};
-
-/*
- * MXU pool 18
- */
-enum {
-    OPC_MXU_D32SLLV  = 0x00,
-    OPC_MXU_D32SLRV  = 0x01,
-    OPC_MXU_D32SARV  = 0x03,
-    OPC_MXU_Q16SLLV  = 0x04,
-    OPC_MXU_Q16SLRV  = 0x05,
-    OPC_MXU_Q16SARV  = 0x07,
-};
-
 /*
  * MXU pool 19
  */
@@ -1722,26 +1516,6 @@ enum {
     OPC_MXU_Q8MULSU  = 0x01,
 };
 
-/*
- * MXU pool 20
- */
-enum {
-    OPC_MXU_Q8MOVZ   = 0x00,
-    OPC_MXU_Q8MOVN   = 0x01,
-    OPC_MXU_D16MOVZ  = 0x02,
-    OPC_MXU_D16MOVN  = 0x03,
-    OPC_MXU_S32MOVZ  = 0x04,
-    OPC_MXU_S32MOVN  = 0x05,
-};
-
-/*
- * MXU pool 21
- */
-enum {
-    OPC_MXU_Q8MAC    = 0x00,
-    OPC_MXU_Q8MACSU  = 0x01,
-};
-
 /*
  *     Overview of the TX79-specific instruction set
  *     =============================================
@@ -25332,11 +25106,6 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
  *  S32NOR XRa, XRb, XRc
  *    Update XRa with the result of logical bitwise 'nor' operation
  *    applied to the content of XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_S32NOR(DisasContext *ctx)
 {
@@ -25373,11 +25142,6 @@ static void gen_mxu_S32NOR(DisasContext *ctx)
  *  S32AND XRa, XRb, XRc
  *    Update XRa with the result of logical bitwise 'and' operation
  *    applied to the content of XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_S32AND(DisasContext *ctx)
 {
@@ -25408,11 +25172,6 @@ static void gen_mxu_S32AND(DisasContext *ctx)
  *  S32OR XRa, XRb, XRc
  *    Update XRa with the result of logical bitwise 'or' operation
  *    applied to the content of XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_S32OR(DisasContext *ctx)
 {
@@ -25449,11 +25208,6 @@ static void gen_mxu_S32OR(DisasContext *ctx)
  *  S32XOR XRa, XRb, XRc
  *    Update XRa with the result of logical bitwise 'xor' operation
  *    applied to the content of XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_S32XOR(DisasContext *ctx)
 {
@@ -25503,11 +25257,6 @@ static void gen_mxu_S32XOR(DisasContext *ctx)
  *  S32MIN XRa, XRb, XRc
  *    Update XRa with the minimum of signed 32-bit integers contained
  *    in XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL00|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_S32MAX_S32MIN(DisasContext *ctx)
 {
@@ -25558,11 +25307,6 @@ static void gen_mxu_S32MAX_S32MIN(DisasContext *ctx)
  *  D16MIN
  *    Update XRa with the 16-bit-wise minimums of signed integers
  *    contained in XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL00|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
 {
@@ -25660,11 +25404,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
  *  Q8MIN
  *    Update XRa with the 8-bit-wise minimums of signed integers
  *    contained in XRb and XRc.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0| opc |  XRc  |  XRb  |  XRa  |MXU__POOL00|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
  */
 static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
 {
@@ -25774,12 +25513,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
  *  S32ALNI XRc, XRb, XRa, optn3
  *    Arrange bytes from XRb and XRc according to one of five sets of
  *    rules determined by optn3, and place the result in XRa.
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+-----+---+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |optn3|0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+-----+---+-----+-------+-------+-------+-----------+
- *
  */
 static void gen_mxu_S32ALNI(DisasContext *ctx)
 {
@@ -25961,16 +25694,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
  * =======================
  */
 
-/*
- *
- * Decode MXU pool00
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL00|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- */
 static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
@@ -25988,16 +25711,6 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MXU_Q8MIN:
         gen_mxu_Q8MAX_Q8MIN(ctx);
         break;
-    case OPC_MXU_Q8SLT:
-        /* TODO: Implement emulation of Q8SLT instruction. */
-        MIPS_INVAL("OPC_MXU_Q8SLT");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8SLTU:
-        /* TODO: Implement emulation of Q8SLTU instruction. */
-        MIPS_INVAL("OPC_MXU_Q8SLTU");
-        gen_reserved_instruction(ctx);
-        break;
     default:
         MIPS_INVAL("decode_opc_mxu");
         gen_reserved_instruction(ctx);
@@ -26005,161 +25718,6 @@ static void decode_opc_mxu__pool00(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-/*
- *
- * Decode MXU pool01
- *
- *  S32SLT, D16SLT, D16AVG, D16AVGR, Q8AVG, Q8AVGR:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL01|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- *  Q8ADD:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+-----+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |en2|0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL01|
- *  +-----------+---+-----+-----+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool01(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 18, 3);
-
-    switch (opcode) {
-    case OPC_MXU_S32SLT:
-        /* TODO: Implement emulation of S32SLT instruction. */
-        MIPS_INVAL("OPC_MXU_S32SLT");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16SLT:
-        /* TODO: Implement emulation of D16SLT instruction. */
-        MIPS_INVAL("OPC_MXU_D16SLT");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16AVG:
-        /* TODO: Implement emulation of D16AVG instruction. */
-        MIPS_INVAL("OPC_MXU_D16AVG");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16AVGR:
-        /* TODO: Implement emulation of D16AVGR instruction. */
-        MIPS_INVAL("OPC_MXU_D16AVGR");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8AVG:
-        /* TODO: Implement emulation of Q8AVG instruction. */
-        MIPS_INVAL("OPC_MXU_Q8AVG");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8AVGR:
-        /* TODO: Implement emulation of Q8AVGR instruction. */
-        MIPS_INVAL("OPC_MXU_Q8AVGR");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8ADD:
-        /* TODO: Implement emulation of Q8ADD instruction. */
-        MIPS_INVAL("OPC_MXU_Q8ADD");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool02
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL02|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool02(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 18, 3);
-
-    switch (opcode) {
-    case OPC_MXU_S32CPS:
-        /* TODO: Implement emulation of S32CPS instruction. */
-        MIPS_INVAL("OPC_MXU_S32CPS");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16CPS:
-        /* TODO: Implement emulation of D16CPS instruction. */
-        MIPS_INVAL("OPC_MXU_D16CPS");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8ABD:
-        /* TODO: Implement emulation of Q8ABD instruction. */
-        MIPS_INVAL("OPC_MXU_Q8ABD");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16SAT:
-        /* TODO: Implement emulation of Q16SAT instruction. */
-        MIPS_INVAL("OPC_MXU_Q16SAT");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool03
- *
- *  D16MULF:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |x x|on2|0 0 0 0|  XRc  |  XRb  |  XRa  |MXU__POOL03|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- *  D16MULE:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |x x|on2|   Xd  |  XRc  |  XRb  |  XRa  |MXU__POOL03|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool03(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 24, 2);
-
-    switch (opcode) {
-    case OPC_MXU_D16MULF:
-        /* TODO: Implement emulation of D16MULF instruction. */
-        MIPS_INVAL("OPC_MXU_D16MULF");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16MULE:
-        /* TODO: Implement emulation of D16MULE instruction. */
-        MIPS_INVAL("OPC_MXU_D16MULE");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool04
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-+-------------------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x|        s12        |  XRa  |MXU__POOL04|
- *  +-----------+---------+-+-------------------+-------+-----------+
- *
- */
 static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 20, 1);
@@ -26176,455 +25734,14 @@ static void decode_opc_mxu__pool04(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-/*
- *
- * Decode MXU pool05
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-+-------------------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x|        s12        |  XRa  |MXU__POOL05|
- *  +-----------+---------+-+-------------------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool05(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 20, 1);
-
-    switch (opcode) {
-    case OPC_MXU_S32STD:
-        /* TODO: Implement emulation of S32STD instruction. */
-        MIPS_INVAL("OPC_MXU_S32STD");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32STDR:
-        /* TODO: Implement emulation of S32STDR instruction. */
-        MIPS_INVAL("OPC_MXU_S32STDR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool06
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |    rc   |st2|x x x x|  XRa  |MXU__POOL06|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool06(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 10, 4);
-
-    switch (opcode) {
-    case OPC_MXU_S32LDDV:
-        /* TODO: Implement emulation of S32LDDV instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDDV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32LDDVR:
-        /* TODO: Implement emulation of S32LDDVR instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDDVR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool07
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |    rc   |st2|x x x x|  XRa  |MXU__POOL07|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool07(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 10, 4);
-
-    switch (opcode) {
-    case OPC_MXU_S32STDV:
-        /* TODO: Implement emulation of S32TDV instruction. */
-        MIPS_INVAL("OPC_MXU_S32TDV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32STDVR:
-        /* TODO: Implement emulation of S32TDVR instruction. */
-        MIPS_INVAL("OPC_MXU_S32TDVR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool08
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-+-------------------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x|        s12        |  XRa  |MXU__POOL08|
- *  +-----------+---------+-+-------------------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool08(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 20, 1);
-
-    switch (opcode) {
-    case OPC_MXU_S32LDI:
-        /* TODO: Implement emulation of S32LDI instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDI");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32LDIR:
-        /* TODO: Implement emulation of S32LDIR instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDIR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool09
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-+-------------------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x|        s12        |  XRa  |MXU__POOL09|
- *  +-----------+---------+-+-------------------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool09(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 5, 0);
-
-    switch (opcode) {
-    case OPC_MXU_S32SDI:
-        /* TODO: Implement emulation of S32SDI instruction. */
-        MIPS_INVAL("OPC_MXU_S32SDI");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32SDIR:
-        /* TODO: Implement emulation of S32SDIR instruction. */
-        MIPS_INVAL("OPC_MXU_S32SDIR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool10
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |    rc   |st2|x x x x|  XRa  |MXU__POOL10|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool10(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 5, 0);
-
-    switch (opcode) {
-    case OPC_MXU_S32LDIV:
-        /* TODO: Implement emulation of S32LDIV instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDIV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32LDIVR:
-        /* TODO: Implement emulation of S32LDIVR instruction. */
-        MIPS_INVAL("OPC_MXU_S32LDIVR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool11
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |    rc   |st2|x x x x|  XRa  |MXU__POOL11|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool11(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 10, 4);
-
-    switch (opcode) {
-    case OPC_MXU_S32SDIV:
-        /* TODO: Implement emulation of S32SDIV instruction. */
-        MIPS_INVAL("OPC_MXU_S32SDIV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32SDIVR:
-        /* TODO: Implement emulation of S32SDIVR instruction. */
-        MIPS_INVAL("OPC_MXU_S32SDIVR");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool12
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |an2|x x|   Xd  |  XRc  |  XRb  |  XRa  |MXU__POOL12|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool12(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 22, 2);
-
-    switch (opcode) {
-    case OPC_MXU_D32ACC:
-        /* TODO: Implement emulation of D32ACC instruction. */
-        MIPS_INVAL("OPC_MXU_D32ACC");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D32ACCM:
-        /* TODO: Implement emulation of D32ACCM instruction. */
-        MIPS_INVAL("OPC_MXU_D32ACCM");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D32ASUM:
-        /* TODO: Implement emulation of D32ASUM instruction. */
-        MIPS_INVAL("OPC_MXU_D32ASUM");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool13
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |en2|x x|0 0 0 0|  XRc  |  XRb  |  XRa  |MXU__POOL13|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool13(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 22, 2);
-
-    switch (opcode) {
-    case OPC_MXU_Q16ACC:
-        /* TODO: Implement emulation of Q16ACC instruction. */
-        MIPS_INVAL("OPC_MXU_Q16ACC");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16ACCM:
-        /* TODO: Implement emulation of Q16ACCM instruction. */
-        MIPS_INVAL("OPC_MXU_Q16ACCM");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16ASUM:
-        /* TODO: Implement emulation of Q16ASUM instruction. */
-        MIPS_INVAL("OPC_MXU_Q16ASUM");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool14
- *
- *  Q8ADDE, Q8ACCE:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0|x x|  XRd  |  XRc  |  XRb  |  XRa  |MXU__POOL14|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- *  D8SUM, D8SUMC:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |en2|x x|0 0 0 0|  XRc  |  XRb  |  XRa  |MXU__POOL14|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool14(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 22, 2);
-
-    switch (opcode) {
-    case OPC_MXU_Q8ADDE:
-        /* TODO: Implement emulation of Q8ADDE instruction. */
-        MIPS_INVAL("OPC_MXU_Q8ADDE");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D8SUM:
-        /* TODO: Implement emulation of D8SUM instruction. */
-        MIPS_INVAL("OPC_MXU_D8SUM");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D8SUMC:
-        /* TODO: Implement emulation of D8SUMC instruction. */
-        MIPS_INVAL("OPC_MXU_D8SUMC");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool15
- *
- *  S32MUL, S32MULU, S32EXTRV:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rs   |    rt   |x x|  XRd  |  XRa  |MXU__POOL15|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- *  S32EXTR:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |   sft5  |x x|  XRd  |  XRa  |MXU__POOL15|
- *  +-----------+---------+---------+---+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool15(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 14, 2);
-
-    switch (opcode) {
-    case OPC_MXU_S32MUL:
-        /* TODO: Implement emulation of S32MUL instruction. */
-        MIPS_INVAL("OPC_MXU_S32MUL");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32MULU:
-        /* TODO: Implement emulation of S32MULU instruction. */
-        MIPS_INVAL("OPC_MXU_S32MULU");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32EXTR:
-        /* TODO: Implement emulation of S32EXTR instruction. */
-        MIPS_INVAL("OPC_MXU_S32EXTR");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32EXTRV:
-        /* TODO: Implement emulation of S32EXTRV instruction. */
-        MIPS_INVAL("OPC_MXU_S32EXTRV");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool16
- *
- *  D32SARW:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x x x|  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- *  S32ALN:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |    rs   |x x x|  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- *  S32ALNI:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+-----+---+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |  s3 |0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+-----+---+-----+-------+-------+-------+-----------+
- *
- *  S32LUI:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+-----+---+-----+-------+---------------+-----------+
- *  |  SPECIAL2 |optn3|0 0|x x x|  XRc  |       s8      |MXU__POOL16|
- *  +-----------+-----+---+-----+-------+---------------+-----------+
- *
- *  S32NOR, S32AND, S32OR, S32XOR:
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL16|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- */
 static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 18, 3);
 
     switch (opcode) {
-    case OPC_MXU_D32SARW:
-        /* TODO: Implement emulation of D32SARW instruction. */
-        MIPS_INVAL("OPC_MXU_D32SARW");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32ALN:
-        /* TODO: Implement emulation of S32ALN instruction. */
-        MIPS_INVAL("OPC_MXU_S32ALN");
-        gen_reserved_instruction(ctx);
-        break;
     case OPC_MXU_S32ALNI:
         gen_mxu_S32ALNI(ctx);
         break;
-    case OPC_MXU_S32LUI:
-        /* TODO: Implement emulation of S32LUI instruction. */
-        MIPS_INVAL("OPC_MXU_S32LUI");
-        gen_reserved_instruction(ctx);
-        break;
     case OPC_MXU_S32NOR:
         gen_mxu_S32NOR(ctx);
         break;
@@ -26644,114 +25761,6 @@ static void decode_opc_mxu__pool16(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-/*
- *
- * Decode MXU pool17
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---+---------+-----+-----------+
- *  |  SPECIAL2 |    rs   |    rt   |0 0|    rd   |x x x|MXU__POOL15|
- *  +-----------+---------+---------+---+---------+-----+-----------+
- *
- */
-static void decode_opc_mxu__pool17(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 6, 2);
-
-    switch (opcode) {
-    case OPC_MXU_LXW:
-        /* TODO: Implement emulation of LXW instruction. */
-        MIPS_INVAL("OPC_MXU_LXW");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_LXH:
-        /* TODO: Implement emulation of LXH instruction. */
-        MIPS_INVAL("OPC_MXU_LXH");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_LXHU:
-        /* TODO: Implement emulation of LXHU instruction. */
-        MIPS_INVAL("OPC_MXU_LXHU");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_LXB:
-        /* TODO: Implement emulation of LXB instruction. */
-        MIPS_INVAL("OPC_MXU_LXB");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_LXBU:
-        /* TODO: Implement emulation of LXBU instruction. */
-        MIPS_INVAL("OPC_MXU_LXBU");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-/*
- *
- * Decode MXU pool18
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |    rb   |x x x|  XRd  |  XRa  |0 0 0 0|MXU__POOL18|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool18(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 18, 3);
-
-    switch (opcode) {
-    case OPC_MXU_D32SLLV:
-        /* TODO: Implement emulation of D32SLLV instruction. */
-        MIPS_INVAL("OPC_MXU_D32SLLV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D32SLRV:
-        /* TODO: Implement emulation of D32SLRV instruction. */
-        MIPS_INVAL("OPC_MXU_D32SLRV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D32SARV:
-        /* TODO: Implement emulation of D32SARV instruction. */
-        MIPS_INVAL("OPC_MXU_D32SARV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16SLLV:
-        /* TODO: Implement emulation of Q16SLLV instruction. */
-        MIPS_INVAL("OPC_MXU_Q16SLLV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16SLRV:
-        /* TODO: Implement emulation of Q16SLRV instruction. */
-        MIPS_INVAL("OPC_MXU_Q16SLRV");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q16SARV:
-        /* TODO: Implement emulation of Q16SARV instruction. */
-        MIPS_INVAL("OPC_MXU_Q16SARV");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool19
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0|x x|  XRd  |  XRc  |  XRb  |  XRa  |MXU__POOL19|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
 static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
 {
     uint32_t opcode = extract32(ctx->opcode, 22, 2);
@@ -26768,107 +25777,11 @@ static void decode_opc_mxu__pool19(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-/*
- *
- * Decode MXU pool20
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *  |  SPECIAL2 |0 0 0 0 0|x x x|  XRc  |  XRb  |  XRa  |MXU__POOL20|
- *  +-----------+---------+-----+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool20(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 18, 3);
-
-    switch (opcode) {
-    case OPC_MXU_Q8MOVZ:
-        /* TODO: Implement emulation of Q8MOVZ instruction. */
-        MIPS_INVAL("OPC_MXU_Q8MOVZ");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8MOVN:
-        /* TODO: Implement emulation of Q8MOVN instruction. */
-        MIPS_INVAL("OPC_MXU_Q8MOVN");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16MOVZ:
-        /* TODO: Implement emulation of D16MOVZ instruction. */
-        MIPS_INVAL("OPC_MXU_D16MOVZ");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_D16MOVN:
-        /* TODO: Implement emulation of D16MOVN instruction. */
-        MIPS_INVAL("OPC_MXU_D16MOVN");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32MOVZ:
-        /* TODO: Implement emulation of S32MOVZ instruction. */
-        MIPS_INVAL("OPC_MXU_S32MOVZ");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_S32MOVN:
-        /* TODO: Implement emulation of S32MOVN instruction. */
-        MIPS_INVAL("OPC_MXU_S32MOVN");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-/*
- *
- * Decode MXU pool21
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *  |  SPECIAL2 |an2|x x|  XRd  |  XRc  |  XRb  |  XRa  |MXU__POOL21|
- *  +-----------+---+---+-------+-------+-------+-------+-----------+
- *
- */
-static void decode_opc_mxu__pool21(CPUMIPSState *env, DisasContext *ctx)
-{
-    uint32_t opcode = extract32(ctx->opcode, 22, 2);
-
-    switch (opcode) {
-    case OPC_MXU_Q8MAC:
-        /* TODO: Implement emulation of Q8MAC instruction. */
-        MIPS_INVAL("OPC_MXU_Q8MAC");
-        gen_reserved_instruction(ctx);
-        break;
-    case OPC_MXU_Q8MACSU:
-        /* TODO: Implement emulation of Q8MACSU instruction. */
-        MIPS_INVAL("OPC_MXU_Q8MACSU");
-        gen_reserved_instruction(ctx);
-        break;
-    default:
-        MIPS_INVAL("decode_opc_mxu");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
-
 /*
  * Main MXU decoding function
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------------------------------------+-----------+
- *  |  SPECIAL2 |                                       |x x x x x x|
- *  +-----------+---------------------------------------+-----------+
- *
  */
 static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
 {
-    /*
-     * TODO: Investigate necessity of including handling of
-     * CLZ, CLO, SDBB in this function, as they belong to
-     * SPECIAL2 opcode space for regular pre-R6 MIPS ISAs.
-     */
     uint32_t opcode = extract32(ctx->opcode, 0, 6);
 
     if (opcode == OPC__MXU_MUL) {
@@ -26903,226 +25816,27 @@ static void decode_opc_mxu(CPUMIPSState *env, DisasContext *ctx)
         tcg_gen_brcondi_tl(TCG_COND_NE, t_mxu_cr, MXU_CR_MXU_EN, l_exit);
 
         switch (opcode) {
-        case OPC_MXU_S32MADD:
-            /* TODO: Implement emulation of S32MADD instruction. */
-            MIPS_INVAL("OPC_MXU_S32MADD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S32MADDU:
-            /* TODO: Implement emulation of S32MADDU instruction. */
-            MIPS_INVAL("OPC_MXU_S32MADDU");
-            gen_reserved_instruction(ctx);
-            break;
         case OPC_MXU__POOL00:
             decode_opc_mxu__pool00(env, ctx);
             break;
-        case OPC_MXU_S32MSUB:
-            /* TODO: Implement emulation of S32MSUB instruction. */
-            MIPS_INVAL("OPC_MXU_S32MSUB");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S32MSUBU:
-            /* TODO: Implement emulation of S32MSUBU instruction. */
-            MIPS_INVAL("OPC_MXU_S32MSUBU");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU__POOL01:
-            decode_opc_mxu__pool01(env, ctx);
-            break;
-        case OPC_MXU__POOL02:
-            decode_opc_mxu__pool02(env, ctx);
-            break;
         case OPC_MXU_D16MUL:
             gen_mxu_d16mul(ctx);
             break;
-        case OPC_MXU__POOL03:
-            decode_opc_mxu__pool03(env, ctx);
-            break;
         case OPC_MXU_D16MAC:
             gen_mxu_d16mac(ctx);
             break;
-        case OPC_MXU_D16MACF:
-            /* TODO: Implement emulation of D16MACF instruction. */
-            MIPS_INVAL("OPC_MXU_D16MACF");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D16MADL:
-            /* TODO: Implement emulation of D16MADL instruction. */
-            MIPS_INVAL("OPC_MXU_D16MADL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S16MAD:
-            /* TODO: Implement emulation of S16MAD instruction. */
-            MIPS_INVAL("OPC_MXU_S16MAD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_Q16ADD:
-            /* TODO: Implement emulation of Q16ADD instruction. */
-            MIPS_INVAL("OPC_MXU_Q16ADD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D16MACE:
-            /* TODO: Implement emulation of D16MACE instruction. */
-            MIPS_INVAL("OPC_MXU_D16MACE");
-            gen_reserved_instruction(ctx);
-            break;
         case OPC_MXU__POOL04:
             decode_opc_mxu__pool04(env, ctx);
             break;
-        case OPC_MXU__POOL05:
-            decode_opc_mxu__pool05(env, ctx);
-            break;
-        case OPC_MXU__POOL06:
-            decode_opc_mxu__pool06(env, ctx);
-            break;
-        case OPC_MXU__POOL07:
-            decode_opc_mxu__pool07(env, ctx);
-            break;
-        case OPC_MXU__POOL08:
-            decode_opc_mxu__pool08(env, ctx);
-            break;
-        case OPC_MXU__POOL09:
-            decode_opc_mxu__pool09(env, ctx);
-            break;
-        case OPC_MXU__POOL10:
-            decode_opc_mxu__pool10(env, ctx);
-            break;
-        case OPC_MXU__POOL11:
-            decode_opc_mxu__pool11(env, ctx);
-            break;
-        case OPC_MXU_D32ADD:
-            /* TODO: Implement emulation of D32ADD instruction. */
-            MIPS_INVAL("OPC_MXU_D32ADD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU__POOL12:
-            decode_opc_mxu__pool12(env, ctx);
-            break;
-        case OPC_MXU__POOL13:
-            decode_opc_mxu__pool13(env, ctx);
-            break;
-        case OPC_MXU__POOL14:
-            decode_opc_mxu__pool14(env, ctx);
-            break;
-        case OPC_MXU_Q8ACCE:
-            /* TODO: Implement emulation of Q8ACCE instruction. */
-            MIPS_INVAL("OPC_MXU_Q8ACCE");
-            gen_reserved_instruction(ctx);
-            break;
         case OPC_MXU_S8LDD:
             gen_mxu_s8ldd(ctx);
             break;
-        case OPC_MXU_S8STD:
-            /* TODO: Implement emulation of S8STD instruction. */
-            MIPS_INVAL("OPC_MXU_S8STD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S8LDI:
-            /* TODO: Implement emulation of S8LDI instruction. */
-            MIPS_INVAL("OPC_MXU_S8LDI");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S8SDI:
-            /* TODO: Implement emulation of S8SDI instruction. */
-            MIPS_INVAL("OPC_MXU_S8SDI");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU__POOL15:
-            decode_opc_mxu__pool15(env, ctx);
-            break;
         case OPC_MXU__POOL16:
             decode_opc_mxu__pool16(env, ctx);
             break;
-        case OPC_MXU__POOL17:
-            decode_opc_mxu__pool17(env, ctx);
-            break;
-        case OPC_MXU_S16LDD:
-            /* TODO: Implement emulation of S16LDD instruction. */
-            MIPS_INVAL("OPC_MXU_S16LDD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S16STD:
-            /* TODO: Implement emulation of S16STD instruction. */
-            MIPS_INVAL("OPC_MXU_S16STD");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S16LDI:
-            /* TODO: Implement emulation of S16LDI instruction. */
-            MIPS_INVAL("OPC_MXU_S16LDI");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S16SDI:
-            /* TODO: Implement emulation of S16SDI instruction. */
-            MIPS_INVAL("OPC_MXU_S16SDI");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D32SLL:
-            /* TODO: Implement emulation of D32SLL instruction. */
-            MIPS_INVAL("OPC_MXU_D32SLL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D32SLR:
-            /* TODO: Implement emulation of D32SLR instruction. */
-            MIPS_INVAL("OPC_MXU_D32SLR");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D32SARL:
-            /* TODO: Implement emulation of D32SARL instruction. */
-            MIPS_INVAL("OPC_MXU_D32SARL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_D32SAR:
-            /* TODO: Implement emulation of D32SAR instruction. */
-            MIPS_INVAL("OPC_MXU_D32SAR");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_Q16SLL:
-            /* TODO: Implement emulation of Q16SLL instruction. */
-            MIPS_INVAL("OPC_MXU_Q16SLL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_Q16SLR:
-            /* TODO: Implement emulation of Q16SLR instruction. */
-            MIPS_INVAL("OPC_MXU_Q16SLR");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU__POOL18:
-            decode_opc_mxu__pool18(env, ctx);
-            break;
-        case OPC_MXU_Q16SAR:
-            /* TODO: Implement emulation of Q16SAR instruction. */
-            MIPS_INVAL("OPC_MXU_Q16SAR");
-            gen_reserved_instruction(ctx);
-            break;
         case OPC_MXU__POOL19:
             decode_opc_mxu__pool19(env, ctx);
             break;
-        case OPC_MXU__POOL20:
-            decode_opc_mxu__pool20(env, ctx);
-            break;
-        case OPC_MXU__POOL21:
-            decode_opc_mxu__pool21(env, ctx);
-            break;
-        case OPC_MXU_Q16SCOP:
-            /* TODO: Implement emulation of Q16SCOP instruction. */
-            MIPS_INVAL("OPC_MXU_Q16SCOP");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_Q8MADL:
-            /* TODO: Implement emulation of Q8MADL instruction. */
-            MIPS_INVAL("OPC_MXU_Q8MADL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_S32SFL:
-            /* TODO: Implement emulation of S32SFL instruction. */
-            MIPS_INVAL("OPC_MXU_S32SFL");
-            gen_reserved_instruction(ctx);
-            break;
-        case OPC_MXU_Q8SAD:
-            /* TODO: Implement emulation of Q8SAD instruction. */
-            MIPS_INVAL("OPC_MXU_Q8SAD");
-            gen_reserved_instruction(ctx);
-            break;
         default:
             MIPS_INVAL("decode_opc_mxu");
             gen_reserved_instruction(ctx);
-- 
2.26.2


