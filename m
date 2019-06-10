Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE073ACD0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 04:10:11 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ha9lC-0003YA-Ic
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 22:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52919)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9dp-0005mV-Lk
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9do-0001do-G8
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:33 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44615)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ha9do-0001dJ-9Y
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:32 -0400
Received: by mail-pg1-x52b.google.com with SMTP id n2so4138535pgp.11
 for <qemu-devel@nongnu.org>; Sun, 09 Jun 2019 19:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=98JOxuqlJVZoGMNI/F+3Atqcd/SU0QC/Vy6EmOYsiac=;
 b=tfXfKcyQfSWBaf2iFwZWPXPzYxIt4apQjvSUpd8kyuGBenNSJ9eySIt4Hh0o7qjJd3
 TACGFkh8dsUqQwMyH55eCa8awSru01sz0nIKvhLpMPB0HP0HDG9vFke0/Z5RKr4dqo9H
 zwAHmyVB+aF5o2EeG2nasXVGJY+Q7tPh5poewMGspxiD4LipgxKabWfV8X3LA8V2PbSa
 N7PlfsacF12AaE3Mfvvr5XpodxQCnIwWoRO5+WCpsnb6eXoDdurUsZP/1WrejUWfrIV0
 NUGCoC7bjwPUxyzTabN195vUmNsnIqCx6neZlkovzYBsZCdA+32ksUe8MppTOfBOXXwv
 eh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=98JOxuqlJVZoGMNI/F+3Atqcd/SU0QC/Vy6EmOYsiac=;
 b=PYqM1zRFdqx7SzFyTzKFSWipxldoUBZW7d73ZcBDrWoOqIO9BAasRQz7rQ8hJdSuUn
 F6wWUjuJFILcUxGvydieNQt+ZOLs9kNaE9O/IZNTF4y8W6WXGvxtHIo+bFcZXcBi+iYy
 R9hb5U7hNHFCISbpZ9kkTG7OknG6CVng+X0l3iU9cwpsleJynfSLBQXZPTjDPliauMko
 QJer3KkWAW4TQBc87sQ/DRl4ESD8z51E8K6fe2v1QGxRvYNeWzMyhy59mP0hRcHp49Y1
 XNmF78IWjHgKnUxYQqQvZrFyN6m8wLh1/ztaGmUHTEusT5hz9ULGNJwyhmdVk4ej9OYu
 eP6Q==
X-Gm-Message-State: APjAAAVmrLlzFfDBGLpXhhGxLnf0cGu8preC2YPz6SHWxFWovspfYEDC
 TxHndMTrc4q2YHBKbKalRtSOhstHkdE=
X-Google-Smtp-Source: APXvYqxmisLsYS5Tr252CcWZsTd1r4WHsVW/clUQ8KqWCQG3YxVFypASPO3shBSVWhLktggJ99Touw==
X-Received: by 2002:a62:1993:: with SMTP id 141mr69706947pfz.97.1560132150781; 
 Sun, 09 Jun 2019 19:02:30 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
 [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id l63sm9749013pfl.181.2019.06.09.19.02.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 19:02:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun,  9 Jun 2019 19:01:47 -0700
Message-Id: <20190610020218.9228-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610020218.9228-1-richard.henderson@linaro.org>
References: <20190610020218.9228-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: [Qemu-devel] [PULL 08/39] target/alpha: Use env_cpu, env_archcpu
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup in the boilerplate that each target must define.
Replace alpha_env_get_cpu with env_archcpu.  The combination
CPU(alpha_env_get_cpu) should have used ENV_GET_CPU to begin;
use env_cpu now.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h          | 5 -----
 linux-user/alpha/cpu_loop.c | 2 +-
 target/alpha/helper.c       | 8 +++-----
 target/alpha/sys_helper.c   | 8 ++++----
 4 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index e391195be0..86d3e953b9 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -278,11 +278,6 @@ struct AlphaCPU {
     QEMUTimer *alarm_timer;
 };
 
-static inline AlphaCPU *alpha_env_get_cpu(CPUAlphaState *env)
-{
-    return container_of(env, AlphaCPU, env);
-}
-
 #define ENV_OFFSET offsetof(AlphaCPU, env)
 
 #ifndef CONFIG_USER_ONLY
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 61992571e1..7a94eee84c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -23,7 +23,7 @@
 
 void cpu_loop(CPUAlphaState *env)
 {
-    CPUState *cs = CPU(alpha_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     int trapnr;
     target_siginfo_t info;
     abi_long sysret;
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 2134ee1e9d..93b8e788b1 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -136,7 +136,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
                                 int prot_need, int mmu_idx,
                                 target_ulong *pphys, int *pprot)
 {
-    CPUState *cs = CPU(alpha_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     target_long saddr = addr;
     target_ulong phys = 0;
     target_ulong L1pte, L2pte, L3pte;
@@ -486,8 +486,7 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
    We expect that ENV->PC has already been updated.  */
 void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)
 {
-    AlphaCPU *cpu = alpha_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
 
     cs->exception_index = excp;
     env->error_code = error;
@@ -498,8 +497,7 @@ void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)
 void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
                                 int excp, int error)
 {
-    AlphaCPU *cpu = alpha_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
 
     cs->exception_index = excp;
     env->error_code = error;
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index ac22323191..f9c34b1144 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -44,17 +44,17 @@ uint64_t helper_load_pcc(CPUAlphaState *env)
 #ifndef CONFIG_USER_ONLY
 void helper_tbia(CPUAlphaState *env)
 {
-    tlb_flush(CPU(alpha_env_get_cpu(env)));
+    tlb_flush(env_cpu(env));
 }
 
 void helper_tbis(CPUAlphaState *env, uint64_t p)
 {
-    tlb_flush_page(CPU(alpha_env_get_cpu(env)), p);
+    tlb_flush_page(env_cpu(env), p);
 }
 
 void helper_tb_flush(CPUAlphaState *env)
 {
-    tb_flush(CPU(alpha_env_get_cpu(env)));
+    tb_flush(env_cpu(env));
 }
 
 void helper_halt(uint64_t restart)
@@ -78,7 +78,7 @@ uint64_t helper_get_walltime(void)
 
 void helper_set_alarm(CPUAlphaState *env, uint64_t expire)
 {
-    AlphaCPU *cpu = alpha_env_get_cpu(env);
+    AlphaCPU *cpu = env_archcpu(env);
 
     if (expire) {
         env->alarm_expire = expire;
-- 
2.17.1


