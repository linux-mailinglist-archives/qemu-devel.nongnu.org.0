Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8651C967
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:44:39 +0200 (CEST)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhOw-0002YT-9N
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYo-0003JZ-Nw; Thu, 05 May 2022 14:50:50 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYm-0004O5-Vb; Thu, 05 May 2022 14:50:46 -0400
Received: by mail-oi1-x22d.google.com with SMTP id y63so5254914oia.7;
 Thu, 05 May 2022 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBts86DpO80mYxJjRHWD7Zw3OzhCdIiKbCFZqyDfHqM=;
 b=hqGP397YICpZGDY8+O+oDPjUKViY1tkc39G/suLmMQjy1W/eYQwJpFLNwLTccCu+oy
 0fdW5eDobxrkxfHVMbq8zS74NTUF9fJO4c5I8GGn0HBi61c/0iK+TfZeajZgTQVztTOT
 4bPze1EzsyPhHfcaF74i/XS3kIu4wjW5CBy9uRD0R4I7oC8ZWrNHMzC8G2pfSGIF8/0a
 k/xeAjhDUFDpMdjUNVjOhCdYvNt4EO/SitQYutEo6GfGTziBot7zbxHM3L4/GTKVioUb
 5V6mwsbd408vqG2yS3dFEIcD7oQaaZwAtWqC6gLjtB3S+U7qJqwkYGiWHW2n3gEJA3SL
 67xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBts86DpO80mYxJjRHWD7Zw3OzhCdIiKbCFZqyDfHqM=;
 b=7Twq0NNMW3VuCXfnkr4u9STuepuVKsTm15ZEe/WX5bk01dGn0M0WKlmcW0yVvHHvP7
 fTT4UR9TYR1lVqlJintvoF3fH9DahIpDKcWVmFJiElXr0qnsktHyDboGTxfMjqQSVNBn
 UBUldIZL7O9V91YwxZoZi/PAZqH61HoK3HwhqxkCNSzd6CH7RVuGNgiZwX6dvset2eB9
 UQHmiO6DbxFSMLkOQN1tq/VJgTMBFTjx0iGJfd1cqI5Hf8L1OzodE79q3dXhctlOB3bQ
 i7WoZY4UOZzEdGrn90YpN7+uy5tEn2TcGGQ5kgTIwooMsQPiYjjsCIAoey02qMxczst6
 wUTg==
X-Gm-Message-State: AOAM530HPXL/5UFeSQMkiEovNI4p0VcQjAxu/fr6VkY5YJVFS+FlaZ7y
 gNTfb4Uo2Q/LKTPeozd+SbO3uFIQscY=
X-Google-Smtp-Source: ABdhPJxtV7+WVPQv6dXDA1W17cyx+RSl3ZCfZeViz//rXXbCMMRbXT2RANVJ1s2kkYGPD80sa0ycKQ==
X-Received: by 2002:a05:6808:d4c:b0:322:e7de:fffe with SMTP id
 w12-20020a0568080d4c00b00322e7defffemr3141860oik.107.1651776643821; 
 Thu, 05 May 2022 11:50:43 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 12/30] target/ppc: Remove msr_le macro
Date: Thu,  5 May 2022 15:49:20 -0300
Message-Id: <20220505184938.351866-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_le macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-5-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        |  2 +-
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/gdbstub.c    |  2 +-
 target/ppc/mem_helper.c | 16 ++++++++--------
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8f1dc4cb15..c561d664de 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, LE, MSR_LE, 1)
 
 /* PMU bits */
 #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
@@ -486,7 +487,6 @@ FIELD(MSR, PR, MSR_PR, 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ds   ((env->msr >> MSR_DS)   & 1)
-#define msr_le   ((env->msr >> MSR_LE)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ac16a64846..0c6b83406e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7210,7 +7210,7 @@ static bool ppc_cpu_is_big_endian(CPUState *cs)
 
     cpu_synchronize_state(cs);
 
-    return !msr_le;
+    return !FIELD_EX64(env->msr, MSR, LE);
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 1252429a2a..1a0b9ca82c 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -95,7 +95,7 @@ static int ppc_gdb_register_len(int n)
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
 {
 #ifndef CONFIG_USER_ONLY
-    if (!msr_le) {
+    if (!FIELD_EX64(env->msr, MSR, LE)) {
         /* do nothing */
     } else if (len == 4) {
         bswap32s((uint32_t *)mem_buf);
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index fba7f84b7a..9af135e88e 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -33,9 +33,9 @@
 static inline bool needs_byteswap(const CPUPPCState *env)
 {
 #if TARGET_BIG_ENDIAN
-  return msr_le;
+  return FIELD_EX64(env->msr, MSR, LE);
 #else
-  return !msr_le;
+  return !FIELD_EX64(env->msr, MSR, LE);
 #endif
 }
 
@@ -470,8 +470,8 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
 #endif
 
 /*
- * We use msr_le to determine index ordering in a vector.  However,
- * byteswapping is not simply controlled by msr_le.  We also need to
+ * We use MSR_LE to determine index ordering in a vector.  However,
+ * byteswapping is not simply controlled by MSR_LE.  We also need to
  * take into account endianness of the target.  This is done for the
  * little-endian PPC64 user-mode target.
  */
@@ -484,7 +484,7 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
         int adjust = HI_IDX * (n_elems - 1);                    \
         int sh = sizeof(r->element[0]) >> 1;                    \
         int index = (addr & 0xf) >> sh;                         \
-        if (msr_le) {                                           \
+        if (FIELD_EX64(env->msr, MSR, LE)) {                    \
             index = n_elems - index - 1;                        \
         }                                                       \
                                                                 \
@@ -511,7 +511,7 @@ LVE(lvewx, cpu_ldl_data_ra, bswap32, u32)
         int adjust = HI_IDX * (n_elems - 1);                            \
         int sh = sizeof(r->element[0]) >> 1;                            \
         int index = (addr & 0xf) >> sh;                                 \
-        if (msr_le) {                                                   \
+        if (FIELD_EX64(env->msr, MSR, LE)) {                            \
             index = n_elems - index - 1;                                \
         }                                                               \
                                                                         \
@@ -545,7 +545,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,                 \
     t.s128 = int128_zero();                                             \
     if (nb) {                                                           \
         nb = (nb >= 16) ? 16 : nb;                                      \
-        if (msr_le && !lj) {                                            \
+        if (FIELD_EX64(env->msr, MSR, LE) && !lj) {                     \
             for (i = 16; i > 16 - nb; i--) {                            \
                 t.VsrB(i - 1) = cpu_ldub_data_ra(env, addr, GETPC());   \
                 addr = addr_add(env, addr, 1);                          \
@@ -576,7 +576,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,           \
     }                                                             \
                                                                   \
     nb = (nb >= 16) ? 16 : nb;                                    \
-    if (msr_le && !lj) {                                          \
+    if (FIELD_EX64(env->msr, MSR, LE) && !lj) {                   \
         for (i = 16; i > 16 - nb; i--) {                          \
             cpu_stb_data_ra(env, addr, xt->VsrB(i - 1), GETPC()); \
             addr = addr_add(env, addr, 1);                        \
-- 
2.32.0


