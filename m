Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BDB10DD3D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 10:00:04 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaybj-0001ox-2V
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 04:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iayOT-000317-Df
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iayON-0003KD-Du
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:21 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iayOL-0003HI-DR
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 03:46:14 -0500
Received: by mail-wm1-x344.google.com with SMTP id f4so1858063wmj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Nov 2019 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSOBcj8/Vr2/47kbFINtVltVZyirwstj5SBcex8WC+M=;
 b=m/x77NpOccCEM9wyDMaxtrWJEiAC0x1491eR2Xf5t8/jqrx7Odasfx+lNDAMKlpEqy
 PXLWDAp/jYApR6GgOVmN7OYWNf+VNeD0P0Yc0s3gL8mfRSX60bDnhkFp9TC5a9yTQGXr
 RwG4sSxC/ajiqbBeWFCytT2o+rvOO6Hzm9+ETeHPgLji6dZh/PCpdjOOIq3d/3FONw26
 6GYBNYIJaZWyHxh1XigLmWTwgdMTrwHgXy8uUKURB9BqbQTCKrEOJ48AXO3Djm5u1cT8
 6Vsscm8JS4yP7NRxQliYekVAOU+iinnP7g56PQjAWEAr0gIs7PL35lR8FUaBwW+gl7S+
 8oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSOBcj8/Vr2/47kbFINtVltVZyirwstj5SBcex8WC+M=;
 b=oCBdANuZox3BNS88skRoa3tf2lqhy/XcYphylmAG4jOiVBW7T0rXxDjjNriY2rm3kt
 QZ95tYa7VgAzCY35dNF3uPuuBcXiWqGwbvWL8ldeEgjxKxzNgnNHF+KICin8XgQLtWAa
 mYNfAhlHbK5casUL8mQ7LxXq6LIFb5+qORMTWNkVdDvyKyVowrHHfriNy8KNQG0r2Dxq
 mgn5lPpPkrs2VM2azUhXbbP20rKg8o10G6NRMCmOjB/KD9te/K5ylXstonCNrDYwepko
 P+mk5RQliEeUwop6FFlTTF5bV3sbx6Yl+nNy+uEt8GvhLZTjpVfamzIivR7loQZ57ZDN
 3v1Q==
X-Gm-Message-State: APjAAAWC902yVnZpVjn7ny69MCO2FYqvecj4tSYUwFAOIso4KEO4wOyo
 kr0cXB5V7GKFohWZhJgxQT817NAfwxU=
X-Google-Smtp-Source: APXvYqwpmPGSlTdQyDJvVxthyrdpsmfWwf+KsR27QguoX2VRYidLAcd161VadMbQ/BYrOseE1tUaAg==
X-Received: by 2002:a7b:c357:: with SMTP id l23mr18648552wmj.152.1575103571559; 
 Sat, 30 Nov 2019 00:46:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t12sm13372454wrs.96.2019.11.30.00.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 00:46:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27C371FF8F;
 Sat, 30 Nov 2019 08:46:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/14] gdbstub: stop passing GDBState * around and use
 global
Date: Sat, 30 Nov 2019 08:45:50 +0000
Message-Id: <20191130084602.10818-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130084602.10818-1-alex.bennee@linaro.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: damien.hedde@greensocs.com, luis.machado@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, alan.hayward@arm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only have one GDBState which should be allocated at the time we
process any commands. This will make further clean-up a bit easier.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 539 +++++++++++++++++++++++++++---------------------------
 1 file changed, 267 insertions(+), 272 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 36b1d7a9408..23f513f709e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -397,21 +397,21 @@ bool gdb_has_xml;
 /* XXX: This is not thread safe.  Do we care?  */
 static int gdbserver_fd = -1;
 
