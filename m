Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CCC67EC9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 13:14:14 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmcSL-0001vK-MD
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 07:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60353)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcR8-0005he-PW
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcR6-0006NQ-SQ
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:12:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36590)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hmcR6-0006N8-Kj
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:12:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id g67so8393093wme.1
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2019 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KHFpSRHm8eke5kb9WIbzFk3DWe+3YkG7SdTFpV8kP0M=;
 b=CX0UOX1uqVpfp2rjhTU1HltFf39Mebnt7EbpNmQg+pSQHEs3GPQKh8vgFVyZWXE/o9
 PC9NYuiL9HinzFoXryopKFW65ycCHr3MkrHKwuqsGxksWSagi6qy0po0S/G6t89R061U
 KXXXBv06BHl1lwTznxzHb3KerRQrDIGcUe/QTg7R8W5qRqUA+QKnRRgXHaD+ppBqNkr8
 H1jg60nu8tfeaF3Sjacso7bXR1Y/VEjV6lsNFSSjnw49l2v5QbSUB0+JiaFJKNldReZn
 pxV5TEjm0PLjvnUM/Yhtqlak+PpxxVphYI3rWsRQyOyKsOdmP5HZSYwRLI948WP8tLzL
 k+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHFpSRHm8eke5kb9WIbzFk3DWe+3YkG7SdTFpV8kP0M=;
 b=R7J+5KG0qs6XlOAm/MsKGAqtF+J6qVggd1Hm3pAcyvBxTIO6na/zqmNGGxNgHuM9eK
 cpNlLodF0MbQ/wXn5O2ST64LW5fdHkpTNF1C4qpm/LoRfudvqzGvUYfllStEwQruyEr9
 Rm+bj5tRpPj7gQ1eBcLGIDn6eFSvT7gLQw+F9gc37gn2l8xEI0gPMpCF7FUHX2Wde4Rb
 bv5GsmcnHQoIaSiqiKkYIH42ihYUL1eBdPmPh0pMqtg6FQ/OBu2jt6yGFB2WlKbMuVG3
 tDcFTG0ImJ16XaXk5pavi+lmZh+YjokdzpyZCS5DTAukF9WVIlWuJ+MzNKqL3QUInO6s
 jfCw==
X-Gm-Message-State: APjAAAW4dlHMgmA7h88QDJuqYpoi7LV9k+C/onuKk/xp0HzmvxHJPVAX
 EYD4rOsH91wPr96qCdngNRRpPES2Ok69WQ==
X-Google-Smtp-Source: APXvYqx4xc4ZEutQBY7I7tAWyxUEiUlVCLUqo8tPF3II+ad0O7ZhzmExnDNtZHi1bKBT6MLC3IY4pQ==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr18788939wmf.45.1563102775188; 
 Sun, 14 Jul 2019 04:12:55 -0700 (PDT)
Received: from localhost.localdomain ([194.144.248.241])
 by smtp.gmail.com with ESMTPSA id f17sm12675795wmf.27.2019.07.14.04.12.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 14 Jul 2019 04:12:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 14 Jul 2019 11:12:46 +0000
Message-Id: <20190714111249.13859-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190714111249.13859-1-richard.henderson@linaro.org>
References: <20190714111249.13859-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: [Qemu-devel] [PULL for-4.1 4/7] tcg: Introduce
 set/clear_helper_retaddr
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

At present we have a potential error in that helper_retaddr contains
data for handle_cpu_signal, but we have not ensured that those stores
will be scheduled properly before the operation that may fault.

It might be that these races are not in practice observable, due to
our use of -fno-strict-aliasing, but better safe than sorry.

Adjust all of the setters of helper_retaddr.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h                   | 20 +++++++++++
 include/exec/cpu_ldst_useronly_template.h | 12 +++----
 accel/tcg/user-exec.c                     | 11 +++---
 target/arm/helper-a64.c                   |  8 ++---
 target/arm/sve_helper.c                   | 43 +++++++++++------------
 5 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a08b11bd2c..9de8c93303 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -89,6 +89,26 @@ typedef target_ulong abi_ptr;
 
 extern __thread uintptr_t helper_retaddr;
 
