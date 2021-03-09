Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00F332A6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:30:07 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeJC-0001RH-83
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnI-0004Ur-RM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:08 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnH-0002Pd-7z
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:08 -0500
Received: by mail-ed1-x531.google.com with SMTP id h10so20733722edl.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5fiD8J1cTEppASnTHaHX7DmQkr6qX0i8N0ojoebTOk=;
 b=vHs31r4bJKiYjNl2oZnEQBEsM+VOleMQbha5a8FD99l4s7PeibEZaOQ5IXOG9eAWHo
 F+YbADOnIjM/pRC7ci5BxHX1YUo9XLO7S9LQ6a6O5g7dFUDqktjMYn8eRcYdRWiMS8dj
 p/Jw6TXPqEmSwYSYvLL4gbrE6eTreTM5R8H1KlOLJiwQ6zTuqAND3rjsw1Xg0BB2F2TU
 BjXrv31/3ndIKF/VEkhwGPcSrkThKfX/2Q2vraZ3i/PXSgoIGUU2P0/4ewB/ViHaoBd+
 s+7cJqh2Kbh9cgiovTy2duQ+B4cOA5NpS98NSpnTjjOqxhddNF8xtwOT5k5Nis4O5n38
 Uekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r5fiD8J1cTEppASnTHaHX7DmQkr6qX0i8N0ojoebTOk=;
 b=H6r17mHwiSJHulV5WsioJ4Rkc4iMAwhhU0Hct7WZSs4zJnem5SgGXy/bYt5B5u/Ryk
 e5vO+c+1+xCT7zhFIrfdgxbKJutuCulpUoBILncApwPzYEAuentLHyxzwMP2dNTsLE25
 /QedTJ0IqFuo6p+x2CKgpl++2TzBAkeAJIgYV79cDZh2DmFa5OExNYA+4b/D9UWHlxWT
 KUJ1uioD7y32L/fLUw/SFazmQX8M2CJEC0HI0XLwh9MvUNphLp3zASK/tWwo8ASBZl49
 WbYVbyHxtXRXMQXuB4PGpnF9/s0jyeC7crkCejQrDOdZDfjxlpTDpUr79co2MG5OWYNW
 4ebw==
X-Gm-Message-State: AOAM532CjVLsCEYe4m6PBSEoKJtLrZNMtqPQN/cCtpfhOXkKxWQnJBYT
 rwvjMeJvgGMH/x4/pBP3Gc8elLP0TU0=
X-Google-Smtp-Source: ABdhPJwz7kBD2d+s7MWKjTnqXFOShL8oOOjsH4fZqcqnJl52greVTLOjbby4uAS7vPDFil/jl57Tsg==
X-Received: by 2002:a05:6402:2695:: with SMTP id
 w21mr4534663edd.99.1615301825641; 
 Tue, 09 Mar 2021 06:57:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id yk8sm8443477ejb.123.2021.03.09.06.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 02/22] target/mips/tx79: Move MTHI1 / MTLO1 opcodes to
 decodetree
Date: Tue,  9 Mar 2021 15:56:33 +0100
Message-Id: <20210309145653.743937-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-10-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  3 +++
 target/mips/translate.c      | 25 -------------------------
 target/mips/tx79_translate.c | 14 ++++++++++++++
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 2e287ebbf36..30737da54e4 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,9 +17,12 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
 ###########################################################################
 
 MFHI1           011100 0000000000  ..... 00000 010000   @rd
+MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
+MTLO1           011100 .....  0000000000 00000 010011   @rs
diff --git a/target/mips/translate.c b/target/mips/translate.c
index aa35d0f680e..0131affce70 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1360,8 +1360,6 @@ enum {
     MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MTHI1      = 0x11 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTHI */
-    MMI_OPC_MTLO1      = 0x13 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTLO */
     MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
     MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
     MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
@@ -3462,25 +3460,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-#if defined(TARGET_MIPS64)
-/* Copy GPR to and from TX79 HI1/LO1 register. */
-static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
-{
-    switch (opc) {
-    case MMI_OPC_MTHI1:
-        gen_load_gpr(cpu_HI[1], reg);
-        break;
-    case MMI_OPC_MTLO1:
-        gen_load_gpr(cpu_LO[1], reg);
-        break;
-    default:
-        MIPS_INVAL("mfthilo1 TX79");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-#endif
-
 /* Arithmetic on HI/LO registers */
 static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 {
@@ -25108,10 +25087,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_DIVU1:
         gen_div1_tx79(ctx, opc, rs, rt);
         break;
-    case MMI_OPC_MTLO1:
-    case MMI_OPC_MTHI1:
-        gen_HILO1_tx79(ctx, opc, rs);
-        break;
     case MMI_OPC_PLZCW:         /* TODO: MMI_OPC_PLZCW */
     case MMI_OPC_PMFHL:         /* TODO: MMI_OPC_PMFHL */
     case MMI_OPC_PMTHL:         /* TODO: MMI_OPC_PMTHL */
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 22bd6033e55..905245cece7 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -35,3 +35,17 @@ static bool trans_MFLO1(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+static bool trans_MTHI1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_load_gpr(cpu_HI[1], a->rs);
+
+    return true;
+}
+
+static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_load_gpr(cpu_LO[1], a->rs);
+
+    return true;
+}
-- 
2.26.2