-static int get_char(GDBState *s)
+static int get_char(void)
 {
     uint8_t ch;
     int ret;
 
     for(;;) {
-        ret = qemu_recv(s->fd, &ch, 1, 0);
+        ret = qemu_recv(gdbserver_state.fd, &ch, 1, 0);
         if (ret < 0) {
             if (errno == ECONNRESET)
-                s->fd = -1;
+                gdbserver_state.fd = -1;
             if (errno != EINTR)
                 return -1;
         } else if (ret == 0) {
-            close(s->fd);
-            s->fd = -1;
+            close(gdbserver_state.fd);
+            gdbserver_state.fd = -1;
             return -1;
         } else {
             break;
@@ -449,11 +449,11 @@ int use_gdb_syscalls(void)
 }
 
 /* Resume execution.  */
-static inline void gdb_continue(GDBState *s)
+static inline void gdb_continue(void)
 {
 
 #ifdef CONFIG_USER_ONLY
-    s->running_state = 1;
+    gdbserver_state.running_state = 1;
     trace_gdbstub_op_continue();
 #else
     if (!runstate_needs_reset()) {
@@ -467,7 +467,7 @@ static inline void gdb_continue(GDBState *s)
  * Resume execution, per CPU actions. For user-mode emulation it's
  * equivalent to gdb_continue.
  */
-static int gdb_continue_partial(GDBState *s, char *newstates)
+static int gdb_continue_partial(char *newstates)
 {
     CPUState *cpu;
     int res = 0;
@@ -482,7 +482,7 @@ static int gdb_continue_partial(GDBState *s, char *newstates)
             cpu_single_step(cpu, sstep_flags);
         }
     }
-    s->running_state = 1;
+    gdbserver_state.running_state = 1;
 #else
     int flag = 0;
 
@@ -520,13 +520,13 @@ static int gdb_continue_partial(GDBState *s, char *newstates)
     return res;
 }
 
-static void put_buffer(GDBState *s, const uint8_t *buf, int len)
+static void put_buffer(const uint8_t *buf, int len)
 {
 #ifdef CONFIG_USER_ONLY
     int ret;
 
     while (len > 0) {
-        ret = send(s->fd, buf, len, 0);
+        ret = send(gdbserver_state.fd, buf, len, 0);
         if (ret < 0) {
             if (errno != EINTR)
                 return;
@@ -538,7 +538,7 @@ static void put_buffer(GDBState *s, const uint8_t *buf, int len)
 #else
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&s->chr, buf, len);
+    qemu_chr_fe_write_all(&gdbserver_state.chr, buf, len);
 #endif
 }
 
@@ -620,17 +620,18 @@ static void hexdump(const char *buf, int len,
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet_binary(GDBState *s, const char *buf, int len, bool dump)
+static int put_packet_binary(const char *buf, int len, bool dump)
 {
     int csum, i;
     uint8_t *p;
+    uint8_t *ps = &gdbserver_state.last_packet[0];
 
     if (dump && trace_event_get_state_backends(TRACE_GDBSTUB_IO_BINARYREPLY)) {
         hexdump(buf, len, trace_gdbstub_io_binaryreply);
     }
 
     for(;;) {
-        p = s->last_packet;
+        p = ps;
         *(p++) = '$';
         memcpy(p, buf, len);
         p += len;
@@ -642,11 +643,11 @@ static int put_packet_binary(GDBState *s, const char *buf, int len, bool dump)
         *(p++) = tohex((csum >> 4) & 0xf);
         *(p++) = tohex((csum) & 0xf);
 
-        s->last_packet_len = p - s->last_packet;
-        put_buffer(s, (uint8_t *)s->last_packet, s->last_packet_len);
+        gdbserver_state.last_packet_len = p - ps;
+        put_buffer(ps, gdbserver_state.last_packet_len);
 
 #ifdef CONFIG_USER_ONLY
-        i = get_char(s);
+        i = get_char();
         if (i < 0)
             return -1;
         if (i == '+')
@@ -659,11 +660,11 @@ static int put_packet_binary(GDBState *s, const char *buf, int len, bool dump)
 }
 
 /* return -1 if error, 0 if OK */
-static int put_packet(GDBState *s, const char *buf)
+static int put_packet(const char *buf)
 {
     trace_gdbstub_io_reply(buf);
 
-    return put_packet_binary(s, buf, strlen(buf), false);
+    return put_packet_binary(buf, strlen(buf), false);
 }
 
 /* Encode data using the encoding for 'x' packets.  */
@@ -687,37 +688,38 @@ static int memtox(char *buf, const char *mem, int len)
     return p - buf;
 }
 
-static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
+static uint32_t gdb_get_cpu_pid(CPUState *cpu)
 {
     /* TODO: In user mode, we should use the task state PID */
     if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
         /* Return the default process' PID */
-        return s->processes[s->process_num - 1].pid;
+        int index = gdbserver_state.process_num - 1;
+        return gdbserver_state.processes[index].pid;
     }
     return cpu->cluster_index + 1;
 }
 
-static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
+static GDBProcess *gdb_get_process(uint32_t pid)
 {
     int i;
 
     if (!pid) {
         /* 0 means any process, we take the first one */
-        return &s->processes[0];
+        return &gdbserver_state.processes[0];
     }
 
-    for (i = 0; i < s->process_num; i++) {
-        if (s->processes[i].pid == pid) {
-            return &s->processes[i];
+    for (i = 0; i < gdbserver_state.process_num; i++) {
+        if (gdbserver_state.processes[i].pid == pid) {
+            return &gdbserver_state.processes[i];
         }
     }
 
     return NULL;
 }
 
-static GDBProcess *gdb_get_cpu_process(const GDBState *s, CPUState *cpu)
+static GDBProcess *gdb_get_cpu_process(CPUState *cpu)
 {
-    return gdb_get_process(s, gdb_get_cpu_pid(s, cpu));
+    return gdb_get_process(gdb_get_cpu_pid(cpu));
 }
 
 static CPUState *find_cpu(uint32_t thread_id)
@@ -733,13 +735,12 @@ static CPUState *find_cpu(uint32_t thread_id)
     return NULL;
 }
 
-static CPUState *get_first_cpu_in_process(const GDBState *s,
-                                          GDBProcess *process)
+static CPUState *get_first_cpu_in_process(GDBProcess *process)
 {
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        if (gdb_get_cpu_pid(s, cpu) == process->pid) {
+        if (gdb_get_cpu_pid(cpu) == process->pid) {
             return cpu;
         }
     }
@@ -747,13 +748,13 @@ static CPUState *get_first_cpu_in_process(const GDBState *s,
     return NULL;
 }
 
-static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cpu)
+static CPUState *gdb_next_cpu_in_process(CPUState *cpu)
 {
-    uint32_t pid = gdb_get_cpu_pid(s, cpu);
+    uint32_t pid = gdb_get_cpu_pid(cpu);
     cpu = CPU_NEXT(cpu);
 
     while (cpu) {
-        if (gdb_get_cpu_pid(s, cpu) == pid) {
+        if (gdb_get_cpu_pid(cpu) == pid) {
             break;
         }
 
@@ -764,12 +765,12 @@ static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cpu)
 }
 
 /* Return the cpu following @cpu, while ignoring unattached processes. */
-static CPUState *gdb_next_attached_cpu(const GDBState *s, CPUState *cpu)
+static CPUState *gdb_next_attached_cpu(CPUState *cpu)
 {
     cpu = CPU_NEXT(cpu);
 
     while (cpu) {
-        if (gdb_get_cpu_process(s, cpu)->attached) {
+        if (gdb_get_cpu_process(cpu)->attached) {
             break;
         }
 
@@ -780,29 +781,29 @@ static CPUState *gdb_next_attached_cpu(const GDBState *s, CPUState *cpu)
 }
 
 /* Return the first attached cpu */
-static CPUState *gdb_first_attached_cpu(const GDBState *s)
+static CPUState *gdb_first_attached_cpu(void)
 {
     CPUState *cpu = first_cpu;
-    GDBProcess *process = gdb_get_cpu_process(s, cpu);
+    GDBProcess *process = gdb_get_cpu_process(cpu);
 
     if (!process->attached) {
-        return gdb_next_attached_cpu(s, cpu);
+        return gdb_next_attached_cpu(cpu);
     }
 
     return cpu;
 }
 
-static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
+static CPUState *gdb_get_cpu(uint32_t pid, uint32_t tid)
 {
     GDBProcess *process;
     CPUState *cpu;
 
     if (!pid && !tid) {
         /* 0 means any process/thread, we take the first attached one */
-        return gdb_first_attached_cpu(s);
+        return gdb_first_attached_cpu();
     } else if (pid && !tid) {
         /* any thread in a specific process */
-        process = gdb_get_process(s, pid);
+        process = gdb_get_process(pid);
 
         if (process == NULL) {
             return NULL;
@@ -812,7 +813,7 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
             return NULL;
         }
 
-        return get_first_cpu_in_process(s, process);
+        return get_first_cpu_in_process(process);
     } else {
         /* a specific thread */
         cpu = find_cpu(tid);
@@ -821,7 +822,7 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
             return NULL;
         }
 
-        process = gdb_get_cpu_process(s, cpu);
+        process = gdb_get_cpu_process(cpu);
 
         if (pid && process->pid != pid) {
             return NULL;
@@ -835,13 +836,13 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
     }
 }
 
-static const char *get_feature_xml(const GDBState *s, const char *p,
-                                   const char **newp, GDBProcess *process)
+static const char *get_feature_xml(const char *p, const char **newp,
+                                   GDBProcess *process)
 {
     size_t len;
     int i;
     const char *name;
-    CPUState *cpu = get_first_cpu_in_process(s, process);
+    CPUState *cpu = get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     len = 0;
@@ -1076,13 +1077,13 @@ static inline void gdb_cpu_breakpoint_remove_all(CPUState *cpu)
 #endif
 }
 
-static void gdb_process_breakpoint_remove_all(const GDBState *s, GDBProcess *p)
+static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 {
-    CPUState *cpu = get_first_cpu_in_process(s, p);
+    CPUState *cpu = get_first_cpu_in_process(p);
 
     while (cpu) {
         gdb_cpu_breakpoint_remove_all(cpu);
-        cpu = gdb_next_cpu_in_process(s, cpu);
+        cpu = gdb_next_cpu_in_process(cpu);
     }
 }
 
@@ -1100,20 +1101,19 @@ static void gdb_breakpoint_remove_all(void)
     }
 }
 
-static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
+static void gdb_set_cpu_pc(target_ulong pc)
 {
-    CPUState *cpu = s->c_cpu;
+    CPUState *cpu = gdbserver_state.c_cpu;
 
     cpu_synchronize_state(cpu);
     cpu_set_pc(cpu, pc);
 }
 
-static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
-                           char *buf, size_t buf_size)
+static char *gdb_fmt_thread_id(CPUState *cpu, char *buf, size_t buf_size)
 {
-    if (s->multiprocess) {
+    if (gdbserver_state.multiprocess) {
         snprintf(buf, buf_size, "p%02x.%02x",
-                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
+                 gdb_get_cpu_pid(cpu), cpu_gdb_index(cpu));
     } else {
         snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
     }
@@ -1180,7 +1180,7 @@ static GDBThreadIdKind read_thread_id(const char *buf, const char **end_buf,
  * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if there is
  *         a format error, 0 on success.
  */
-static int gdb_handle_vcont(GDBState *s, const char *p)
+static int gdb_handle_vcont(const char *p)
 {
     int res, signal = 0;
     char cur_action;
@@ -1255,36 +1255,36 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
             goto out;
 
         case GDB_ALL_PROCESSES:
-            cpu = gdb_first_attached_cpu(s);
+            cpu = gdb_first_attached_cpu();
             while (cpu) {
                 if (newstates[cpu->cpu_index] == 1) {
                     newstates[cpu->cpu_index] = cur_action;
                 }
 
-                cpu = gdb_next_attached_cpu(s, cpu);
+                cpu = gdb_next_attached_cpu(cpu);
             }
             break;
 
         case GDB_ALL_THREADS:
-            process = gdb_get_process(s, pid);
+            process = gdb_get_process(pid);
 
             if (!process->attached) {
                 res = -EINVAL;
                 goto out;
             }
 
-            cpu = get_first_cpu_in_process(s, process);
+            cpu = get_first_cpu_in_process(process);
             while (cpu) {
                 if (newstates[cpu->cpu_index] == 1) {
                     newstates[cpu->cpu_index] = cur_action;
                 }
 
-                cpu = gdb_next_cpu_in_process(s, cpu);
+                cpu = gdb_next_cpu_in_process(cpu);
             }
             break;
 
         case GDB_ONE_THREAD:
-            cpu = gdb_get_cpu(s, pid, tid);
+            cpu = gdb_get_cpu(pid, tid);
 
             /* invalid CPU/thread specified */
             if (!cpu) {
@@ -1299,8 +1299,8 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
             break;
         }
     }
-    s->signal = signal;
-    gdb_continue_partial(s, newstates);
+    gdbserver_state.signal = signal;
+    gdb_continue_partial(newstates);
 
 out:
     g_free(newstates);
@@ -1409,7 +1409,6 @@ static int cmd_parse_params(const char *data, const char *schema,
 }
 
 typedef struct GdbCmdContext {
-    GDBState *s;
     GdbCmdVariant *params;
     int num_params;
     uint8_t mem_buf[MAX_PACKET_LENGTH];
@@ -1453,7 +1452,7 @@ static inline int startswith(const char *string, const char *pattern)
   return !strncmp(string, pattern, strlen(pattern));
 }
 
-static int process_string_cmd(GDBState *s, void *user_ctx, const char *data,
+static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
     int i, schema_len, max_num_params = 0;
@@ -1490,7 +1489,6 @@ static int process_string_cmd(GDBState *s, void *user_ctx, const char *data,
             return -1;
         }
 
-        gdb_ctx.s = s;
         cmd->handler(&gdb_ctx, user_ctx);
         return 0;
     }
@@ -1507,44 +1505,43 @@ static void run_cmd_parser(GDBState *s, const char *data,
 
     /* In case there was an error during the command parsing we must
     * send a NULL packet to indicate the command is not supported */
-    if (process_string_cmd(s, NULL, data, cmd, 1)) {
-        put_packet(s, "");
+    if (process_string_cmd(NULL, data, cmd, 1)) {
+        put_packet("");
     }
 }
 
 static void handle_detach(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     GDBProcess *process;
-    GDBState *s = gdb_ctx->s;
     uint32_t pid = 1;
 
-    if (s->multiprocess) {
+    if (gdbserver_state.multiprocess) {
         if (!gdb_ctx->num_params) {
-            put_packet(s, "E22");
+            put_packet("E22");
             return;
         }
 
         pid = gdb_ctx->params[0].val_ul;
     }
 
-    process = gdb_get_process(s, pid);
-    gdb_process_breakpoint_remove_all(s, process);
+    process = gdb_get_process(pid);
+    gdb_process_breakpoint_remove_all(process);
     process->attached = false;
 
-    if (pid == gdb_get_cpu_pid(s, s->c_cpu)) {
-        s->c_cpu = gdb_first_attached_cpu(s);
+    if (pid == gdb_get_cpu_pid(gdbserver_state.c_cpu)) {
+        gdbserver_state.c_cpu = gdb_first_attached_cpu();
     }
 
-    if (pid == gdb_get_cpu_pid(s, s->g_cpu)) {
-        s->g_cpu = gdb_first_attached_cpu(s);
+    if (pid == gdb_get_cpu_pid(gdbserver_state.g_cpu)) {
+        gdbserver_state.g_cpu = gdb_first_attached_cpu();
     }
 
-    if (!s->c_cpu) {
+    if (!gdbserver_state.c_cpu) {
         /* No more process attached */
         gdb_syscall_mode = GDB_SYS_DISABLED;
-        gdb_continue(s);
+        gdb_continue();
     }
-    put_packet(s, "OK");
+    put_packet("OK");
 }
 
 static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1552,33 +1549,33 @@ static void handle_thread_alive(GdbCmdContext *gdb_ctx, void *user_ctx)
     CPUState *cpu;
 
     if (!gdb_ctx->num_params) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     if (gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->s, gdb_ctx->params[0].thread_id.pid,
+    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
                       gdb_ctx->params[0].thread_id.tid);
     if (!cpu) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 
 static void handle_continue(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc(gdb_ctx->s, gdb_ctx->params[0].val_ull);
+        gdb_set_cpu_pc(gdb_ctx->params[0].val_ull);
     }
 
-    gdb_ctx->s->signal = 0;
-    gdb_continue(gdb_ctx->s);
+    gdbserver_state.signal = 0;
+    gdb_continue();
 }
 
 static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1593,11 +1590,11 @@ static void handle_cont_with_sig(GdbCmdContext *gdb_ctx, void *user_ctx)
         signal = gdb_ctx->params[0].val_ul;
     }
 
-    gdb_ctx->s->signal = gdb_signal_to_target(signal);
-    if (gdb_ctx->s->signal == -1) {
-        gdb_ctx->s->signal = 0;
+    gdbserver_state.signal = gdb_signal_to_target(signal);
+    if (gdbserver_state.signal == -1) {
+        gdbserver_state.signal = 0;
     }
-    gdb_continue(gdb_ctx->s);
+    gdb_continue();
 }
 
 static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1605,24 +1602,24 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
     CPUState *cpu;
 
     if (gdb_ctx->num_params != 2) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     if (gdb_ctx->params[1].thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     if (gdb_ctx->params[1].thread_id.kind != GDB_ONE_THREAD) {
-        put_packet(gdb_ctx->s, "OK");
+        put_packet("OK");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->s, gdb_ctx->params[1].thread_id.pid,
+    cpu = gdb_get_cpu(gdb_ctx->params[1].thread_id.pid,
                       gdb_ctx->params[1].thread_id.tid);
     if (!cpu) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
@@ -1632,15 +1629,15 @@ static void handle_set_thread(GdbCmdContext *gdb_ctx, void *user_ctx)
      */
     switch (gdb_ctx->params[0].opcode) {
     case 'c':
-        gdb_ctx->s->c_cpu = cpu;
-        put_packet(gdb_ctx->s, "OK");
+        gdbserver_state.c_cpu = cpu;
+        put_packet("OK");
         break;
     case 'g':
-        gdb_ctx->s->g_cpu = cpu;
-        put_packet(gdb_ctx->s, "OK");
+        gdbserver_state.g_cpu = cpu;
+        put_packet("OK");
         break;
     default:
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         break;
     }
 }
@@ -1650,7 +1647,7 @@ static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     int res;
 
     if (gdb_ctx->num_params != 3) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
@@ -1658,14 +1655,14 @@ static void handle_insert_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
                                 gdb_ctx->params[1].val_ull,
                                 gdb_ctx->params[2].val_ull);
     if (res >= 0) {
-        put_packet(gdb_ctx->s, "OK");
+        put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
         return;
     }
 
-    put_packet(gdb_ctx->s, "E22");
+    put_packet("E22");
 }
 
 static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1673,7 +1670,7 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
     int res;
 
     if (gdb_ctx->num_params != 3) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
@@ -1681,14 +1678,14 @@ static void handle_remove_bp(GdbCmdContext *gdb_ctx, void *user_ctx)
                                 gdb_ctx->params[1].val_ull,
                                 gdb_ctx->params[2].val_ull);
     if (res >= 0) {
-        put_packet(gdb_ctx->s, "OK");
+        put_packet("OK");
         return;
     } else if (res == -ENOSYS) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
         return;
     }
 
-    put_packet(gdb_ctx->s, "E22");
+    put_packet("E22");
 }
 
 /*
@@ -1707,20 +1704,20 @@ static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
         return;
     }
 
     if (gdb_ctx->num_params != 2) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     reg_size = strlen(gdb_ctx->params[1].data) / 2;
     hextomem(gdb_ctx->mem_buf, gdb_ctx->params[1].data, reg_size);
-    gdb_write_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf,
+    gdb_write_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf,
                        gdb_ctx->params[0].val_ull);
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 
 static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1728,73 +1725,73 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
     int reg_size;
 
     if (!gdb_has_xml) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
         return;
     }
 
     if (!gdb_ctx->num_params) {
-        put_packet(gdb_ctx->s, "E14");
+        put_packet("E14");
         return;
     }
 
-    reg_size = gdb_read_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf,
+    reg_size = gdb_read_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf,
                                  gdb_ctx->params[0].val_ull);
     if (!reg_size) {
-        put_packet(gdb_ctx->s, "E14");
+        put_packet("E14");
         return;
     }
 
     memtohex(gdb_ctx->str_buf, gdb_ctx->mem_buf, reg_size);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_write_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     if (gdb_ctx->num_params != 3) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     /* hextomem() reads 2*len bytes */
     if (gdb_ctx->params[1].val_ull > strlen(gdb_ctx->params[2].data) / 2) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     hextomem(gdb_ctx->mem_buf, gdb_ctx->params[2].data,
              gdb_ctx->params[1].val_ull);
-    if (target_memory_rw_debug(gdb_ctx->s->g_cpu, gdb_ctx->params[0].val_ull,
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
                                gdb_ctx->mem_buf,
                                gdb_ctx->params[1].val_ull, true)) {
-        put_packet(gdb_ctx->s, "E14");
+        put_packet("E14");
         return;
     }
 
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 
 static void handle_read_mem(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     if (gdb_ctx->num_params != 2) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     /* memtohex() doubles the required space */
     if (gdb_ctx->params[1].val_ull > MAX_PACKET_LENGTH / 2) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
-    if (target_memory_rw_debug(gdb_ctx->s->g_cpu, gdb_ctx->params[0].val_ull,
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, gdb_ctx->params[0].val_ull,
                                gdb_ctx->mem_buf,
                                gdb_ctx->params[1].val_ull, false)) {
-        put_packet(gdb_ctx->s, "E14");
+        put_packet("E14");
         return;
     }
 
     memtohex(gdb_ctx->str_buf, gdb_ctx->mem_buf, gdb_ctx->params[1].val_ull);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1807,37 +1804,37 @@ static void handle_write_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    cpu_synchronize_state(gdb_ctx->s->g_cpu);
+    cpu_synchronize_state(gdbserver_state.g_cpu);
     registers = gdb_ctx->mem_buf;
     len = strlen(gdb_ctx->params[0].data) / 2;
     hextomem(registers, gdb_ctx->params[0].data, len);
-    for (addr = 0; addr < gdb_ctx->s->g_cpu->gdb_num_g_regs && len > 0;
+    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
          addr++) {
-        reg_size = gdb_write_register(gdb_ctx->s->g_cpu, registers, addr);
+        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
         len -= reg_size;
         registers += reg_size;
     }
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 
 static void handle_read_all_regs(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     target_ulong addr, len;
 
-    cpu_synchronize_state(gdb_ctx->s->g_cpu);
+    cpu_synchronize_state(gdbserver_state.g_cpu);
     len = 0;
-    for (addr = 0; addr < gdb_ctx->s->g_cpu->gdb_num_g_regs; addr++) {
-        len += gdb_read_register(gdb_ctx->s->g_cpu, gdb_ctx->mem_buf + len,
+    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs; addr++) {
+        len += gdb_read_register(gdbserver_state.g_cpu, gdb_ctx->mem_buf + len,
                                  addr);
     }
 
     memtohex(gdb_ctx->str_buf, gdb_ctx->mem_buf, len);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    if (gdb_ctx->num_params >= 1 && gdb_ctx->s->current_syscall_cb) {
+    if (gdb_ctx->num_params >= 1 && gdbserver_state.current_syscall_cb) {
         target_ulong ret, err;
 
         ret = (target_ulong)gdb_ctx->params[0].val_ull;
@@ -1846,31 +1843,31 @@ static void handle_file_io(GdbCmdContext *gdb_ctx, void *user_ctx)
         } else {
             err = 0;
         }
-        gdb_ctx->s->current_syscall_cb(gdb_ctx->s->c_cpu, ret, err);
-        gdb_ctx->s->current_syscall_cb = NULL;
+        gdbserver_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
+        gdbserver_state.current_syscall_cb = NULL;
     }
 
     if (gdb_ctx->num_params >= 3 && gdb_ctx->params[2].opcode == (uint8_t)'C') {
-        put_packet(gdb_ctx->s, "T02");
+        put_packet("T02");
         return;
     }
 
-    gdb_continue(gdb_ctx->s);
+    gdb_continue();
 }
 
 static void handle_step(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     if (gdb_ctx->num_params) {
-        gdb_set_cpu_pc(gdb_ctx->s, (target_ulong)gdb_ctx->params[0].val_ull);
+        gdb_set_cpu_pc((target_ulong)gdb_ctx->params[0].val_ull);
     }
 
-    cpu_single_step(gdb_ctx->s->c_cpu, sstep_flags);
-    gdb_continue(gdb_ctx->s);
+    cpu_single_step(gdbserver_state.c_cpu, sstep_flags);
+    gdb_continue();
 }
 
 static void handle_v_cont_query(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    put_packet(gdb_ctx->s, "vCont;c;C;s;S");
+    put_packet("vCont;c;C;s;S");
 }
 
 static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1881,11 +1878,11 @@ static void handle_v_cont(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    res = gdb_handle_vcont(gdb_ctx->s, gdb_ctx->params[0].data);
+    res = gdb_handle_vcont(gdb_ctx->params[0].data);
     if ((res == -EINVAL) || (res == -ERANGE)) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
     } else if (res) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
     }
 }
 
@@ -1900,31 +1897,31 @@ static void handle_v_attach(GdbCmdContext *gdb_ctx, void *user_ctx)
         goto cleanup;
     }
 
-    process = gdb_get_process(gdb_ctx->s, gdb_ctx->params[0].val_ul);
+    process = gdb_get_process(gdb_ctx->params[0].val_ul);
     if (!process) {
         goto cleanup;
     }
 
-    cpu = get_first_cpu_in_process(gdb_ctx->s, process);
+    cpu = get_first_cpu_in_process(process);
     if (!cpu) {
         goto cleanup;
     }
 
     process->attached = true;
-    gdb_ctx->s->g_cpu = cpu;
-    gdb_ctx->s->c_cpu = cpu;
+    gdbserver_state.g_cpu = cpu;
+    gdbserver_state.c_cpu = cpu;
 
-    gdb_fmt_thread_id(gdb_ctx->s, cpu, thread_id, sizeof(thread_id));
+    gdb_fmt_thread_id(cpu, thread_id, sizeof(thread_id));
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "T%02xthread:%s;",
              GDB_SIGNAL_TRAP, thread_id);
 cleanup:
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     /* Kill the target */
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
     exit(0);
 }
@@ -1961,10 +1958,10 @@ static void handle_v_commands(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
                            gdb_v_commands_table,
                            ARRAY_SIZE(gdb_v_commands_table))) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
     }
 }
 
