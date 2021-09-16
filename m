Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BB40DDBC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:15:58 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt7F-0005VV-0L
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4I-0002qP-6L
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4D-0004DP-Ja
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:53 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4aEC-1mRQlF018I-001kll; Thu, 16
 Sep 2021 17:12:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] linux-user: Fix coding style nits in qemu.h
Date: Thu, 16 Sep 2021 17:12:28 +0200
Message-Id: <20210916151237.1188301-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sKpQL72kQCXKyE2AtzkNdtHMCcm6TBG2i9GqYfxFcQobZ78vXG+
 ihseQD2mxFD/LjLxXAO1d8+kpT22efqoXEueOo/7C0XY/o2RKKPp7JoVv4mRsL7Nazrjn0C
 NlZDjjc+1erqP2b5Qr27avAKMdfKi+2gfPBQW8KnMi55U4Q8tkcv46PXCVTTK3+l3AGAhZi
 FvYnypNw8vkk6wQ/y5zow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/Q7ZDuMYIs=:xEiCLG11Uc8gwv/2exydz8
 o0U6Wk09gavSweps9yd0p+2QRE/XVym3LQtK7Zi/ezq3EfBVav3riaR8dt5bT2DHCNHvRLvY0
 4JfdXFh4KFEnz82Mt4xB2afpB80Pw1UdDTKdkvj3q2ErgmleF0KGYuA29RGIDXJkaHi9h+Mob
 5gTv9vzngRjUsiHTXsAj5VMH/vXs+oyTxrVeY2L2fDDEsI8WBAZrlOWthygIP+ngNFiHyVdqP
 uJ2gI7tcqNNv8Lfd+bigxCOxNvia1TSrtZJcj1WOWm6q/pL9eJkYsfhqjmCprNuspQj3dy/aj
 MGjikbGzsGxAsbJbBcL58mQmw0KNYZS4pFFAb6h+XIjQUVkBNewmPqw8n6S2SAhkPFPJkGByM
 hPNlq4JvvfJtTI4iw9YJGte1Upe8SmCydGw2Pys5bydsj9tqZyu+iQtBqFpxCLOG5AEEWun6e
 xV7qXzVwCTQnGPVBUvZgvXbf/ipc6TJ1S4mLgVzgEu6bSTh6q4xQwLzI+JbdY2/UEjjGhc64n
 d9h6lIjrs5VWUCGgWGCccfDDTCWJdNoG0gHSeEtwuzlZf276UOY8zwrUHsj2W9VGbKQSbfT/b
 ZsUzYyM0IHvf2gKG+ML6AQCyoFXftkfFsavgEn3L/1aMUCedC9yKEQe9fGhHjJqx+LNOhnpUQ
 65aPlnv6BPE16WVfboegBMW+k3ylI50Nrc8QyaW3iCdS3G3DsEfvHu4Ff43fMfmXTzr/RFjyR
 DAuOQlNcwPOcKh7MLxudCkaPq8riuYuL1USrKQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We're about to move a lot of the code in qemu.h out into different
header files; fix the coding style nits first so that checkpatch
is happy with the pure code-movement patches. This is mostly
block-comment style but also a few whitespace issues.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-2-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe8f..34b975ba502e 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -15,12 +15,14 @@
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
 
-/* This is the size of the host kernel's sigset_t, needed where we make
+/*
+ * This is the size of the host kernel's sigset_t, needed where we make
  * direct system calls that take a sigset_t pointer and a size.
  */
 #define SIGSET_T_SIZE (_NSIG / 8)
 
-/* This struct is used to hold certain information about the image.
+/*
+ * This struct is used to hold certain information about the image.
  * Basically, it replicates in user space what would be certain
  * task_struct fields in the kernel
  */
