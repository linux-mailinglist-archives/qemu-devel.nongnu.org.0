Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915C37CEA4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:22:59 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsZW-00055Z-KT
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUH-0006zM-4N
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:33 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUE-0008GW-SV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:32 -0400
Received: by mail-io1-xd29.google.com with SMTP id n10so22389712ion.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J8Y1xFsUbnggFmWIJScpTRSuMSFl+Bq/LAbgdOuZaAs=;
 b=nmVhV9qb6kxVodbtl6/yoxzEeJSUjI9fnBwnYjU3JCpzi2wqJeJf0lWMbZmMJhrLnl
 7XJcUCkoPcrpsJtaxfKQ8CeGiSXLGBAv3PY9s9zF1atoFWJb4cMqVLtbCLFnNhfnnfPW
 ZsRQ4KvcIN8pB6AHEwli51Eke73lRoN7etAN8CM6GogpCqkcQw6n47aSf48k+d0tGzw0
 GsobFmrw4Hh6edSW7RsnyIRlKsjw3LY1xwwDnKHQgrLDSv++obVICRWz4W4r9G51iwIz
 ACVcdlyQAWp0rSrvqRKzcLwNNGGjp13KGz318niqQ3b7MfZRARHvIVD9Bb1xxvQ9rfb5
 0lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J8Y1xFsUbnggFmWIJScpTRSuMSFl+Bq/LAbgdOuZaAs=;
 b=dlX/WRhiUBCgt8fB7Je6HoSGXW3zkVJNCvDek8lO9cFz3vwu2jKpvokbNdy3kMfuv8
 MAzFi/jHvwkqKYYWx3+A1RTb4CT4xNig4ubP+Cm3uPOS1913n3TgsJ0oyZIu5uzEbYFN
 GRq0CeUo4J2jy2kb3iudlJJuOdw0AC3cwhCBtCVqF0UC8V+oLhUfjS7XJb1lln12roij
 oMciFpetq5JjdQFeYcG2dbwrNQNXmxPM+jow9+0FI5p7cZF9USoBVHWHQIEaGE/27AnV
 ZBe67wYpBBz9fUuYkNJl3TC8TppRlHShwtj98djT6ZPCg1CbYUGytKHYQwbYKxJYS6PW
 +7XQ==
X-Gm-Message-State: AOAM532nDNnnnd5q16H5AVHHVMHgLaRswzZq5s7Ymf9cAmUeYDsMfzkw
 lJGQRcebE+++NbmVggEHgn27fevZG3stSQ==
X-Google-Smtp-Source: ABdhPJwEpXLPSzsmNIgf3nxdVx1PZmCGNDZwQUdlup8bfo0b7mZh4t8bny/hU3FQu2GEYfcdbeJ+0Q==
X-Received: by 2002:a02:5142:: with SMTP id s63mr32918307jaa.82.1620839848698; 
 Wed, 12 May 2021 10:17:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] bsd-user: whitespace changes
Date: Wed, 12 May 2021 11:17:01 -0600
Message-Id: <20210512171720.46744-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Space after keywords, no space for function calls and spaces around operators.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 36a889d084..079520737b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -149,13 +149,13 @@ void cpu_loop(CPUX86State *env)
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
@@ -344,7 +344,7 @@ void cpu_loop(CPUX86State *env)
             {
                 int sig;
 
-                sig = gdb_handlesig (env, TARGET_SIGTRAP);
+                sig = gdb_handlesig(env, TARGET_SIGTRAP);
                 if (sig)
                   {
                     info.si_signo = sig;
@@ -397,7 +397,7 @@ static inline void save_window_offset(CPUSPARCState *env, int cwp1)
     printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
            sp_ptr, cwp1);
 #endif
-    for(i = 0; i < 16; i++) {
+    for (i = 0; i < 16; i++) {
         /* FIXME - what to do if put_user() fails? */
         put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
         sp_ptr += sizeof(abi_ulong);
@@ -447,7 +447,7 @@ static void restore_window(CPUSPARCState *env)
     printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
            sp_ptr, cwp1);
 #endif
-    for(i = 0; i < 16; i++) {
+    for (i = 0; i < 16; i++) {
         /* FIXME - what to do if get_user() fails? */
         get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
         sp_ptr += sizeof(abi_ulong);
@@ -467,7 +467,7 @@ static void flush_windows(CPUSPARCState *env)
     int offset, cwp1;
 
     offset = 1;
-    for(;;) {
+    for (;;) {
         /* if restore would invoke restore_window(), then we can stop */
         cwp1 = cpu_cwp_inc(env, env->cwp + offset);
 #ifndef TARGET_SPARC64
@@ -647,11 +647,11 @@ void cpu_loop(CPUSPARCState *env)
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
 
@@ -824,15 +824,15 @@ int main(int argc, char **argv)
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
@@ -957,7 +957,7 @@ int main(int argc, char **argv)
         }
     }
 
-    if (loader_exec(filename, argv+optind, target_environ, regs, info) != 0) {
+    if (loader_exec(filename, argv + optind, target_environ, regs, info) != 0) {
         printf("Error loading %s\n", filename);
         _exit(1);
     }
@@ -1052,8 +1052,8 @@ int main(int argc, char **argv)
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
@@ -1081,8 +1081,8 @@ int main(int argc, char **argv)
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
@@ -1122,9 +1122,9 @@ int main(int argc, char **argv)
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