@@ -1973,7 +1970,7 @@ static void handle_query_qemu_sstepbits(GdbCmdContext *gdb_ctx, void *user_ctx)
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf),
              "ENABLE=%x,NOIRQ=%x,NOTIMER=%x", SSTEP_ENABLE,
              SSTEP_NOIRQ, SSTEP_NOTIMER);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_set_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -1983,13 +1980,13 @@ static void handle_set_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
 
     sstep_flags = gdb_ctx->params[0].val_ul;
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 
 static void handle_query_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "0x%x", sstep_flags);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -2003,33 +2000,32 @@ static void handle_query_curr_tid(GdbCmdContext *gdb_ctx, void *user_ctx)
      * the first thread of the current process (gdb returns the
      * first thread).
      */
-    process = gdb_get_cpu_process(gdb_ctx->s, gdb_ctx->s->g_cpu);
-    cpu = get_first_cpu_in_process(gdb_ctx->s, process);
-    gdb_fmt_thread_id(gdb_ctx->s, cpu, thread_id, sizeof(thread_id));
+    process = gdb_get_cpu_process(gdbserver_state.g_cpu);
+    cpu = get_first_cpu_in_process(process);
+    gdb_fmt_thread_id(cpu, thread_id, sizeof(thread_id));
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "QC%s", thread_id);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_query_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     char thread_id[16];
 
