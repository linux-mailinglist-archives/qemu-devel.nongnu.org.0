Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0635173
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 22:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYGTy-0002Vy-MF
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 16:56:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYG8j-0001Q9-Ef
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYG8i-0004ZF-2z
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:37 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYG8h-0004YQ-U0
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:36 -0400
Received: by mail-ot1-x342.google.com with SMTP id z23so5891841ote.13
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jHl7gkzT/N8BQj20qWalBWj0TcNnQlOd+W3G9t5Nacs=;
	b=dZHuwQbEIJt8Qafun4+DETs2m0+QjXaDjbE5XZRnUBykDRTLlfGnEJ7sDtixmSB3vR
	EoQeNy8OF8pZ49A8kkFOETuvxnDqKK4oOHW3s+xycV3r/ZEam8hlr7Hfpoz0OtMY+6cA
	fm4UXDjBKNWrUsEtAgmJhdxsMvLdkcU5RuLe59FXdojeLeXlmKJyZe3eJGCxXhuDUDSD
	2oNKoE6DKmVZQZlbxvig0pQj+H2RdxpSE9SFyuRJdCxtMORhdZDfFa9XZPAkrLZ9ZAyA
	0S1AQu/LgojlB9GneKdJzTxmeJm1LADT5v55yV7u6mtmEJDGdqJWJXob7UWr3WkBG953
	QEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jHl7gkzT/N8BQj20qWalBWj0TcNnQlOd+W3G9t5Nacs=;
	b=r04Bh/QtbBub3xhzefwG1nvwv3imp4bcspsqx3PzDIPpMxUcMJi4KOkgWx6PAg5pKK
	ekd+hs1RQ5yeU5ByJuThDyZTlXwMkxO7aYXjZUbE7ajMcaOCLm0Lvpxon3XPg3XkTicE
	DATjhkjPUVNbwyw+xlHHPFUGdYbKOLa8R21TQhanYRAO/QmGS3WjdmcQfaUGTjUqVSeh
	eeomRfbOqlDEoJgkYFg59jP1BbP16Kwfzr5KXQr3yAPKirG3PMLnt0S4L/wY3ka0rMCq
	fzRDqUYgjYNmDL9dHy/GBTIrBPfbaJBtnJ4TCUdO1Hy45XlcIM/i9/DGDyf79oLwYRwl
	5jkQ==
X-Gm-Message-State: APjAAAVG+O49bX5MMghm4EFL296CIJq95h/Ls/hIVjj4bybVHlUDOZIw
	LuNAujsIvEwY/kJN1jDdHWwdcX3KIBbt2Q==
X-Google-Smtp-Source: APXvYqwp4LUz3yFMxLG1d0uQ8d2vumzgXzeHD5BxaYEO+binwIAVThSV2VTjgcSak7dZsSc28NYZxA==
X-Received: by 2002:a9d:69d9:: with SMTP id v25mr1735756oto.4.1559680474928;
	Tue, 04 Jun 2019 13:34:34 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id h1sm5979901otj.78.2019.06.04.13.34.33
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 13:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 15:33:37 -0500
Message-Id: <20190604203351.27778-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604203351.27778-1-richard.henderson@linaro.org>
References: <20190604203351.27778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: [Qemu-devel] [PATCH v4 25/39] target/sh4: Use env_cpu, env_archcpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup in the boilerplate that each target must define.
Replace sh_env_get_cpu with env_archcpu.  The combination
CPU(sh_env_get_cpu) should have used ENV_GET_CPU to begin;
use env_cpu now.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.h          |  5 -----
 linux-user/sh4/cpu_loop.c |  2 +-
 target/sh4/helper.c       | 26 ++++++++++++--------------
 target/sh4/op_helper.c    |  9 +++------
 4 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 8b17e6d63e..089eea261c 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -207,11 +207,6 @@ struct SuperHCPU {
     CPUSH4State env;
 };
 
-static inline SuperHCPU *sh_env_get_cpu(CPUSH4State *env)
-{
-    return container_of(env, SuperHCPU, env);
-}
-
 #define ENV_OFFSET offsetof(SuperHCPU, env)
 
 void superh_cpu_do_interrupt(CPUState *cpu);
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 59cbbeda7e..add8817d86 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -23,7 +23,7 @@
 
 void cpu_loop(CPUSH4State *env)
 {
-    CPUState *cs = CPU(sh_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     int trapnr, ret;
     target_siginfo_t info;
 
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index fda195e7cb..2afc1770d8 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -216,8 +216,6 @@ static void update_itlb_use(CPUSH4State * env, int itlbnb)
 
 static int itlb_replacement(CPUSH4State * env)
 {
-    SuperHCPU *cpu = sh_env_get_cpu(env);
-
     if ((env->mmucr & 0xe0000000) == 0xe0000000) {
 	return 0;
     }
@@ -230,7 +228,7 @@ static int itlb_replacement(CPUSH4State * env)
     if ((env->mmucr & 0x2c000000) == 0x00000000) {
 	return 3;
     }
-    cpu_abort(CPU(cpu), "Unhandled itlb_replacement");
+    cpu_abort(env_cpu(env), "Unhandled itlb_replacement");
 }
 
 /* Find the corresponding entry in the right TLB
@@ -286,7 +284,7 @@ static int copy_utlb_entry_itlb(CPUSH4State *env, int utlb)
     itlb = itlb_replacement(env);
     ientry = &env->itlb[itlb];
     if (ientry->v) {
-        tlb_flush_page(CPU(sh_env_get_cpu(env)), ientry->vpn << 10);
+        tlb_flush_page(env_cpu(env), ientry->vpn << 10);
     }
     *ientry = env->utlb[utlb];
     update_itlb_use(env, itlb);
@@ -448,14 +446,14 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 
 void cpu_load_tlb(CPUSH4State * env)
 {
-    SuperHCPU *cpu = sh_env_get_cpu(env);
+    CPUState *cs = env_cpu(env);
     int n = cpu_mmucr_urc(env->mmucr);
     tlb_t * entry = &env->utlb[n];
 
     if (entry->v) {
         /* Overwriting valid entry in utlb. */
         target_ulong address = entry->vpn << 10;
-        tlb_flush_page(CPU(cpu), address);
+        tlb_flush_page(cs, address);
     }
 
     /* Take values into cpu status from registers. */
@@ -478,7 +476,7 @@ void cpu_load_tlb(CPUSH4State * env)
         entry->size = 1024 * 1024; /* 1M */
         break;
     default:
-        cpu_abort(CPU(cpu), "Unhandled load_tlb");
+        cpu_abort(cs, "Unhandled load_tlb");
         break;
     }
     entry->sh   = (uint8_t)cpu_ptel_sh(env->ptel);
