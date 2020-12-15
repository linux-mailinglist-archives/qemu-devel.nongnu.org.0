Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4FA2DB718
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:25:05 +0100 (CET)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJgm-0007cu-Q5
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIp-0006RZ-NK
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:20 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:41192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIm-0004CJ-Tm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:18 -0500
Received: by mail-ej1-x642.google.com with SMTP id ce23so30051199ejb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTZIrFlHcNm9YcGLkUm/8b5t2eShtDyueJmi4bfarso=;
 b=o/Lg9AW6RsdSbatw9ZvZiaqGAphftza4xV+qx2aTN7AIRuAThHpFz8i03HC30uKif4
 k09ZCCY9ml9P9upy+m6AILYY/L92yYpHq6eo071QIX5MR2XFCcw1tpcKSFq0Beh5kBFZ
 eKuGpJf3YtIbB+EBHr94w4ud4pJuvCmbR5HK2mjoL1KsceIV2cYIwLjkL4P2WdxN7xH1
 7df04zElquESuERW5RwQxmyaw6EG/LLy+y0CDF2GlnYq4Rkd2jxAIN8Ee/ajZh/6bxN2
 gRZNrILg4ZZK8S//9V52n0Ty1QvOpXo2VFq6XbSTeEgotNf9yw3JM8JO37yUKdAdf80o
 muow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DTZIrFlHcNm9YcGLkUm/8b5t2eShtDyueJmi4bfarso=;
 b=O77sCqdezcPD3uU4AEtde6d2kMWp1qR9Lz8YXFG8KNc80BDzycQdUyw8eHYSIL4Wi7
 jW78FdWj43uhCuZAJQUohX+Ylbh0U1Su4f1VVK74cOMOlK7X9D1Glv5d9sVP3882jL+J
 +VZvyWX7/RsWsrqGDgjyiZDO19EvhqySP4R/1Rr6lLkKKM0+imNpSNIdeQGEzkHAKqEP
 EBvikVLdl8vlMVM6y4JXnYW9dml9Nq14/onw3vRdevHSFGrbtEsvy8lQFEP8lA2PDgTt
 oRaoKIXXzHRGZW9b46B5hjx8J88CcC/yBIY0/aLkKY9qahDf4TYFkGc2yx3hwdCKxnuO
 yIUg==
X-Gm-Message-State: AOAM530TwpWlofIi8tqdRiSbL+wVo3/xvRTiBDEWYq8e3nPQM8wuZrEM
 dJBcIvfJhOWI6G07cBbv3Go=
X-Google-Smtp-Source: ABdhPJwwyM69vtNujuLHaxpzJ3Xo4kw4/9pTA0EnBDUB6BwcABn54DD4EgmC3yUoZ3BDWepNBGrQAw==
X-Received: by 2002:a17:907:94c6:: with SMTP id
 dn6mr29085549ejc.13.1608073214898; 
 Tue, 15 Dec 2020 15:00:14 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f11sm20320776edy.59.2020.12.15.15.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 15:00:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 24/24] target/mips/mod-msa: Pass TCGCond argument to
 gen_check_zero_element()
Date: Tue, 15 Dec 2020 23:57:57 +0100
Message-Id: <20201215225757.764263-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify gen_check_zero_element() by passing the TCGCond
argument along.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Maybe this can be named 'msa_translate.c' after all...
---
 target/mips/mod-msa_translate.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/mips/mod-msa_translate.c b/target/mips/mod-msa_translate.c
index f139ba784dc..7ad14b19b0c 100644
--- a/target/mips/mod-msa_translate.c
+++ b/target/mips/mod-msa_translate.c
@@ -309,7 +309,8 @@ static inline int check_msa_access(DisasContext *ctx)
     return 1;
 }
 
-static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
+static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
+                                   TCGCond cond)
 {
     /* generates tcg ops to check if any element is 0 */
     /* Note this function only works with MSA_WRLEN = 128 */
@@ -344,7 +345,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_gen_or_i64(t0, t0, t1);
     /* if all bits are zero then all elements are not zero */
     /* if some bit is non-zero then some element is zero */
-    tcg_gen_setcondi_i64(TCG_COND_NE, t0, t0, 0);
+    tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(tresult, t0);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
@@ -393,10 +394,7 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
         return true;
     }
 
-    gen_check_zero_element(bcond, df, wt);
-    if (if_not) {
-        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
-    }
+    gen_check_zero_element(bcond, df, wt, if_not ? TCG_COND_EQ : TCG_COND_NE);
 
     ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
-- 
2.26.2


