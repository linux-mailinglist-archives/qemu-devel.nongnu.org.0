Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383C332A81
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:33:09 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeM8-0004w0-I5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnf-0004sm-Ld
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:36 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnb-0002XV-Tb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:29 -0500
Received: by mail-ej1-x632.google.com with SMTP id p7so17068779eju.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jWKBH1PqrL+3zgv6Q7B53kJS5+64dRl5ardIw0ZvjK0=;
 b=FkK2utIf0O73XOIr98hxPzah5uyLyj0mGKRM+pID9NHQzlC0Y/NQD9Ba4D9gYeG463
 IkV74QWgalbnNIZMeA8wtnJqi0aBMnspL1oft+a0lar1H0XAvnE82qoWM3tuCwu/KG+5
 aGo2kQUjVkj8Kbp6rb85qlopC5ygoLsJ8CDTqN3J9KNyhXsfPd14WaNTuVorgMrYbPEC
 gj3zVEoo2Z0/6+J6Ue1lTJfhCe6DhuzP5U1qh/AVenAnNYneklq9DBWHxSMVWR7NGCwG
 dA9vpRyB6A4gZo1SdwfCwWbCqryxDHdR1IgAWlTV+mfKKsjp450U9+f2+0KvvKBZ6q1w
 8Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jWKBH1PqrL+3zgv6Q7B53kJS5+64dRl5ardIw0ZvjK0=;
 b=VabGkeIOzsb63FIai106XBvbsGW8Rk7LK1zSTtu8dLprH0VO3Uk1uOzrZdNT3Fcre1
 0X3Iv5a3EcgL2TzppEsAoaRFQaalAQM0R/hzQLPNeqBJvrHLmE6aBbm/nP8rYoRkw+DF
 dls2GHPJnz0cvau3c3D+u1Kqs3weW4d7DDPAxZILWkXyqwGj8sLwYZzMRa9Dcol6tah/
 KCIuPlUpPetXn2i0AsSn3eCKVwg4OEZ9kkwG+T2KdA3wyGl/zbh416cs9e0lczTjSQql
 uJ+lCrM7EE4OoDyzzxKXTuxiJKRqr9OEpatz8zscxlq+Fwh1X9BwR5vxa5HRv2BNOO4P
 DMnw==
X-Gm-Message-State: AOAM531FbIi+IDUgPK0phMe5j6Oo5Q+nH9/rM+Xjluzajlk5QGpYf/Fg
 cK9P3wWtZLs61U629TvmyK7Ise2rxxk=
X-Google-Smtp-Source: ABdhPJx5eX6x6l7/0VZFB0vL2GBw5fD6OcKX2PEJzGTAYROonUuN1luw95L2/wHlFtbHB3uB7aUOmA==
X-Received: by 2002:a17:907:78d9:: with SMTP id
 kv25mr21129374ejc.415.1615301846072; 
 Tue, 09 Mar 2021 06:57:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y2sm8533493ejf.30.2021.03.09.06.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/22] target/mips/tx79: Move PCPYLD / PCPYUD opcodes
 to decodetree
Date: Tue,  9 Mar 2021 15:56:37 +0100
Message-Id: <20210309145653.743937-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
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
index 25adaa75eb5..00fac4824de 100644
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


