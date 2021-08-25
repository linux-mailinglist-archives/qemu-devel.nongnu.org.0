Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508743F75C1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:20:06 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsp3-0000Am-BN
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZl-0002wL-NE
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZk-0002ul-67
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so4270122wme.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7AhW4qakAQXR7MG6oQIs52Ne0TNOUcGgs1+LT6yXd8=;
 b=XeYUK8t0DOiREORdQw4Gzx7FoIlS5cW+vZAX68r2gw/bStvCsadNhFp0gu6WiqBVfG
 lpldCuvKb8wjLRVwxM/bo0s0LI5mKWQ89IXkjW59Lri4/ippR1EA7MHJZOAAh5aZQQy9
 6C53zJuqA6AAP299dUM8Ye/KUdXxayf6nZpZ06nykKmkxQm9r+RF7muLO4KhF4nUkH0T
 jLN4XRbJ0OV3BjHGXQQxohaY9S0wO/zlwmI4hTj8CDN5HLngiFIxDNRjfneEg4cw1tn1
 prujxwI4DDCzI4UWn5BNhO4DWFZ6JRSGkOVkSTPsC+ZLcj14gAF0sQdZfNwG6OS/DwIY
 o57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S7AhW4qakAQXR7MG6oQIs52Ne0TNOUcGgs1+LT6yXd8=;
 b=ETsMizTKq4F9ZiggQg0LVefbbGGlXaJpSgZDz+/njz7sEz8nG3OUNNqnxW9K9dxEw1
 SJYUiKjvIZZLAlQwdGl+BqmjtJbPKVkh3bTQwvv8wQUfCtxZoq4ZiBU4qk9ed9MQUhj+
 fEu2FFFyu288IkFH0/qg/XT5HFlS+VLDghpv9QvSUzHjIa3OGzxsLXLxJNSWKct5eHTz
 oehBz81dU1GzFBMXm/kkvn4gFmJerz9ItQt+VUWuf0TpnnLdrFM1+O6GH4MSquUC66rD
 eI6P7oF0i8/cQGu2Be+aLGEyv2lcaovpW2kdTYB3S1YlxsRv08USPhGghrQH9+zcXEbi
 GUuQ==
X-Gm-Message-State: AOAM530GZhG1fJjv8RTMmuxYxoqcrXoHf+XkoBDXVTlKb+7dEdkZVozu
 SnCxDwpJRoslUpv/M+P+QK1JP7n46Yo=
X-Google-Smtp-Source: ABdhPJz1G3TrgQmkbrLQTfCjeo4gjALxxwcm/LMQKHvVbqHyAN8LSDBbNGJmm7yUDd8FA1QU6DKqBw==
X-Received: by 2002:a1c:1d3:: with SMTP id 202mr9063624wmb.179.1629896654012; 
 Wed, 25 Aug 2021 06:04:14 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d9sm11303921wrm.21.2021.08.25.06.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:04:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] target/mips: Replace GET_LMASK64() macro by
 get_lmask(64) function
Date: Wed, 25 Aug 2021 15:02:09 +0200
Message-Id: <20210825130211.1542338-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove another use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818215517.2560994-4-f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 054459703aa..d0bd0267b24 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -124,50 +124,46 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
  * "half" load and stores.  We must do the memory access inline,
  * or fault handling won't work.
  */
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK64(v) ((v) & 7)
-#else
-#define GET_LMASK64(v) (((v) & 7) ^ 7)
-#endif
 
 void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    target_ulong lmask = get_lmask(env, arg2, 64);
     int dir = cpu_is_bigendian(env) ? 1 : -1;
 
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
 
-    if (GET_LMASK64(arg2) <= 6) {
+    if (lmask <= 6) {
         cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 5) {
+    if (lmask <= 5) {
         cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 4) {
+    if (lmask <= 4) {
         cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 3) {
+    if (lmask <= 3) {
         cpu_stb_mmuidx_ra(env, arg2 + 4 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 2) {
+    if (lmask <= 2) {
         cpu_stb_mmuidx_ra(env, arg2 + 5 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 1) {
+    if (lmask <= 1) {
         cpu_stb_mmuidx_ra(env, arg2 + 6 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) <= 0) {
+    if (lmask <= 0) {
         cpu_stb_mmuidx_ra(env, arg2 + 7 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
@@ -176,41 +172,42 @@ void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    target_ulong lmask = get_lmask(env, arg2, 64);
     int dir = cpu_is_bigendian(env) ? 1 : -1;
 
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
-    if (GET_LMASK64(arg2) >= 1) {
+    if (lmask >= 1) {
         cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 2) {
+    if (lmask >= 2) {
         cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 3) {
+    if (lmask >= 3) {
         cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 4) {
+    if (lmask >= 4) {
         cpu_stb_mmuidx_ra(env, arg2 - 4 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 5) {
+    if (lmask >= 5) {
         cpu_stb_mmuidx_ra(env, arg2 - 5 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) >= 6) {
+    if (lmask >= 6) {
         cpu_stb_mmuidx_ra(env, arg2 - 6 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK64(arg2) == 7) {
+    if (lmask == 7) {
         cpu_stb_mmuidx_ra(env, arg2 - 7 * dir, (uint8_t)(arg1 >> 56),
                           mem_idx, GETPC());
     }
-- 
2.31.1