-    if (!gdb_ctx->s->query_cpu) {
-        put_packet(gdb_ctx->s, "l");
+    if (!gdbserver_state.query_cpu) {
+        put_packet("l");
         return;
     }
 
-    gdb_fmt_thread_id(gdb_ctx->s, gdb_ctx->s->query_cpu, thread_id,
+    gdb_fmt_thread_id(gdbserver_state.query_cpu, thread_id,
                       sizeof(thread_id));
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "m%s", thread_id);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
-    gdb_ctx->s->query_cpu =
-        gdb_next_attached_cpu(gdb_ctx->s, gdb_ctx->s->query_cpu);
+    put_packet(gdb_ctx->str_buf);
+    gdbserver_state.query_cpu = gdb_next_attached_cpu(gdbserver_state.query_cpu);
 }
 
 static void handle_query_first_threads(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    gdb_ctx->s->query_cpu = gdb_first_attached_cpu(gdb_ctx->s);
+    gdbserver_state.query_cpu = gdb_first_attached_cpu();
     handle_query_threads(gdb_ctx, user_ctx);
 }
 
@@ -2040,11 +2036,11 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     if (!gdb_ctx->num_params ||
         gdb_ctx->params[0].thread_id.kind == GDB_READ_THREAD_ERR) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
-    cpu = gdb_get_cpu(gdb_ctx->s, gdb_ctx->params[0].thread_id.pid,
+    cpu = gdb_get_cpu(gdb_ctx->params[0].thread_id.pid,
                       gdb_ctx->params[0].thread_id.tid);
     if (!cpu) {
         return;
@@ -2052,7 +2048,7 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     cpu_synchronize_state(cpu);
 
-    if (gdb_ctx->s->multiprocess && (gdb_ctx->s->process_num > 1)) {
+    if (gdbserver_state.multiprocess && (gdbserver_state.process_num > 1)) {
         /* Print the CPU model and name in multiprocess mode */
         ObjectClass *oc = object_get_class(OBJECT(cpu));
         const char *cpu_model = object_class_get_name(oc);
@@ -2069,7 +2065,7 @@ static void handle_query_thread_extra(GdbCmdContext *gdb_ctx, void *user_ctx)
     }
     trace_gdbstub_op_extra_info((char *)gdb_ctx->mem_buf);
     memtohex(gdb_ctx->str_buf, gdb_ctx->mem_buf, len);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -2077,14 +2073,14 @@ static void handle_query_offsets(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     TaskState *ts;
 
-    ts = gdb_ctx->s->c_cpu->opaque;
+    ts = gdbserver_state.c_cpu->opaque;
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf),
              "Text=" TARGET_ABI_FMT_lx ";Data=" TARGET_ABI_FMT_lx
              ";Bss=" TARGET_ABI_FMT_lx,
              ts->info->code_offset,
              ts->info->data_offset,
              ts->info->data_offset);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 #else
 static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -2092,21 +2088,21 @@ static void handle_query_rcmd(GdbCmdContext *gdb_ctx, void *user_ctx)
     int len;
 
     if (!gdb_ctx->num_params) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
     len = strlen(gdb_ctx->params[0].data);
     if (len % 2) {
-        put_packet(gdb_ctx->s, "E01");
+        put_packet("E01");
         return;
     }
 
     len = len / 2;
     hextomem(gdb_ctx->mem_buf, gdb_ctx->params[0].data, len);
     gdb_ctx->mem_buf[len++] = 0;
-    qemu_chr_be_write(gdb_ctx->s->mon_chr, gdb_ctx->mem_buf, len);
-    put_packet(gdb_ctx->s, "OK");
+    qemu_chr_be_write(gdbserver_state.mon_chr, gdb_ctx->mem_buf, len);
+    put_packet("OK");
 
 }
 #endif
@@ -2125,11 +2121,11 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     if (gdb_ctx->num_params &&
         strstr(gdb_ctx->params[0].data, "multiprocess+")) {
-        gdb_ctx->s->multiprocess = true;
+        gdbserver_state.multiprocess = true;
     }
 
     pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";multiprocess+");
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -2141,22 +2137,22 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     const char *p;
 
     if (gdb_ctx->num_params < 3) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
