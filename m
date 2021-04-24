Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050A36A1EC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:06:39 +0200 (CEST)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKnm-0001qT-Ki
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhw-0005Qo-2x
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:36 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhq-0004Bu-Gm
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:35 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k25so8748646iob.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OVr7/iF9QwRMuNLkTonYfMoL4e8SyG1h9wUWyeqRXo=;
 b=x9XQKfJyRLaeQcIdMzK78P4K4lHT5iJbUS29EpZpbNm0IgZD3hVU1pYYjueN1woPJX
 m50yWYPO+hozPXbss+rQlemFK4JGrNnatdqcb6h/9Iayp86uFKHE36TG98tF1wNFgPbC
 NvLs8BWzEPbewe4Lgp3Q4qW7ln+6lZYFLGzqysuYAa72GzP67JZAp2bGzcszybAI2SPx
 MAtg8VSGznxsA8fp+Bo7cYzi+DpVSTzINFVfXu/Mwb5/DZgWfMtmlaIljYdNTzTS8RCP
 kM3u5Ny5zfndC7YxOO7eQk3JiI4XRDppLkws+5inZZaukpPMn3mG25JitcQEh86p1kk5
 Z/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OVr7/iF9QwRMuNLkTonYfMoL4e8SyG1h9wUWyeqRXo=;
 b=Wg9Vxg3pQ6Oob94NzCswsbUEMl8b5ZWDmh3cV3koEDaM1XV0O4V6sW+oJzWDrH7wYZ
 kT75ixPkWGSklFLLgX3AOyjC6sGPUwUeMbzt3SepCmPq/WC9ny6N7iIj77UOJqiiwyEF
 Qz5Bm19OcU6h7DRPTrQsUhmNTGewOQq9p1t2BYCTGfycQKB+lFpxAV5+Kv6HIk/xH3qQ
 jWoZcLyOAROCB3IwQo288CbD5G0vMztlYYMsuWuYu3dA2YMp78Y9+B1hQycRou2GV9ya
 D1GVC10r2d41RSM1Q/Uoi6FcEWpmfesYEmGgdMQFz5CBNR761VabAtvaNKrmYwdlr7w7
 5yjQ==
X-Gm-Message-State: AOAM532s9jyzKFC7CIjV3gBhtaP3PQEj6TZgDVq6/tBxRt8gjDlYRLWs
 BoWwwGqrqrEHrxUvjTB2PEv3KL4kq6ahC57C
X-Google-Smtp-Source: ABdhPJxTiI84J2+joDxd2vE1fZ0kLVER00plGlxNjUIb2C21Au3bGRksMELFq3gA5XuCLy1Xhc60DA==
X-Received: by 2002:a02:4e45:: with SMTP id r66mr8208081jaa.137.1619280029063; 
 Sat, 24 Apr 2021 09:00:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:28 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/48] bsd-user: whitespace changes
Date: Sat, 24 Apr 2021 09:59:31 -0600
Message-Id: <20210424160016.15200-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Space after keywords, no space for function calls and spaces around operators.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 798aba512c..455b8eddab 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -150,13 +150,13 @@ void cpu_loop(CPUX86State *env)
     abi_ulong pc;
     //target_siginfo_t info;
 
-    for(;;) {
+    for (;;) {
         cpu_exec_start(cs);
         trapnr = cpu_exec(cs);
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
 
-        switch(trapnr) {
+        switch (trapnr) {
         case 0x80:
             /* syscall from int $0x80 */
             if (bsd_type == target_freebsd) {
@@ -345,7 +345,7 @@ void cpu_loop(CPUX86State *env)
             {
                 int sig;
 
-                sig = gdb_handlesig (env, TARGET_SIGTRAP);
+                sig = gdb_handlesig(env, TARGET_SIGTRAP);
                 if (sig)
                   {
                     info.si_signo = sig;
@@ -398,7 +398,7 @@ static inline void save_window_offset(CPUSPARCState *env, int cwp1)
     printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
            sp_ptr, cwp1);
 #endif
-    for(i = 0; i < 16; i++) {
+    for (i = 0; i < 16; i++) {
         /* FIXME - what to do if put_user() fails? */
         put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
         sp_ptr += sizeof(abi_ulong);
@@ -448,7 +448,7 @@ static void restore_window(CPUSPARCState *env)
     printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
            sp_ptr, cwp1);
 #endif
-    for(i = 0; i < 16; i++) {
+    for (i = 0; i < 16; i++) {
         /* FIXME - what to do if get_user() fails? */
         get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
         sp_ptr += sizeof(abi_ulong);
@@ -468,7 +468,7 @@ static void flush_windows(CPUSPARCState *env)
     int offset, cwp1;
 
     offset = 1;
-    for(;;) {
+    for (;;) {
         /* if restore would invoke restore_window(), then we can stop */
         cwp1 = cpu_cwp_inc(env, env->cwp + offset);
 #ifndef TARGET_SPARC64
@@ -648,11 +648,11 @@ void cpu_loop(CPUSPARCState *env)
 #ifdef TARGET_SPARC64
         badtrap:
 #endif
-            printf ("Unhandled trap: 0x%x\n", trapnr);
+            printf("Unhandled trap: 0x%x\n", trapnr);
             cpu_dump_state(cs, stderr, 0);
-            exit (1);
+            exit(1);
         }
-        process_pending_signals (env);
+        process_pending_signals(env);
     }
 }
 
@@ -825,15 +825,15 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "cpu")) {
             cpu_model = argv[optind++];
             if (is_help_option(cpu_model)) {
-/* XXX: implement xxx_cpu_list for targets that still miss it */
+                /* XXX: implement xxx_cpu_list for targets that still miss it */
 #if defined(cpu_list)
-                    cpu_list();
+                cpu_list();
 #endif
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
-           guest_base = strtol(argv[optind++], NULL, 0);
-           have_guest_base = true;
+            guest_base = strtol(argv[optind++], NULL, 0);
+            have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
         } else if (!strcmp(r, "bsd")) {
@@ -958,7 +958,7 @@ int main(int argc, char **argv)
         }
     }
 
-    if (loader_exec(filename, argv+optind, target_environ, regs, info) != 0) {
+    if (loader_exec(filename, argv + optind, target_environ, regs, info) != 0) {
         printf("Error loading %s\n", filename);
         _exit(1);
     }
@@ -1053,8 +1053,8 @@ int main(int argc, char **argv)
     env->idt.limit = 255;
 #endif
     env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
-                                PROT_READ|PROT_WRITE,
-                                MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+                                PROT_READ | PROT_WRITE,
+                                MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
     idt_table = g2h_untagged(env->idt.base);
     set_idt(0, 0);
     set_idt(1, 0);
@@ -1082,8 +1082,8 @@ int main(int argc, char **argv)
     {
         uint64_t *gdt_table;
         env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
-                                    PROT_READ|PROT_WRITE,
-                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+                                    PROT_READ | PROT_WRITE,
+                                    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
         env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
         gdt_table = g2h_untagged(env->gdt.base);
 #ifdef TARGET_ABI32
@@ -1123,9 +1123,9 @@ int main(int argc, char **argv)
         env->pc = regs->pc;
         env->npc = regs->npc;
         env->y = regs->y;
-        for(i = 0; i < 8; i++)
+        for (i = 0; i < 8; i++)
             env->gregs[i] = regs->u_regs[i];
-        for(i = 0; i < 8; i++)
+        for (i = 0; i < 8; i++)
             env->regwptr[i] = regs->u_regs[i + 8];
     }
 #else
-- 
2.22.1


