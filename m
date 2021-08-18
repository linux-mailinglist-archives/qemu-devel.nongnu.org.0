Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6F3F098A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:48:08 +0200 (CEST)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOjX-0002rd-Ij
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfA-0003TU-Nl
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOf9-000464-4H
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso4846962wmj.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JF49QaE9jCuDi/YmbkMexymGIj6EFWRt8yNQcZZmeTQ=;
 b=EHEju86HEPsmbWmFjE7I4kYTZmpZc6WBr41nN6vjZTxPUqmtGzZbW/875qdvMNUuyA
 cA+xVYhGADm+iTS1lkuZlnYRwaEWbXjY+2w8AiUL3GiOCqUIxK5LZ8xd6IqGATA4Qb27
 b9M4II4rzwoMOGgdv2wmrhON+xp0GQikKwxuf53Ik7zBGiNWF7DRFCRxjlW9Db9nAC4f
 LKGnK5Y8g420vB4onD3rnMcpr7QnJdjm/3sY+rVGn5FDhlRngqMmHWP0+4QbERxUJS0U
 lBmSA++T1nOHh2zxfflrNNRF5Cj4t2N0LPdu1mcoxf/DexDxm2xyYdU98Yun6UQ+eKEj
 f27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JF49QaE9jCuDi/YmbkMexymGIj6EFWRt8yNQcZZmeTQ=;
 b=Zh4DHByQhpfQlI8QQ24AtUz+H2qVCYA+mt/1164zCPqTUNrxRXjxw6sBDnmrNyMW1P
 obrdaluFKtf92s09WVDrd8J5GGKm18tCc2BRjijYx26PLILg7vJFUc52PuhHWZT1mP+w
 n3E/1N7rUxS7gMmaRVydRuNWTLG9fFvrvLb1+LYDy3PVA/Es5XIXR9SGkXYdM0PFTYDU
 BXs/7mU6auog/BZzuqskB9BOGnY/PlpThbLp5hnaArndMViWSdwf+YsQP+gKntAaHlOT
 DRPcG43/BfJV3hSXpEhLILa3L6L1A02NL21C0FMg+ukt3ycrAsf+7Xqh1lNiIWcFYtTS
 9jmg==
X-Gm-Message-State: AOAM530HOoblEQLIUjjualVkdB6WNDF66iwTjWoheYoKijtZWGxPxpbW
 W0l6SWxIJttSbdVzUHirSKayY5ivZzU=
X-Google-Smtp-Source: ABdhPJwXIUILdGjulabHSeJUlmbnNtW3m5hgpdeGXpCDmcd78RaUOEZtknDckxI8NliV4nO1TKkRDA==
X-Received: by 2002:a1c:9ace:: with SMTP id c197mr9519244wme.170.1629305013115; 
 Wed, 18 Aug 2021 09:43:33 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b13sm282074wrf.86.2021.08.18.09.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/mips: Replace GET_LMASK() macro by get_lmask(32)
 function
Date: Wed, 18 Aug 2021 18:43:18 +0200
Message-Id: <20210818164321.2474534-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818164321.2474534-1-f4bug@amsat.org>
References: <20210818164321.2474534-1-f4bug@amsat.org>
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove one use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 97e7ad7d7a4..888578c0b9c 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -57,12 +57,6 @@ static inline bool cpu_is_bigendian(CPUMIPSState *env)
     return extract32(env->CP0_Config0, CP0C0_BE, 1);
 }
 
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK(v) ((v) & 3)
-#else
-#define GET_LMASK(v) (((v) & 3) ^ 3)
-#endif
-
 static inline target_ulong get_offset(CPUMIPSState *env,
                                       target_ulong addr, int offset)
 {
@@ -73,22 +67,36 @@ static inline target_ulong get_offset(CPUMIPSState *env,
     }
 }
 
+static inline target_ulong get_lmask(CPUMIPSState *env,
+                                     target_ulong value, unsigned bits)
+{
+    unsigned mask = (bits / BITS_PER_BYTE) - 1;
+
+    value &= mask;
+
+    if (cpu_is_bigendian(env)) {
+        value ^= mask;
+    }
+
+    return value;
+}
+
 void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
 
-    if (GET_LMASK(arg2) <= 2) {
+    if (get_lmask(env, arg2, 32) <= 2) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) <= 1) {
+    if (get_lmask(env, arg2, 32) <= 1) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) == 0) {
+    if (get_lmask(env, arg2, 32) == 0) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 3), (uint8_t)arg1,
                           mem_idx, GETPC());
     }
@@ -99,17 +107,17 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 {
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
-    if (GET_LMASK(arg2) >= 1) {
+    if (get_lmask(env, arg2, 32) >= 1) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -1), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) >= 2) {
+    if (get_lmask(env, arg2, 32) >= 2) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -2), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) == 3) {
+    if (get_lmask(env, arg2, 32) == 3) {
         cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -3), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
-- 
2.31.1


