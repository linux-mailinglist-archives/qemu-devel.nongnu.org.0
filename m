Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE2403CC8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:47:32 +0200 (CEST)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNznP-0000aI-Cw
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkD-00065w-0L
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzk9-0002JJ-H0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id g16so4005948wrb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FQap68RVQYE/H+/JgLzkmMM46sErHJmtCOTGRZKu4qQ=;
 b=q6s6/MVIEzdGwu0aDCKgKIWIrX0irTMuKcbWwPHP1M37sbZtWY1r6486what8NFat5
 VbhudbDrXAAamCZ3zHuRTYQO2pXhh2q5t+AfyWkLqf66DghgvjZqmwQP9WEbsV+lA82M
 vE2Jre8HwOqs7qNXJBFtsIXZmdB7jq4D08FZlXQ2gZNss1kyX+Sg03NU/yAfWQqWsN6j
 TljJL3YSY8M+qfEwT2PddwZWb378NSnM14C1F8IVL9FYLE2XUVyOB15DW6jdlY5N8yiT
 jZMSFrllRvF2Ed5itAr2rF9kWYR4y956BwypRbCW/UMfG/MFjLDNGUYCaY4XUOmryUWQ
 Kvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FQap68RVQYE/H+/JgLzkmMM46sErHJmtCOTGRZKu4qQ=;
 b=GQ+gk3lPy9hHwzTPTFyxgxWBMIXVcVAA8yqweTYHQLFgwA67DDWo70PIvILgQHYPXJ
 zyLQ/TTXpiVa2XAVySML7SVit8QcCBMkv2ZKC3A3l/YCteVKHtxh0hXpgMM0ozaPO+sp
 exaDjDOv8NLmf6BNRqFiTiA11jzBigYCP5Ml2KATsOUwUglAJgA9q5p36goa+8OUU8Xc
 Xv8rX6jjeFZRSBkyDO/GaZXT0nSVIDExCvyOM2GKa8UpLgeQts6ah7NO0OFC5yoPEfjl
 YrUgnZYaPrrdhzYj2oVfGsjY6oGTU4v1SgXhhlrsbvJd/OXucHEsJ22nfiyTHK1AhxH0
 nrrw==
X-Gm-Message-State: AOAM5335ccmVTpzCteNCA9JOkKS9uE4g6t3cNw2df683YwKVeE6Pa8kd
 ZDpWcHl3/N46PlF4T+Tdoq6MHWSty+uhvA==
X-Google-Smtp-Source: ABdhPJz+Ec4DOG/MIYFCmAjo9GHIAyeL8KKQIcklNgxgh1q8ewW1SXdCdDy8icsl6O+2XeL11o5GDA==
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr3796026wrw.35.1631115848087;
 Wed, 08 Sep 2021 08:44:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] linux-user: Fix coding style nits in qemu.h
Date: Wed,  8 Sep 2021 16:43:57 +0100
Message-Id: <20210908154405.15417-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move a lot of the code in qemu.h out into different
header files; fix the coding style nits first so that checkpatch
is happy with the pure code-movement patches. This is mostly
block-comment style but also a few whitespace issues.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/qemu.h | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe8..34b975ba502 100644
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
2.20.1