+static inline void set_helper_retaddr(uintptr_t ra)
+{
+    helper_retaddr = ra;
+    /*
+     * Ensure that this write is visible to the SIGSEGV handler that
+     * may be invoked due to a subsequent invalid memory operation.
+     */
+    signal_barrier();
+}
+
+static inline void clear_helper_retaddr(void)
+{
+    /*
+     * Ensure that previous memory operations have succeeded before
+     * removing the data visible to the signal handler.
+     */
+    signal_barrier();
+    helper_retaddr = 0;
+}
+
 /* In user-only mode we provide only the _code and _data accessors. */
 
 #define MEMSUFFIX _data
diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu_ldst_useronly_template.h
index bc45e2b8d4..e65733f7e2 100644
--- a/include/exec/cpu_ldst_useronly_template.h
+++ b/include/exec/cpu_ldst_useronly_template.h
@@ -78,9 +78,9 @@ glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
                                                   uintptr_t retaddr)
 {
     RES_TYPE ret;
-    helper_retaddr = retaddr;
+    set_helper_retaddr(retaddr);
     ret = glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(env, ptr);
-    helper_retaddr = 0;
+    clear_helper_retaddr();
     return ret;
 }
 
@@ -102,9 +102,9 @@ glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
                                                   uintptr_t retaddr)
 {
     int ret;
-    helper_retaddr = retaddr;
+    set_helper_retaddr(retaddr);
     ret = glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(env, ptr);
-    helper_retaddr = 0;
+    clear_helper_retaddr();
     return ret;
 }
 #endif
@@ -128,9 +128,9 @@ glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUArchState *env,
                                                   RES_TYPE v,
                                                   uintptr_t retaddr)
 {
-    helper_retaddr = retaddr;
+    set_helper_retaddr(retaddr);
     glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(env, ptr, v);
-    helper_retaddr = 0;
+    clear_helper_retaddr();
 }
 #endif
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cb5f4b19c5..4384b59a4d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -134,7 +134,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
              * currently executing TB was modified and must be exited
              * immediately.  Clear helper_retaddr for next execution.
              */
-            helper_retaddr = 0;
+            clear_helper_retaddr();
             cpu_exit_tb_from_sighandler(cpu, old_set);
             /* NORETURN */
 
@@ -152,7 +152,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
      * an exception.  Undo signal and retaddr state prior to longjmp.
      */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-    helper_retaddr = 0;
+    clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
     access_type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
@@ -682,14 +682,15 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    helper_retaddr = retaddr;
-    return g2h(addr);
+    void *ret = g2h(addr);
+    set_helper_retaddr(retaddr);
+    return ret;
 }
 
 /* Macro to call the above, with local variables from the use context.  */
 #define ATOMIC_MMU_DECLS do {} while (0)
 #define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, DATA_SIZE, GETPC())
-#define ATOMIC_MMU_CLEANUP do { helper_retaddr = 0; } while (0)
+#define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
 
 #define ATOMIC_NAME(X)   HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
 #define EXTRA_ARGS
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 44e45a8037..060699b901 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -554,7 +554,7 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
     /* ??? Enforce alignment.  */
     uint64_t *haddr = g2h(addr);
 
-    helper_retaddr = ra;
+    set_helper_retaddr(ra);
     o0 = ldq_le_p(haddr + 0);
     o1 = ldq_le_p(haddr + 1);
     oldv = int128_make128(o0, o1);
@@ -564,7 +564,7 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
         stq_le_p(haddr + 0, int128_getlo(newv));
         stq_le_p(haddr + 1, int128_gethi(newv));
     }
-    helper_retaddr = 0;
+    clear_helper_retaddr();
 #else
     int mem_idx = cpu_mmu_index(env, false);
     TCGMemOpIdx oi0 = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
@@ -624,7 +624,7 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
     /* ??? Enforce alignment.  */
     uint64_t *haddr = g2h(addr);
 
-    helper_retaddr = ra;
+    set_helper_retaddr(ra);
     o1 = ldq_be_p(haddr + 0);
     o0 = ldq_be_p(haddr + 1);
     oldv = int128_make128(o0, o1);
