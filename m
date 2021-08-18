Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B763F0DC6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:57:54 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTZJ-0006an-6s
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTX8-0003tf-Mn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTX7-0008UV-5U
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 a201-20020a1c7fd2000000b002e6d33447f9so4267822wmd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZmWEqvwx0LhQMZDXdcBKLnuhYde6vFm0XnmKyuDjCoU=;
 b=DWMli3VEvnBi6VaFE5hLbw/IiMXgajQrL5+H+8gai2BTnmshKv48paNEusptWHIWMs
 gbqo5e1p6OCHYKoioYsqMODmoQNScf+chhPUvJgevusjNAHwiavtpDDarGSSuiRX7pAL
 EyblyVOxkbJwhzV9PP0izbs4Ks2fKSbx6AsLRcjZcqLkKnz089MnSFoOaLHi+JvSb833
 KvTGpl9o+PChyvlZcwokIDTkLC9va6RBXBAQx4mImTb/rmOSpu8kp56JgpMhB70sh3TL
 eVfsv2CmGkkYNNpkU6Zes5FjTVDK6edSFI4wuTVW0IKe8g62LnWdQNS0oibTzHH3UTEw
 Iufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZmWEqvwx0LhQMZDXdcBKLnuhYde6vFm0XnmKyuDjCoU=;
 b=hY7Imyf1VJ/HJsb3AIssMTW0AfVJOCr+zpBOEyzbCTNJfFvVCKXLcn7SBiGM5WJ1Rs
 FbhBVASObT4yvArSxaLdE/eqz1HeF7KATQ8z/NxGA3K8cUY68wbDne6foYAuvZQCsf7t
 4VDIFoGHl1bFXnOn7GDyz4SZ1wu/dlbULB6syzw0xLRgqjmji1tp/JgzY8RI55vld9Wp
 upwA3vbYGXRDTO1ZFPVKQl98j+tUe3Zojv2xJGUYIWYVlDYvGQOvrbqBpLC4rj/eRVKj
 1pcrN7WFT1QSVFsgI1tBBPCJBEufx5L/ZDnQd6QHz9URnaZ61E/ctt3K8qdDsGSlstLs
 Vnyw==
X-Gm-Message-State: AOAM5318nRisdMUpaHUNTcTfGUQCr8bJrq7gGhA/oNEyEr6Qf5nLVqj2
 Qd92VXmNQiCg5+P65xQgik0wToUYkX4=
X-Google-Smtp-Source: ABdhPJylhRbZ7LLJhvngu3RAVvK4L1CzhRz/fUY3XnazIRfdNR/j4W0LIVE0FAna8xQJRbX3r1LcuQ==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr10545411wmj.45.1629323734565; 
 Wed, 18 Aug 2021 14:55:34 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b10sm1267282wrn.9.2021.08.18.14.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] target/mips: Replace GET_LMASK64() macro by
 get_lmask(64) function
Date: Wed, 18 Aug 2021 23:55:15 +0200
Message-Id: <20210818215517.2560994-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
References: <20210818215517.2560994-1-f4bug@amsat.org>
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

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove another use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index c48a2818681..139f4d833bd 100644
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


