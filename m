Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A292420338
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:07:40 +0200 (CEST)
Received: from localhost ([::1]:54840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5tj-0005pc-58
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5ke-00038v-7n
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kc-0003b5-Ml
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o4-20020a05600c510400b0030d55d6449fso4377423wms.5
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhXr0CImE+7NvBwyuzdOAZs7t1J2dHvRPqJwA4cIlkQ=;
 b=heyTkqrEddrxX4nRPI+sZdGCq825lzySUhCayps+4/7gOV95EorAgm3BX44r1ZEbgJ
 b5YSZtnf6eU6ua0Afil7vRJXd9aa2MLAyI1Q4lKOYq9+nMlArMFX+kifBsV7aqMgBshY
 mMW/5qknzuXquUFCbtrsrefjiD+gyK8Bv/BjYVNWWo6Xd13fpnX6u4HhGFBEMbEhbeF5
 2WqMAdPvOFCRbsV3aCcLE4heBwsm1+UwZjVcGlwmxB7Y+a9a6TobE1v+MhZ5j7Vl3Zlb
 jYqmBUQyIIaZcfi7TZ13OQNDSWTQ2AdQkEudj0kOJTgwJF6gLzMUv7FV7GvbHOdW5Ypm
 OtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yhXr0CImE+7NvBwyuzdOAZs7t1J2dHvRPqJwA4cIlkQ=;
 b=j9joBMBLHrKjr+9S+msk8PkPw+y53FlkQ5dsv1V6C6gvM4ZJaQWa36dt0oB2dvcqDY
 CSyAbsdjYzz9+esX6nZgbmaFa961n6DwJ99tZjQ4VFKIIKH3qUpiAG1r8LiO64LAUmhP
 5YvN0WMD6fyIWUSKcDrqLxVlHHuNkqY20dAb1VTHb1S0i4Fb7sMorglGPLyM5fhphSIJ
 ntMJmiJzwYiOBziBKuKRQhmUW4+ufKB7/JUGsmh0aQI5twXekh3iV/35GGHeVfuNFRBr
 rBTtJVUS/XAe6oBvubDVW/9M7CscnOotLcKqlC70WhM4EtKG96FmgJ5nlwbrXnrNN2yU
 M+4A==
X-Gm-Message-State: AOAM531/VhQ3Iv9kiGVDBNl7jUTuE3uzRCINNkA45tWn9/fW0e9MVBV/
 XtHPy5vz2iYGdBgVHw5IiKHMTK4oPC4=
X-Google-Smtp-Source: ABdhPJxvwuCumsr8NNeeMw8ghCCwqo//WGAtcbT4Ag5BtmhFF217UgEdiv31yWOiYejoN+BwOKLF2w==
X-Received: by 2002:a05:600c:3646:: with SMTP id
 y6mr14745336wmq.61.1633283893117; 
 Sun, 03 Oct 2021 10:58:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 p6sm7508691wrj.95.2021.10.03.10.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:58:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] target/mips: Use explicit extract32() calls in
 gen_msa_i5()
Date: Sun,  3 Oct 2021 19:57:41 +0200
Message-Id: <20211003175743.3738710-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

We already use sextract32(), use extract32() for completeness
instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e107cad57ee..3ef912da6b8 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -473,15 +473,12 @@ static void gen_msa_i8(DisasContext *ctx)
 static void gen_msa_i5(DisasContext *ctx)
 {
 #define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    uint8_t df = (ctx->opcode >> 21) & 0x3;
     int8_t s5 = (int8_t) sextract32(ctx->opcode, 16, 5);
-    uint8_t u5 = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    uint8_t u5 = extract32(ctx->opcode, 16, 5);
 
-    TCGv_i32 tdf = tcg_const_i32(df);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
+    TCGv_i32 tdf = tcg_const_i32(extract32(ctx->opcode, 21, 2));
+    TCGv_i32 twd = tcg_const_i32(extract32(ctx->opcode, 11, 5));
+    TCGv_i32 tws = tcg_const_i32(extract32(ctx->opcode, 6, 5));
     TCGv_i32 timm = tcg_temp_new_i32();
     tcg_gen_movi_i32(timm, u5);
 
-- 
2.31.1


