Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA503CC6C0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:25:04 +0200 (CEST)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tg7-0000kX-C2
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcL-0001cM-Cf
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcJ-0000gK-LU
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id k4so16461218wrc.8
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/qkTBQDwDBx59odk0rUl2QA3V5gIm0hniACs5M4QEw=;
 b=wLwG+LSFFKKP4181fDmmx6oCjie8Mj0Qyov/A8GdA+VPEVdIRfeyZd0tjGJDX7+L+P
 M+3ykMfrMYYZwNXfbSWo3A4O0Vzc4Jj/VdML7KqynP8xobfNmwdgZLFG4pD9wIyuWe2j
 RTVddOvrriwddQrG45wG1joVLQaaBJh1zCCzQdbakRcRlQpTpsGQzdOy2AiBOholi4VY
 R1WEXlEXryyIAYiVK228D2xfP7cyLiWT39JUHuyXmAtrSv5/m1JG/fYEagsUBGWipWD3
 HqU9Q5mQDL1Bq//Xzzi1A2AWJSzY8fl8k23h3Vdpo7qr787auEGoyVavL2Rw+Pu5gr2A
 PXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/qkTBQDwDBx59odk0rUl2QA3V5gIm0hniACs5M4QEw=;
 b=kjMjt9fsYSBK0NCf03+ZqsZ+eHQQtNt2Aqspqdm2JCSFPfze/+EWnRbJHr+LmLFsmF
 tpC6ToPbDPZM7DeGpciaWmaKB9f/vhUzgURF3ChFvMg8Hm/rARspaBX1pG8rfOa3QDhg
 ea4fjm/G5XLAvLcekLgh1B9bB5qbecyO+ny8byF3slSGwriD60ySXMg7MDnfK2MuHFLt
 sc66arnMDTs355oM4ZcyoQfr78+Wd0ZIyKcG0+S54Isx6TBJGEt9+PWnk+p13kmgcDhj
 QMHSfai+TGPXQGRo/Ms0ypj89mBay/I7lgPR2ydH15Qvyfw396aHUJti+lqsn1DMkZ68
 Uatg==
X-Gm-Message-State: AOAM532rY2c6bCHmnIebLYftl9w43Ec0dN7TPC01IMzmKM1k+23RYgow
 jRaDZwgJFqN39dJl2lKdSaUP1/XtKxfWSA==
X-Google-Smtp-Source: ABdhPJyh4RKtABcqCTQRH2dS2u9maqRi5zDo2KYC4gykGvqASnzLE50HqgXRIICXsexwSNmJdDDoQQ==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr13116314wrs.301.1626564066125; 
 Sat, 17 Jul 2021 16:21:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/10] linux-user: Fix coding style nits in qemu.h
Date: Sun, 18 Jul 2021 00:20:54 +0100
Message-Id: <20210717232103.18047-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move a lot of the code in qemu.h out into different
header files; fix the coding style nits first so that checkpatch
is happy with the pure code-movement patches. This is mostly
block-comment style but also a few whitespace issues.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I didn't clean the whole file; some parts I know I don't need
to move (the user-access functions and macros) I left alone.
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


