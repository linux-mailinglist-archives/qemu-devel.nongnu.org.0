Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44A443030
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:20:29 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhueK-0000CG-Lk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6E-0004LD-L4
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6C-0006J9-Jq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2118808wmb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfN9KCH7LHaF1iy9iJEh7uoGdvWg3DwUxmG5SexE/XE=;
 b=W972MXEskOIMjt5eoN+FbQFPGivD0lkA/d1clF00bKipEViIjaI3nTqpyfgJWwpbEH
 jQ8jpOoziDHfRl3yHi56L+qVtzJ8oH0jjDlovG7D4J0NAU+BhOd3McLNn3UWwsc6YclS
 cIDXebNBOJbp9NSbqQKlTz4wyisxCMHcgEp2O0Kyxv9kHlutPP+JLq6CuyNPry9rbDhz
 jezAuqah3ZYybqa2cwXwun5M96oByixSgO+FLNoBiXpa72jqC8ze54DwybFVEF+Dq5Db
 oizh2JqGPWV1Gw+UvWcbdSe2Tv2xooQYtCuH7uCIKuFUfGcOOySe/6EEHrNesh8vKrXR
 HpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DfN9KCH7LHaF1iy9iJEh7uoGdvWg3DwUxmG5SexE/XE=;
 b=ooavslWGHHNZEObXn35THiSAbkngb0T4/1nmRe5xAL/QsvMSl6hbnFYjqzSNwqpzEo
 lB0jX5hueL8vfcNNgGQUylZtMcN+bA3iXxVGaZnCtPJy47IvSF4lysGL8T4gkbNbGN3A
 LMLufuvo/GwWrQJC6cB95qOzDan4j3SDAvECa0osm7kDKisFgjQIzOy2l6rUzG9eXI38
 zGw6s+RkjaJSjlcybwKhUkSE7sWwrg40WNwEmZ2NtCi6u3myrNuhtcU4uUIlyozn8oM8
 yZOTN5L7uxyjIgquWo2tNRQg00g8QWhmFKHLR4Qg2jP5fJBFPX6jtZ5q7IrOLQrXIaq8
 ovnA==
X-Gm-Message-State: AOAM532YzCAghgfOkffe1nhG4KaQXiT4q/YqLASZijEF7inhUkv05WQG
 LfndSvqUOVKGJVIveQ/uhWtsbpl08NU=
X-Google-Smtp-Source: ABdhPJwMPAMKHGD3ORbkhhUh4k7lcmo3N1u2r21hRp2Fef3htBn/lwMi03FucnXkcow1V02CRCFPfw==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr7108742wmj.178.1635860711109; 
 Tue, 02 Nov 2021 06:45:11 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t9sm12015195wrx.72.2021.11.02.06.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/41] target/mips: Convert CFCMSA opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:30 +0100
Message-Id: <20211102134240.3036524-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
X-Mailman-Version: 2.1.29
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

Convert the CFCMSA (Copy From Control MSA register) opcode
to decodetree. Since it overlaps with the SPLATI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-29-f4bug@amsat.org>
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
index ea572413ed6..764b33741aa 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -45,7 +45,6 @@ enum {
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -551,7 +550,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     uint8_t source = (ctx->opcode >> 11) & 0x1f;
     uint8_t dest = (ctx->opcode >> 6) & 0x1f;
     TCGv telm = tcg_temp_new();
-    TCGv_i32 tsr = tcg_const_i32(source);
     TCGv_i32 tdt = tcg_const_i32(dest);
 
     switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
@@ -559,10 +557,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
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
@@ -571,7 +565,24 @@ static void gen_msa_elm_3e(DisasContext *ctx)
 
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
@@ -663,7 +674,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA */
+        /* CTCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1


