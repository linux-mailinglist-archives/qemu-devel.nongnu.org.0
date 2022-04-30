Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC417515DEC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:57:11 +0200 (CEST)
Received: from localhost ([::1]:55248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknaw-0004FS-QR
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAo-00051N-S7
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:11 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAm-0006WH-TQ
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:10 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so10814015pjb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wppbnjnSPA38ZbueUEu4qjUCfA8mLgkrGrV5gfq7DgQ=;
 b=sKpzkJIsDOfc/h2PsKLyg7O2eVGSwEhwrukpLzUilXgcRV4n3fMkTAgA5LG+dJyzKf
 rS0OHXHHDxaLR4Wq6GZ8d3cJGjPDrKDXj3DuHlw9kD1dovBSS05Mfu13G+A4nerP2+wY
 DWOzgOBbIsYY2uh+c7LD+lmaN1ExlUnuH0MAIT9GuOMXxwxkBiX5N1L0bUjoly/Gy4bB
 u/8mNTUHbXMWEzpT9ZjTgn644JiJiCdjqlWdQaZ63SWAjcknsJqF/rRb1tU7tRd5Jfv6
 UcLdqFJhAmhwWda7Fq4cRMTEHx0R3PoDtp9ABzGIs7rCr05YiCGaDxajtNx6VLhnx5j0
 oM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wppbnjnSPA38ZbueUEu4qjUCfA8mLgkrGrV5gfq7DgQ=;
 b=1eq0qTt6BGP/T6GpRB1BtKKmScGyq/daG3f65cyIl8aYnu0U5skBVeFuBCWXoXS8hr
 y6Ofui+XLj/hwwq6Tr9D3Ly2kS99QlV5rJyAQ6G4f6RvGA9EfpYZQ19iUjPM0jU0Smi2
 Eb9Fx4IxIDcsl3/LGs/Gh4MOomAaKEYC7Q2AHsB1CkF9t9riu/QEZtSYyNg7fb1FmnkG
 JWsAXNOh2C9Hpeg6JwUOFAsE5yAy9pps7wS97RR3d364F5cgUJtXyaE7Dnps7hqouXvv
 gvDsjXpW70ZDDAsO4anSVYy6HQiDH+RZKB6bHrfpxU9nB5WX3Tehx3Czpd6HqL2mgb8w
 UojA==
X-Gm-Message-State: AOAM5324LHcNlnoBQ5rO+w1JN+9qEWPj4McHkzQm0K738CQSju7SNIdl
 WoPDLpFOjGUTJftQvv1b7YfneYwhPaq97A==
X-Google-Smtp-Source: ABdhPJyUGInzd8emdo5byqAhbp+/rlhBFNdbdj++6DmGFa/cFkR6kn2XUxOMJzmDgdtugQmDwiz0cA==
X-Received: by 2002:a17:90b:3901:b0:1db:f2a7:c881 with SMTP id
 ob1-20020a17090b390100b001dbf2a7c881mr9182781pjb.229.1651325407563; 
 Sat, 30 Apr 2022 06:30:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/43] target/m68k: Eliminate m68k_semi_is_fseek
Date: Sat, 30 Apr 2022 06:29:23 -0700
Message-Id: <20220430132932.324018-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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
index 94deebf09e..5b4c51957e 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -93,8 +93,11 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
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
@@ -108,8 +111,11 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
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
@@ -120,21 +126,6 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
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
@@ -149,6 +140,7 @@ static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
 
 void do_m68k_semihosting(CPUM68KState *env, int nr)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
     void *p;
@@ -167,7 +159,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "open,%s,%x,%x", arg0, (int)arg1,
+            gdb_do_syscall(m68k_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
                            arg2, arg3);
             return;
         } else {
@@ -188,7 +180,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             int fd = arg0;
             if (fd > 2) {
                 if (use_gdb_syscalls()) {
-                    gdb_do_syscall(m68k_semi_cb, "close,%x", arg0);
+                    gdb_do_syscall(m68k_semi_u32_cb, "close,%x", arg0);
                     return;
                 } else {
                     result = close(fd);
@@ -204,7 +196,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "read,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "read,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -224,7 +216,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "write,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "write,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -247,12 +239,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
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
@@ -262,7 +253,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "rename,%s,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "rename,%s,%s",
                            arg0, (int)arg1, arg2, (int)arg3);
             return;
         } else {
@@ -282,7 +273,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "unlink,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "unlink,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -301,7 +292,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(1);
         GET_ARG(2);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "stat,%s,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "stat,%s,%x",
                            arg0, (int)arg1, arg2);
             return;
         } else {
@@ -323,7 +314,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "fstat,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "fstat,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -338,7 +329,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "gettimeofday,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "gettimeofday,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -359,7 +350,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     case HOSTED_ISATTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "isatty,%x", arg0);
+            gdb_do_syscall(m68k_semi_u32_cb, "isatty,%x", arg0);
             return;
         } else {
             result = isatty(arg0);
@@ -369,7 +360,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "system,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "system,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -427,5 +418,5 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         result = 0;
     }
 failed:
-    m68k_semi_return_u32(env, result, errno);
+    m68k_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