@@ -634,7 +634,7 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
         stq_be_p(haddr + 0, int128_gethi(newv));
         stq_be_p(haddr + 1, int128_getlo(newv));
     }
-    helper_retaddr = 0;
+    clear_helper_retaddr();
 #else
     int mem_idx = cpu_mmu_index(env, false);
     TCGMemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fd434c66ea..fc0c1755d2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4125,12 +4125,11 @@ static intptr_t max_for_page(target_ulong base, intptr_t mem_off,
     return MIN(split, mem_max - mem_off) + mem_off;
 }
 
-static inline void set_helper_retaddr(uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    helper_retaddr = ra;
+#ifndef CONFIG_USER_ONLY
+/* These are normally defined only for CONFIG_USER_ONLY in <exec/cpu_ldst.h> */
+static inline void set_helper_retaddr(uintptr_t ra) { }
+static inline void clear_helper_retaddr(void) { }
 #endif
-}
 
 /*
  * The result of tlb_vaddr_to_host for user-only is just g2h(x),
@@ -4188,7 +4187,7 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            set_helper_retaddr(0);
+            clear_helper_retaddr();
             /* After having taken any fault, zero leading inactive elements. */
             swap_memzero(vd, reg_off);
             return;
@@ -4239,7 +4238,7 @@ static void sve_ld1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
     memcpy(vd, &scratch, reg_max);
 }
 
@@ -4312,7 +4311,7 @@ static void sve_ld2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * size;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4341,7 +4340,7 @@ static void sve_ld3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * size;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4372,7 +4371,7 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * size;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(&env->vfp.zregs[rd], &scratch[0], oprsz);
@@ -4494,7 +4493,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         if (test_host_page(host)) {
             mem_off = host_fn(vd, vg, host - mem_off, mem_off, mem_max);
             tcg_debug_assert(mem_off == mem_max);
-            set_helper_retaddr(0);
+            clear_helper_retaddr();
             /* After any fault, zero any leading inactive elements.  */
             swap_memzero(vd, reg_off);
             return;
@@ -4537,7 +4536,7 @@ static void sve_ldff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     }
 #endif
 
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
     record_fault(env, reg_off, reg_max);
 }
 
@@ -4740,7 +4739,7 @@ static void sve_st1_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += msize;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4766,7 +4765,7 @@ static void sve_st2_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 2 * msize;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4794,7 +4793,7 @@ static void sve_st3_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 3 * msize;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
@@ -4824,7 +4823,7 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
             addr += 4 * msize;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 #define DO_STN_1(N, NAME, ESIZE) \
@@ -4932,7 +4931,7 @@ static void sve_ld1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz);
@@ -4955,7 +4954,7 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, &scratch, i * 8, base + (off << scale), oi, ra);
         }
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 
     /* Wait until all exceptions have been raised to write back.  */
     memcpy(vd, &scratch, oprsz * 8);
@@ -5133,7 +5132,7 @@ static inline void sve_ldff1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
         tlb_fn(env, vd, reg_off, addr, oi, ra);
 
         /* The rest of the reads will be non-faulting.  */
-        set_helper_retaddr(0);
+        clear_helper_retaddr();
     }
 
     /* After any fault, zero the leading predicated false elements.  */
@@ -5175,7 +5174,7 @@ static inline void sve_ldff1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
         tlb_fn(env, vd, reg_off, addr, oi, ra);
 
         /* The rest of the reads will be non-faulting.  */
-        set_helper_retaddr(0);
+        clear_helper_retaddr();
     }
 
     /* After any fault, zero the leading predicated false elements.  */
@@ -5299,7 +5298,7 @@ static void sve_st1_zs(CPUARMState *env, void *vd, void *vg, void *vm,
             i += 4, pg >>= 4;
         } while (i & 15);
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
@@ -5318,7 +5317,7 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
             tlb_fn(env, vd, i * 8, base + (off << scale), oi, ra);
         }
     }
-    set_helper_retaddr(0);
+    clear_helper_retaddr();
 }
 
 #define DO_ST1_ZPZ_S(MEM, OFS) \
-- 
2.17.1