-    process = gdb_get_cpu_process(gdb_ctx->s, gdb_ctx->s->g_cpu);
-    cc = CPU_GET_CLASS(gdb_ctx->s->g_cpu);
+    process = gdb_get_cpu_process(gdbserver_state.g_cpu);
+    cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
     if (!cc->gdb_core_xml_file) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
         return;
     }
 
     gdb_has_xml = true;
     p = gdb_ctx->params[0].data;
-    xml = get_feature_xml(gdb_ctx->s, p, &p, process);
+    xml = get_feature_xml(p, &p, process);
     if (!xml) {
-        put_packet(gdb_ctx->s, "E00");
+        put_packet("E00");
         return;
     }
 
@@ -2164,7 +2160,7 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
     len = gdb_ctx->params[2].val_ul;
     total_len = strlen(xml);
     if (addr > total_len) {
-        put_packet(gdb_ctx->s, "E00");
+        put_packet("E00");
         return;
     }
 
@@ -2180,12 +2176,12 @@ static void handle_query_xfer_features(GdbCmdContext *gdb_ctx, void *user_ctx)
         len = memtox(gdb_ctx->str_buf + 1, xml + addr, total_len - addr);
     }
 
-    put_packet_binary(gdb_ctx->s, gdb_ctx->str_buf, len + 1, true);
+    put_packet_binary(gdb_ctx->str_buf, len + 1, true);
 }
 
 static void handle_query_attached(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    put_packet(gdb_ctx->s, GDB_ATTACHED);
+    put_packet(GDB_ATTACHED);
 }
 
 static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
