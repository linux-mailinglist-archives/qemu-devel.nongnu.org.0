Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E723BA14E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:37:59 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJMk-0003Jh-Up
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJKy-00019s-Nw
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJKw-0003s2-It
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:36:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6432945wmj.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3L5gBpbgmqBBugkJukw22D8IeaKPnzHPS3VsGEJn7Vs=;
 b=CphryjQtJ6re9YMlgTWuqtGBZ5ScCrt/5jdQ6snyb9ED6aHMhYVDOnR4K+MMEBInWi
 tUfTpEwIFU6XR80b6b6NXssZWbfQF+vD4mmmYovJI5khIaf9yKttd0orCuP1Zs8wkWSb
 t+X39hmsCBitES/5V3ZymrUGwNqEXzP1/oG6tDjOBPS2wn4/tTOkCnFdAKV9nOJmWrQn
 y5P2H8d9N5HQmUiudpAtjrQKNBafln3P63hj5XAVKEnOhdbi+zOeqRYuMNl8EWd5PkUk
 R7w85PgrO5BlSyFC+HHHlBYDUvUJxoZQ19wLHA3/opCPPvRYcibEfomOAkcBPduY89cB
 fKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3L5gBpbgmqBBugkJukw22D8IeaKPnzHPS3VsGEJn7Vs=;
 b=XASd4U94mAY2xwcaM2F+2Cb+cix7oFylj+bBjEvUyEpDC35sD8d5O6wvM6ijO3bpPX
 9i9UPCxX8QYfuE8QsafNbBXki4v9fGaVdGGzWDGyOiyFlVsthwBbxfxPk2whntUQI71r
 qRnoOrIgpQgmvWyZdQmibm4H60C4ru4/OymnsdJq8f6GwJ1fu0ZN4IQ4BCmnxHfU7+Cl
 iejOV1vcVl3XgWg7x8NpcNu0HTslzM7POPFQQ3mt8h/IiWM3bRiJ/mipeJsT0Vy8U6ul
 kn4L6lbu7JL18Zb3gzf7UcwlNCKAxAsd53pYOVAWOxFEA1NPZuNXgs8Ii4bTVQMtgqqp
 D+LA==
X-Gm-Message-State: AOAM531/GYlfY18Qbw005rsXnyRZAmlfufadyixRNWzP14q7ANtdVeIs
 tP3c8Yjy9iFT1Yj6vFTJOtgXGh8jQNFx9H77
X-Google-Smtp-Source: ABdhPJyL5vBEMRfxcu054vvpV7PpjHL1ki2WUWAgOImGqqJ2klrVGVs2clWNne4byi1Mo2k+vNkGAg==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr16256697wmh.81.1625232964631; 
 Fri, 02 Jul 2021 06:36:04 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id i11sm13450671wmg.18.2021.07.02.06.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:36:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] target/mips: Add declarations for generic TCG helpers
Date: Fri,  2 Jul 2021 15:35:40 +0200
Message-Id: <20210702133557.60317-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to extract the microMIPS ISA and Code Compaction ASE to
new compilation units.

We will first extract this code as included source files (.c.inc),
then make them new compilation units afterward.

The following methods are going to be used externally:

  micromips_translate.c.inc:1778:   gen_ldxs(ctx, rs, rt, rd);
  micromips_translate.c.inc:1806:   gen_align(ctx, 32, rd, rs, ...
  micromips_translate.c.inc:2859:   gen_addiupc(ctx, reg, offset, ...
  mips16e_translate.c.inc:444:      gen_addiupc(ctx, ry, offset, ...

To avoid too much code churn, it is simpler to declare these
prototypes in "translate.h" now.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174907.2904067-2-f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 5 +++++
 target/mips/tcg/translate.c | 9 ++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 61442590340..c25fad597d5 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -146,6 +146,11 @@ void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
 void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 int get_fp_bit(int cc);
 
+void gen_ldxs(DisasContext *ctx, int base, int index, int rd);
+void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp);
+void gen_addiupc(DisasContext *ctx, int rx, int imm,
+                 int is_64_bit, int extended);
+
 /*
  * Address Computation and Large Constant Instructions
  */
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index b4a454ec09b..3e9945540fc 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5629,8 +5629,7 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
     tcg_temp_free(t0);
 }
 
-static void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt,
-                      int bp)
+void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp)
 {
     gen_align_bits(ctx, wordsz, rd, rs, rt, bp * 8);
 }
@@ -12778,8 +12777,8 @@ static void gen_mips16_restore(DisasContext *ctx,
     tcg_temp_free(t2);
 }
 
-static void gen_addiupc(DisasContext *ctx, int rx, int imm,
-                        int is_64_bit, int extended)
+void gen_addiupc(DisasContext *ctx, int rx, int imm,
+                 int is_64_bit, int extended)
 {
     TCGv t0;
 
@@ -14510,7 +14509,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
     }
 }
 
-static void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
+void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-- 
2.31.1


