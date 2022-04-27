Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97EA510F04
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:53:22 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXnt-0007fD-Le
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXmI-0006yZ-HH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:51:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXmE-0000ys-2q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:51:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so2941735pje.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/ogX8SQAJw2qIqiGOcXtS3h48Rs5t9vL6Yrp5m9yaY=;
 b=bIDYNL574bX3hVdhw079nIn8cJ03hSRSFcUYW1OyIRie6wYEMJYvVDWawgQTWU1/bE
 SjQCroyN7CqzNr6vY3+LQ9SBVMkeVEZcmjlERpCMdhJRN9l09vqM4veUV/Su+qDxZu3/
 ZsrG3Cf8nUg+4t2ANb+2e01hIuRLjlCxqqCFkiKnEBsf/19MEXI4W1bPON23Eu8CB+ej
 TJas6CBjXWxhoIYsqxTljNd47g1zQjbSH9w5EyUDwiyhXezO0WeUD9Pqv3fYZSptqCOQ
 fVRp3PEXfsvemblyPAsDIt1sqIBulReZqxwjkSHvvjELs374f4jKitkYpQtFAHk0c9MM
 Dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/ogX8SQAJw2qIqiGOcXtS3h48Rs5t9vL6Yrp5m9yaY=;
 b=6efQjbsWawgAOT5Y7315qTLMSoBdu3mkhnA6XPnYlY9+GjwmKVmf+t9UpGub2I2n/0
 t8XKhGhbQ8m90cfJmIxEYYLMe1kGvfhOu1DpVRN60OZWu+5iBfJ29827CQK8ey0X6tLF
 5p+LBuYhgWphxOonKxRnM9nYCh/4uk80YAFLhC7W5iOtmqIK1Ts9VXPFjbtQhjIZPGAx
 UdtF2AYoHr4MwkZwuBrSeO/kXrnYJn+XYz/JLHcOwSBbVv3sOlew/rbmt7uMIDX6KQe2
 UE5tZaGIeCf0/8Zk5O3gWweswDp1A5L+IQU6qTRoz2WtNWlTgMxsfHb7x0XgamMxCuke
 jCzg==
X-Gm-Message-State: AOAM532ElAHt0YBbL46t+1KBsYy3BUHVKYjzTHRWVq2YTOCRfKZ90uc1
 rUaAIQkCH194xIb+o+DIZpI+RdPtD2Fjsw==
X-Google-Smtp-Source: ABdhPJxQ4R1BkAYQNMrrQsM1K0jCmusape1L1NaTY6/hxqvDnS73xFx58OYBodLSu0ip79M82KsHMQ==
X-Received: by 2002:a17:90b:1b06:b0:1d1:6633:5ec2 with SMTP id
 nu6-20020a17090b1b0600b001d166335ec2mr41614745pjb.103.1651027890932; 
 Tue, 26 Apr 2022 19:51:30 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a00199400b005060849909esm19643024pfl.176.2022.04.26.19.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 19:51:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Clean up arg_start/arg_end confusion
Date: Tue, 26 Apr 2022 19:51:29 -0700
Message-Id: <20220427025129.160184-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had two sets of variables: arg_start/arg_end, and
arg_strings/env_strings.  In linuxload.c, we set the
first pair to the bounds of the argv strings, but in
elfload.c, we set the first pair to the bounds of the
argv pointers and the second pair to the bounds of
the argv strings.

