Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C332541F59
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:14:56 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiPW-0003DK-I5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyhec-0005a2-Lb
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:26 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyheW-0007vK-Bo
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so16018133plg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 15:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rn+Nwlq/SZ84k46btrnEBM9Y+gGCUfAzGjjM5Ob5VY=;
 b=LcmhXeIME/8vZ2Phkl3G7YcHStZ7PLnKkT2iriviH9nUQV09KCHKtH4eZDETDGPRSn
 /c4h08+FnXVshhINPRRL5Ih6n0mkLLn0jrDpXqFHq6EQ72irmHFXonQJPRW9iwiG4aCp
 pt9t4eo7FTnvDLjYDcjuBi8mldNcAQKWWtqXfbwx52r+nQcCQZLLkvZ941dPJR3v5SO5
 JfrOEs3Leiabvd80gRmiWDmG7DR9f6jlMs2MDOT2fwfUoURtCzPuPwa4D0DHQohAd3bK
 9rjjZInjYF8BvInGsIIOnA9Q4jKDqLxlwUYQdIkzrJl8MFDxgTTZV30DC2Ch/e0GOOKG
 d6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rn+Nwlq/SZ84k46btrnEBM9Y+gGCUfAzGjjM5Ob5VY=;
 b=kGgOnvk5F3XWqfF/6JdA5AzG/eYdIboP/NT2nxRKm8rep7oh1Uw9qctIHXdDVzNTeN
 gBljIDHgir4oGOOgZyWxAkiD3dpeCN6EX2fBOxVGPoew+rrqRlnRw0JadaopA758Moij
 qlmf6Wmy5z5RkbMscw0CbsgJ+19yoCyzq+BwRG4CWwVa8IUPD3V08J/ZnNOQ3S1c0umh
 OMx24uVwluZF0hd9NMr2T0BdlrYKyCzx7vO7VHLG/g6vWR/XeW+x90OMndlIMHqLitc/
 WZWhK53seoCo7HYdhf1GcwTH/DGKLth+jSi8qMiEHibi4wqmk/u8GoHiuXq50yrWOaqv
 Wmuw==
X-Gm-Message-State: AOAM531kwBJHSGcemeI4J4QWJiZ0hLk38hK6hkaXJKyyekw4WyRO+84w
 xk+Uw93lgX5DTr4Wqbud940xQYRU3iVjwQ==
X-Google-Smtp-Source: ABdhPJwdoHxWbFHQDg0sB90ae0sBeAjjkH8rYfWvYd0EQwEoGIrLaFZ4+muWRWgm8k+NH6kEhjkZaw==
X-Received: by 2002:a17:90a:cc0d:b0:1e3:1256:faa3 with SMTP id
 b13-20020a17090acc0d00b001e31256faa3mr50111677pju.107.1654640779043; 
 Tue, 07 Jun 2022 15:26:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a17090ae4d300b001e2fade86c1sm15112133pju.2.2022.06.07.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 15:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v4 1/3] target/m68k: Eliminate m68k_semi_is_fseek
Date: Tue,  7 Jun 2022 15:26:14 -0700
Message-Id: <20220607222616.717435-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607222616.717435-1-richard.henderson@linaro.org>
References: <20220607222616.717435-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Reorg m68k_semi_return_* to gdb_syscall_complete_cb.
Use the 32-bit version normally, and the 64-bit version
for HOSTED_LSEEK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/m68k-semi.c | 55 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 8c186c0e9f..37b409b0b9 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -95,8 +95,11 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
     unlock_user(p, addr, sizeof(struct gdb_stat));
 }
 
-static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
+static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
         put_user_u32(err, args + 4)) {
@@ -110,8 +113,11 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
     }
 }
 
-static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
+static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
@@ -122,21 +128,6 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
     }
 }
 
-static int m68k_semi_is_fseek;
-
-static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
-{
-    M68kCPU *cpu = M68K_CPU(cs);
-    CPUM68KState *env = &cpu->env;
-
-    if (m68k_semi_is_fseek) {
-        m68k_semi_return_u64(env, ret, err);
-        m68k_semi_is_fseek = 0;
-    } else {
-        m68k_semi_return_u32(env, ret, err);
-    }
-}
-
 /*
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails.
@@ -151,6 +142,7 @@ static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
 
 void do_m68k_semihosting(CPUM68KState *env, int nr)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
     void *p;
@@ -169,7 +161,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "open,%s,%x,%x", arg0, (int)arg1,
+            gdb_do_syscall(m68k_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
                            arg2, arg3);
             return;
         } else {
@@ -190,7 +182,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             int fd = arg0;
             if (fd > 2) {
                 if (use_gdb_syscalls()) {
-                    gdb_do_syscall(m68k_semi_cb, "close,%x", arg0);
+                    gdb_do_syscall(m68k_semi_u32_cb, "close,%x", arg0);
                     return;
                 } else {
                     result = close(fd);
@@ -206,7 +198,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "read,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "read,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -226,7 +218,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "write,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "write,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -249,12 +241,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             GET_ARG(3);
             off = (uint32_t)arg2 | ((uint64_t)arg1 << 32);
             if (use_gdb_syscalls()) {
-                m68k_semi_is_fseek = 1;
-                gdb_do_syscall(m68k_semi_cb, "fseek,%x,%lx,%x",
+                gdb_do_syscall(m68k_semi_u64_cb, "fseek,%x,%lx,%x",
                                arg0, off, arg3);
             } else {
                 off = lseek(arg0, off, arg3);
-                m68k_semi_return_u64(env, off, errno);
+                m68k_semi_u64_cb(cs, off, errno);
             }
             return;
         }
@@ -264,7 +255,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "rename,%s,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "rename,%s,%s",
                            arg0, (int)arg1, arg2, (int)arg3);
             return;
         } else {
@@ -284,7 +275,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "unlink,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "unlink,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -303,7 +294,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(1);
         GET_ARG(2);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "stat,%s,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "stat,%s,%x",
                            arg0, (int)arg1, arg2);
             return;
         } else {
@@ -325,7 +316,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "fstat,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "fstat,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -340,7 +331,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "gettimeofday,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "gettimeofday,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -361,7 +352,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     case HOSTED_ISATTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "isatty,%x", arg0);
+            gdb_do_syscall(m68k_semi_u32_cb, "isatty,%x", arg0);
             return;
         } else {
             result = isatty(arg0);
@@ -371,7 +362,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "system,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "system,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -429,5 +420,5 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         result = 0;
     }
 failed:
-    m68k_semi_return_u32(env, result, errno);
+    m68k_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