@@ -2194,7 +2190,7 @@ static void handle_query_qemu_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
 #ifndef CONFIG_USER_ONLY
     pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";PhyMemMode");
 #endif
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -2202,13 +2198,13 @@ static void handle_query_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx,
                                            void *user_ctx)
 {
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "%d", phy_memory_mode);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
 }
 
 static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     if (!gdb_ctx->num_params) {
-        put_packet(gdb_ctx->s, "E22");
+        put_packet("E22");
         return;
     }
 
@@ -2217,7 +2213,7 @@ static void handle_set_qemu_phy_mem_mode(GdbCmdContext *gdb_ctx, void *user_ctx)
     } else {
         phy_memory_mode = 1;
     }
-    put_packet(gdb_ctx->s, "OK");
+    put_packet("OK");
 }
 #endif
 
@@ -2333,16 +2329,16 @@ static void handle_gen_query(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
                            gdb_gen_query_table,
                            ARRAY_SIZE(gdb_gen_query_table))) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
     }
 }
 
@@ -2352,16 +2348,16 @@ static void handle_gen_set(GdbCmdContext *gdb_ctx, void *user_ctx)
         return;
     }
 
-    if (!process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+    if (!process_string_cmd(NULL, gdb_ctx->params[0].data,
                             gdb_gen_query_set_common_table,
                             ARRAY_SIZE(gdb_gen_query_set_common_table))) {
         return;
     }
 
-    if (process_string_cmd(gdb_ctx->s, NULL, gdb_ctx->params[0].data,
+    if (process_string_cmd(NULL, gdb_ctx->params[0].data,
                            gdb_gen_set_table,
                            ARRAY_SIZE(gdb_gen_set_table))) {
-        put_packet(gdb_ctx->s, "");
+        put_packet("");
     }
 }
 
@@ -2369,11 +2365,11 @@ static void handle_target_halt(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     char thread_id[16];
 
-    gdb_fmt_thread_id(gdb_ctx->s, gdb_ctx->s->c_cpu, thread_id,
+    gdb_fmt_thread_id(gdbserver_state.c_cpu, thread_id,
                       sizeof(thread_id));
     snprintf(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), "T%02xthread:%s;",
              GDB_SIGNAL_TRAP, thread_id);
-    put_packet(gdb_ctx->s, gdb_ctx->str_buf);
+    put_packet(gdb_ctx->str_buf);
     /*
      * Remove all the breakpoints when this query is issued,
      * because gdb is doing an initial connect and the state
@@ -2390,7 +2386,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
 
     switch (line_buf[0]) {
     case '!':
-        put_packet(s, "OK");
+        put_packet("OK");
         break;
     case '?':
         {
@@ -2605,7 +2601,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         break;
     default:
         /* put empty packet */
-        put_packet(s, "");
+        put_packet("");
         break;
     }
 
@@ -2618,7 +2614,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
 
 void gdb_set_stop_cpu(CPUState *cpu)
 {
-    GDBProcess *p = gdb_get_cpu_process(&gdbserver_state, cpu);
+    GDBProcess *p = gdb_get_cpu_process(cpu);
 
     if (!p->attached) {
         /*
@@ -2635,19 +2631,18 @@ void gdb_set_stop_cpu(CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
 static void gdb_vm_state_change(void *opaque, int running, RunState state)
 {
-    GDBState *s = &gdbserver_state;
-    CPUState *cpu = s->c_cpu;
+    CPUState *cpu = gdbserver_state.c_cpu;
     char buf[256];
     char thread_id[16];
     const char *type;
     int ret;
 
-    if (running || s->state == RS_INACTIVE) {
+    if (running || gdbserver_state.state == RS_INACTIVE) {
         return;
     }
     /* Is there a GDB syscall waiting to be sent?  */
-    if (s->current_syscall_cb) {
-        put_packet(s, s->syscall_buf);
+    if (gdbserver_state.current_syscall_cb) {
+        put_packet(gdbserver_state.syscall_buf);
         return;
     }
 
@@ -2656,7 +2651,7 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
         return;
     }
 
-    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
+    gdb_fmt_thread_id(cpu, thread_id, sizeof(thread_id));
 
     switch (state) {
     case RUN_STATE_DEBUG:
@@ -2721,7 +2716,7 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
     snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
 
 send_packet:
-    put_packet(s, buf);
+    put_packet(buf);
 
     /* disable single step if it was enabled */
     cpu_single_step(cpu, 0);
@@ -2781,7 +2776,7 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
     }
     *p = 0;
 #ifdef CONFIG_USER_ONLY
-    put_packet(&gdbserver_state, gdbserver_state.syscall_buf);
+    put_packet(gdbserver_state.syscall_buf);
     /* Return control to gdb for it to process the syscall request.
      * Since the protocol requires that gdb hands control back to us
      * using a "here are the results" F packet, we don't need to check
@@ -2814,12 +2809,12 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
     uint8_t reply;
 
 #ifndef CONFIG_USER_ONLY
-    if (s->last_packet_len) {
+    if (gdbserver_state.last_packet_len) {
         /* Waiting for a response to the last packet.  If we see the start
            of a new command then abandon the previous response.  */
         if (ch == '-') {
             trace_gdbstub_err_got_nack();
-            put_buffer(s, (uint8_t *)s->last_packet, s->last_packet_len);
+            put_buffer((uint8_t *)gdbserver_state.last_packet, gdbserver_state.last_packet_len);
         } else if (ch == '+') {
             trace_gdbstub_io_got_ack();
         } else {
@@ -2827,7 +2822,7 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
         }
 
         if (ch == '+' || ch == '$')
-            s->last_packet_len = 0;
+            gdbserver_state.last_packet_len = 0;
         if (ch != '$')
             return;
     }
@@ -2838,13 +2833,13 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
     } else
 #endif
     {
-        switch(s->state) {
+        switch(gdbserver_state.state) {
         case RS_IDLE:
             if (ch == '$') {
                 /* start of command packet */
-                s->line_buf_index = 0;
-                s->line_sum = 0;
-                s->state = RS_GETLINE;
+                gdbserver_state.line_buf_index = 0;
+                gdbserver_state.line_sum = 0;
+                gdbserver_state.state = RS_GETLINE;
             } else {
                 trace_gdbstub_err_garbage(ch);
             }
@@ -2852,37 +2847,37 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
         case RS_GETLINE:
             if (ch == '}') {
                 /* start escape sequence */
-                s->state = RS_GETLINE_ESC;
-                s->line_sum += ch;
+                gdbserver_state.state = RS_GETLINE_ESC;
+                gdbserver_state.line_sum += ch;
             } else if (ch == '*') {
                 /* start run length encoding sequence */
-                s->state = RS_GETLINE_RLE;
-                s->line_sum += ch;
+                gdbserver_state.state = RS_GETLINE_RLE;
+                gdbserver_state.line_sum += ch;
             } else if (ch == '#') {
                 /* end of command, start of checksum*/
-                s->state = RS_CHKSUM1;
-            } else if (s->line_buf_index >= sizeof(s->line_buf) - 1) {
+                gdbserver_state.state = RS_CHKSUM1;
+            } else if (gdbserver_state.line_buf_index >= sizeof(gdbserver_state.line_buf) - 1) {
                 trace_gdbstub_err_overrun();
-                s->state = RS_IDLE;
+                gdbserver_state.state = RS_IDLE;
             } else {
                 /* unescaped command character */
-                s->line_buf[s->line_buf_index++] = ch;
-                s->line_sum += ch;
+                gdbserver_state.line_buf[gdbserver_state.line_buf_index++] = ch;
+                gdbserver_state.line_sum += ch;
             }
             break;
         case RS_GETLINE_ESC:
             if (ch == '#') {
                 /* unexpected end of command in escape sequence */
-                s->state = RS_CHKSUM1;
-            } else if (s->line_buf_index >= sizeof(s->line_buf) - 1) {
+                gdbserver_state.state = RS_CHKSUM1;
+            } else if (gdbserver_state.line_buf_index >= sizeof(gdbserver_state.line_buf) - 1) {
                 /* command buffer overrun */
                 trace_gdbstub_err_overrun();
-                s->state = RS_IDLE;
+                gdbserver_state.state = RS_IDLE;
             } else {
                 /* parse escaped character and leave escape state */
-                s->line_buf[s->line_buf_index++] = ch ^ 0x20;
-                s->line_sum += ch;
-                s->state = RS_GETLINE;
+                gdbserver_state.line_buf[gdbserver_state.line_buf_index++] = ch ^ 0x20;
+                gdbserver_state.line_sum += ch;
+                gdbserver_state.state = RS_GETLINE;
             }
             break;
         case RS_GETLINE_RLE:
@@ -2893,25 +2888,25 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
             if (ch < ' ' || ch == '#' || ch == '$' || ch > 126) {
                 /* invalid RLE count encoding */
                 trace_gdbstub_err_invalid_repeat(ch);
-                s->state = RS_GETLINE;
+                gdbserver_state.state = RS_GETLINE;
             } else {
                 /* decode repeat length */
                 int repeat = ch - ' ' + 3;
-                if (s->line_buf_index + repeat >= sizeof(s->line_buf) - 1) {
+                if (gdbserver_state.line_buf_index + repeat >= sizeof(gdbserver_state.line_buf) - 1) {
                     /* that many repeats would overrun the command buffer */
                     trace_gdbstub_err_overrun();
-                    s->state = RS_IDLE;
-                } else if (s->line_buf_index < 1) {
+                    gdbserver_state.state = RS_IDLE;
+                } else if (gdbserver_state.line_buf_index < 1) {
                     /* got a repeat but we have nothing to repeat */
                     trace_gdbstub_err_invalid_rle();
-                    s->state = RS_GETLINE;
+                    gdbserver_state.state = RS_GETLINE;
                 } else {
                     /* repeat the last character */
-                    memset(s->line_buf + s->line_buf_index,
-                           s->line_buf[s->line_buf_index - 1], repeat);
-                    s->line_buf_index += repeat;
-                    s->line_sum += ch;
-                    s->state = RS_GETLINE;
+                    memset(gdbserver_state.line_buf + gdbserver_state.line_buf_index,
+                           gdbserver_state.line_buf[gdbserver_state.line_buf_index - 1], repeat);
+                    gdbserver_state.line_buf_index += repeat;
+                    gdbserver_state.line_sum += ch;
+                    gdbserver_state.state = RS_GETLINE;
                 }
             }
             break;
@@ -2919,33 +2914,33 @@ static void gdb_read_byte(GDBState *s, uint8_t ch)
             /* get high hex digit of checksum */
             if (!isxdigit(ch)) {
                 trace_gdbstub_err_checksum_invalid(ch);
-                s->state = RS_GETLINE;
+                gdbserver_state.state = RS_GETLINE;
                 break;
             }
-            s->line_buf[s->line_buf_index] = '\0';
-            s->line_csum = fromhex(ch) << 4;
-            s->state = RS_CHKSUM2;
+            gdbserver_state.line_buf[gdbserver_state.line_buf_index] = '\0';
+            gdbserver_state.line_csum = fromhex(ch) << 4;
+            gdbserver_state.state = RS_CHKSUM2;
             break;
         case RS_CHKSUM2:
             /* get low hex digit of checksum */
             if (!isxdigit(ch)) {
                 trace_gdbstub_err_checksum_invalid(ch);
-                s->state = RS_GETLINE;
+                gdbserver_state.state = RS_GETLINE;
                 break;
             }
-            s->line_csum |= fromhex(ch);
+            gdbserver_state.line_csum |= fromhex(ch);
 
-            if (s->line_csum != (s->line_sum & 0xff)) {
-                trace_gdbstub_err_checksum_incorrect(s->line_sum, s->line_csum);
+            if (gdbserver_state.line_csum != (gdbserver_state.line_sum & 0xff)) {
+                trace_gdbstub_err_checksum_incorrect(gdbserver_state.line_sum, gdbserver_state.line_csum);
                 /* send NAK reply */
                 reply = '-';
-                put_buffer(s, &reply, 1);
-                s->state = RS_IDLE;
+                put_buffer(&reply, 1);
+                gdbserver_state.state = RS_IDLE;
             } else {
                 /* send ACK reply */
                 reply = '+';
-                put_buffer(s, &reply, 1);
-                s->state = gdb_handle_packet(s, s->line_buf);
+                put_buffer(&reply, 1);
+                gdbserver_state.state = gdb_handle_packet(s, gdbserver_state.line_buf);
             }
             break;
         default:
@@ -2971,7 +2966,7 @@ void gdb_exit(CPUArchState *env, int code)
   trace_gdbstub_op_exiting((uint8_t)code);
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(&gdbserver_state, buf);
+  put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
   qemu_chr_fe_deinit(&gdbserver_state.chr, true);
@@ -2988,7 +2983,7 @@ static void create_default_process(GDBState *s)
     GDBProcess *process;
     int max_pid = 0;
 
-    if (s->process_num) {
+    if (gdbserver_state.process_num) {
         max_pid = s->processes[s->process_num - 1].pid;
     }
 
@@ -3020,7 +3015,7 @@ gdb_handlesig(CPUState *cpu, int sig)
 
     if (sig != 0) {
         snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
-        put_packet(&gdbserver_state, buf);
+        put_packet(buf);
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
@@ -3064,7 +3059,7 @@ void gdb_signalled(CPUArchState *env, int sig)
     }
 
     snprintf(buf, sizeof(buf), "X%02x", target_signal_to_gdb(sig));
-    put_packet(&gdbserver_state, buf);
+    put_packet(buf);
 }
 
 static bool gdb_accept(void)
@@ -3095,7 +3090,7 @@ static bool gdb_accept(void)
     init_gdbserver_state();
     create_default_process(&gdbserver_state);
     gdbserver_state.processes[0].attached = true;
-    gdbserver_state.c_cpu = gdb_first_attached_cpu(&gdbserver_state);
+    gdbserver_state.c_cpu = gdb_first_attached_cpu();
     gdbserver_state.g_cpu = gdbserver_state.c_cpu;
     gdbserver_state.fd = fd;
     gdb_has_xml = false;
@@ -3188,7 +3183,7 @@ static void gdb_chr_event(void *opaque, int event)
             s->processes[i].attached = !i;
         }
 
-        s->c_cpu = gdb_first_attached_cpu(s);
+        s->c_cpu = gdb_first_attached_cpu();
         s->g_cpu = s->c_cpu;
 
         vm_stop(RUN_STATE_PAUSED);
@@ -3207,7 +3202,7 @@ static void gdb_monitor_output(GDBState *s, const char *msg, int len)
     if (len > (MAX_PACKET_LENGTH/2) - 1)
         len = (MAX_PACKET_LENGTH/2) - 1;
     memtohex(buf + 1, (uint8_t *)msg, len);
-    put_packet(s, buf);
+    put_packet(buf);
 }
 
 static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
@@ -3305,9 +3300,9 @@ static void create_processes(GDBState *s)
 {
     object_child_foreach(object_get_root(), find_cpu_clusters, s);
 
-    if (s->processes) {
+    if (gdbserver_state.processes) {
         /* Sort by PID */
-        qsort(s->processes, s->process_num, sizeof(s->processes[0]), pid_order);
+        qsort(gdbserver_state.processes, gdbserver_state.process_num, sizeof(gdbserver_state.processes[0]), pid_order);
     }
 
     create_default_process(s);
@@ -3387,7 +3382,7 @@ int gdbserver_start(const char *device)
 void gdbserver_cleanup(void)
 {
     if (gdbserver_state.init) {
-        put_packet(&gdbserver_state, "W00");
+        put_packet("W00");
     }
 }
 
-- 
2.20.1


