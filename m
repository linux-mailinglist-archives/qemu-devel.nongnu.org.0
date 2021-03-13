Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C233A0EC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:12:38 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAcn-0001UY-JU
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHZ-0000TB-Lz
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHX-0007jf-UZ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso17105068wmi.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYD0kz0+5thSbgQop2x/XNUgvdHEo6LE0U/VV3XWrfg=;
 b=SAXgLp6nqgKxb11+3BJAR0JPhNumR+RaCY8cSpr17u3vJYWCb9kc0DBZRfEghIyhNY
 2hOH1eT4DILqS0FAd3GCSr2BYy7bj4tKdhfNaPvYtmdCEOtNeH9CeSgv/SOFNbEBnkPt
 7eB6ZdwkuEiS7SDpEhoH1F/VKW/bFXJX+59B3/WZPtkQGXXKfsomr/FLrNiNHKoDN54L
 zqE1KLFvusiM957vRLILeTtz7JjbtifVGhSXP1SwHvlS9h/ZS+eKL2YCOsV7DPg0+LQW
 1zG5cwpY84coeYKEuIMmDoCIorSIEm3ibrA6rnv2xu1ri10pjiwT0NwVNcC8qPEJDnQz
 FWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bYD0kz0+5thSbgQop2x/XNUgvdHEo6LE0U/VV3XWrfg=;
 b=H2RaB8JcfLjb6HrlB43dywU5DoEaPi+TOqy5jEMfaGMjpz3IMuv/IX8bsmX9UsEsfl
 FFKi4dPYBStune5fe6BTc4ZybDmBCOMzK1AqJEN0Gr6ZBY0Ut8BkTy39Zk8oQuF7RD63
 h0edWDZ08duKRQd3/tH4bKTikZG5AkftzvQFw00AyWFuFDvsf86oR8NlJ/J3ZLnRsAPz
 yEAdU7bQ3yyFJ//v+Q9OT6nAvW7k0J8bbv3WJxtJOrLZyz0FNpO/nEmnGDncrAa0n/DW
 wFXCRVkOH0iPmHV+RKMmyJtc9GksRO+UUgU9pe4xUYk66tBRMcCpDrXxeJZ9RoAvZQZn
 SVaw==
X-Gm-Message-State: AOAM530GI5hnrBtOqsJERVtlWVqNB0cQNl6ITKgnW6x7O5FvbBHF2uV2
 XcSaptKMqblLPCzCmlaM1Ffr+iWdPhBKzA==
X-Google-Smtp-Source: ABdhPJwpaoXd0WrHOaj6geaNbib+s2cUiGNa5RDhHbLYDJr3BCc+wWcO/+wT08TbDmCNu1S+lC8RTg==
X-Received: by 2002:a1c:9849:: with SMTP id a70mr19829635wme.48.1615665037229; 
 Sat, 13 Mar 2021 11:50:37 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm13226557wrr.58.2021.03.13.11.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/27] target/mips/tx79: Move PCPYLD / PCPYUD opcodes to
 decodetree
Date: Sat, 13 Mar 2021 20:48:27 +0100
Message-Id: <20210313194829.2193621-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

Move PCPYLD (Parallel Copy Lower Doubleword) and PCPYUD
(Parallel Copy Upper Doubleword) to decodetree. Remove
unnecessary code / comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-13-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Use gen_load_gpr_hi (rth)
---
 target/mips/tx79.decode      |  6 +++
 target/mips/translate.c      | 80 ------------------------------------
 target/mips/tx79_translate.c | 42 +++++++++++++++++++
 3 files changed, 48 insertions(+), 80 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 7af35458b0a..0f748b53a64 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,6 +17,7 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &rtype sa=0
 @rt_rd          ...... ..... rt:5  rd:5  ..... ......   &rtype rs=0 sa=0
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
@@ -28,6 +29,11 @@ MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
 
+# MMI2
+
+PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
+
 # MMI3
 
+PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 80fcab5a564..08e4995c730 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24062,80 +24062,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
  *                     PEXTUW
  */
 
-/*
- *  PCPYLD rd, rs, rt
- *
- *    Parallel Copy Lower Doubleword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |   rs    |   rt    |   rd    | PCPYLD  |    MMI2   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyld(DisasContext *ctx)
-{
-    uint32_t rs, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    rs = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (rd == 0) {
-        /* nop */
-    } else {
-        if (rs == 0) {
-            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-        } else {
-            tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr[rs]);
-        }
-        if (rt == 0) {
-            tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        } else {
-            if (rd != rt) {
-                tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr[rt]);
-            }
-        }
-    }
-}
-
-/*
- *  PCPYUD rd, rs, rt
- *
- *    Parallel Copy Upper Doubleword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |   rs    |   rt    |   rd    | PCPYUD  |    MMI3   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyud(DisasContext *ctx)
-{
-    uint32_t rs, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    rs = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (rd == 0) {
-        /* nop */
-    } else {
-        gen_load_gpr_hi(cpu_gpr[rd], rs);
-        if (rt == 0) {
-            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-        } else {
-            if (rd != rt) {
-                tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt]);
-            }
-        }
-    }
-}
-
 #endif
 
 static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
@@ -24952,9 +24878,6 @@ static void decode_mmi2(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_2_PROT3W:    /* TODO: MMI_OPC_2_PROT3W */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI2 */
         break;
-    case MMI_OPC_2_PCPYLD:
-        gen_mmi_pcpyld(ctx);
-        break;
     default:
         MIPS_INVAL("TX79 MMI class MMI2");
         gen_reserved_instruction(ctx);
@@ -24980,9 +24903,6 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
-    case MMI_OPC_3_PCPYUD:
-        gen_mmi_pcpyud(ctx);
-        break;
     default:
         MIPS_INVAL("TX79 MMI class MMI3");
         gen_reserved_instruction(ctx);
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index d58b4fcd7b3..6e90eb64608 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -71,3 +71,45 @@ static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Copy Lower Doubleword */
+static bool trans_PCPYLD(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (a->rs == 0) {
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+    } else {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr[a->rs]);
+    }
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+    } else if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
+    }
+
+    return true;
+}
+
+/* Parallel Copy Upper Doubleword */
+static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    gen_load_gpr_hi(cpu_gpr[a->rd], a->rs);
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+    } else if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt]);
+    }
+
+    return true;
+}
-- 
2.26.2


