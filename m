Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A83F0DC4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:57:48 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTZD-0006Hj-Mk
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTWy-0003ab-AR
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTWw-0008LU-JZ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso2707382wms.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v88WJY9jWSIDINAld1zfrJMJVvB23xKws1R7Y44jy4I=;
 b=U1teTNutOLhNLP6UNAWZ7PMMxCXOLGO2HQozCJK7+5dBgCRNIoRU8rGHnbLd/ENjmX
 5PhWS0CyXpWSx/OQRZ2epIpRTovItfbJ+e+Q6RAF9dErUwGAsh0DW9JIZSAKb4o0AY7S
 6wgstHb7tjxIg5Nh6hylb9poWoeofEuR3zLkKkWtfesB2iR7CR3pS0IPrPH2K9G2YDan
 xFRuZanbXcof86Zo8Hr6kQf1BEYWv+K3h1/EvfzfJKGXKfU3Twjqh/rVdlnl/aE2r4om
 Mn+/H7O+QLwNCmw9riJXcB80cIv+4a/R8FNEOHDkOgA/TOBYPMx6aDdETVHugvbfi4tg
 vhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v88WJY9jWSIDINAld1zfrJMJVvB23xKws1R7Y44jy4I=;
 b=rCEP9V0b+wa7dwdeWqTAq/q1T+i71Dv/EwWb9YeVZsETdZaz+n33UVvDxJdHedqk+E
 tluCLzFG4lneaiLyBYZKqEDQbitIhTC9cWvUxucuSFPjIUHzyV9bgX2JjB74Av5NokdX
 zROW4kpWb3rNXlTSrYmWMHqCnaZqpz/CqNnpjKvRpQ/Tk8/sTwEpJq1q2C4sKnpMUin7
 EJjpKwH5rOWbOlyiSBD19jRazhuWXpvwGyAWapKMcUpme9kCBgTbrQToGRPLUBeC5G6H
 79M1ivSof6Si7/ktLY/tkctS+Ajz7AU492fFIUsTwwfEc8TZtxhqm7yHYTYThQypaaVZ
 pFSg==
X-Gm-Message-State: AOAM532yHAbz0lQO1G7JP+sJ2buzl0ICEPN9BhcNjZdSZlzQYKL1FdFB
 xvds6YjpMKRiXgXrdOUIRQBHq3LSV9A=
X-Google-Smtp-Source: ABdhPJyXLxPKPyz8uADqvXpVheWXaxexpvKV9lYwLuzE82t3riVS5EZs8xWUijE5Mk7Vo2qEw4OZSQ==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr10587416wmz.98.1629323724661; 
 Wed, 18 Aug 2021 14:55:24 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p5sm1118566wrd.25.2021.08.18.14.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/mips: Call cpu_is_bigendian & inline GET_OFFSET
 in ld/st helpers
Date: Wed, 18 Aug 2021 23:55:13 +0200
Message-Id: <20210818215517.2560994-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
References: <20210818215517.2560994-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

As a first step, inline the GET_OFFSET() macro, calling
cpu_is_bigendian() to get the 'direction' of the offset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 55 +++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d42812b8a6a..8d1dfea6766 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -52,31 +52,36 @@ HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
 
 #endif /* !CONFIG_USER_ONLY */
 
+static inline bool cpu_is_bigendian(CPUMIPSState *env)
+{
+    return extract32(env->CP0_Config0, CP0C0_BE, 1);
+}
+
 #ifdef TARGET_WORDS_BIGENDIAN
 #define GET_LMASK(v) ((v) & 3)
-#define GET_OFFSET(addr, offset) (addr + (offset))
 #else
 #define GET_LMASK(v) (((v) & 3) ^ 3)
-#define GET_OFFSET(addr, offset) (addr - (offset))
 #endif
 
 void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
 
     if (GET_LMASK(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -84,20 +89,22 @@ void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 }
@@ -116,40 +123,42 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) <= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 + 4 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 + 5 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 + 6 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, arg2 + 7 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -157,40 +166,42 @@ void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, arg2 - 4 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, arg2 - 5 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, arg2 - 6 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) == 7) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
+        cpu_stb_mmuidx_ra(env, arg2 - 7 * dir, (uint8_t)(arg1 >> 56),
                           mem_idx, GETPC());
     }
 }
-- 
2.31.1


