Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40CA31B206
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:36:36 +0100 (CET)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMG3-00038Z-SW
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhz-0008Kv-QX
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhx-0004as-Kk
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:23 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v7so6064211wrr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/wEPKUWVvF3Au5VTI/1Dl8n/cS8vH0tcjl9xMfLNXs=;
 b=R9WH9p3i5LPJpjNrvtzsWpCoRmx1g0vX32QUTut9fskN0a0U2lLXZ6RkFaGgwn1imq
 ItzdEKvD4EISD6L26yLgfWyMpVLy0mzFCKaeDc9rI+UpUF0z4PxeFjhzTfhG8By/iVw4
 03dvEl93H19BKxzKIlt2EkfGLk5aDYOYLS0rP20DsDFQz19J7LggpMXjLaJvhsyhIzsc
 FWZzdMzvrresoCYK18A3rfAUxOEfu1dKZr0yYcZ5Z07i0QpE75aIvdaW9T9KyDPsaM4N
 j7EzYWyqk62ZTF5Y+RvLDRB2VCk8jvAbRCnJnCBKRvd+MCbVWK4V6cwxExW1Jz+Jkn6q
 e58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u/wEPKUWVvF3Au5VTI/1Dl8n/cS8vH0tcjl9xMfLNXs=;
 b=LfYBu9zNNh7LRhbh+oDAOX6p3khFwKbZ2lPu2/LOMwmB7e5wg8mcwnEpxKQsAeuZVX
 xjhSl/rPeVCnmg98v0VsImooWJLw8NkfSwXjxrQRPNb/56c3ZGXXPRVJ+AUbM/PY1mWB
 uyugquuIXdmeSa9LCiF1qEtHLVpnYz6BCcb1rffnBCGon3oX+pnDY8QinWTWk4RWePg+
 emq5PzcHHuU427v4d94InkP5D3FcvjiI6h5/GJaqc/7iC3UYqCwP7905UW73jBel+O6G
 sQIsv1i9GAcTMFQzAyQVm7TXWGf/VYa8VosuTXWNj2v7yF9WFaa5eho0+uXc+9tFvcYh
 YDLg==
X-Gm-Message-State: AOAM531TG7UaQCHUji+PST5clfolOwLLMjQkrwv2fhyRMp8lZSoLSw4k
 txJNqxc8S/EmBpcqdSgbBq7kgF941Ts=
X-Google-Smtp-Source: ABdhPJw8jcaXCiCTea/OB+QboMcRRduC+W4fDyy7ALcJtnnp39B62XdPnNh5/jwCH6EjNe/WboI4nw==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr8802098wrw.298.1613325680153; 
 Sun, 14 Feb 2021 10:01:20 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x4sm19853110wrn.64.2021.02.14.10.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/42] target/mips/tx79: Introduce LQ opcode (Load
 Quadword)
Date: Sun, 14 Feb 2021 18:58:55 +0100
Message-Id: <20210214175912.732946-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the LQ opcode (Load Quadword) and remove unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  8 ++++++++
 target/mips/translate.c      | 16 ++--------------
 target/mips/tx79_translate.c | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 79001359242..b5396f48c2d 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -13,6 +13,8 @@
 
 &rtype           rs rt rd sa
 
+&itype           base rt offset
+
 ###########################################################################
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
@@ -22,6 +24,8 @@
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
+@ldst            ...... base:5 rt:5 offset:16            &itype
+
 ###########################################################################
 
 MFHI1           011100 0000000000  ..... 00000 010000   @rd
@@ -65,3 +69,7 @@ PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
 PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
 PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
+
+# SPECIAL
+
+LQ              011110 ..... ..... ................     @ldst
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 109f7f80f3d..bed0489997a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1780,7 +1780,6 @@ enum {
 
 enum {
     MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_LQ        = 0x1E << 26,    /* Same as OPC_MSA */
     MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
 };
 
@@ -27331,11 +27330,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void gen_mmi_lq(CPUMIPSState *env, DisasContext *ctx)
-{
-    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_LQ */
-}
-
 static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
 {
     gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
@@ -28229,14 +28223,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_branch(ctx, op, 4, rs, rt, offset, 4);
         }
         break;
-    case OPC_MDMX: /* MMI_OPC_LQ */
-        if (ctx->insn_flags & INSN_R5900) {
-#if defined(TARGET_MIPS64)
-            gen_mmi_lq(env, ctx);
-#endif
-        } else {
-            /* MDMX: Not implemented. */
-        }
+    case OPC_MDMX:
+        /* MDMX: Not implemented. */
         break;
     case OPC_PCREL:
         check_insn(ctx, ISA_MIPS_R6);
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index c25f61d382c..293efd7bd06 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -376,6 +376,41 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
  * SQ      rt, offset(base)  Store Quadword
  */
 
+static bool trans_LQ(DisasContext *ctx, arg_itype *a)
+{
+    TCGv_i64 t0;
+    TCGv addr;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    addr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, addr, a->base, a->offset);
+    /*
+     * Clear least-significant four bits of the effective
+     * address, effectively creating an aligned address.
+     */
+    tcg_gen_andi_tl(addr, addr, ~0xf);
+
+    /* Lower halve */
+    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+    gen_store_gpr(t0, a->rt);
+
+    /* Upper halve */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+    gen_store_gpr_hi(t0, a->rt);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(addr);
+
+    return true;
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.26.2


