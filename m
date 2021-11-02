Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3155E442FC8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:05:55 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuQE-00015z-8t
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5F-0001Zd-NJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5C-00066B-O5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so2010677wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/oAKn93/BmwUt+yc3dYyDptN24rOWDdTSRD3Nh266Ks=;
 b=EwvVN5nKv8imnjN8ar47AO9wxE/LFaVDzVjlWpXg1L7xyiVSCl0MYdTGWWA3f+j39r
 r1aHn5HcYMInKiYqAC7VS8UmeDKq3HzOF8KAI4VQmR+QGySnMzgah9UQgLbOGi4QmE70
 TpaGL7NvcltJi72RwDg3FBSOa3h10NGnF2ULShAZZhVftPXuUN29uCxIo8NnkdUpFHGT
 O/lXBacLBo9XBhXaTp1QZxcMQdL5lgmm8v/pMQk3fQsda3v1iKCmQP56OwHE6vh3q/Jb
 7fv/PnVB9IXv2H0d+IoQGrsSPd5Vk9ro/3/nACRIdSB+iRDvJy0lymoHJGgWYYJFCl77
 GnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/oAKn93/BmwUt+yc3dYyDptN24rOWDdTSRD3Nh266Ks=;
 b=jX+jYLORbmaHm+UFiSr852kcMAEw06Jr4kHCh0lEKHYJdPTNv1NYWcyA0S1c5G6El1
 6HaYt9k+UJUaGxroCr4affL7aA86iOfreGr2bJ0RTKRfsPJJt3prWZJe5h5GaLx83w3E
 45nXUmIhqiUwH/Y4eIN5wBZ1/64T3hX6UCcOnHXxqOJ0gvcrEjD75wl9vSZrFOfwN7Pg
 bPJOT5SVZPEuIGiyiMTWafzeMOHphvOyaUQRGtrGnWlaBC8ao6HZ8JHATcBeTuRn9j8T
 7pctZzDeVougX8MOxCRa1SKConZlMG5SrnIDcS8QcYeJ6hlr4AwyBLXC/ohEXiArZoEa
 UiVQ==
X-Gm-Message-State: AOAM530kcIuR61fQdLQFzEMpqf1uku8Ddu77fcJzrtnlNTjaO1VfvMad
 mUwvM+v8dnA+y1uv/NVR0Rj9gWLtW+w=
X-Google-Smtp-Source: ABdhPJyzv5s19f3FlVdpJSJ2DLWcp6vvuTYaPCaRLFEf+wWfdLbj5ec9lQ+poPPZkSBtS0i+wjf0Vg==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr7068071wmc.165.1635860648833; 
 Tue, 02 Nov 2021 06:44:08 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n9sm2963874wmq.6.2021.11.02.06.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/41] target/mips: Convert MSA FILL opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:17 +0100
Message-Id: <20211102134240.3036524-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Convert the FILL opcode (Vector Fill from GPR) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-16-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  2 ++
 target/mips/tcg/msa_translate.c | 31 +++++++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 33288b50355..bcbc573deec 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -27,6 +27,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
@@ -82,6 +83,7 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FILL              011110 11000000 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 704273dfd2f..c7509088987 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -61,7 +61,6 @@ enum {
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
     OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
     OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
     OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
@@ -1847,17 +1846,6 @@ static void gen_msa_2r(DisasContext *ctx)
     TCGv_i32 tws = tcg_const_i32(ws);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_FILL_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
-                               twd, tws); /* trs */
-        break;
     case OPC_NLOC_df:
         switch (df) {
         case DF_BYTE:
@@ -1916,6 +1904,25 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
+static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
+{
+    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
+        /* Double format valid only for MIPS64 */
+        return false;
+    }
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_fill_df(cpu_env,
+                           tcg_constant_i32(a->df),
+                           tcg_constant_i32(a->wd),
+                           tcg_constant_i32(a->ws));
+
+    return true;
+}
+
 static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
                           gen_helper_piii *gen_msa_2rf)
 {
-- 
2.31.1


