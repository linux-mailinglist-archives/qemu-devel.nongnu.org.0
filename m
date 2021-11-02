Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186DA442F99
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:59:47 +0100 (CET)
Received: from localhost ([::1]:48568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuKI-0006Aw-7L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4h-0000Nr-Sz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4f-00062W-OB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so2009115wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yq0hPXTClhBJmAxr5iw2vWW8JkXa0mJtI91u85gGNks=;
 b=kr9J4dDjXll1fGeo1zTsWMgVzOWhM5oDXuglzJXrRi9sNKV30NeofFMfk6fxLaqaNY
 7kAA9WJmUoAUvw7q+AFkkFirMRsXHzGjwij7IqD0/rIW8LA71cG9s9HB90fyPncwAptF
 fQTMErypBHQVJsLCVvgfnZ1GZt4aYKeQfj2XTs4jT1Tjtt0BNbdxUql38kF6NRyhvRav
 FkhqDxk2/RBQp4O0XEy/CUnxSteBFwkQpulxZIt0KtRBiC7rX4mkHJHQy+c/vD+c4vGI
 MwP9VoeJzzqc/v2WmOr8PlNauCX3rVHnleRkpF+bNNADY2oIDCdqea6tHaJSpLqEfmM+
 wYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yq0hPXTClhBJmAxr5iw2vWW8JkXa0mJtI91u85gGNks=;
 b=lq0RGLZT41ZLUqM5hm0amVZGM3Wcnt1ll47yGrnGnDV8VoNCOsdNMyafY9/KCrgRlX
 pIUNcTMEWIh/S8SHwAybNcyPIipJvpmKlnLyi5Y5E64nInmuZPPwxM1XGrwZOSKJ0Mc9
 Fvzq4NbF1bOlyKSxZ9OqkOevlCu8eNPrgSdJJe/PCB1amLoSgeP7Lz9N4ME+MHfwf3tD
 C9gLF+1PD9GJNT1UBLQ8HMlFPD2G4LVUR3/yTI89zrz62JlnAXIFLHWd26l0awPHdGKp
 JRAFPZN4dm4ZzqStwyWg0TTywT6jeQmygecXS2kiDKbfyepARMrxpFHOFCYWcxGzlMWm
 KEWg==
X-Gm-Message-State: AOAM532bTvGOruXV62Vz58absjRaWlc2vK/5uOSok4eH4/Dd4IBu1fmT
 nhP0GleEbzDg5l9O368+keV+vD+zMco=
X-Google-Smtp-Source: ABdhPJzr3GduIii2P6xK6SL7GJzKaDTlTgIDsUCri+d7qKcNxGu9pHSMAARjv6wu23jijMcLEdW0Ag==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr7023665wmi.167.1635860615385; 
 Tue, 02 Nov 2021 06:43:35 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j134sm2775088wmj.3.2021.11.02.06.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/41] target/mips: Convert MSA LDI opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:10 +0100
Message-Id: <20211102134240.3036524-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

Convert the LDI opcode (Immediate Load) to decodetree. Since it
overlaps with the generic MSA handler, use a decodetree overlap
group.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-9-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 +++++++-
 target/mips/tcg/msa_translate.c | 22 ++++++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 56419a24eb9..bdfe5a24cb3 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -14,10 +14,12 @@
 &r                  rs rt rd sa
 
 &msa_bz             df        wt sa
+&msa_ldi            df  wd       sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
@@ -27,4 +29,8 @@ BNZ_V               010001 01111  ..... ................    @bz_v
 BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
-MSA                 011110 --------------------------
+{
+  LDI               011110 110 .. ..........  ..... 000111  @ldi
+
+  MSA               011110 --------------------------
+}
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 8311730f0a5..94c69a668da 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -70,7 +70,6 @@ enum {
     OPC_CLEI_S_df   = (0x4 << 23) | OPC_MSA_I5_07,
     OPC_MINI_U_df   = (0x5 << 23) | OPC_MSA_I5_06,
     OPC_CLEI_U_df   = (0x5 << 23) | OPC_MSA_I5_07,
-    OPC_LDI_df      = (0x6 << 23) | OPC_MSA_I5_07,
 
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
@@ -515,13 +514,6 @@ static void gen_msa_i5(DisasContext *ctx)
     case OPC_CLEI_U_df:
         gen_helper_msa_clei_u_df(cpu_env, tdf, twd, tws, timm);
         break;
-    case OPC_LDI_df:
-        {
-            int32_t s10 = sextract32(ctx->opcode, 11, 10);
-            tcg_gen_movi_i32(timm, s10);
-            gen_helper_msa_ldi_df(cpu_env, tdf, twd, timm);
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -534,6 +526,20 @@ static void gen_msa_i5(DisasContext *ctx)
     tcg_temp_free_i32(timm);
 }
 
+static bool trans_LDI(DisasContext *ctx, arg_msa_ldi *a)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_ldi_df(cpu_env,
+                          tcg_constant_i32(a->df),
+                          tcg_constant_i32(a->wd),
+                          tcg_constant_i32(a->sa));
+
+    return true;
+}
+
 static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-- 
2.31.1


