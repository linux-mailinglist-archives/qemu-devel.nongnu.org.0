Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C92369B72
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:42:01 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2ci-0006sL-QA
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aa-00055V-52
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:48 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aY-0007v4-EG
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:47 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 i26-20020a9d625a0000b02902a2119f7613so9583456otk.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFfeE9NrqKLi2T7g5naTvNLQTZSCOawrbK1LnSvxfQI=;
 b=hNO9muwhvwumi2IqJ4LyGT/cfPIM5LdurQFgetc0+9/Q45rnBoxWZgnVV+ucB5BwnT
 l/XgLwZ2bNDrYyVJF6IppPp5cXL5Va8PfBvFC4T8cLHEZXfWSDHCZLqerUWFpQcAstvs
 OHSd886+s3L/p4AzUoDQd73XqdrYTMMKgvv12sGH644xExmSzV43CNP+AVn4WkXemUiR
 4dSpjVTou/AfRjJBfl8ARPXzBdDsx8NnMwHcHVYzMurmpwECt5ISFPD008u8mCUJ8W7G
 JV6s1vvTdkWO78F+8C2XlfagpqsAP6VwNDJo0fCv8eWDsCtOtVI/QzrHcsA86FmK+gbb
 Dg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFfeE9NrqKLi2T7g5naTvNLQTZSCOawrbK1LnSvxfQI=;
 b=KtNhtZLRTCEwM6Qe4xyKQXrZfKfK2w6n+4J3i4722jNOu9Ol65x83tT6CMcRVFxdiH
 quIJnjhmBuj8z9s3Lr2D4NI4GnAAhgYKJ0S4zHGuHBVoTXy6d+rlZo7vbkdfOZU+PkpZ
 SacpDqDHKkAlkv5Y4V8+N/ECh2iodwf3O7Lz0alpmhT3aW2waDriJa4Cmu0Htb85sy2y
 jA57foH4elt/dQccIV+0bMspsFVzS1xiEeFwLxw3uN1KMfRf8REnHRlib8wZDtNc05Nt
 a8S0pvVJkF7wh+jm/IE5e9NAttqmx+J6a7G9e3eRlJfOHndcEcA7+WboP0jiEHNmumE7
 IqXA==
X-Gm-Message-State: AOAM5313yYxuCU+2aq0tsh85JJhIIhFFf6wGEVF7dIAQyWPXDA/ylicI
 ltoQQcBgol6Azm80qbtt3u/cNsFzLdzNazFc
X-Google-Smtp-Source: ABdhPJztKdT38fcZLwUe9ze3oJxYwt8xsowd6WarIrpl+YBFRY3kZJF/FfMBtlkEGKg82pyItAY4sg==
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr4930737otn.14.1619210385085; 
 Fri, 23 Apr 2021 13:39:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:44 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] bsd-user: whitespace changes
Date: Fri, 23 Apr 2021 14:39:29 -0600
Message-Id: <20210423203935.78225-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::334;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x334.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Space after keywords, no space for function calls and spaces around operators.

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


