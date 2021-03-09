Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE5332A10
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:17:37 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe76-0001xx-34
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnY-0004sE-4k
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:24 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnW-0002Vq-JQ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:23 -0500
Received: by mail-ed1-x52b.google.com with SMTP id bd6so20660331edb.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTd3dK5Mj70iaA9wAzBL+3DpQxfmajFVbOdHqCwvUtU=;
 b=GFJMRhpclO2wif7QM47XRXh8CYCymLx2CQcNhJLU90ZTBU8v1559gLPIYDlHb0NpV8
 R8Lwgjw2BWYrISdz7SL97zcgatj987grZc63JURxe6rXOHqnn4tX9kxOM/AJH3CWamYZ
 1QKTiBqfD0uC+VsbSeK/epuF41ZIe/gXLxFc0/97SrKdz32nsRm0rYhvAZWGsxXFJmEz
 4P4eG1wSr0MzDbHDiAPhWo2FqQ5ZXCCJ03kJ5s2FNdU5UpQ/mXMSb6Ou7VdkDMfFv0Rq
 CQ0bD1uF7bIwXMrmIqAd7Qc3CyhC8D889+VdCV7zPywg06ppJAZtJevC8v63QUROsSXK
 bMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XTd3dK5Mj70iaA9wAzBL+3DpQxfmajFVbOdHqCwvUtU=;
 b=eFnjswgNtcGzziyyRmCqlLZl6rzK2Q3Mq56hSVd9LvRG3KFWOlAVMoyFm1V9CEy6N+
 6uKCrPtKJ334aqvywAgjBNfYqu27f7iKf0IE/TfZ0qanRC3FK6QUH6xwr47j8u5JD+Ms
 On+BOq8U4i83ZSmNkHXHWb6uZCjUVmazKt8AaRW2FKc7FBoFiY8KY97qr9ov+Kqz2t3s
 WVl4MByY/2b9mLRJkdTw1CjpLpr/mwcpP+6K4M9tGjJ7W92bKngCVTiEzGYZWrSvJr1y
 CkNvoGEPFOw5uBil1dzAVNWmfucu0QMPY2gECuY7m4F+RrQpFUj1AYx0PmoYG03825JO
 wChw==
X-Gm-Message-State: AOAM530CWzj7y8fI0Ha5bpGRzLgoiPUtenIkBUndCFTeOC6Hi8C6jkqe
 0yOpZiKEUK3sd3wP+4gF1m7uNEGX4dA=
X-Google-Smtp-Source: ABdhPJxkHL1+yKsLZn4Q/aFSgAzqZZl80Gp6XzfdwRl9CZcFX2074VDGSLlINELORPJEAzfpcrm8/A==
X-Received: by 2002:a05:6402:30a2:: with SMTP id
 df2mr4524495edb.29.1615301840906; 
 Tue, 09 Mar 2021 06:57:20 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm8363431ejv.40.2021.03.09.06.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/22] target/mips/tx79: Move PCPYH opcode to decodetree
Date: Tue,  9 Mar 2021 15:56:36 +0100
Message-Id: <20210309145653.743937-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
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

Move the existing PCPYH opcode (Parallel Copy Halfword) to decodetree.
Remove unnecessary code / comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-12-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  5 +++++
 target/mips/translate.c      | 39 ------------------------------------
 target/mips/tx79_translate.c | 22 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 30737da54e4..7af35458b0a 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,6 +17,7 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rt_rd          ...... ..... rt:5  rd:5  ..... ......   &rtype rs=0 sa=0
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
@@ -26,3 +27,7 @@ MFHI1           011100 0000000000  ..... 00000 010000   @rd
 MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
+
+# MMI3
+
+PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9de81b08665..25adaa75eb5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24062,42 +24062,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
  *                     PEXTUW
  */
 
-/*
- *  PCPYH rd, rt
- *
- *    Parallel Copy Halfword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |0 0 0 0 0|   rt    |   rd    |  PCPYH  |    MMI3   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyh(DisasContext *ctx)
-{
-    uint32_t pd, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    pd = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (unlikely(pd != 0)) {
-        gen_reserved_instruction(ctx);
-    } else if (rd == 0) {
-        /* nop */
-    } else if (rt == 0) {
-        tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-    } else {
-        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rt], cpu_gpr[rt], 16, 16);
-        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rd], cpu_gpr[rd], 32, 32);
-        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt], cpu_gpr_hi[rt], 16, 16);
-        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rd], cpu_gpr_hi[rd], 32, 32);
-    }
-}
-
 /*
  *  PCPYLD rd, rs, rt
  *
@@ -25016,9 +24980,6 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
-    case MMI_OPC_3_PCPYH:
-        gen_mmi_pcpyh(ctx);
-        break;
     case MMI_OPC_3_PCPYUD:
         gen_mmi_pcpyud(ctx);
         break;
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 905245cece7..d58b4fcd7b3 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -49,3 +49,25 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Copy Halfword */
+static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], cpu_gpr[a->rt], 16, 16);
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], cpu_gpr[a->rd], 32, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt], cpu_gpr_hi[a->rt], 16, 16);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], 32, 32);
+
+    return true;
+}
-- 
2.26.2


