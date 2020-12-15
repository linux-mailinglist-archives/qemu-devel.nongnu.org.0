Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FF2DB6D6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:02:55 +0100 (CET)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJLK-0007ju-9q
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGp-0002mR-0e
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:15 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJGm-0003Zn-V9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:58:14 -0500
Received: by mail-ej1-x631.google.com with SMTP id jx16so30020445ejb.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nIvvusNJm60WWqveYR8Cj3EE3xSaf0EEqwOHmNBN40o=;
 b=rE1wg4s+BQFCEk8G4qW/EZvLlvRn6pVxQO3rKh4VPhBKrCVG/5yqEwoiblwqOAVg+s
 1jKsfSERkOnk3qfv8sVj922EN1A+gxv1DwbsZUIgZHOBv+BNMQu+6ohBNFP3RnovvOj9
 zdyVuynSE1umCq28i/rSVXS5jcEkECpHS2kohBMsXcdYTT8lV+AEga+bmJkpBPnSyWEl
 y3VaMmRFsjzHzim7xhbqmXib/rnEdeYVp7dPdzpjnLSgh7ViyON5jFRke9Pf8B1deDuj
 z0dFvMtjfL3QZy1GJxE5hhfYq/jO+10+I6BjV0/xVVDbTYHvVBr90l4FPpqIMxnY9PBn
 5atQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nIvvusNJm60WWqveYR8Cj3EE3xSaf0EEqwOHmNBN40o=;
 b=XQ3ti8faERC7cxCF4lx/KBaS5OFu5rnvciOOD2YK0rlIOryScdVEYuHUPEfOOeDmYQ
 poJp6JB33uF3Dhd8mD1o70v0/YIOe1JYIAeZ/RTHd9ioPCI8QDetfWGcPQouLmM4/Iqg
 Fyf0bZns/uOLMkhfKj4TornCA8ukWJ4RN/qV3ZZ5hkTTu3K6wIhIEySyGp/hIMjmIEEA
 fXEdpxByaCiUc8MKX8HsJoBhZ2pXpT7t7jwzhDYoFne82Eezu0owQHVXTOpvKmzk9pe1
 qfOowU8KXDy+I1HldufA0BuDaK6sLMs48X1mysPCVjnzwss45WVYslolOr6fVXcJDSF1
 4/fg==
X-Gm-Message-State: AOAM530PvitvAq/ClN3vLNV8J5qrKe6vD6afvQtk0bRF+ZMqE2m9rAQ9
 fKeDtLnxR25QhEMpyXLlQgQ=
X-Google-Smtp-Source: ABdhPJyJfKCLWMingZozHIiLHLT59KgzZqGQr2a+zB0lXaXEIGcuoBun5nXBUlkaB1EB0fOznCztLA==
X-Received: by 2002:a17:906:2c54:: with SMTP id
 f20mr4559736ejh.318.1608073091601; 
 Tue, 15 Dec 2020 14:58:11 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f20sm8514210edx.92.2020.12.15.14.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:58:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] target/mips/translate: Expose check_mips_64() to
 32-bit mode
Date: Tue, 15 Dec 2020 23:57:35 +0100
Message-Id: <20201215225757.764263-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
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

To allow compiling 64-bit specific translation code more
generically (and removing #ifdef'ry), allow compiling
check_mips_64() on 32-bit targets.
If ever called on 32-bit, we obviously emit a reserved
instruction exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 --
 target/mips/translate.c | 8 +++-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index a9eab69249f..942d803476c 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -127,9 +127,7 @@ void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
 void gen_reserved_instruction(DisasContext *ctx);
 void check_insn(DisasContext *ctx, uint64_t flags);
-#ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
-#endif
 void check_cp1_enabled(DisasContext *ctx);
 
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5c62b32c6ae..af543d1f375 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2972,18 +2972,16 @@ static inline void check_ps(DisasContext *ctx)
     check_cp1_64bitmode(ctx);
 }
 
-#ifdef TARGET_MIPS64
 /*
- * This code generates a "reserved instruction" exception if 64-bit
- * instructions are not enabled.
+ * This code generates a "reserved instruction" exception if cpu is not
+ * 64-bit or 64-bit instructions are not enabled.
  */
 void check_mips_64(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
+    if (unlikely((TARGET_LONG_BITS != 64) || !(ctx->hflags & MIPS_HFLAG_64))) {
         gen_reserved_instruction(ctx);
     }
 }
-#endif
 
 #ifndef CONFIG_USER_ONLY
 static inline void check_mvh(DisasContext *ctx)
-- 
2.26.2


