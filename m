Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227C2DE204
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:32:05 +0100 (CET)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDzQ-0003m6-Fk
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDur-0006yV-OS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuo-00036R-97
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id v14so1992409wml.1
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzjSb7TtaIs2FGaM8dLD/lXODxjDnZRhX0kYxDeMf/0=;
 b=YNJLCJRXjXXwKTGmY28f+WUCU2SQy4OYAGmw0Ib1c7z7of+wbB+uT54mksudMDrAzJ
 42inANlaI9vm3wvbVKly6Z0gzz7dKYCymRM7rNLtRUdL2VyXdPGiw9uOHfdaCAlRwjA6
 epzrw92BGHE7pa4fgaTV4ZxLrlyZam5twdvQId+fKY3qQlDM/e20HSW5lBA5nheUMf1u
 wI6fJCobxuBs82lpT2LjVrfKO12zNQ764MOzzM7xpzrkMO0pgLG1ycu72fljnnC5dIYR
 4Ihq+LDLUulIr4sa1NUtgJqhA6LMRkE6JC9NDBHYbKqg6wvGWP6+7zQ7qMou1QAlJgoC
 3prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qzjSb7TtaIs2FGaM8dLD/lXODxjDnZRhX0kYxDeMf/0=;
 b=nij5U7qgBzr2pZfRh77NhFZLxtR5c1pEEbpI/nqTL6+l5pDd1SXHiAcEft4XXiUlbz
 t3kibXJNl48T8iRXQJGmDAZ/mXiUsmtmZ5ItkBd7s2ra4a+Hq+UkLNOqArD+SS9JDyC7
 Wa+0JL4Fd5Q7FUvt86RcS4nJGItO/ffjTSQhLpEBu9dW1hAcrZ2PVGAZ9NTRJZpr16VS
 w6zxmmOAatk2otjCVdKi3uQ8UjdKw63H4ooW/Q8s0bwRwav+6wfShBQP1Dz6BVSh/+NL
 rVxZO01NZ3WgTKf3gxRlHzDejNtAKuEYws6gBTY723HbiFk/pgqG+1C+5DFPZg+IvuRM
 Ch+g==
X-Gm-Message-State: AOAM532pL2TkZGCE79H8O0irYcJnEEq6+SmzOrZNWERAF8TVLns2C+2R
 YUkqhmz6E9SQ3RgDp7WBPrmThw==
X-Google-Smtp-Source: ABdhPJy4wyjih1cGkYrZQ54n/6sGGNAFSz7yq85MgbSQA+ITp8lrccLTH7WSoV1mWw58F/s4MnfS2w==
X-Received: by 2002:a1c:5410:: with SMTP id i16mr3889763wmb.30.1608290836832; 
 Fri, 18 Dec 2020 03:27:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm14438759wrb.73.2020.12.18.03.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B2E21FF92;
 Fri, 18 Dec 2020 11:27:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 6/9] gdbstub: drop CPUEnv from gdb_exit()
Date: Fri, 18 Dec 2020 11:27:04 +0000
Message-Id: <20201218112707.28348-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdb_exit() has never needed anything from env and I doubt we are going
to start now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h    | 2 +-
 bsd-user/syscall.c        | 6 +++---
 gdbstub.c                 | 2 +-
 linux-user/exit.c         | 2 +-
 target/arm/arm-semi.c     | 2 +-
 target/m68k/m68k-semi.c   | 2 +-
 target/nios2/nios2-semi.c | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 94d8f83e92..492db0f512 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -46,7 +46,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 void gdb_set_stop_cpu(CPUState *cpu);
-void gdb_exit(CPUArchState *, int);
+void gdb_exit(int);
 #ifdef CONFIG_USER_ONLY
 /**
  * gdb_handlesig: yield control to gdb
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index d38ec7a162..adc3d21b54 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -333,7 +333,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
@@ -435,7 +435,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
@@ -514,7 +514,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
-        gdb_exit(cpu_env, arg1);
+        gdb_exit(arg1);
         qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
diff --git a/gdbstub.c b/gdbstub.c
index 15d3a8e1f5..afa553e8fc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3068,7 +3068,7 @@ static void gdb_read_byte(uint8_t ch)
 }
 
 /* Tell the remote gdb that the process has exited.  */
-void gdb_exit(CPUArchState *env, int code)
+void gdb_exit(int code)
 {
   char buf[4];
 
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 1594015444..70b344048c 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -34,6 +34,6 @@ void preexit_cleanup(CPUArchState *env, int code)
 #ifdef CONFIG_GCOV
         __gcov_dump();
 #endif
-        gdb_exit(env, code);
+        gdb_exit(code);
         qemu_plugin_atexit_cb();
 }
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index f7b7bff522..93360e28c7 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -1101,7 +1101,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
              */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
-        gdb_exit(env, ret);
+        gdb_exit(ret);
         exit(ret);
     case TARGET_SYS_SYNCCACHE:
         /*
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 27600e0cc0..d919245e4f 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -195,7 +195,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     args = env->dregs[1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env, env->dregs[0]);
+        gdb_exit(env->dregs[0]);
         exit(env->dregs[0]);
     case HOSTED_OPEN:
         GET_ARG(0);
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index d7a80dd303..e508b2fafc 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -215,7 +215,7 @@ void do_nios2_semihosting(CPUNios2State *env)
     args = env->regs[R_ARG1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env, env->regs[R_ARG0]);
+        gdb_exit(env->regs[R_ARG0]);
         exit(env->regs[R_ARG0]);
     case HOSTED_OPEN:
         GET_ARG(0);
-- 
2.20.1


