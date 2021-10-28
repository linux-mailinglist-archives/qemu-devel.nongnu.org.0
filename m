Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34643F1AB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:29:03 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCxK-0008PX-GI
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfx-0001AD-UE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfw-0007Ue-Bp
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso1391850wmc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKIHe36oU3WI7pboaOlYIqAXpiFb5Tp6+r5u+rTzDDM=;
 b=fDSm2m51PymFpQAOLGEFXnr5geGqg0yj/TPpyMVlazloq/siib1OfV9Vdg2DO0v8+3
 zqNFhJ1SNhZml1bg7dfNWNBXk/c6zf/ZJ/25P/Ctxc604Tw7jlI6WuFDonCU3jyfEZo8
 eJHn+KEbM2SybCVAacUN6Z4FWtn6kyKZmtJsoRWv4lzwVJgfogvENOlThrzmeqdpzYoY
 0tZu80rFmPYfBSZrJLi8jdfStctE5ko/cWPysooy2NZl9oOEhEChqBf2DZS5y2sKenav
 0F4l7dzQTUm+phdmePWAhbiBBUj5L9r4CgniXAMKUA6HpA/NGLo+aztXId7bXeO5qAgR
 MVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QKIHe36oU3WI7pboaOlYIqAXpiFb5Tp6+r5u+rTzDDM=;
 b=HDru0KHNzLIz1BrF2ObBoq0tylN+U6GbH+rYx7G8i+6f84bs6lwu6IIIZqC18Nr9Mb
 4HmR5yRbWTGW80urb8nOtl7Lek+mPmPeqql9iurNCuXjR9x262H7byaPfHO3wc5KGzvS
 Wy1ihOsSX1CrIHlbweEkp3oe1aK0zD0LVbox274k1RhKcqt4J8H7yAYCyHRCvNPmhm/5
 f1559a1L4zsV1mvDBKcQXaop9iA3f1VY6Kjc8ZPLJMPeXh3Yq/y+2jfUP2FElhEWnrev
 iYauAaTTq+whx+x1lfnfnv4Gv30amV/j4wwUlBYPyEY+fFw674+eDoJhejtsUc7c2BBP
 guPg==
X-Gm-Message-State: AOAM530jvuH7hCT3yh0anIxZ7u8CALg1ixjkrpS9lxlIqrVdSEAlDJNo
 9OZ444xyy2nTc5QQd6YyPiYwrkN8Ebc=
X-Google-Smtp-Source: ABdhPJwU766I1Ke8IONlyOQjHMxGW20XYdKUHmL9w3r0x6Sxdat3YYfuhSpGKrfxudNuJ/y8bYF9NQ==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr15098510wmi.100.1635455462787; 
 Thu, 28 Oct 2021 14:11:02 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p1sm7343125wmq.23.2021.10.28.14.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:11:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/32] target/mips: Convert CFCMSA opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:39 +0200
Message-Id: <20211028210843.2120802-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CFCMSA (Copy From Control MSA register) opcode
to decodetree. Since it overlaps with the SPLATI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  5 ++++-
 target/mips/tcg/msa_translate.c | 27 +++++++++++++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index d1b6a63b526..de8153a89bf 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -168,7 +168,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
-  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  {
+    CFCMSA          011110 0001111110  ..... .....  011001  @elm
+    SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
+  }
   {
     MOVE_V          011110 0010111110  ..... .....  011001  @elm
     COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1cc9cd8afa5..b8439a2bd37 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -45,7 +45,6 @@ enum {
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -549,7 +548,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     uint8_t source = (ctx->opcode >> 11) & 0x1f;
     uint8_t dest = (ctx->opcode >> 6) & 0x1f;
     TCGv telm = tcg_temp_new();
-    TCGv_i32 tsr = tcg_const_i32(source);
     TCGv_i32 tdt = tcg_const_i32(dest);
 
     switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
@@ -557,10 +555,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_load_gpr(telm, source);
         gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
         break;
-    case OPC_CFCMSA:
-        gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
-        gen_store_gpr(telm, dest);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -569,7 +563,24 @@ static void gen_msa_elm_3e(DisasContext *ctx)
 
     tcg_temp_free(telm);
     tcg_temp_free_i32(tdt);
-    tcg_temp_free_i32(tsr);
+}
+
+static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
+{
+    TCGv telm;
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    telm = tcg_temp_new();
+
+    gen_helper_msa_cfcmsa(telm, cpu_env, tcg_constant_i32(a->ws));
+    gen_store_gpr(telm, a->wd);
+
+    tcg_temp_free(telm);
+
+    return true;
 }
 
 static bool trans_msa_elm(DisasContext *ctx, arg_msa_elm_df *a,
@@ -661,7 +672,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA */
+        /* CTCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1