@@ -48,13 +50,13 @@ struct image_info {
         abi_ulong       env_strings;
         abi_ulong       file_string;
         uint32_t        elf_flags;
-        int		personality;
+        int             personality;
         abi_ulong       alignment;
 
         /* The fields below are used in FDPIC mode.  */
         abi_ulong       loadmap_addr;
         uint16_t        nsegs;
-        void           *loadsegs;
+        void            *loadsegs;
         abi_ulong       pt_dynamic_addr;
         abi_ulong       interpreter_loadmap_addr;
         abi_ulong       interpreter_pt_dynamic_addr;
@@ -98,8 +100,10 @@ struct emulated_sigtable {
     target_siginfo_t info;
 };
 
-/* NOTE: we force a big alignment so that the stack stored after is
-   aligned too */
+/*
+ * NOTE: we force a big alignment so that the stack stored after is
+ * aligned too
+ */
 typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 #ifdef TARGET_ARM
@@ -134,20 +138,23 @@ typedef struct TaskState {
 
     struct emulated_sigtable sync_signal;
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    /* This thread's signal mask, as requested by the guest program.
+    /*
+     * This thread's signal mask, as requested by the guest program.
      * The actual signal mask of this thread may differ:
      *  + we don't let SIGSEGV and SIGBUS be blocked while running guest code
      *  + sometimes we block all signals to avoid races
      */
     sigset_t signal_mask;
-    /* The signal mask imposed by a guest sigsuspend syscall, if we are
+    /*
+     * The signal mask imposed by a guest sigsuspend syscall, if we are
      * currently in the middle of such a syscall
      */
     sigset_t sigsuspend_mask;
     /* Nonzero if we're leaving a sigsuspend and sigsuspend_mask is valid. */
     int in_sigsuspend;
 
-    /* Nonzero if process_pending_signals() needs to do something (either
+    /*
+     * Nonzero if process_pending_signals() needs to do something (either
      * handle a pending signal or unblock signals).
      * This flag is written from a signal handler so should be accessed via
      * the qatomic_read() and qatomic_set() functions. (It is not accessed
@@ -168,8 +175,10 @@ extern unsigned long mmap_min_addr;
 
 /* ??? See if we can avoid exposing so much of the loader internals.  */
 
-/* Read a good amount of data initially, to hopefully get all the
-   program headers loaded.  */
+/*
+ * Read a good amount of data initially, to hopefully get all the
+ * program headers loaded.
+ */
 #define BPRM_BUF_SIZE  1024
 
 /*
@@ -184,7 +193,7 @@ struct linux_binprm {
         int argc, envc;
         char **argv;
         char **envp;
-        char * filename;        /* Name of binary */
+        char *filename;        /* Name of binary */
         int (*core_dump)(int, const CPUArchState *); /* coredump routine */
 };
 
@@ -212,10 +221,11 @@ void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
                               abi_ulong stringp, int push_ptr);
 int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
-             struct target_pt_regs * regs, struct image_info *infop,
+             struct target_pt_regs *regs, struct image_info *infop,
              struct linux_binprm *);
 
-/* Returns true if the image uses the FDPIC ABI. If this is the case,
+/*
+ * Returns true if the image uses the FDPIC ABI. If this is the case,
  * we have to provide some information (loadmap, pt_dynamic_info) such
  * that the program can be relocated adequately. This is also useful
  * when handling signals.
@@ -283,7 +293,8 @@ void probe_guest_base(const char *image_name,
  * with any of the host errno values.)
  */
 
-/* A guide to using safe_syscall() to handle interactions between guest
+/*
+ * A guide to using safe_syscall() to handle interactions between guest
  * syscalls and guest signals:
  *
  * Guest syscalls come in two flavours:
@@ -392,7 +403,8 @@ extern long safe_syscall_base(int *pending, long number, ...);
 
 #else
 
-/* Fallback for architectures which don't yet provide a safe-syscall assembly
+/*
+ * Fallback for architectures which don't yet provide a safe-syscall assembly
  * fragment; note that this is racy!
  * This should go away when all host architectures have been updated.
  */
@@ -736,7 +748,8 @@ static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
  */
 void preexit_cleanup(CPUArchState *env, int code);
 
-/* Include target-specific struct and function definitions;
+/*
+ * Include target-specific struct and function definitions;
  * they may need access to the target-independent structures
  * above, so include them last.
  */
-- 
2.31.1


