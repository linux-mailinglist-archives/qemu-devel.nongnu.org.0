Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1132D6A6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:29:12 +0100 (CET)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpuZ-00065k-3E
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHpry-0004f5-A9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:30 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHprv-0007vk-2D
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:26:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j2so15234286wrx.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9xAL5D/T+erOOt4nYnSvEJ1KyVpwBXFxggwnysClZs=;
 b=qodYh789KeT8vPirjW/fC3Z9IU7ACGcljnaNcrcyRcPbbmdrQyQ9bcDEqYiclbZsUX
 1MlZZJqcSRIDWHT4JiuDx1HVfyQPvMoanq9/ZNykw/CBVePEsrA5RGtnOoSreAZ2wv6u
 JBpKjqW0aM8ICf2YZGK3bBnX6cAE+Jz6OkpBPUwDMXzcAGYMVQR3+ZVOp0i/X7hT590M
 GWrs5DQBKnGd26Bz7DBM+Uq1nVLv4oV1O72DOCPZSo9GqFSTyaVZ/xPhIIuJCpzohYMe
 /2HEcmzec8DVzp0zPY8uROOYOECiwHoP21IAeDlSVFF7Daw3nnz7YVRBJ8dMRCq6kfwh
 cw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M9xAL5D/T+erOOt4nYnSvEJ1KyVpwBXFxggwnysClZs=;
 b=UvG9h8VPCEP95JIsgaVKAjBUtwRGKiODor1huX2L9tjjPfkM8fOkYuXmf3JO8gLr8F
 A9AAKofQIWBC4Zv+Cx1FneTWlL4ICedg6Guh96WR50qqstjY/3xARe9MrmnWRXDjE7rF
 iE6EIsRwNrh8u3j3DVCrhXIIsvP8IIXOEW7o0cCTB1AEgF+OPgc9HzmoVDbHWIMuH3Sl
 5J6VAGtkWJBNYiREdPnMijX41Ftht5aCkGekTFt8OETHh/++iK5jczSDre0QJYtJlZeS
 L3o6N7L02wq+s9zdZitPduz+b2V98jlKt9B4d6ouFL9A4CMRv2nWKA/MaS/DCe7a16CG
 XJMg==
X-Gm-Message-State: AOAM533vnxI76kd9PjNGxXUv3itpaRNcUq59UESuiKoo1I0TsuDbV27c
 rfcyzink1l/K4OofqMHvuNrysP60egA=
X-Google-Smtp-Source: ABdhPJzj2g7bEGKMVZZE9LIR7mjTwOjMdY1UwHMf3vPemH7g7OBblwFAMAG3rtsqmJ+0aTXj+iLdUg==
X-Received: by 2002:adf:b641:: with SMTP id i1mr4602378wre.295.1614871585015; 
 Thu, 04 Mar 2021 07:26:25 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm7834133wml.38.2021.03.04.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 07:26:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 3/3] user-mode: Rename CPUState::opaque as CPUState::task_state
Date: Thu,  4 Mar 2021 16:26:07 +0100
Message-Id: <20210304152607.1817648-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304152607.1817648-1-f4bug@amsat.org>
References: <20210304152607.1817648-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the CPUState 'opaque' field sounds generic, it is meant
for user-mode emulation. Rename it as 'task_state' (the "task"
concept is only meaningful in user-mode) to clarify this field
use. Remove various cast while renaming.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            |  4 ++--
 linux-user/m68k/target_cpu.h     |  3 +--
 linux-user/qemu.h                |  2 +-
 bsd-user/main.c                  |  2 +-
 gdbstub.c                        | 13 ++++------
 hw/semihosting/arm-compat-semi.c | 12 ++++------
 linux-user/aarch64/cpu_loop.c    |  2 +-
 linux-user/arm/cpu_loop.c        |  4 ++--
 linux-user/arm/signal.c          |  2 +-
 linux-user/cris/cpu_loop.c       |  3 +--
 linux-user/elfload.c             |  8 +++----
 linux-user/hppa/signal.c         |  3 +--
 linux-user/linuxload.c           |  2 +-
 linux-user/m68k/cpu_loop.c       |  2 +-
 linux-user/main.c                |  2 +-
 linux-user/mips/cpu_loop.c       |  3 +--
 linux-user/ppc/signal.c          |  7 +++---
 linux-user/riscv/cpu_loop.c      |  3 +--
 linux-user/signal.c              | 34 ++++++++++++--------------
 linux-user/syscall.c             | 41 +++++++++++++-------------------
 linux-user/vm86.c                | 19 +++++++--------
 target/m68k/m68k-semi.c          |  2 +-
 22 files changed, 73 insertions(+), 100 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f4d2169cc8e..c373618f2e9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -313,7 +313,7 @@ typedef struct TaskState TaskState;
  * @gdb_num_regs: Number of total registers accessible to GDB.
  * @gdb_num_g_regs: Number of registers in GDB 'g' packets.
  * @next_cpu: Next CPU sharing TB cache.