Remove arg_start/arg_end, replacing them with the standard
argc/argv/envc/envp values.  Retain arg_strings/env_strings
with the meaning we were using in elfload.c.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h             | 12 ++++++++----
 linux-user/elfload.c          | 10 ++++++----
 linux-user/linuxload.c        | 12 ++++++++++--
 linux-user/main.c             |  4 ++--
 semihosting/arm-compat-semi.c |  4 ++--
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 46550f5e21..7d90de1b15 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -40,15 +40,19 @@ struct image_info {
         abi_ulong       data_offset;
         abi_ulong       saved_auxv;
         abi_ulong       auxv_len;
-        abi_ulong       arg_start;
-        abi_ulong       arg_end;
-        abi_ulong       arg_strings;
-        abi_ulong       env_strings;
+        abi_ulong       argc;
+        abi_ulong       argv;
+        abi_ulong       envc;
+        abi_ulong       envp;
         abi_ulong       file_string;
         uint32_t        elf_flags;
         int             personality;
         abi_ulong       alignment;
 
+        /* Generic semihosting knows about these pointers. */
+        abi_ulong       arg_strings;   /* strings for argv */
+        abi_ulong       env_strings;   /* strings for envp; ends arg_strings */
+
         /* The fields below are used in FDPIC mode.  */
         abi_ulong       loadmap_addr;
         uint16_t        nsegs;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974..8c0765dd4b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1516,8 +1516,8 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->iaoq[0] = infop->entry;
     regs->iaoq[1] = infop->entry + 4;
     regs->gr[23] = 0;
-    regs->gr[24] = infop->arg_start;
-    regs->gr[25] = (infop->arg_end - infop->arg_start) / sizeof(abi_ulong);
+    regs->gr[24] = infop->argv;
+    regs->gr[25] = infop->argc;
     /* The top-of-stack contains a linkage buffer.  */
     regs->gr[30] = infop->start_stack + 64;
     regs->gr[31] = infop->entry;
@@ -2120,8 +2120,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     u_envp = u_argv + (argc + 1) * n;
     u_auxv = u_envp + (envc + 1) * n;
     info->saved_auxv = u_auxv;
-    info->arg_start = u_argv;
-    info->arg_end = u_argv + argc * n;
+    info->argc = argc;
+    info->envc = envc;
+    info->argv = u_argv;
+    info->envp = u_envp;
 
     /* This is correct because Linux defines
      * elf_addr_t as Elf32_Off / Elf64_Off
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 2ed5fc45ed..745cce70ab 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -92,6 +92,11 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     envp = sp;
     sp -= (argc + 1) * n;
     argv = sp;
+    ts->info->envp = envp;
+    ts->info->envc = envc;
+    ts->info->argv = argv;
+    ts->info->argc = argc;
+
     if (push_ptr) {
         /* FIXME - handle put_user() failures */
         sp -= n;
@@ -99,19 +104,22 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
         sp -= n;
         put_user_ual(argv, sp);
     }
+
     sp -= n;
     /* FIXME - handle put_user() failures */
     put_user_ual(argc, sp);
-    ts->info->arg_start = stringp;
+
+    ts->info->arg_strings = stringp;
     while (argc-- > 0) {
         /* FIXME - handle put_user() failures */
         put_user_ual(stringp, argv);
         argv += n;
         stringp += target_strlen(stringp) + 1;
     }
-    ts->info->arg_end = stringp;
     /* FIXME - handle put_user() failures */
     put_user_ual(0, argv);
+
+    ts->info->env_strings = stringp;
     while (envc-- > 0) {
         /* FIXME - handle put_user() failures */
         put_user_ual(stringp, envp);
diff --git a/linux-user/main.c b/linux-user/main.c
index 7ca48664e4..651e32f5f2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -878,9 +878,9 @@ int main(int argc, char **argv, char **envp)
             fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n",
                     info->entry);
             fprintf(f, "argv_start  0x" TARGET_ABI_FMT_lx "\n",
-                    info->arg_start);
+                    info->argv);
             fprintf(f, "env_start   0x" TARGET_ABI_FMT_lx "\n",
-                    info->arg_end + (abi_ulong)sizeof(abi_ulong));
+                    info->envp);
             fprintf(f, "auxv_start  0x" TARGET_ABI_FMT_lx "\n",
                     info->saved_auxv);
             qemu_log_unlock(f);
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7a51fd0737..b6ddaf863a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1106,7 +1106,7 @@ target_ulong do_common_semihosting(CPUState *cs)
 #else
             unsigned int i;
 
-            output_size = ts->info->arg_end - ts->info->arg_start;
+            output_size = ts->info->env_strings - ts->info->arg_strings;
             if (!output_size) {
                 /*
                  * We special-case the "empty command line" case (argc==0).
@@ -1146,7 +1146,7 @@ target_ulong do_common_semihosting(CPUState *cs)
                 goto out;
             }
 
-            if (copy_from_user(output_buffer, ts->info->arg_start,
+            if (copy_from_user(output_buffer, ts->info->arg_strings,
                                output_size)) {
                 errno = EFAULT;
                 status = set_swi_errno(cs, -1);
-- 
2.34.1