@@ -505,7 +503,7 @@ void cpu_load_tlb(CPUSH4State * env)
         entry->v = 0;
     }
 
-    tlb_flush(CPU(sh_env_get_cpu(s)));
+    tlb_flush(env_cpu(s));
 }
 
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
@@ -531,7 +529,7 @@ void cpu_sh4_write_mmaped_itlb_addr(CPUSH4State *s, hwaddr addr,
     if (entry->v) {
         /* Overwriting valid entry in itlb. */
         target_ulong address = entry->vpn << 10;
-        tlb_flush_page(CPU(sh_env_get_cpu(s)), address);
+        tlb_flush_page(env_cpu(s), address);
     }
     entry->asid = asid;
     entry->vpn = vpn;
@@ -573,7 +571,7 @@ void cpu_sh4_write_mmaped_itlb_data(CPUSH4State *s, hwaddr addr,
         if (entry->v) {
             /* Overwriting valid entry in utlb. */
             target_ulong address = entry->vpn << 10;
-            tlb_flush_page(CPU(sh_env_get_cpu(s)), address);
+            tlb_flush_page(env_cpu(s), address);
         }
         entry->ppn = (mem_value & 0x1ffffc00) >> 10;
         entry->v   = (mem_value & 0x00000100) >> 8;
@@ -626,7 +624,7 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
             if (entry->vpn == vpn
                 && (!use_asid || entry->asid == asid || entry->sh)) {
 	        if (utlb_match_entry) {
-                    CPUState *cs = CPU(sh_env_get_cpu(s));
+                    CPUState *cs = env_cpu(s);
 
 		    /* Multiple TLB Exception */
                     cs->exception_index = 0x140;
@@ -658,13 +656,13 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
 	}
 
         if (needs_tlb_flush) {
-            tlb_flush_page(CPU(sh_env_get_cpu(s)), vpn << 10);
+            tlb_flush_page(env_cpu(s), vpn << 10);
         }
     } else {
         int index = (addr & 0x00003f00) >> 8;
         tlb_t * entry = &s->utlb[index];
 	if (entry->v) {
-            CPUState *cs = CPU(sh_env_get_cpu(s));
+            CPUState *cs = env_cpu(s);
 
 	    /* Overwriting valid entry in utlb. */
             target_ulong address = entry->vpn << 10;
@@ -719,7 +717,7 @@ void cpu_sh4_write_mmaped_utlb_data(CPUSH4State *s, hwaddr addr,
         if (entry->v) {
             /* Overwriting valid entry in utlb. */
             target_ulong address = entry->vpn << 10;
-            tlb_flush_page(CPU(sh_env_get_cpu(s)), address);
+            tlb_flush_page(env_cpu(s), address);
         }
         entry->ppn = (mem_value & 0x1ffffc00) >> 10;
         entry->v   = (mem_value & 0x00000100) >> 8;
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 932aa7a7c7..14c3db0f48 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -46,10 +46,7 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 void helper_ldtlb(CPUSH4State *env)
 {
 #ifdef CONFIG_USER_ONLY
-    SuperHCPU *cpu = sh_env_get_cpu(env);
-
-    /* XXXXX */
-    cpu_abort(CPU(cpu), "Unhandled ldtlb");
+    cpu_abort(env_cpu(env), "Unhandled ldtlb");
 #else
     cpu_load_tlb(env);
 #endif
@@ -58,7 +55,7 @@ void helper_ldtlb(CPUSH4State *env)
 static inline void QEMU_NORETURN raise_exception(CPUSH4State *env, int index,
                                                  uintptr_t retaddr)
 {
-    CPUState *cs = CPU(sh_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
 
     cs->exception_index = index;
     cpu_loop_exit_restore(cs, retaddr);
@@ -91,7 +88,7 @@ void helper_debug(CPUSH4State *env)
 
 void helper_sleep(CPUSH4State *env)
 {
-    CPUState *cs = CPU(sh_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
 
     cs->halted = 1;
     env->in_sleep = 1;
-- 
2.17.1