- * @opaque: User task data.
+ * @task_state: User task data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
@@ -389,7 +389,7 @@ struct CPUState {
     QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
     CPUWatchpoint *watchpoint_hit;
 
-    TaskState *opaque;
+    TaskState *task_state;
 
     /* In order to avoid passing too many arguments to the MMIO helpers,
      * we store some rarely used information in the CPU context.
diff --git a/linux-user/m68k/target_cpu.h b/linux-user/m68k/target_cpu.h
index c3f288dfe83..bb252f90ba7 100644
--- a/linux-user/m68k/target_cpu.h
+++ b/linux-user/m68k/target_cpu.h
@@ -37,9 +37,8 @@ static inline void cpu_clone_regs_parent(CPUM68KState *env, unsigned flags)
 static inline void cpu_set_tls(CPUM68KState *env, target_ulong newtls)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
 
-    ts->tp_value = newtls;
+    cs->task_state->tp_value = newtls;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUM68KState *state)
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5394f726892..59949676c6a 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -381,7 +381,7 @@ extern long safe_syscall_base(int *pending, long number, ...);
 #define safe_syscall(...)                                               \
     ({                                                                  \
         long ret_;                                                      \
-        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
+        int *psp_ = &thread_cpu->task_state->signal_pending; \
         ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
         if (is_error(ret_)) {                                           \
             errno = -ret_;                                              \
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 798aba512c1..625d440ab31 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -1000,7 +1000,7 @@ int main(int argc, char **argv)
     memset(ts, 0, sizeof(TaskState));
     init_task_state(ts);
     ts->info = info;
-    cpu->opaque = ts;
+    cpu->task_state = ts;
 
 #if defined(TARGET_I386)
     env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
diff --git a/gdbstub.c b/gdbstub.c
index 3ee40479b69..406241ee3fa 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -94,8 +94,7 @@ static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
 static inline int cpu_gdb_index(CPUState *cpu)
 {
 #if defined(CONFIG_USER_ONLY)
-    TaskState *ts = (TaskState *) cpu->opaque;
-    return ts->ts_tid;
+    return cpu->task_state->ts_tid;
 #else
     return cpu->cpu_index + 1;
 #endif
@@ -2121,7 +2120,7 @@ static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     TaskState *ts;
 
-    ts = gdbserver_state.c_cpu->opaque;
+    ts = gdbserver_state.c_cpu->task_state;
     g_string_printf(gdbserver_state.str_buf,
                     "Text=" TARGET_ABI_FMT_lx
                     ";Data=" TARGET_ABI_FMT_lx
@@ -2174,7 +2173,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
 #ifdef CONFIG_USER_ONLY
-    if (gdbserver_state.c_cpu->opaque) {
+    if (gdbserver_state.c_cpu->task_state) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
 #endif
@@ -2243,7 +2242,6 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
 static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    TaskState *ts;
     unsigned long offset, len, saved_auxv, auxv_len;
 
     if (gdb_ctx->num_params < 2) {
@@ -2253,9 +2251,8 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     offset = gdb_ctx->params[0].val_ul;
     len = gdb_ctx->params[1].val_ul;
-    ts = gdbserver_state.c_cpu->opaque;
-    saved_auxv = ts->info->saved_auxv;
-    auxv_len = ts->info->auxv_len;
+    saved_auxv = gdbserver_state.c_cpu->task_state->info->saved_auxv;
+    auxv_len = gdbserver_state.c_cpu->task_state->info->auxv_len;
 
     if (offset >= auxv_len) {
         put_packet("E00");
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 23c6e3edcb6..5e5724d18fb 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -375,9 +375,7 @@ static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
 {
     if (code == (uint32_t)-1) {
 #ifdef CONFIG_USER_ONLY
-        TaskState *ts = cs->opaque;
-
-        ts->swi_errno = errno;
+        cs->task_state->swi_errno = errno;
 #else
         syscall_err = errno;
 #endif
@@ -388,9 +386,7 @@ static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
 static inline uint32_t get_swi_errno(CPUState *cs)
 {
 #ifdef CONFIG_USER_ONLY
-    TaskState *ts = cs->opaque;
-
-    return ts->swi_errno;
+    return cs->task_state->swi_errno;
 #else
     return syscall_err;
 #endif
@@ -1107,7 +1103,7 @@ target_ulong do_common_semihosting(CPUState *cs)
 #if !defined(CONFIG_USER_ONLY)
             const char *cmdline;
 #else
-            TaskState *ts = cs->opaque;
+            TaskState *ts = cs->task_state;
 #endif
             GET_ARG(0);
             GET_ARG(1);
@@ -1188,7 +1184,7 @@ target_ulong do_common_semihosting(CPUState *cs)
             target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
-            TaskState *ts = cs->opaque;
+            TaskState *ts = cs->task_state;
 #else
             target_ulong rambase = common_semi_rambase(cs);
 #endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 7c42f657068..e8e2f17b34b 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -187,7 +187,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     struct image_info *info = ts->info;
     int i;
 
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index cadfb7fa439..a1c1d7e20eb 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -244,7 +244,7 @@ void cpu_loop(CPUARMState *env)
         case EXCP_NOCP:
         case EXCP_INVSTATE:
             {
-                TaskState *ts = cs->opaque;
+                TaskState *ts = cs->task_state;
                 uint32_t opcode;
                 int rc;
 
@@ -470,7 +470,7 @@ void cpu_loop(CPUARMState *env)
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
     struct image_info *info = ts->info;
     int i;
 
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index f21d1535e4d..fe20add8029 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -214,7 +214,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     abi_ulong retcode;
 
     int thumb;
-    int is_fdpic = info_is_fdpic(((TaskState *)thread_cpu->opaque)->info);
+    int is_fdpic = info_is_fdpic(thread_cpu->task_state->info);
 
     if (is_fdpic) {
         /* In FDPIC mode, ka->_sa_handler points to a function
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 334edddd1e2..2c9081360de 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -85,8 +85,7 @@ void cpu_loop(CPUCRISState *env)
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
-    struct image_info *info = ts->info;
+    struct image_info *info = cpu->task_state->info;
 
     env->regs[0] = regs->r0;
     env->regs[1] = regs->r1;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bab4237e90f..1984226e0db 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3805,12 +3805,11 @@ static int write_note(struct memelfnote *men, int fd)
 static void fill_thread_info(struct elf_note_info *info, const CPUArchState *env)
 {
     CPUState *cpu = env_cpu((CPUArchState *)env);
-    TaskState *ts = (TaskState *)cpu->opaque;
     struct elf_thread_status *ets;
 
     ets = g_malloc0(sizeof (*ets));
     ets->num_notes = 1; /* only prstatus is dumped */
-    fill_prstatus(&ets->prstatus, ts, 0);
+    fill_prstatus(&ets->prstatus, cpu->task_state, 0);
     elf_core_copy_regs(&ets->prstatus.pr_reg, env);
     fill_note(&ets->notes[0], "CORE", NT_PRSTATUS, sizeof (ets->prstatus),
               &ets->prstatus);
@@ -3835,7 +3834,7 @@ static int fill_note_info(struct elf_note_info *info,
 {
 #define NUMNOTES 3
     CPUState *cpu = env_cpu((CPUArchState *)env);
-    TaskState *ts = (TaskState *)cpu->opaque;
+    TaskState *ts = cpu->task_state;
     int i;
 
     info->notes = g_new0(struct memelfnote, NUMNOTES);
@@ -3959,7 +3958,6 @@ static int write_note_info(struct elf_note_info *info, int fd)
 static int elf_core_dump(int signr, const CPUArchState *env)
 {
     const CPUState *cpu = env_cpu((CPUArchState *)env);
-    const TaskState *ts = (const TaskState *)cpu->opaque;
     struct vm_area_struct *vma = NULL;
     char corefile[PATH_MAX];
     struct elf_note_info info;
@@ -3978,7 +3976,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     if (dumpsize.rlim_cur == 0)
         return 0;
 
-    if (core_dump_filename(ts, corefile, sizeof (corefile)) < 0)
+    if (core_dump_filename(cpu->task_state, corefile, sizeof(corefile)) < 0)
         return (-errno);
 
     if ((fd = open(corefile, O_WRONLY | O_CREAT,
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index d1a58feeb36..76b68e817bc 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -111,11 +111,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     abi_ulong frame_addr, sp, haddr;
     struct target_rt_sigframe *frame;
     int i;
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
 
     sp = get_sp_from_cpustate(env);
     if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp)) {
-        sp = (ts->sigaltstack_used.ss_sp + 0x7f) & ~0x3f;
+        sp = (thread_cpu->task_state->sigaltstack_used.ss_sp + 0x7f) & ~0x3f;
     }
     frame_addr = QEMU_ALIGN_UP(sp, 64);
     sp = frame_addr + PARISC_RT_SIGFRAME_SIZE32;
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index a27e1d0d8bc..263bf6aed73 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -83,7 +83,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
                               abi_ulong stringp, int push_ptr)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
     int n = sizeof(abi_ulong);
     abi_ulong envp;
     abi_ulong argv;
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c4..74674562fa6 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -118,7 +118,7 @@ void cpu_loop(CPUM68KState *env)
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
     struct image_info *info = ts->info;
 
     env->pc = regs->pc;
diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed..53542df7556 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -807,7 +807,7 @@ int main(int argc, char **argv, char **envp)
     /* build Task State */
     ts->info = info;
     ts->bprm = &bprm;
-    cpu->opaque = ts;
+    cpu->task_state = ts;
     task_settid(ts);
 
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e7..932b77e4023 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -322,8 +322,7 @@ error:
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
-    struct image_info *info = ts->info;
+    struct image_info *info = cpu->task_state->info;
     int i;
 
     struct mode_req {
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index b78613f7c86..4474981a2fb 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -491,7 +491,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 #if defined(TARGET_PPC64)
     struct target_sigcontext *sc = 0;
 #if !defined(TARGET_ABI32)
-    struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
+    struct image_info *image = thread_cpu->task_state->info;
 #endif
 #endif
 
@@ -684,8 +684,6 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
     }
 
     if (uold_ctx) {
-        TaskState *ts = (TaskState *)thread_cpu->opaque;
-
         if (!lock_user_struct(VERIFY_WRITE, uctx, uold_ctx, 1)) {
             return -TARGET_EFAULT;
         }
@@ -701,7 +699,8 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
 #endif
 
         save_user_regs(env, mctx);
-        host_to_target_sigset(&uctx->tuc_sigmask, &ts->signal_mask);
+        host_to_target_sigset(&uctx->tuc_sigmask,
+                              &thread_cpu->task_state->signal_mask);
 
         unlock_user_struct(uctx, uold_ctx, 1);
     }
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9665dabb096..66860b27a92 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -124,8 +124,7 @@ void cpu_loop(CPURISCVState *env)
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
-    struct image_info *info = ts->info;
+    struct image_info *info = cpu->task_state->info;
 
     env->pc = regs->sepc;
     env->gpr[xSP] = regs->sp;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c40..01f50ea0eef 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -185,7 +185,6 @@ void target_to_host_old_sigset(sigset_t *sigset,
 
 int block_signals(void)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
     sigset_t set;
 
     /* It's OK to block everything including SIGSEGV, because we won't
@@ -195,7 +194,7 @@ int block_signals(void)
     sigfillset(&set);
     sigprocmask(SIG_SETMASK, &set, 0);
 
-    return qatomic_xchg(&ts->signal_pending, 1);
+    return qatomic_xchg(&thread_cpu->task_state->signal_pending, 1);
 }
 
 /* Wrapper for sigprocmask function
@@ -207,7 +206,7 @@ int block_signals(void)
  */
 int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     if (oldset) {
         *oldset = ts->signal_mask;
@@ -251,9 +250,7 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
  */
 void set_sigmask(const sigset_t *set)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
-
-    ts->signal_mask = *set;
+    thread_cpu->task_state->signal_mask = *set;
 }
 #endif
 
@@ -261,7 +258,7 @@ void set_sigmask(const sigset_t *set)
 
 int on_sig_stack(unsigned long sp)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     return (sp - ts->sigaltstack_used.ss_sp
             < ts->sigaltstack_used.ss_size);
@@ -269,7 +266,7 @@ int on_sig_stack(unsigned long sp)
 
 int sas_ss_flags(unsigned long sp)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     return (ts->sigaltstack_used.ss_size == 0 ? SS_DISABLE
             : on_sig_stack(sp) ? SS_ONSTACK : 0);
@@ -280,7 +277,7 @@ abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka)
     /*
      * This is the X/Open sanctioned signal stack switching.
      */
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     if ((ka->sa_flags & TARGET_SA_ONSTACK) && !sas_ss_flags(sp)) {
         return ts->sigaltstack_used.ss_sp + ts->sigaltstack_used.ss_size;
@@ -290,7 +287,7 @@ abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka)
 
 void target_save_altstack(target_stack_t *uss, CPUArchState *env)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     __put_user(ts->sigaltstack_used.ss_sp, &uss->ss_sp);
     __put_user(sas_ss_flags(get_sp_from_cpustate(env)), &uss->ss_flags);
@@ -543,7 +540,6 @@ static void signal_table_init(void)
 
 void signal_init(void)
 {
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
     struct sigaction act;
     struct sigaction oact;
     int i;
@@ -553,7 +549,7 @@ void signal_init(void)
     signal_table_init();
 
     /* Set the signal mask from the host mask. */
-    sigprocmask(0, 0, &ts->signal_mask);
+    sigprocmask(0, 0, &thread_cpu->task_state->signal_mask);
 
     sigfillset(&act.sa_mask);
     act.sa_flags = SA_SIGINFO;
@@ -623,7 +619,7 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
-    TaskState *ts = (TaskState *)cpu->opaque;
+    TaskState *ts = cpu->task_state;
     int host_sig, core_dumped = 0;
     struct sigaction act;
 
@@ -678,7 +674,7 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
                  target_siginfo_t *info)
 {
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
 
     trace_user_queue_signal(env, sig);
 
@@ -703,7 +699,7 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
 {
     CPUArchState *env = thread_cpu->env_ptr;
     CPUState *cpu = env_cpu(env);
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
 
     int sig;
     target_siginfo_t tinfo;
@@ -760,7 +756,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
 {
     int ret;
     struct target_sigaltstack oss;
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    TaskState *ts = thread_cpu->task_state;
 
     /* XXX: test errors */
     if(uoss_addr)
@@ -778,7 +774,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
 
 #if defined(TARGET_PPC64)
         /* ELF V2 for PPC64 has a 4K minimum stack size for signal handlers */
-        struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
+        struct image_info *image = thread_cpu->task_state->info;
         if (get_ppc64_abi(image) > 1) {
             minstacksize = 4096;
         }
@@ -918,7 +914,7 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
     sigset_t set;
     target_sigset_t target_old_set;
     struct target_sigaction *sa;
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
 
     trace_user_handle_signal(cpu_env, sig);
     /* dequeue signal */
@@ -1000,7 +996,7 @@ void process_pending_signals(CPUArchState *cpu_env)
 {
     CPUState *cpu = env_cpu(cpu_env);
     int sig;
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
     sigset_t set;
     sigset_t *blocked_set;
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec097647..70343095d9a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6417,16 +6417,14 @@ static void *clone_func(void *arg)
     new_thread_info *info = arg;
     CPUArchState *env;
     CPUState *cpu;
-    TaskState *ts;
 
     rcu_register_thread();
     tcg_register_thread();
     env = info->env;
     cpu = env_cpu(env);
     thread_cpu = cpu;
-    ts = (TaskState *)cpu->opaque;
     info->tid = sys_gettid();
-    task_settid(ts);
+    task_settid(cpu->task_state);
     if (info->child_tidptr)
         put_user_u32(info->tid, info->child_tidptr);
     if (info->parent_tidptr)
@@ -6454,7 +6452,6 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
 {
     CPUState *cpu = env_cpu(env);
     int ret;
-    TaskState *ts;
     CPUState *new_cpu;
     CPUArchState *new_env;
     sigset_t sigmask;
@@ -6466,7 +6463,8 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         flags &= ~(CLONE_VFORK | CLONE_VM);
 
     if (flags & CLONE_VM) {
-        TaskState *parent_ts = (TaskState *)cpu->opaque;
+        TaskState *ts;
+        TaskState *parent_ts = cpu->task_state;
         new_thread_info info;
         pthread_attr_t attr;
 
@@ -6487,7 +6485,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         cpu_clone_regs_child(new_env, newsp, flags);
         cpu_clone_regs_parent(env, flags);
         new_cpu = env_cpu(new_env);
-        new_cpu->opaque = ts;
+        new_cpu->task_state = ts;
         ts->bprm = parent_ts->bprm;
         ts->info = parent_ts->info;
         ts->signal_mask = parent_ts->signal_mask;
@@ -6576,11 +6574,10 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
                 put_user_u32(sys_gettid(), child_tidptr);
             if (flags & CLONE_PARENT_SETTID)
                 put_user_u32(sys_gettid(), parent_tidptr);
-            ts = (TaskState *)cpu->opaque;
             if (flags & CLONE_SETTLS)
                 cpu_set_tls (env, newtls);
             if (flags & CLONE_CHILD_CLEARTID)
-                ts->child_tidptr = child_tidptr;
+                cpu->task_state->child_tidptr = child_tidptr;
         } else {
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
@@ -7841,7 +7838,7 @@ int host_to_target_waitstatus(int status)
 static int open_self_cmdline(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
-    struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
+    struct linux_binprm *bprm = cpu->task_state->bprm;
     int i;
 
     for (i = 0; i < bprm->argc; i++) {
@@ -7858,7 +7855,6 @@ static int open_self_cmdline(void *cpu_env, int fd)
 static int open_self_maps(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
     GSList *map_info = read_self_maps();
     GSList *s;
     int count;
@@ -7879,7 +7875,7 @@ static int open_self_maps(void *cpu_env, int fd)
                 continue;
             }
 
-            if (h2g(min) == ts->info->stack_limit) {
+            if (h2g(min) == cpu->task_state->info->stack_limit) {
                 path = "[stack]";
             } else {
                 path = e->path;
@@ -7920,7 +7916,7 @@ static int open_self_maps(void *cpu_env, int fd)
 static int open_self_stat(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
+    TaskState *ts = cpu->task_state;
     g_autoptr(GString) buf = g_string_new(NULL);
     int i;
 
@@ -7952,9 +7948,8 @@ static int open_self_stat(void *cpu_env, int fd)
 static int open_self_auxv(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
-    TaskState *ts = cpu->opaque;
-    abi_ulong auxv = ts->info->saved_auxv;
-    abi_ulong len = ts->info->auxv_len;
+    abi_ulong auxv = cpu->task_state->info->saved_auxv;
+    abi_ulong len = cpu->task_state->info->auxv_len;
     char *ptr;
 
     /*
@@ -8276,7 +8271,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         pthread_mutex_lock(&clone_lock);
 
         if (CPU_NEXT(first_cpu)) {
-            TaskState *ts = cpu->opaque;
+            TaskState *ts = cpu->task_state;
 
             object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
             object_unref(OBJECT(cpu));
@@ -8700,7 +8695,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_pause /* not on alpha */
     case TARGET_NR_pause:
         if (!block_signals()) {
-            sigsuspend(&((TaskState *)cpu->opaque)->signal_mask);
+            sigsuspend(&cpu->task_state->signal_mask);
         }
         return -TARGET_EINTR;
 #endif
@@ -9305,7 +9300,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigsuspend
     case TARGET_NR_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            TaskState *ts = cpu->task_state;
 #if defined(TARGET_ALPHA)
             abi_ulong mask = arg1;
             target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
@@ -9325,7 +9320,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
     case TARGET_NR_rt_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            TaskState *ts = cpu->task_state;
 
             if (arg2 != sizeof(target_sigset_t)) {
                 return -TARGET_EINVAL;
@@ -9736,7 +9731,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_mprotect:
         arg1 = cpu_untagged_addr(cpu, arg1);
         {
-            TaskState *ts = cpu->opaque;
+            TaskState *ts = cpu->task_state;
             /* Special hack to detect libc making the stack executable.  */
             if ((arg3 & PROT_GROWSDOWN)
                 && arg1 >= ts->info->stack_limit
@@ -12184,8 +12179,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
       return do_set_thread_area(cpu_env, arg1);
 #elif defined(TARGET_M68K)
       {
-          TaskState *ts = cpu->opaque;
-          ts->tp_value = arg1;
+          cpu->task_state->tp_value = arg1;
           return 0;
       }
 #else
@@ -12198,8 +12192,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return do_get_thread_area(cpu_env, arg1);
 #elif defined(TARGET_M68K)
         {
-            TaskState *ts = cpu->opaque;
-            return ts->tp_value;
+            return cpu->task_state->tp_value;
         }
 #else
         return -TARGET_ENOSYS;
diff --git a/linux-user/vm86.c b/linux-user/vm86.c
index 4412522c4c4..2efb4227716 100644
--- a/linux-user/vm86.c
+++ b/linux-user/vm86.c
@@ -73,7 +73,7 @@ static inline unsigned int vm_getl(CPUX86State *env,
 void save_v86_state(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     struct target_vm86plus_struct * target_v86;
 
     if (!lock_user_struct(VERIFY_WRITE, target_v86, ts->target_v86, 0))
@@ -133,7 +133,7 @@ static inline void return_to_32bit(CPUX86State *env, int retval)
 static inline int set_IF(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
 
     ts->v86flags |= VIF_MASK;
     if (ts->v86flags & VIP_MASK) {
@@ -146,9 +146,8 @@ static inline int set_IF(CPUX86State *env)
 static inline void clear_IF(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
 
-    ts->v86flags &= ~VIF_MASK;
+    cs->task_state->v86flags &= ~VIF_MASK;
 }
 
 static inline void clear_TF(CPUX86State *env)
@@ -164,7 +163,7 @@ static inline void clear_AC(CPUX86State *env)
 static inline int set_vflags_long(unsigned long eflags, CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
 
     set_flags(ts->v86flags, eflags, ts->v86mask);
     set_flags(env->eflags, eflags, SAFE_MASK);
@@ -178,7 +177,7 @@ static inline int set_vflags_long(unsigned long eflags, CPUX86State *env)
 static inline int set_vflags_short(unsigned short flags, CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
 
     set_flags(ts->v86flags, flags, ts->v86mask & 0xffff);
     set_flags(env->eflags, flags, SAFE_MASK);
@@ -192,7 +191,7 @@ static inline int set_vflags_short(unsigned short flags, CPUX86State *env)
 static inline unsigned int get_vflags(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     unsigned int flags;
 
     flags = env->eflags & RETURN_MASK;
@@ -209,7 +208,7 @@ static inline unsigned int get_vflags(CPUX86State *env)
 static void do_int(CPUX86State *env, int intno)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     uint32_t int_addr, segoffs, ssp;
     unsigned int sp;
 
@@ -268,7 +267,7 @@ void handle_vm86_trap(CPUX86State *env, int trapno)
 void handle_vm86_fault(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     uint32_t csp, ssp;
     unsigned int ip, sp, newflags, newip, newcs, opcode, intno;
     int data32, pref_done;
@@ -393,7 +392,7 @@ void handle_vm86_fault(CPUX86State *env)
 int do_vm86(CPUX86State *env, long subfunction, abi_ulong vm86_addr)
 {
     CPUState *cs = env_cpu(env);
-    TaskState *ts = cs->opaque;
+    TaskState *ts = cs->task_state;
     struct target_vm86plus_struct * target_v86;
     int ret;
 
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index d919245e4f8..217a9b9fc94 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -425,7 +425,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
 #if defined(CONFIG_USER_ONLY)
         {
         CPUState *cs = env_cpu(env);
-        TaskState *ts = cs->opaque;
+        TaskState *ts = cs->task_state;
         /* Allocate the heap using sbrk.  */
         if (!ts->heap_limit) {
             abi_ulong ret;
-- 
2.26.2


