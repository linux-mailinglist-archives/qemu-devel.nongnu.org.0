Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83A2D9B30
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:38:17 +0100 (CET)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopvU-00076G-41
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnt-0007ml-1d
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:25 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnr-000684-3c
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:24 -0500
Received: by mail-wm1-x344.google.com with SMTP id q75so15640892wme.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dATvnSiNbzH3IwDni97PXBq4aN519xmIXNmYmOWL0lM=;
 b=JzYtmShzwL9A2ZTyH1kSjm5gGQN7L8LcRZt46y1GQnuOZACxjN28FtToulywsIbnXm
 dvsh/t1tR1VA0squD/FqRbjKpoe2Gf0Zti8WBNmE9zYUeqAOnXjMNKgvLQFZO/d3CvhA
 hDaofg0/rZqhioWsROOmx+CeeEQl9BXGQkKamjvzlP0Vuvu9v/xQ+lcui1le5yU2E6li
 rYTB8ffpET0lI7jjSUrMtZriNgoobsyY94y72/ijMDD9xZP2e8kA9gw3oJkL3RjTiIox
 j4MFwd/Ir0WJmI4/pjTKJxDjvabl3s1j9uEEthr5XvRXxr4E1if1lgPGfVBzCHzWacHz
 i6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dATvnSiNbzH3IwDni97PXBq4aN519xmIXNmYmOWL0lM=;
 b=B+NmgVT+3DlZP1v20lpwFmDpnz/jHV7ELoCHFB+9bWGzzG4oSYUCeTIpNfPBXiAnEG
 9KPBWqxpyo0bdIMe7fvQeOLnHSYziHcK/c+NuzcqEsz0naVt4KVEAC3+WIdxqPfFKyp7
 TjR/QtH7jer9Z6qqCDM3D2y9Dw06IjkJmo6PFeMPm3twKv9X/uX5OMfWwN8LjIBxpJp3
 6MBaN8BB6a514f6fT3VN2zv+frxQiHF87mD6CoGhl5PTVx9ttLIDqp+i/STSWCRLMsG/
 ximFtazqyu4bbMxww/by5crDoJdVvwLP/FeMDDoJ+Vb+HQWFZA/JM+deqZZK+stsouim
 mU1Q==
X-Gm-Message-State: AOAM5320eTGYywohfIBAGkmt+Fxb7JFDDdMT5G2tB0y7/InNhST3K2sj
 +zD0yk+8QFYnDibV/nnqG+rS/mbyDPbMOw==
X-Google-Smtp-Source: ABdhPJwiuC6LSFF2lkY1be7Xfs4N0LTBAVB0PrzO2H07I7WiRrfV5uxzmu+2Q/jgEh2avFVjx1eIAQ==
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr28998203wmc.187.1607959821625; 
 Mon, 14 Dec 2020 07:30:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e15sm27711843wrx.86.2020.12.14.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B1131FF90;
 Mon, 14 Dec 2020 15:30:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/6] gdbstub: drop CPUEnv from gdb_exit()
Date: Mon, 14 Dec 2020 15:30:10 +0000
Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdb_exit() has never needed anything from env and I doubt we are going
to start now.

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
index ec8daa002b..f6566c7b82 100644
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
index c892e0e674..5d5654bec0 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -1100,7 +1100,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
              */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
-        gdb_exit(env, ret);
+        gdb_exit(ret);
         exit(ret);
     case TARGET_SYS_SYNCCACHE:
         /*
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 8e5fbfc8fa..6230a789b6 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -194,7 +194,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
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


