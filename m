Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0891228F8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 23:03:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSyI-0007Wb-IQ
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 17:03:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZ9-0003AI-N1
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZ3-0003hJ-HQ
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:55 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSZ3-0003gI-4H
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:37:49 -0400
Received: by mail-pf1-x442.google.com with SMTP id t87so6175001pfa.2
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=auz6sklL4M5LXs+Q33JnnlVdFEtL/kK5mScgKa9VDE4=;
	b=tg50ALsXNqQQjAS8XjYfKA2FhMZbUDDNy/YPboc6EQal1lu4LAEko9pVy6vVcUHUYW
	7QAExrod/bCki+tizOuT1zeCb2u1mnxEsMTaFgztsAkqz6MD1NpxVjBcvLsLXOlVHRI8
	fI8pdT3vT10I3R/xaVZgQ13/l+Q9jFBAdM5QCbdPZ8AL2Q8s2JWfrob1tqkG+7pzhZIN
	zQWv8M37cpk2jo0NCqnmw5IxJatuWzXFZt/y5V04TvANiAb/xKfWNPRieXqTwfGcWCBf
	DxJjEacJ3fdSOoUo3JnEXCEkmJzTUI48OLkNT7bfSwNP2jWTj3AguxmW13E4yRYUDcrS
	vGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=auz6sklL4M5LXs+Q33JnnlVdFEtL/kK5mScgKa9VDE4=;
	b=G0ygqT9uNdaLnveCZhWASVVd9jlAhQyt94PsXth9mcz6VhGsza9JeHgzNxtPBVplz9
	l11MwsMB72qF4dGPGhUzG6dtWQ5zVEY3a55RhF3nvMkn9W4UqCctTpy0OgkQkSY7nyS7
	rm/uvCiy2DotEvz4W6Gqa2bkYOnJ+f3ep/P5LtBUQdwwhDc9/XQj7ebEEEC9GPH/u4Lm
	IL9jxFb2g8N8UUvgExYLmDzlkJXgMygQf/10qmBtIYMOIscoNpDtklH7IlcKWvfNs8G/
	fjJpxUQZbkX20ATXJt0ntfj6YEnBrE8Qb/PydMSEfE4OuUpStLsCvZlJo2iRPytwSb9d
	ouqA==
X-Gm-Message-State: APjAAAVEA3fDNX8XzbXn3U/XHggpFW89AUs7t4DsNorMiVi7APxqntAs
	rHmOKHpT78e42I3vfK7mgjqIgyAx7Sw=
X-Google-Smtp-Source: APXvYqxS4Scdxlug+vXkVnYxZ8jxvRO6YVG5nfdcqqVvBL5UjxpPXCNH5OcsIF9Ng8lZqRWsejsPWg==
X-Received: by 2002:a62:6456:: with SMTP id y83mr11075131pfb.71.1558298266906; 
	Sun, 19 May 2019 13:37:46 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	i7sm11397448pfo.19.2019.05.19.13.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:37:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:36:25 -0700
Message-Id: <20190519203726.20729-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519203726.20729-1-richard.henderson@linaro.org>
References: <20190519203726.20729-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v7 13/74] linux-user: Split out ipc syscalls
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of the ipc multiplex syscall, these must be done all at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall-defs.h    |   38 ++
 linux-user/strace.c          |   83 ---
 linux-user/syscall-ipc.inc.c | 1088 ++++++++++++++++++++++++++++++++++
 linux-user/syscall.c         |  973 +-----------------------------
 linux-user/strace.list       |   42 --
 5 files changed, 1129 insertions(+), 1095 deletions(-)
 create mode 100644 linux-user/syscall-ipc.inc.c

diff --git a/linux-user/syscall-defs.h b/linux-user/syscall-defs.h
index 1fc89c1b08..6d6349da01 100644
--- a/linux-user/syscall-defs.h
+++ b/linux-user/syscall-defs.h
@@ -17,6 +17,21 @@
  */
 
 SYSCALL_DEF(close, ARG_DEC);
+#ifdef TARGET_NR_ipc
+SYSCALL_DEF_ARGS(ipc, ARG_HEX, ARG_DEC, ARG_DEC, ARG_HEX, ARG_PTR, ARG_HEX);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgctl)
+SYSCALL_DEF(msgctl, ARG_DEC, ARG_DEC, ARG_PTR);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgget)
+SYSCALL_DEF(msgget, ARG_DEC, ARG_DEC);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgrcv)
+SYSCALL_DEF(msgrcv, ARG_DEC, ARG_PTR, ARG_DEC, ARG_DEC, ARG_HEX);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_msgsnd)
+SYSCALL_DEF(msgsnd, ARG_DEC, ARG_PTR, ARG_DEC, ARG_HEX);
+#endif
 SYSCALL_DEF(name_to_handle_at,
             ARG_ATDIRFD, ARG_STR, ARG_PTR, ARG_PTR, ARG_ATFLAG);
 #ifdef TARGET_NR_open
@@ -44,5 +59,28 @@ SYSCALL_DEF(readlink, ARG_STR, ARG_PTR, ARG_DEC);
 SYSCALL_DEF(readlinkat, ARG_ATDIRFD, ARG_STR, ARG_PTR, ARG_DEC);
 #endif
 SYSCALL_DEF(readv, ARG_DEC, ARG_PTR, ARG_DEC);
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_semctl)
+SYSCALL_DEF(semctl, ARG_DEC, ARG_DEC, ARG_DEC, ARG_HEX);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_semget)
+SYSCALL_DEF(semget, ARG_DEC, ARG_DEC, ARG_HEX);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_semop)
+SYSCALL_DEF(semop, ARG_DEC, ARG_PTR, ARG_DEC);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_shmat)
+SYSCALL_DEF_FULL(shmat, .impl = impl_shmat,
+                 .print_ret = print_syscall_ptr_ret,
+                 .arg_type = { ARG_DEC, ARG_PTR, ARG_HEX });
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_shmctl)
+SYSCALL_DEF(shmctl, ARG_DEC, ARG_DEC, ARG_PTR);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_shmdt)
+SYSCALL_DEF(shmdt, ARG_PTR);
+#endif
+#if !defined(SYSCALL_TABLE) || defined(TARGET_NR_shmget)
+SYSCALL_DEF(shmget, ARG_DEC, ARG_DEC, ARG_HEX);
+#endif
 SYSCALL_DEF(write, ARG_DEC, ARG_PTR, ARG_DEC);
 SYSCALL_DEF(writev, ARG_DEC, ARG_PTR, ARG_DEC);
diff --git a/linux-user/strace.c b/linux-user/strace.c
index e92b2c298e..e1c4859a95 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1,8 +1,4 @@
 #include "qemu/osdep.h"
-#include <sys/ipc.h>
-#include <sys/msg.h>
-#include <sys/sem.h>
-#include <sys/shm.h>
 #include <sys/select.h>
 #include <sys/mount.h>
 #include <arpa/inet.h>
@@ -74,54 +70,6 @@ UNUSED static void print_socket_protocol(int domain, int type, int protocol);
 /*
  * Utility functions
  */
-static void
-print_ipc_cmd(int cmd)
-{
-#define output_cmd(val) \
-if( cmd == val ) { \
-    gemu_log(#val); \
-    return; \
-}
-
-    cmd &= 0xff;
-
-    /* General IPC commands */
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_SET );
-    output_cmd( IPC_STAT );
-    output_cmd( IPC_INFO );
-    /* msgctl() commands */
-    output_cmd( MSG_STAT );
-    output_cmd( MSG_INFO );
-    /* shmctl() commands */
-    output_cmd( SHM_LOCK );
-    output_cmd( SHM_UNLOCK );
-    output_cmd( SHM_STAT );
-    output_cmd( SHM_INFO );
-    /* semctl() commands */
-    output_cmd( GETPID );
-    output_cmd( GETVAL );
-    output_cmd( GETALL );
-    output_cmd( GETNCNT );
-    output_cmd( GETZCNT );
-    output_cmd( SETVAL );
-    output_cmd( SETALL );
-    output_cmd( SEM_STAT );
-    output_cmd( SEM_INFO );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-    output_cmd( IPC_RMID );
-
-    /* Some value we don't recognize */
-    gemu_log("%d",cmd);
-}
-
 static void
 print_signal(abi_ulong arg, int last)
 {
@@ -620,18 +568,6 @@ print_newselect(const struct syscallname *name,
 }
 #endif
 
-#ifdef TARGET_NR_semctl
-static void
-print_semctl(const struct syscallname *name,
-             abi_long arg1, abi_long arg2, abi_long arg3,
-             abi_long arg4, abi_long arg5, abi_long arg6)
-{
-    gemu_log("%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ",", name->name, arg1, arg2);
-    print_ipc_cmd(arg3);
-    gemu_log(",0x" TARGET_ABI_FMT_lx ")", arg4);
-}
-#endif
-
 static void
 print_execve(const struct syscallname *name,
              abi_long arg1, abi_long arg2, abi_long arg3,
@@ -664,25 +600,6 @@ print_execve(const struct syscallname *name,
     gemu_log("NULL})");
 }
 
-#ifdef TARGET_NR_ipc
-static void
-print_ipc(const struct syscallname *name,
-          abi_long arg1, abi_long arg2, abi_long arg3,
-          abi_long arg4, abi_long arg5, abi_long arg6)
-{
-    switch(arg1) {
-    case IPCOP_semctl:
-        gemu_log("semctl(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ",", arg1, arg2);
-        print_ipc_cmd(arg3);
-        gemu_log(",0x" TARGET_ABI_FMT_lx ")", arg4);
-        break;
-    default:
-        gemu_log("%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ")",
-                 name->name, arg1, arg2, arg3, arg4);
-    }
-}
-#endif
-
 /*
  * Variants for the return value output function
  */
diff --git a/linux-user/syscall-ipc.inc.c b/linux-user/syscall-ipc.inc.c
new file mode 100644
index 0000000000..26ee3be8bf
--- /dev/null
+++ b/linux-user/syscall-ipc.inc.c
@@ -0,0 +1,1088 @@
+/*
+ *  Linux ipc-related syscalls
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+#ifdef __NR_msgsnd
+safe_syscall4(int, msgsnd, int, msgid, const void *, msgp, size_t, sz,
+              int, flags)
+safe_syscall5(int, msgrcv, int, msgid, void *, msgp, size_t, sz,
+              long, msgtype, int, flags)
+safe_syscall4(int, semtimedop, int, semid, struct sembuf *, tsops,
+              unsigned, nsops, const struct timespec *, timeout)
+#else
+/*
+ * This host kernel architecture uses a single ipc syscall; fake up
+ * wrappers for the sub-operations to hide this implementation detail.
+ * Annoyingly we can't include linux/ipc.h to get the constant definitions
+ * for the call parameter because some structs in there conflict with the
+ * sys/ipc.h ones. So we just define them here, and rely on them being
+ * the same for all host architectures.
+ */
+#define Q_SEMTIMEDOP 4
+#define Q_MSGSND 11
+#define Q_MSGRCV 12
+#define Q_IPCCALL(VERSION, OP) ((VERSION) << 16 | (OP))
+
+safe_syscall6(int, ipc, int, call, long, first, long, second, long, third,
+              void *, ptr, long, fifth)
+
+static int safe_msgsnd(int msgid, const void *msgp, size_t sz, int flags)
+{
+    return safe_ipc(Q_IPCCALL(0, Q_MSGSND), msgid, sz, flags, (void *)msgp, 0);
+}
+
+static int safe_msgrcv(int msgid, void *msgp, size_t sz, long type, int flags)
+{
+    return safe_ipc(Q_IPCCALL(1, Q_MSGRCV), msgid, sz, flags, msgp, type);
+}
+
+static int safe_semtimedop(int semid, struct sembuf *tsops, unsigned nsops,
+                           const struct timespec *timeout)
+{
+    return safe_ipc(Q_IPCCALL(0, Q_SEMTIMEDOP), semid, nsops, 0, tsops,
+                    (long)timeout);
+}
+#endif
+
+/* See <linux/ipc.h> comment above.  */
+#define SEMOPM  500
+
+#define N_SHM_REGIONS  32
+
+static struct shm_region {
+    abi_ulong start;
+    abi_ulong size;
+    bool in_use;
+} shm_regions[N_SHM_REGIONS];
+
+#ifndef TARGET_SEMID64_DS
+/* asm-generic version of this struct */
+struct target_semid64_ds {
+    struct target_ipc_perm sem_perm;
+    abi_ulong sem_otime;
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused1;
+#endif
+    abi_ulong sem_ctime;
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused2;
+#endif
+    abi_ulong sem_nsems;
+    abi_ulong __unused3;
+    abi_ulong __unused4;
+};
+#endif
+
+static abi_long target_to_host_ipc_perm(struct ipc_perm *host_ip,
+                                        abi_ulong target_addr)
+{
+    struct target_ipc_perm *target_ip;
+    struct target_semid64_ds *target_sd;
+
+    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    target_ip = &target_sd->sem_perm;
+    host_ip->__key = tswap32(target_ip->__key);
+    host_ip->uid = tswap32(target_ip->uid);
+    host_ip->gid = tswap32(target_ip->gid);
+    host_ip->cuid = tswap32(target_ip->cuid);
+    host_ip->cgid = tswap32(target_ip->cgid);
+#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_PPC)
+    host_ip->mode = tswap32(target_ip->mode);
+#else
+    host_ip->mode = tswap16(target_ip->mode);
+#endif
+#if defined(TARGET_PPC)
+    host_ip->__seq = tswap32(target_ip->__seq);
+#else
+    host_ip->__seq = tswap16(target_ip->__seq);
+#endif
+    unlock_user_struct(target_sd, target_addr, 0);
+    return 0;
+}
+
+static abi_long host_to_target_ipc_perm(abi_ulong target_addr,
+                                        struct ipc_perm *host_ip)
+{
+    struct target_ipc_perm *target_ip;
+    struct target_semid64_ds *target_sd;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    target_ip = &target_sd->sem_perm;
+    target_ip->__key = tswap32(host_ip->__key);
+    target_ip->uid = tswap32(host_ip->uid);
+    target_ip->gid = tswap32(host_ip->gid);
+    target_ip->cuid = tswap32(host_ip->cuid);
+    target_ip->cgid = tswap32(host_ip->cgid);
+#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_PPC)
+    target_ip->mode = tswap32(host_ip->mode);
+#else
+    target_ip->mode = tswap16(host_ip->mode);
+#endif
+#if defined(TARGET_PPC)
+    target_ip->__seq = tswap32(host_ip->__seq);
+#else
+    target_ip->__seq = tswap16(host_ip->__seq);
+#endif
+    unlock_user_struct(target_sd, target_addr, 1);
+    return 0;
+}
+
+static abi_long target_to_host_semid_ds(struct semid_ds *host_sd,
+                                        abi_ulong target_addr)
+{
+    struct target_semid64_ds *target_sd;
+
+    if (target_to_host_ipc_perm(&host_sd->sem_perm, target_addr)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    host_sd->sem_nsems = tswapal(target_sd->sem_nsems);
+    host_sd->sem_otime = tswapal(target_sd->sem_otime);
+    host_sd->sem_ctime = tswapal(target_sd->sem_ctime);
+    unlock_user_struct(target_sd, target_addr, 0);
+    return 0;
+}
+
+static abi_long host_to_target_semid_ds(abi_ulong target_addr,
+                                        struct semid_ds *host_sd)
+{
+    struct target_semid64_ds *target_sd;
+
+    if (host_to_target_ipc_perm(target_addr, &host_sd->sem_perm)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    target_sd->sem_nsems = tswapal(host_sd->sem_nsems);
+    target_sd->sem_otime = tswapal(host_sd->sem_otime);
+    target_sd->sem_ctime = tswapal(host_sd->sem_ctime);
+    unlock_user_struct(target_sd, target_addr, 1);
+    return 0;
+}
+
+struct target_seminfo {
+    int semmap;
+    int semmni;
+    int semmns;
+    int semmnu;
+    int semmsl;
+    int semopm;
+    int semume;
+    int semusz;
+    int semvmx;
+    int semaem;
+};
+
+static abi_long host_to_target_seminfo(abi_ulong target_addr,
+                                       struct seminfo *host_seminfo)
+{
+    struct target_seminfo *target_seminfo;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_seminfo, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(host_seminfo->semmap, &target_seminfo->semmap);
+    __put_user(host_seminfo->semmni, &target_seminfo->semmni);
+    __put_user(host_seminfo->semmns, &target_seminfo->semmns);
+    __put_user(host_seminfo->semmnu, &target_seminfo->semmnu);
+    __put_user(host_seminfo->semmsl, &target_seminfo->semmsl);
+    __put_user(host_seminfo->semopm, &target_seminfo->semopm);
+    __put_user(host_seminfo->semume, &target_seminfo->semume);
+    __put_user(host_seminfo->semusz, &target_seminfo->semusz);
+    __put_user(host_seminfo->semvmx, &target_seminfo->semvmx);
+    __put_user(host_seminfo->semaem, &target_seminfo->semaem);
+    unlock_user_struct(target_seminfo, target_addr, 1);
+    return 0;
+}
+
+union semun {
+    int val;
+    struct semid_ds *buf;
+    unsigned short *array;
+    struct seminfo *__buf;
+};
+
+union target_semun {
+    int val;
+    abi_ulong buf;
+    abi_ulong array;
+    abi_ulong __buf;
+};
+
+static abi_long target_to_host_semarray(int semid,
+                                        unsigned short **host_array,
+                                        abi_ulong target_addr)
+{
+    int nsems;
+    unsigned short *array;
+    union semun semun;
+    struct semid_ds semid_ds;
+    int i, ret;
+
+    semun.buf = &semid_ds;
+
+    ret = semctl(semid, 0, IPC_STAT, semun);
+    if (ret == -1) {
+        return get_errno(ret);
+    }
+
+    nsems = semid_ds.sem_nsems;
+
+    *host_array = g_try_new(unsigned short, nsems);
+    if (!*host_array) {
+        return -TARGET_ENOMEM;
+    }
+    array = lock_user(VERIFY_READ, target_addr,
+                      nsems * sizeof(unsigned short), 1);
+    if (!array) {
+        g_free(*host_array);
+        return -TARGET_EFAULT;
+    }
+    for (i = 0; i < nsems; i++) {
+        __get_user((*host_array)[i], &array[i]);
+    }
+    unlock_user(array, target_addr, 0);
+
+    return 0;
+}
+
+static abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
+                                        unsigned short **host_array)
+{
+    int nsems;
+    unsigned short *array;
+    union semun semun;
+    struct semid_ds semid_ds;
+    int i, ret;
+
+    semun.buf = &semid_ds;
+
+    ret = semctl(semid, 0, IPC_STAT, semun);
+    if (ret == -1) {
+        return get_errno(ret);
+    }
+
+    nsems = semid_ds.sem_nsems;
+
+    array = lock_user(VERIFY_WRITE, target_addr,
+                      nsems * sizeof(unsigned short), 0);
+    if (!array) {
+        return -TARGET_EFAULT;
+    }
+    for (i = 0; i < nsems; i++) {
+        __put_user((*host_array)[i], &array[i]);
+    }
+    g_free(*host_array);
+    unlock_user(array, target_addr, 1);
+
+    return 0;
+}
+
+struct target_sembuf {
+    unsigned short sem_num;
+    short sem_op;
+    short sem_flg;
+};
+
+static abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
+                                      abi_ulong target_addr,
+                                      unsigned nsops)
+{
+    struct target_sembuf *target_sembuf;
+    int i;
+
+    target_sembuf = lock_user(VERIFY_READ, target_addr,
+                              nsops * sizeof(struct target_sembuf), 1);
+    if (!target_sembuf) {
+        return -TARGET_EFAULT;
+    }
+    for (i = 0; i < nsops; i++) {
+        __get_user(host_sembuf[i].sem_num, &target_sembuf[i].sem_num);
+        __get_user(host_sembuf[i].sem_op, &target_sembuf[i].sem_op);
+        __get_user(host_sembuf[i].sem_flg, &target_sembuf[i].sem_flg);
+    }
+    unlock_user(target_sembuf, target_addr, 0);
+    return 0;
+}
+
+struct target_msqid_ds {
+    struct target_ipc_perm msg_perm;
+    abi_ulong msg_stime;
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused1;
+#endif
+    abi_ulong msg_rtime;
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused2;
+#endif
+    abi_ulong msg_ctime;
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused3;
+#endif
+    abi_ulong __msg_cbytes;
+    abi_ulong msg_qnum;
+    abi_ulong msg_qbytes;
+    abi_ulong msg_lspid;
+    abi_ulong msg_lrpid;
+    abi_ulong __unused4;
+    abi_ulong __unused5;
+};
+
+static abi_long target_to_host_msqid_ds(struct msqid_ds *host_md,
+                                        abi_ulong target_addr)
+{
+    struct target_msqid_ds *target_md;
+
+    if (target_to_host_ipc_perm(&host_md->msg_perm, target_addr)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_READ, target_md, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    host_md->msg_stime = tswapal(target_md->msg_stime);
+    host_md->msg_rtime = tswapal(target_md->msg_rtime);
+    host_md->msg_ctime = tswapal(target_md->msg_ctime);
+    host_md->__msg_cbytes = tswapal(target_md->__msg_cbytes);
+    host_md->msg_qnum = tswapal(target_md->msg_qnum);
+    host_md->msg_qbytes = tswapal(target_md->msg_qbytes);
+    host_md->msg_lspid = tswapal(target_md->msg_lspid);
+    host_md->msg_lrpid = tswapal(target_md->msg_lrpid);
+    unlock_user_struct(target_md, target_addr, 0);
+    return 0;
+}
+
+static abi_long host_to_target_msqid_ds(abi_ulong target_addr,
+                                        struct msqid_ds *host_md)
+{
+    struct target_msqid_ds *target_md;
+
+    if (host_to_target_ipc_perm(target_addr, &host_md->msg_perm)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_WRITE, target_md, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    target_md->msg_stime = tswapal(host_md->msg_stime);
+    target_md->msg_rtime = tswapal(host_md->msg_rtime);
+    target_md->msg_ctime = tswapal(host_md->msg_ctime);
+    target_md->__msg_cbytes = tswapal(host_md->__msg_cbytes);
+    target_md->msg_qnum = tswapal(host_md->msg_qnum);
+    target_md->msg_qbytes = tswapal(host_md->msg_qbytes);
+    target_md->msg_lspid = tswapal(host_md->msg_lspid);
+    target_md->msg_lrpid = tswapal(host_md->msg_lrpid);
+    unlock_user_struct(target_md, target_addr, 1);
+    return 0;
+}
+
+struct target_msginfo {
+    int msgpool;
+    int msgmap;
+    int msgmax;
+    int msgmnb;
+    int msgmni;
+    int msgssz;
+    int msgtql;
+    unsigned short int msgseg;
+};
+
+static abi_long host_to_target_msginfo(abi_ulong target_addr,
+                                       struct msginfo *host_msginfo)
+{
+    struct target_msginfo *target_msginfo;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_msginfo, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(host_msginfo->msgpool, &target_msginfo->msgpool);
+    __put_user(host_msginfo->msgmap, &target_msginfo->msgmap);
+    __put_user(host_msginfo->msgmax, &target_msginfo->msgmax);
+    __put_user(host_msginfo->msgmnb, &target_msginfo->msgmnb);
+    __put_user(host_msginfo->msgmni, &target_msginfo->msgmni);
+    __put_user(host_msginfo->msgssz, &target_msginfo->msgssz);
+    __put_user(host_msginfo->msgtql, &target_msginfo->msgtql);
+    __put_user(host_msginfo->msgseg, &target_msginfo->msgseg);
+    unlock_user_struct(target_msginfo, target_addr, 1);
+    return 0;
+}
+
+struct target_msgbuf {
+    abi_long mtype;
+    char mtext[1];
+};
+
+static abi_long target_to_host_shmid_ds(struct shmid_ds *host_sd,
+                                        abi_ulong target_addr)
+{
+    struct target_shmid_ds *target_sd;
+
+    if (target_to_host_ipc_perm(&host_sd->shm_perm, target_addr)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_sd->shm_segsz, &target_sd->shm_segsz);
+    __get_user(host_sd->shm_atime, &target_sd->shm_atime);
+    __get_user(host_sd->shm_dtime, &target_sd->shm_dtime);
+    __get_user(host_sd->shm_ctime, &target_sd->shm_ctime);
+    __get_user(host_sd->shm_cpid, &target_sd->shm_cpid);
+    __get_user(host_sd->shm_lpid, &target_sd->shm_lpid);
+    __get_user(host_sd->shm_nattch, &target_sd->shm_nattch);
+    unlock_user_struct(target_sd, target_addr, 0);
+    return 0;
+}
+
+static abi_long host_to_target_shmid_ds(abi_ulong target_addr,
+                                        struct shmid_ds *host_sd)
+{
+    struct target_shmid_ds *target_sd;
+
+    if (host_to_target_ipc_perm(target_addr, &host_sd->shm_perm)) {
+        return -TARGET_EFAULT;
+    }
+    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(host_sd->shm_segsz, &target_sd->shm_segsz);
+    __put_user(host_sd->shm_atime, &target_sd->shm_atime);
+    __put_user(host_sd->shm_dtime, &target_sd->shm_dtime);
+    __put_user(host_sd->shm_ctime, &target_sd->shm_ctime);
+    __put_user(host_sd->shm_cpid, &target_sd->shm_cpid);
+    __put_user(host_sd->shm_lpid, &target_sd->shm_lpid);
+    __put_user(host_sd->shm_nattch, &target_sd->shm_nattch);
+    unlock_user_struct(target_sd, target_addr, 1);
+    return 0;
+}
+
+struct target_shminfo {
+    abi_ulong shmmax;
+    abi_ulong shmmin;
+    abi_ulong shmmni;
+    abi_ulong shmseg;
+    abi_ulong shmall;
+};
+
+static abi_long host_to_target_shminfo(abi_ulong target_addr,
+                                       struct shminfo *host_shminfo)
+{
+    struct target_shminfo *target_shminfo;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_shminfo, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(host_shminfo->shmmax, &target_shminfo->shmmax);
+    __put_user(host_shminfo->shmmin, &target_shminfo->shmmin);
+    __put_user(host_shminfo->shmmni, &target_shminfo->shmmni);
+    __put_user(host_shminfo->shmseg, &target_shminfo->shmseg);
+    __put_user(host_shminfo->shmall, &target_shminfo->shmall);
+    unlock_user_struct(target_shminfo, target_addr, 1);
+    return 0;
+}
+
+struct target_shm_info {
+    int used_ids;
+    abi_ulong shm_tot;
+    abi_ulong shm_rss;
+    abi_ulong shm_swp;
+    abi_ulong swap_attempts;
+    abi_ulong swap_successes;
+};
+
+static abi_long host_to_target_shm_info(abi_ulong target_addr,
+                                        struct shm_info *host_shm_info)
+{
+    struct target_shm_info *target_shm_info;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_shm_info, target_addr, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __put_user(host_shm_info->used_ids, &target_shm_info->used_ids);
+    __put_user(host_shm_info->shm_tot, &target_shm_info->shm_tot);
+    __put_user(host_shm_info->shm_rss, &target_shm_info->shm_rss);
+    __put_user(host_shm_info->shm_swp, &target_shm_info->shm_swp);
+    __put_user(host_shm_info->swap_attempts,
+               &target_shm_info->swap_attempts);
+    __put_user(host_shm_info->swap_successes,
+               &target_shm_info->swap_successes);
+    unlock_user_struct(target_shm_info, target_addr, 1);
+    return 0;
+}
+
+#ifndef TARGET_FORCE_SHMLBA
+/*
+ * For most architectures, SHMLBA is the same as the page size;
+ * some architectures have larger values, in which case they should
+ * define TARGET_FORCE_SHMLBA and provide a target_shmlba() function.
+ * This corresponds to the kernel arch code defining __ARCH_FORCE_SHMLBA
+ * and defining its own value for SHMLBA.
+ *
+ * The kernel also permits SHMLBA to be set by the architecture to a
+ * value larger than the page size without setting __ARCH_FORCE_SHMLBA;
+ * this means that addresses are rounded to the large size if
+ * SHM_RND is set but addresses not aligned to that size are not rejected
+ * as long as they are at least page-aligned. Since the only architecture
+ * which uses this is ia64 this code doesn't provide for that oddity.
+ */
+static abi_ulong target_shmlba(CPUArchState *cpu_env)
+{
+    return TARGET_PAGE_SIZE;
+}
+#endif
+
+
+SYSCALL_IMPL(msgctl)
+{
+    abi_long msgid = arg1;
+    int cmd = arg2 & 0xff;
+    abi_ulong ptr = arg3;
+    struct msqid_ds dsarg;
+    struct msginfo msginfo;
+    abi_long ret;
+
+    switch (cmd) {
+    case IPC_STAT:
+    case IPC_SET:
+    case MSG_STAT:
+        if (target_to_host_msqid_ds(&dsarg, ptr)) {
+            return -TARGET_EFAULT;
+        }
+        ret = get_errno(msgctl(msgid, cmd, &dsarg));
+        if (!is_error(ret) && host_to_target_msqid_ds(ptr, &dsarg)) {
+            return -TARGET_EFAULT;
+        }
+        return ret;
+
+    case IPC_RMID:
+        return get_errno(msgctl(msgid, cmd, NULL));
+
+    case IPC_INFO:
+    case MSG_INFO:
+        ret = get_errno(msgctl(msgid, cmd, (struct msqid_ds *)&msginfo));
+        if (host_to_target_msginfo(ptr, &msginfo)) {
+            return -TARGET_EFAULT;
+        }
+        return ret;
+
+    default:
+        return -TARGET_EINVAL;
+    }
+}
+
+SYSCALL_IMPL(msgget)
+{
+    return get_errno(msgget(arg1, arg2));
+}
+
+SYSCALL_IMPL(msgrcv)
+{
+    int msqid = arg1;
+    abi_ulong msgp = arg2;
+    abi_long msgsz = arg3;
+    abi_long msgtyp = arg4;
+    int msgflg = arg5;
+    struct target_msgbuf *target_mb;
+    char *target_mtext;
+    struct msgbuf *host_mb;
+    abi_long ret = 0;
+
+    if (msgsz < 0) {
+        return -TARGET_EINVAL;
+    }
+    if (!lock_user_struct(VERIFY_WRITE, target_mb, msgp, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    host_mb = g_try_malloc(msgsz + sizeof(long));
+    if (!host_mb) {
+        ret = -TARGET_ENOMEM;
+        goto end;
+    }
+    ret = get_errno(safe_msgrcv(msqid, host_mb, msgsz, msgtyp, msgflg));
+
+    if (ret > 0) {
+        abi_ulong target_mtext_addr = msgp + sizeof(abi_ulong);
+        target_mtext = lock_user(VERIFY_WRITE, target_mtext_addr, ret, 0);
+        if (!target_mtext) {
+            ret = -TARGET_EFAULT;
+            goto end;
+        }
+        memcpy(target_mb->mtext, host_mb->mtext, ret);
+        unlock_user(target_mtext, target_mtext_addr, ret);
+    }
+    target_mb->mtype = tswapal(host_mb->mtype);
+
+ end:
+    unlock_user_struct(target_mb, msgp, 1);
+    g_free(host_mb);
+    return ret;
+}
+
+SYSCALL_IMPL(msgsnd)
+{
+    int msqid = arg1;
+    abi_ulong msgp = arg2;
+    abi_long msgsz = arg3;
+    int msgflg = arg4;
+    struct target_msgbuf *target_mb;
+    struct msgbuf *host_mb;
+    abi_long ret = 0;
+
+    if (msgsz < 0) {
+        return -TARGET_EINVAL;
+    }
+    if (!lock_user_struct(VERIFY_READ, target_mb, msgp, 0)) {
+        return -TARGET_EFAULT;
+    }
+    host_mb = g_try_malloc(msgsz + sizeof(long));
+    if (!host_mb) {
+        unlock_user_struct(target_mb, msgp, 0);
+        return -TARGET_ENOMEM;
+    }
+
+    host_mb->mtype = (abi_long)tswapal(target_mb->mtype);
+    memcpy(host_mb->mtext, target_mb->mtext, msgsz);
+    ret = get_errno(safe_msgsnd(msqid, host_mb, msgsz, msgflg));
+
+    g_free(host_mb);
+    unlock_user_struct(target_mb, msgp, 0);
+    return ret;
+}
+
+SYSCALL_IMPL(semctl)
+{
+    abi_long semid = arg1;
+    abi_long semnum = arg2;
+    int cmd = arg3 & 0xff;
+    abi_ulong target_arg = arg4;
+    union target_semun target_su = { .buf = target_arg };
+    union semun arg;
+    struct semid_ds dsarg;
+    unsigned short *array = NULL;
+    struct seminfo seminfo;
+    abi_long ret, err;
+
+    switch (cmd) {
+    case GETVAL:
+    case SETVAL:
+        /*
+         * In 64 bit cross-endian situations, we will erroneously pick up
+         * the wrong half of the union for the "val" element.  To rectify
+         * this, the entire 8-byte structure is byteswapped, followed by
+         * a swap of the 4 byte val field. In other cases, the data is
+         * already in proper host byte order.
+         */
+        if (sizeof(target_su.val) != sizeof(target_su.buf)) {
+            target_su.buf = tswapal(target_su.buf);
+            arg.val = tswap32(target_su.val);
+        } else {
+            arg.val = target_su.val;
+        }
+        return get_errno(semctl(semid, semnum, cmd, arg));
+
+    case GETALL:
+    case SETALL:
+        err = target_to_host_semarray(semid, &array, target_su.array);
+        if (err) {
+            return err;
+        }
+        arg.array = array;
+        ret = get_errno(semctl(semid, semnum, cmd, arg));
+        if (!is_error(ret)) {
+            err = host_to_target_semarray(semid, target_su.array, &array);
+            if (err) {
+                return err;
+            }
+        }
+        return ret;
+
+    case IPC_STAT:
+    case IPC_SET:
+    case SEM_STAT:
+        err = target_to_host_semid_ds(&dsarg, target_su.buf);
+        if (err) {
+            return err;
+        }
+        arg.buf = &dsarg;
+        ret = get_errno(semctl(semid, semnum, cmd, arg));
+        if (!is_error(ret)) {
+            err = host_to_target_semid_ds(target_su.buf, &dsarg);
+            if (err) {
+                return err;
+            }
+        }
+        return ret;
+
+    case IPC_INFO:
+    case SEM_INFO:
+        arg.__buf = &seminfo;
+        ret = get_errno(semctl(semid, semnum, cmd, arg));
+        if (!is_error(ret)) {
+            err = host_to_target_seminfo(target_su.__buf, &seminfo);
+            if (err) {
+                return err;
+            }
+        }
+        return ret;
+
+    case IPC_RMID:
+    case GETPID:
+    case GETNCNT:
+    case GETZCNT:
+        return get_errno(semctl(semid, semnum, cmd, NULL));
+
+    default:
+        return -TARGET_EINVAL;
+    }
+}
+
+SYSCALL_IMPL(semget)
+{
+    return get_errno(semget(arg1, arg2, arg3));
+}
+
+SYSCALL_IMPL(semop)
+{
+    abi_long semid = arg1;
+    abi_ulong ptr = arg2;
+    abi_ulong nsops = arg3;
+    struct sembuf sops[SEMOPM];
+
+    if (nsops > SEMOPM) {
+        return -TARGET_E2BIG;
+    }
+    if (target_to_host_sembuf(sops, ptr, nsops)) {
+        return -TARGET_EFAULT;
+    }
+    return get_errno(safe_semtimedop(semid, sops, nsops, NULL));
+}
+
+SYSCALL_IMPL(shmat)
+{
+    int shmid = arg1;
+    abi_ulong shmaddr = arg2;
+    int shmflg = arg3;
+    abi_ulong raddr;
+    void *host_raddr;
+    struct shmid_ds shm_info;
+    int i, ret;
+    abi_ulong shmlba;
+
+    /* Find out the length of the shared memory segment.  */
+    ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
+    if (is_error(ret)) {
+        /* can't get length, bail out */
+        return ret;
+    }
+
+    /* Validate memory placement and alignment for the guest.  */
+    shmlba = target_shmlba(cpu_env);
+    if (shmaddr & (shmlba - 1)) {
+        if (shmflg & SHM_RND) {
+            shmaddr &= ~(shmlba - 1);
+        } else {
+            return -TARGET_EINVAL;
+        }
+    }
+    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
+        return -TARGET_EINVAL;
+    }
+
+    mmap_lock();
+
+    if (shmaddr) {
+        host_raddr = shmat(shmid, (void *)g2h(shmaddr), shmflg);
+    } else {
+        /* In order to use the host shmat, we need to honor host SHMLBA.  */
+        abi_ulong mmap_start = mmap_find_vma(0, shm_info.shm_segsz,
+                                             MAX(SHMLBA, shmlba));
+        if (mmap_start == -1) {
+            errno = ENOMEM;
+            host_raddr = (void *)-1;
+        } else {
+            host_raddr = shmat(shmid, g2h(mmap_start), shmflg | SHM_REMAP);
+        }
+    }
+    if (host_raddr == (void *)-1) {
+        mmap_unlock();
+        return get_errno((intptr_t)host_raddr);
+    }
+
+    raddr = h2g((uintptr_t)host_raddr);
+    page_set_flags(raddr, raddr + shm_info.shm_segsz,
+                   PAGE_VALID | PAGE_READ |
+                   (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
+
+    for (i = 0; i < N_SHM_REGIONS; i++) {
+        if (!shm_regions[i].in_use) {
+            shm_regions[i].in_use = true;
+            shm_regions[i].start = raddr;
+            shm_regions[i].size = shm_info.shm_segsz;
+            break;
+        }
+    }
+    mmap_unlock();
+    return raddr;
+}
+
+SYSCALL_IMPL(shmctl)
+{
+    int shmid = arg1;
+    int cmd = arg2 & 0xff;
+    abi_ulong buf = arg3;
+    struct shmid_ds dsarg;
+    struct shminfo shminfo;
+    struct shm_info shm_info;
+    abi_long ret;
+
+    switch (cmd) {
+    case IPC_STAT:
+    case IPC_SET:
+    case SHM_STAT:
+        if (target_to_host_shmid_ds(&dsarg, buf)) {
+            return -TARGET_EFAULT;
+        }
+        ret = get_errno(shmctl(shmid, cmd, &dsarg));
+        if (!is_error(ret) && host_to_target_shmid_ds(buf, &dsarg)) {
+            return -TARGET_EFAULT;
+        }
+        return ret;
+
+    case IPC_INFO:
+        ret = get_errno(shmctl(shmid, cmd, (struct shmid_ds *)&shminfo));
+        if (!is_error(ret) && host_to_target_shminfo(buf, &shminfo)) {
+            return -TARGET_EFAULT;
+        }
+        return ret;
+
+    case SHM_INFO:
+        ret = get_errno(shmctl(shmid, cmd, (struct shmid_ds *)&shm_info));
+        if (!is_error(ret) && host_to_target_shm_info(buf, &shm_info)) {
+            return -TARGET_EFAULT;
+        }
+        return ret;
+
+    case IPC_RMID:
+    case SHM_LOCK:
+    case SHM_UNLOCK:
+        return get_errno(shmctl(shmid, cmd, NULL));
+
+    default:
+        return -TARGET_EINVAL;
+    }
+}
+
+SYSCALL_IMPL(shmdt)
+{
+    abi_ulong shmaddr = arg1;
+    abi_long ret;
+    int i;
+
+    mmap_lock();
+
+    for (i = 0; i < N_SHM_REGIONS; ++i) {
+        if (shm_regions[i].in_use && shm_regions[i].start == shmaddr) {
+            shm_regions[i].in_use = false;
+            page_set_flags(shmaddr, shmaddr + shm_regions[i].size, 0);
+            break;
+        }
+    }
+    ret = get_errno(shmdt(g2h(shmaddr)));
+
+    mmap_unlock();
+
+    return ret;
+}
+
+SYSCALL_IMPL(shmget)
+{
+    return get_errno(shmget(arg1, arg2, arg3));
+}
+
+#ifdef TARGET_NR_ipc
+/*
+ * This differs from normal shmat in returning the result via a pointer.
+ * Here we have shifted that pointer to arg4.
+ */
+SYSCALL_IMPL(ipc_shmat)
+{
+    abi_long ret = impl_shmat(cpu_env, arg1, arg2, arg3, 0, 0, 0);
+
+    if (is_error(ret)) {
+        return ret;
+    }
+    if (put_user_ual(ret, arg4)) {
+        return -TARGET_EFAULT;
+    }
+    return 0;
+}
+
+static const SyscallDef def_ipc_shmat = {
+    .name = "shmat",
+    .impl = impl_ipc_shmat,
+    .arg_type = { ARG_DEC, ARG_PTR, ARG_HEX, ARG_PTR },
+};
+
+/* These get defined later via syscall-defs.h.  */
+static const SyscallDef def_semop;
+static const SyscallDef def_semget;
+static const SyscallDef def_semctl;
+static const SyscallDef def_msgget;
+static const SyscallDef def_msgsnd;
+static const SyscallDef def_msgctl;
+static const SyscallDef def_msgrcv;
+static const SyscallDef def_shmdt;
+static const SyscallDef def_shmget;
+static const SyscallDef def_shmctl;
+
+/*
+ * Demultiplex the IPC syscall and shuffle the arguments around
+ * into the "normal" ordering.
+ */
+SYSCALL_ARGS(ipc)
+{
+    int call = extract32(in[0], 0, 16);
+    int version = extract32(in[0], 16, 16);
+    abi_long first = in[1];
+    abi_long second = in[2];
+    abi_long third = in[3];
+    abi_ulong ptr = in[4];
+    abi_long fifth = in[5];
+    abi_ulong atptr;
+
+    /* IPC_* and SHM_* command values are the same on all linux platforms */
+    switch (call) {
+    case IPCOP_semop:
+        out[0] = first;
+        out[1] = ptr;
+        out[2] = second;
+        return &def_semop;
+
+    case IPCOP_semget:
+        out[0] = first;
+        out[1] = second;
+        out[2] = third;
+        return &def_semget;
+
+    case IPCOP_semctl:
+        /*
+         * The semun argument to semctl is passed by value,
+         * so dereference the ptr argument.
+         */
+        if (get_user_ual(atptr, ptr)) {
+            errno = EFAULT;
+            return NULL;
+        }
+        out[0] = first;
+        out[1] = second;
+        out[2] = third;
+        out[3] = atptr;
+        return &def_semctl;
+
+    case IPCOP_msgget:
+        out[0] = first;
+        out[1] = second;
+        return &def_msgget;
+
+    case IPCOP_msgsnd:
+        out[0] = first;
+        out[1] = ptr;
+        out[2] = second;
+        out[3] = third;
+        return &def_msgsnd;
+
+    case IPCOP_msgctl:
+        out[0] = first;
+        out[1] = second;
+        out[2] = ptr;
+        return &def_msgctl;
+
+    case IPCOP_msgrcv:
+        if (version == 0) {
+            struct target_ipc_kludge {
+                abi_long msgp;
+                abi_long msgtyp;
+            } *tmp;
+
+            if (!lock_user_struct(VERIFY_READ, tmp, ptr, 1)) {
+                errno = EFAULT;
+                return NULL;
+            }
+            out[0] = first;
+            out[1] = tswapal(tmp->msgp);
+            out[2] = second;
+            out[3] = tswapal(tmp->msgtyp);
+            out[4] = third;
+            unlock_user_struct(tmp, ptr, 0);
+        } else {
+            out[0] = first;
+            out[1] = ptr;
+            out[2] = second;
+            out[3] = fifth;
+            out[4] = third;
+        }
+        return &def_msgrcv;
+
+    case IPCOP_shmat:
+        if (version == 1) {
+            errno = EINVAL;
+            return NULL;
+        }
+        out[0] = first;
+        out[1] = ptr;
+        out[2] = second;
+        out[3] = third;
+        return &def_ipc_shmat;
+
+    case IPCOP_shmdt:
+        out[0] = ptr;
+        return &def_shmdt;
+
+    case IPCOP_shmget:
+        out[0] = first;
+        out[1] = second;
+        out[2] = third;
+        return &def_shmget;
+
+    case IPCOP_shmctl:
+        out[0] = first;
+        out[1] = second;
+        out[2] = ptr;
+        return &def_shmctl;
+
+    default:
+        /* Invalid syscall.  Continue to impl_ipc for logging.  */
+        return def;
+    }
+}
+
+SYSCALL_IMPL(ipc)
+{
+    int call = extract32(arg1, 0, 16);
+    int version = extract32(arg1, 16, 16);
+
+    gemu_log("Unsupported ipc call: %d (version %d)\n", call, version);
+    return -TARGET_ENOSYS;
+}
+#endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c49f8aebd2..ca345ffb4c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -763,43 +763,6 @@ safe_syscall2(int, nanosleep, const struct timespec *, req,
 safe_syscall4(int, clock_nanosleep, const clockid_t, clock, int, flags,
               const struct timespec *, req, struct timespec *, rem)
 #endif
-#ifdef __NR_msgsnd
-safe_syscall4(int, msgsnd, int, msgid, const void *, msgp, size_t, sz,
-              int, flags)
-safe_syscall5(int, msgrcv, int, msgid, void *, msgp, size_t, sz,
-              long, msgtype, int, flags)
-safe_syscall4(int, semtimedop, int, semid, struct sembuf *, tsops,
-              unsigned, nsops, const struct timespec *, timeout)
-#else
-/* This host kernel architecture uses a single ipc syscall; fake up
- * wrappers for the sub-operations to hide this implementation detail.
- * Annoyingly we can't include linux/ipc.h to get the constant definitions
- * for the call parameter because some structs in there conflict with the
- * sys/ipc.h ones. So we just define them here, and rely on them being
- * the same for all host architectures.
- */
-#define Q_SEMTIMEDOP 4
-#define Q_MSGSND 11
-#define Q_MSGRCV 12
-#define Q_IPCCALL(VERSION, OP) ((VERSION) << 16 | (OP))
-
-safe_syscall6(int, ipc, int, call, long, first, long, second, long, third,
-              void *, ptr, long, fifth)
-static int safe_msgsnd(int msgid, const void *msgp, size_t sz, int flags)
-{
-    return safe_ipc(Q_IPCCALL(0, Q_MSGSND), msgid, sz, flags, (void *)msgp, 0);
-}
-static int safe_msgrcv(int msgid, void *msgp, size_t sz, long type, int flags)
-{
-    return safe_ipc(Q_IPCCALL(1, Q_MSGRCV), msgid, sz, flags, msgp, type);
-}
-static int safe_semtimedop(int semid, struct sembuf *tsops, unsigned nsops,
-                           const struct timespec *timeout)
-{
-    return safe_ipc(Q_IPCCALL(0, Q_SEMTIMEDOP), semid, nsops, 0, tsops,
-                    (long)timeout);
-}
-#endif
 #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
 safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
               size_t, len, unsigned, prio, const struct timespec *, timeout)
@@ -3178,891 +3141,6 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
 }
 #endif
 
-#define N_SHM_REGIONS	32
-
-static struct shm_region {
-    abi_ulong start;
-    abi_ulong size;
-    bool in_use;
-} shm_regions[N_SHM_REGIONS];
-
-#ifndef TARGET_SEMID64_DS
-/* asm-generic version of this struct */
-struct target_semid64_ds
-{
-  struct target_ipc_perm sem_perm;
-  abi_ulong sem_otime;
-#if TARGET_ABI_BITS == 32
-  abi_ulong __unused1;
-#endif
-  abi_ulong sem_ctime;
-#if TARGET_ABI_BITS == 32
-  abi_ulong __unused2;
-#endif
-  abi_ulong sem_nsems;
-  abi_ulong __unused3;
-  abi_ulong __unused4;
-};
-#endif
-
-static inline abi_long target_to_host_ipc_perm(struct ipc_perm *host_ip,
-                                               abi_ulong target_addr)
-{
-    struct target_ipc_perm *target_ip;
-    struct target_semid64_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1))
-        return -TARGET_EFAULT;
-    target_ip = &(target_sd->sem_perm);
-    host_ip->__key = tswap32(target_ip->__key);
-    host_ip->uid = tswap32(target_ip->uid);
-    host_ip->gid = tswap32(target_ip->gid);
-    host_ip->cuid = tswap32(target_ip->cuid);
-    host_ip->cgid = tswap32(target_ip->cgid);
-#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_PPC)
-    host_ip->mode = tswap32(target_ip->mode);
-#else
-    host_ip->mode = tswap16(target_ip->mode);
-#endif
-#if defined(TARGET_PPC)
-    host_ip->__seq = tswap32(target_ip->__seq);
-#else
-    host_ip->__seq = tswap16(target_ip->__seq);
-#endif
-    unlock_user_struct(target_sd, target_addr, 0);
-    return 0;
-}
-
-static inline abi_long host_to_target_ipc_perm(abi_ulong target_addr,
-                                               struct ipc_perm *host_ip)
-{
-    struct target_ipc_perm *target_ip;
-    struct target_semid64_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
-        return -TARGET_EFAULT;
-    target_ip = &(target_sd->sem_perm);
-    target_ip->__key = tswap32(host_ip->__key);
-    target_ip->uid = tswap32(host_ip->uid);
-    target_ip->gid = tswap32(host_ip->gid);
-    target_ip->cuid = tswap32(host_ip->cuid);
-    target_ip->cgid = tswap32(host_ip->cgid);
-#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_PPC)
-    target_ip->mode = tswap32(host_ip->mode);
-#else
-    target_ip->mode = tswap16(host_ip->mode);
-#endif
-#if defined(TARGET_PPC)
-    target_ip->__seq = tswap32(host_ip->__seq);
-#else
-    target_ip->__seq = tswap16(host_ip->__seq);
-#endif
-    unlock_user_struct(target_sd, target_addr, 1);
-    return 0;
-}
-
-static inline abi_long target_to_host_semid_ds(struct semid_ds *host_sd,
-                                               abi_ulong target_addr)
-{
-    struct target_semid64_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1))
-        return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_sd->sem_perm),target_addr))
-        return -TARGET_EFAULT;
-    host_sd->sem_nsems = tswapal(target_sd->sem_nsems);
-    host_sd->sem_otime = tswapal(target_sd->sem_otime);
-    host_sd->sem_ctime = tswapal(target_sd->sem_ctime);
-    unlock_user_struct(target_sd, target_addr, 0);
-    return 0;
-}
-
-static inline abi_long host_to_target_semid_ds(abi_ulong target_addr,
-                                               struct semid_ds *host_sd)
-{
-    struct target_semid64_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
-        return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr,&(host_sd->sem_perm)))
-        return -TARGET_EFAULT;
-    target_sd->sem_nsems = tswapal(host_sd->sem_nsems);
-    target_sd->sem_otime = tswapal(host_sd->sem_otime);
-    target_sd->sem_ctime = tswapal(host_sd->sem_ctime);
-    unlock_user_struct(target_sd, target_addr, 1);
-    return 0;
-}
-
-struct target_seminfo {
-    int semmap;
-    int semmni;
-    int semmns;
-    int semmnu;
-    int semmsl;
-    int semopm;
-    int semume;
-    int semusz;
-    int semvmx;
-    int semaem;
-};
-
-static inline abi_long host_to_target_seminfo(abi_ulong target_addr,
-                                              struct seminfo *host_seminfo)
-{
-    struct target_seminfo *target_seminfo;
-    if (!lock_user_struct(VERIFY_WRITE, target_seminfo, target_addr, 0))
-        return -TARGET_EFAULT;
-    __put_user(host_seminfo->semmap, &target_seminfo->semmap);
-    __put_user(host_seminfo->semmni, &target_seminfo->semmni);
-    __put_user(host_seminfo->semmns, &target_seminfo->semmns);
-    __put_user(host_seminfo->semmnu, &target_seminfo->semmnu);
-    __put_user(host_seminfo->semmsl, &target_seminfo->semmsl);
-    __put_user(host_seminfo->semopm, &target_seminfo->semopm);
-    __put_user(host_seminfo->semume, &target_seminfo->semume);
-    __put_user(host_seminfo->semusz, &target_seminfo->semusz);
-    __put_user(host_seminfo->semvmx, &target_seminfo->semvmx);
-    __put_user(host_seminfo->semaem, &target_seminfo->semaem);
-    unlock_user_struct(target_seminfo, target_addr, 1);
-    return 0;
-}
-
-union semun {
-	int val;
-	struct semid_ds *buf;
-	unsigned short *array;
-	struct seminfo *__buf;
-};
-
-union target_semun {
-	int val;
-	abi_ulong buf;
-	abi_ulong array;
-	abi_ulong __buf;
-};
-
-static inline abi_long target_to_host_semarray(int semid, unsigned short **host_array,
-                                               abi_ulong target_addr)
-{
-    int nsems;
-    unsigned short *array;
-    union semun semun;
-    struct semid_ds semid_ds;
-    int i, ret;
-
-    semun.buf = &semid_ds;
-
-    ret = semctl(semid, 0, IPC_STAT, semun);
-    if (ret == -1)
-        return get_errno(ret);
-
-    nsems = semid_ds.sem_nsems;
-
-    *host_array = g_try_new(unsigned short, nsems);
-    if (!*host_array) {
-        return -TARGET_ENOMEM;
-    }
-    array = lock_user(VERIFY_READ, target_addr,
-                      nsems*sizeof(unsigned short), 1);
-    if (!array) {
-        g_free(*host_array);
-        return -TARGET_EFAULT;
-    }
-
-    for(i=0; i<nsems; i++) {
-        __get_user((*host_array)[i], &array[i]);
-    }
-    unlock_user(array, target_addr, 0);
-
-    return 0;
-}
-
-static inline abi_long host_to_target_semarray(int semid, abi_ulong target_addr,
-                                               unsigned short **host_array)
-{
-    int nsems;
-    unsigned short *array;
-    union semun semun;
-    struct semid_ds semid_ds;
-    int i, ret;
-
-    semun.buf = &semid_ds;
-
-    ret = semctl(semid, 0, IPC_STAT, semun);
-    if (ret == -1)
-        return get_errno(ret);
-
-    nsems = semid_ds.sem_nsems;
-
-    array = lock_user(VERIFY_WRITE, target_addr,
-                      nsems*sizeof(unsigned short), 0);
-    if (!array)
-        return -TARGET_EFAULT;
-
-    for(i=0; i<nsems; i++) {
-        __put_user((*host_array)[i], &array[i]);
-    }
-    g_free(*host_array);
-    unlock_user(array, target_addr, 1);
-
-    return 0;
-}
-
-static inline abi_long do_semctl(int semid, int semnum, int cmd,
-                                 abi_ulong target_arg)
-{
-    union target_semun target_su = { .buf = target_arg };
-    union semun arg;
-    struct semid_ds dsarg;
-    unsigned short *array = NULL;
-    struct seminfo seminfo;
-    abi_long ret = -TARGET_EINVAL;
-    abi_long err;
-    cmd &= 0xff;
-
-    switch( cmd ) {
-	case GETVAL:
-	case SETVAL:
-            /* In 64 bit cross-endian situations, we will erroneously pick up
-             * the wrong half of the union for the "val" element.  To rectify
-             * this, the entire 8-byte structure is byteswapped, followed by
-	     * a swap of the 4 byte val field. In other cases, the data is
-	     * already in proper host byte order. */
-	    if (sizeof(target_su.val) != (sizeof(target_su.buf))) {
-		target_su.buf = tswapal(target_su.buf);
-		arg.val = tswap32(target_su.val);
-	    } else {
-		arg.val = target_su.val;
-	    }
-            ret = get_errno(semctl(semid, semnum, cmd, arg));
-            break;
-	case GETALL:
-	case SETALL:
-            err = target_to_host_semarray(semid, &array, target_su.array);
-            if (err)
-                return err;
-            arg.array = array;
-            ret = get_errno(semctl(semid, semnum, cmd, arg));
-            err = host_to_target_semarray(semid, target_su.array, &array);
-            if (err)
-                return err;
-            break;
-	case IPC_STAT:
-	case IPC_SET:
-	case SEM_STAT:
-            err = target_to_host_semid_ds(&dsarg, target_su.buf);
-            if (err)
-                return err;
-            arg.buf = &dsarg;
-            ret = get_errno(semctl(semid, semnum, cmd, arg));
-            err = host_to_target_semid_ds(target_su.buf, &dsarg);
-            if (err)
-                return err;
-            break;
-	case IPC_INFO:
-	case SEM_INFO:
-            arg.__buf = &seminfo;
-            ret = get_errno(semctl(semid, semnum, cmd, arg));
-            err = host_to_target_seminfo(target_su.__buf, &seminfo);
-            if (err)
-                return err;
-            break;
-	case IPC_RMID:
-	case GETPID:
-	case GETNCNT:
-	case GETZCNT:
-            ret = get_errno(semctl(semid, semnum, cmd, NULL));
-            break;
-    }
-
-    return ret;
-}
-
-struct target_sembuf {
-    unsigned short sem_num;
-    short sem_op;
-    short sem_flg;
-};
-
-static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
-                                             abi_ulong target_addr,
-                                             unsigned nsops)
-{
-    struct target_sembuf *target_sembuf;
-    int i;
-
-    target_sembuf = lock_user(VERIFY_READ, target_addr,
-                              nsops*sizeof(struct target_sembuf), 1);
-    if (!target_sembuf)
-        return -TARGET_EFAULT;
-
-    for(i=0; i<nsops; i++) {
-        __get_user(host_sembuf[i].sem_num, &target_sembuf[i].sem_num);
-        __get_user(host_sembuf[i].sem_op, &target_sembuf[i].sem_op);
-        __get_user(host_sembuf[i].sem_flg, &target_sembuf[i].sem_flg);
-    }
-
-    unlock_user(target_sembuf, target_addr, 0);
-
-    return 0;
-}
-
-static inline abi_long do_semop(int semid, abi_long ptr, unsigned nsops)
-{
-    struct sembuf sops[nsops];
-
-    if (target_to_host_sembuf(sops, ptr, nsops))
-        return -TARGET_EFAULT;
-
-    return get_errno(safe_semtimedop(semid, sops, nsops, NULL));
-}
-
-struct target_msqid_ds
-{
-    struct target_ipc_perm msg_perm;
-    abi_ulong msg_stime;
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused1;
-#endif
-    abi_ulong msg_rtime;
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused2;
-#endif
-    abi_ulong msg_ctime;
-#if TARGET_ABI_BITS == 32
-    abi_ulong __unused3;
-#endif
-    abi_ulong __msg_cbytes;
-    abi_ulong msg_qnum;
-    abi_ulong msg_qbytes;
-    abi_ulong msg_lspid;
-    abi_ulong msg_lrpid;
-    abi_ulong __unused4;
-    abi_ulong __unused5;
-};
-
-static inline abi_long target_to_host_msqid_ds(struct msqid_ds *host_md,
-                                               abi_ulong target_addr)
-{
-    struct target_msqid_ds *target_md;
-
-    if (!lock_user_struct(VERIFY_READ, target_md, target_addr, 1))
-        return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_md->msg_perm),target_addr))
-        return -TARGET_EFAULT;
-    host_md->msg_stime = tswapal(target_md->msg_stime);
-    host_md->msg_rtime = tswapal(target_md->msg_rtime);
-    host_md->msg_ctime = tswapal(target_md->msg_ctime);
-    host_md->__msg_cbytes = tswapal(target_md->__msg_cbytes);
-    host_md->msg_qnum = tswapal(target_md->msg_qnum);
-    host_md->msg_qbytes = tswapal(target_md->msg_qbytes);
-    host_md->msg_lspid = tswapal(target_md->msg_lspid);
-    host_md->msg_lrpid = tswapal(target_md->msg_lrpid);
-    unlock_user_struct(target_md, target_addr, 0);
-    return 0;
-}
-
-static inline abi_long host_to_target_msqid_ds(abi_ulong target_addr,
-                                               struct msqid_ds *host_md)
-{
-    struct target_msqid_ds *target_md;
-
-    if (!lock_user_struct(VERIFY_WRITE, target_md, target_addr, 0))
-        return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr,&(host_md->msg_perm)))
-        return -TARGET_EFAULT;
-    target_md->msg_stime = tswapal(host_md->msg_stime);
-    target_md->msg_rtime = tswapal(host_md->msg_rtime);
-    target_md->msg_ctime = tswapal(host_md->msg_ctime);
-    target_md->__msg_cbytes = tswapal(host_md->__msg_cbytes);
-    target_md->msg_qnum = tswapal(host_md->msg_qnum);
-    target_md->msg_qbytes = tswapal(host_md->msg_qbytes);
-    target_md->msg_lspid = tswapal(host_md->msg_lspid);
-    target_md->msg_lrpid = tswapal(host_md->msg_lrpid);
-    unlock_user_struct(target_md, target_addr, 1);
-    return 0;
-}
-
-struct target_msginfo {
-    int msgpool;
-    int msgmap;
-    int msgmax;
-    int msgmnb;
-    int msgmni;
-    int msgssz;
-    int msgtql;
-    unsigned short int msgseg;
-};
-
-static inline abi_long host_to_target_msginfo(abi_ulong target_addr,
-                                              struct msginfo *host_msginfo)
-{
-    struct target_msginfo *target_msginfo;
-    if (!lock_user_struct(VERIFY_WRITE, target_msginfo, target_addr, 0))
-        return -TARGET_EFAULT;
-    __put_user(host_msginfo->msgpool, &target_msginfo->msgpool);
-    __put_user(host_msginfo->msgmap, &target_msginfo->msgmap);
-    __put_user(host_msginfo->msgmax, &target_msginfo->msgmax);
-    __put_user(host_msginfo->msgmnb, &target_msginfo->msgmnb);
-    __put_user(host_msginfo->msgmni, &target_msginfo->msgmni);
-    __put_user(host_msginfo->msgssz, &target_msginfo->msgssz);
-    __put_user(host_msginfo->msgtql, &target_msginfo->msgtql);
-    __put_user(host_msginfo->msgseg, &target_msginfo->msgseg);
-    unlock_user_struct(target_msginfo, target_addr, 1);
-    return 0;
-}
-
-static inline abi_long do_msgctl(int msgid, int cmd, abi_long ptr)
-{
-    struct msqid_ds dsarg;
-    struct msginfo msginfo;
-    abi_long ret = -TARGET_EINVAL;
-
-    cmd &= 0xff;
-
-    switch (cmd) {
-    case IPC_STAT:
-    case IPC_SET:
-    case MSG_STAT:
-        if (target_to_host_msqid_ds(&dsarg,ptr))
-            return -TARGET_EFAULT;
-        ret = get_errno(msgctl(msgid, cmd, &dsarg));
-        if (host_to_target_msqid_ds(ptr,&dsarg))
-            return -TARGET_EFAULT;
-        break;
-    case IPC_RMID:
-        ret = get_errno(msgctl(msgid, cmd, NULL));
-        break;
-    case IPC_INFO:
-    case MSG_INFO:
-        ret = get_errno(msgctl(msgid, cmd, (struct msqid_ds *)&msginfo));
-        if (host_to_target_msginfo(ptr, &msginfo))
-            return -TARGET_EFAULT;
-        break;
-    }
-
-    return ret;
-}
-
-struct target_msgbuf {
-    abi_long mtype;
-    char	mtext[1];
-};
-
-static inline abi_long do_msgsnd(int msqid, abi_long msgp,
-                                 ssize_t msgsz, int msgflg)
-{
-    struct target_msgbuf *target_mb;
-    struct msgbuf *host_mb;
-    abi_long ret = 0;
-
-    if (msgsz < 0) {
-        return -TARGET_EINVAL;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, target_mb, msgp, 0))
-        return -TARGET_EFAULT;
-    host_mb = g_try_malloc(msgsz + sizeof(long));
-    if (!host_mb) {
-        unlock_user_struct(target_mb, msgp, 0);
-        return -TARGET_ENOMEM;
-    }
-    host_mb->mtype = (abi_long) tswapal(target_mb->mtype);
-    memcpy(host_mb->mtext, target_mb->mtext, msgsz);
-    ret = get_errno(safe_msgsnd(msqid, host_mb, msgsz, msgflg));
-    g_free(host_mb);
-    unlock_user_struct(target_mb, msgp, 0);
-
-    return ret;
-}
-
-static inline abi_long do_msgrcv(int msqid, abi_long msgp,
-                                 ssize_t msgsz, abi_long msgtyp,
-                                 int msgflg)
-{
-    struct target_msgbuf *target_mb;
-    char *target_mtext;
-    struct msgbuf *host_mb;
-    abi_long ret = 0;
-
-    if (msgsz < 0) {
-        return -TARGET_EINVAL;
-    }
-
-    if (!lock_user_struct(VERIFY_WRITE, target_mb, msgp, 0))
-        return -TARGET_EFAULT;
-
-    host_mb = g_try_malloc(msgsz + sizeof(long));
-    if (!host_mb) {
-        ret = -TARGET_ENOMEM;
-        goto end;
-    }
-    ret = get_errno(safe_msgrcv(msqid, host_mb, msgsz, msgtyp, msgflg));
-
-    if (ret > 0) {
-        abi_ulong target_mtext_addr = msgp + sizeof(abi_ulong);
-        target_mtext = lock_user(VERIFY_WRITE, target_mtext_addr, ret, 0);
-        if (!target_mtext) {
-            ret = -TARGET_EFAULT;
-            goto end;
-        }
-        memcpy(target_mb->mtext, host_mb->mtext, ret);
-        unlock_user(target_mtext, target_mtext_addr, ret);
-    }
-
-    target_mb->mtype = tswapal(host_mb->mtype);
-
-end:
-    if (target_mb)
-        unlock_user_struct(target_mb, msgp, 1);
-    g_free(host_mb);
-    return ret;
-}
-
-static inline abi_long target_to_host_shmid_ds(struct shmid_ds *host_sd,
-                                               abi_ulong target_addr)
-{
-    struct target_shmid_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1))
-        return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_sd->shm_perm), target_addr))
-        return -TARGET_EFAULT;
-    __get_user(host_sd->shm_segsz, &target_sd->shm_segsz);
-    __get_user(host_sd->shm_atime, &target_sd->shm_atime);
-    __get_user(host_sd->shm_dtime, &target_sd->shm_dtime);
-    __get_user(host_sd->shm_ctime, &target_sd->shm_ctime);
-    __get_user(host_sd->shm_cpid, &target_sd->shm_cpid);
-    __get_user(host_sd->shm_lpid, &target_sd->shm_lpid);
-    __get_user(host_sd->shm_nattch, &target_sd->shm_nattch);
-    unlock_user_struct(target_sd, target_addr, 0);
-    return 0;
-}
-
-static inline abi_long host_to_target_shmid_ds(abi_ulong target_addr,
-                                               struct shmid_ds *host_sd)
-{
-    struct target_shmid_ds *target_sd;
-
-    if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
-        return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr, &(host_sd->shm_perm)))
-        return -TARGET_EFAULT;
-    __put_user(host_sd->shm_segsz, &target_sd->shm_segsz);
-    __put_user(host_sd->shm_atime, &target_sd->shm_atime);
-    __put_user(host_sd->shm_dtime, &target_sd->shm_dtime);
-    __put_user(host_sd->shm_ctime, &target_sd->shm_ctime);
-    __put_user(host_sd->shm_cpid, &target_sd->shm_cpid);
-    __put_user(host_sd->shm_lpid, &target_sd->shm_lpid);
-    __put_user(host_sd->shm_nattch, &target_sd->shm_nattch);
-    unlock_user_struct(target_sd, target_addr, 1);
-    return 0;
-}
-
-struct  target_shminfo {
-    abi_ulong shmmax;
-    abi_ulong shmmin;
-    abi_ulong shmmni;
-    abi_ulong shmseg;
-    abi_ulong shmall;
-};
-
-static inline abi_long host_to_target_shminfo(abi_ulong target_addr,
-                                              struct shminfo *host_shminfo)
-{
-    struct target_shminfo *target_shminfo;
-    if (!lock_user_struct(VERIFY_WRITE, target_shminfo, target_addr, 0))
-        return -TARGET_EFAULT;
-    __put_user(host_shminfo->shmmax, &target_shminfo->shmmax);
-    __put_user(host_shminfo->shmmin, &target_shminfo->shmmin);
-    __put_user(host_shminfo->shmmni, &target_shminfo->shmmni);
-    __put_user(host_shminfo->shmseg, &target_shminfo->shmseg);
-    __put_user(host_shminfo->shmall, &target_shminfo->shmall);
-    unlock_user_struct(target_shminfo, target_addr, 1);
-    return 0;
-}
-
-struct target_shm_info {
-    int used_ids;
-    abi_ulong shm_tot;
-    abi_ulong shm_rss;
-    abi_ulong shm_swp;
-    abi_ulong swap_attempts;
-    abi_ulong swap_successes;
-};
-
-static inline abi_long host_to_target_shm_info(abi_ulong target_addr,
-                                               struct shm_info *host_shm_info)
-{
-    struct target_shm_info *target_shm_info;
-    if (!lock_user_struct(VERIFY_WRITE, target_shm_info, target_addr, 0))
-        return -TARGET_EFAULT;
-    __put_user(host_shm_info->used_ids, &target_shm_info->used_ids);
-    __put_user(host_shm_info->shm_tot, &target_shm_info->shm_tot);
-    __put_user(host_shm_info->shm_rss, &target_shm_info->shm_rss);
-    __put_user(host_shm_info->shm_swp, &target_shm_info->shm_swp);
-    __put_user(host_shm_info->swap_attempts, &target_shm_info->swap_attempts);
-    __put_user(host_shm_info->swap_successes, &target_shm_info->swap_successes);
-    unlock_user_struct(target_shm_info, target_addr, 1);
-    return 0;
-}
-
-static inline abi_long do_shmctl(int shmid, int cmd, abi_long buf)
-{
-    struct shmid_ds dsarg;
-    struct shminfo shminfo;
-    struct shm_info shm_info;
-    abi_long ret = -TARGET_EINVAL;
-
-    cmd &= 0xff;
-
-    switch(cmd) {
-    case IPC_STAT:
-    case IPC_SET:
-    case SHM_STAT:
-        if (target_to_host_shmid_ds(&dsarg, buf))
-            return -TARGET_EFAULT;
-        ret = get_errno(shmctl(shmid, cmd, &dsarg));
-        if (host_to_target_shmid_ds(buf, &dsarg))
-            return -TARGET_EFAULT;
-        break;
-    case IPC_INFO:
-        ret = get_errno(shmctl(shmid, cmd, (struct shmid_ds *)&shminfo));
-        if (host_to_target_shminfo(buf, &shminfo))
-            return -TARGET_EFAULT;
-        break;
-    case SHM_INFO:
-        ret = get_errno(shmctl(shmid, cmd, (struct shmid_ds *)&shm_info));
-        if (host_to_target_shm_info(buf, &shm_info))
-            return -TARGET_EFAULT;
-        break;
-    case IPC_RMID:
-    case SHM_LOCK:
-    case SHM_UNLOCK:
-        ret = get_errno(shmctl(shmid, cmd, NULL));
-        break;
-    }
-
-    return ret;
-}
-
-#ifndef TARGET_FORCE_SHMLBA
-/* For most architectures, SHMLBA is the same as the page size;
- * some architectures have larger values, in which case they should
- * define TARGET_FORCE_SHMLBA and provide a target_shmlba() function.
- * This corresponds to the kernel arch code defining __ARCH_FORCE_SHMLBA
- * and defining its own value for SHMLBA.
- *
- * The kernel also permits SHMLBA to be set by the architecture to a
- * value larger than the page size without setting __ARCH_FORCE_SHMLBA;
- * this means that addresses are rounded to the large size if
- * SHM_RND is set but addresses not aligned to that size are not rejected
- * as long as they are at least page-aligned. Since the only architecture
- * which uses this is ia64 this code doesn't provide for that oddity.
- */
-static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
-{
-    return TARGET_PAGE_SIZE;
-}
-#endif
-
-static inline abi_ulong do_shmat(CPUArchState *cpu_env,
-                                 int shmid, abi_ulong shmaddr, int shmflg)
-{
-    abi_long raddr;
-    void *host_raddr;
-    struct shmid_ds shm_info;
-    int i,ret;
-    abi_ulong shmlba;
-
-    /* find out the length of the shared memory segment */
-    ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
-    if (is_error(ret)) {
-        /* can't get length, bail out */
-        return ret;
-    }
-
-    shmlba = target_shmlba(cpu_env);
-
-    if (shmaddr & (shmlba - 1)) {
-        if (shmflg & SHM_RND) {
-            shmaddr &= ~(shmlba - 1);
-        } else {
-            return -TARGET_EINVAL;
-        }
-    }
-    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
-        return -TARGET_EINVAL;
-    }
-
-    mmap_lock();
-
-    if (shmaddr)
-        host_raddr = shmat(shmid, (void *)g2h(shmaddr), shmflg);
-    else {
-        abi_ulong mmap_start;
-
-        /* In order to use the host shmat, we need to honor host SHMLBA.  */
-        mmap_start = mmap_find_vma(0, shm_info.shm_segsz, MAX(SHMLBA, shmlba));
-
-        if (mmap_start == -1) {
-            errno = ENOMEM;
-            host_raddr = (void *)-1;
-        } else
-            host_raddr = shmat(shmid, g2h(mmap_start), shmflg | SHM_REMAP);
-    }
-
-    if (host_raddr == (void *)-1) {
-        mmap_unlock();
-        return get_errno((long)host_raddr);
-    }
-    raddr=h2g((unsigned long)host_raddr);
-
-    page_set_flags(raddr, raddr + shm_info.shm_segsz,
-                   PAGE_VALID | PAGE_READ |
-                   ((shmflg & SHM_RDONLY)? 0 : PAGE_WRITE));
-
-    for (i = 0; i < N_SHM_REGIONS; i++) {
-        if (!shm_regions[i].in_use) {
-            shm_regions[i].in_use = true;
-            shm_regions[i].start = raddr;
-            shm_regions[i].size = shm_info.shm_segsz;
-            break;
-        }
-    }
-
-    mmap_unlock();
-    return raddr;
-
-}
-
-static inline abi_long do_shmdt(abi_ulong shmaddr)
-{
-    int i;
-    abi_long rv;
-
-    mmap_lock();
-
-    for (i = 0; i < N_SHM_REGIONS; ++i) {
-        if (shm_regions[i].in_use && shm_regions[i].start == shmaddr) {
-            shm_regions[i].in_use = false;
-            page_set_flags(shmaddr, shmaddr + shm_regions[i].size, 0);
-            break;
-        }
-    }
-    rv = get_errno(shmdt(g2h(shmaddr)));
-
-    mmap_unlock();
-
-    return rv;
-}
-
-#ifdef TARGET_NR_ipc
-/* ??? This only works with linear mappings.  */
-/* do_ipc() must return target values and target errnos. */
-static abi_long do_ipc(CPUArchState *cpu_env,
-                       unsigned int call, abi_long first,
-                       abi_long second, abi_long third,
-                       abi_long ptr, abi_long fifth)
-{
-    int version;
-    abi_long ret = 0;
-
-    version = call >> 16;
-    call &= 0xffff;
-
-    switch (call) {
-    case IPCOP_semop:
-        ret = do_semop(first, ptr, second);
-        break;
-
-    case IPCOP_semget:
-        ret = get_errno(semget(first, second, third));
-        break;
-
-    case IPCOP_semctl: {
-        /* The semun argument to semctl is passed by value, so dereference the
-         * ptr argument. */
-        abi_ulong atptr;
-        get_user_ual(atptr, ptr);
-        ret = do_semctl(first, second, third, atptr);
-        break;
-    }
-
-    case IPCOP_msgget:
-        ret = get_errno(msgget(first, second));
-        break;
-
-    case IPCOP_msgsnd:
-        ret = do_msgsnd(first, ptr, second, third);
-        break;
-
-    case IPCOP_msgctl:
-        ret = do_msgctl(first, second, ptr);
-        break;
-
-    case IPCOP_msgrcv:
-        switch (version) {
-        case 0:
-            {
-                struct target_ipc_kludge {
-                    abi_long msgp;
-                    abi_long msgtyp;
-                } *tmp;
-
-                if (!lock_user_struct(VERIFY_READ, tmp, ptr, 1)) {
-                    ret = -TARGET_EFAULT;
-                    break;
-                }
-
-                ret = do_msgrcv(first, tswapal(tmp->msgp), second, tswapal(tmp->msgtyp), third);
-
-                unlock_user_struct(tmp, ptr, 0);
-                break;
-            }
-        default:
-            ret = do_msgrcv(first, ptr, second, fifth, third);
-        }
-        break;
-
-    case IPCOP_shmat:
-        switch (version) {
-        default:
-        {
-            abi_ulong raddr;
-            raddr = do_shmat(cpu_env, first, ptr, second);
-            if (is_error(raddr))
-                return get_errno(raddr);
-            if (put_user_ual(raddr, third))
-                return -TARGET_EFAULT;
-            break;
-        }
-        case 1:
-            ret = -TARGET_EINVAL;
-            break;
-        }
-	break;
-    case IPCOP_shmdt:
-        ret = do_shmdt(ptr);
-	break;
-
-    case IPCOP_shmget:
-	/* IPC_* flag values are the same on all linux platforms */
-	ret = get_errno(shmget(first, second, third));
-	break;
-
-	/* IPC_* and SHM_* command values are the same on all linux platforms */
-    case IPCOP_shmctl:
-        ret = do_shmctl(first, second, ptr);
-        break;
-    default:
-	gemu_log("Unsupported ipc call: %d (version %d)\n", call, version);
-	ret = -TARGET_ENOSYS;
-	break;
-    }
-    return ret;
-}
-#endif
-
 /* kernel structure types definitions */
 
 #define STRUCT(name, ...) STRUCT_ ## name,
@@ -8451,54 +7529,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
         }
         return ret;
-#ifdef TARGET_NR_ipc
-    case TARGET_NR_ipc:
-        return do_ipc(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
-#endif
-#ifdef TARGET_NR_semget
-    case TARGET_NR_semget:
-        return get_errno(semget(arg1, arg2, arg3));
-#endif
-#ifdef TARGET_NR_semop
-    case TARGET_NR_semop:
-        return do_semop(arg1, arg2, arg3);
-#endif
-#ifdef TARGET_NR_semctl
-    case TARGET_NR_semctl:
-        return do_semctl(arg1, arg2, arg3, arg4);
-#endif
-#ifdef TARGET_NR_msgctl
-    case TARGET_NR_msgctl:
-        return do_msgctl(arg1, arg2, arg3);
-#endif
-#ifdef TARGET_NR_msgget
-    case TARGET_NR_msgget:
-        return get_errno(msgget(arg1, arg2));
-#endif
-#ifdef TARGET_NR_msgrcv
-    case TARGET_NR_msgrcv:
-        return do_msgrcv(arg1, arg2, arg3, arg4, arg5);
-#endif
-#ifdef TARGET_NR_msgsnd
-    case TARGET_NR_msgsnd:
-        return do_msgsnd(arg1, arg2, arg3, arg4);
-#endif
-#ifdef TARGET_NR_shmget
-    case TARGET_NR_shmget:
-        return get_errno(shmget(arg1, arg2, arg3));
-#endif
-#ifdef TARGET_NR_shmctl
-    case TARGET_NR_shmctl:
-        return do_shmctl(arg1, arg2, arg3);
-#endif
-#ifdef TARGET_NR_shmat
-    case TARGET_NR_shmat:
-        return do_shmat(cpu_env, arg1, arg2, arg3);
-#endif
-#ifdef TARGET_NR_shmdt
-    case TARGET_NR_shmdt:
-        return do_shmdt(arg1);
-#endif
     case TARGET_NR_fsync:
         return get_errno(fsync(arg1));
     case TARGET_NR_clone:
@@ -11061,6 +10091,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                                 int64_t arg5, int64_t arg6)
 
 #include "syscall-file.inc.c"
+#include "syscall-ipc.inc.c"
 
 #undef SYSCALL_IMPL
 #undef SYSCALL_ARGS
@@ -11094,6 +10125,7 @@ static const SyscallDef *syscall_table(int num)
 #define SYSCALL_DEF(NAME, ...)  case TARGET_NR_##NAME: return &def_##NAME
 #define SYSCALL_DEF_ARGS(NAME, ...)  SYSCALL_DEF(NAME)
 #define SYSCALL_DEF_FULL(NAME, ...)  SYSCALL_DEF(NAME)
+#define SYSCALL_TABLE
 
     switch (num) {
 #include "syscall-defs.h"
@@ -11103,6 +10135,7 @@ static const SyscallDef *syscall_table(int num)
 #undef SYSCALL_DEF
 #undef SYSCALL_DEF_ARGS
 #undef SYSCALL_DEF_FULL
+#undef SYSCALL_TABLE
 }
 
 abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index bf239cb9a3..f99bd57c09 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -452,9 +452,6 @@
 #ifdef TARGET_NR_io_submit
 { TARGET_NR_io_submit, "io_submit" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_ipc
-{ TARGET_NR_ipc, "ipc" , NULL, print_ipc, NULL },
-#endif
 #ifdef TARGET_NR_kcmp
 { TARGET_NR_kcmp, "kcmp" , NULL, NULL, NULL },
 #endif
@@ -608,18 +605,6 @@
 #ifdef TARGET_NR_mremap
 { TARGET_NR_mremap, "mremap" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_msgctl
-{ TARGET_NR_msgctl, "msgctl" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_msgget
-{ TARGET_NR_msgget, "msgget" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_msgrcv
-{ TARGET_NR_msgrcv, "msgrcv" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_msgsnd
-{ TARGET_NR_msgsnd, "msgsnd" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_msync
 { TARGET_NR_msync, "msync" , NULL, NULL, NULL },
 #endif
@@ -917,9 +902,6 @@
 #ifdef TARGET_NR_osf_settimeofday
 { TARGET_NR_osf_settimeofday, "osf_settimeofday" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_osf_shmat
-{ TARGET_NR_osf_shmat, "osf_shmat" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_osf_signal
 { TARGET_NR_osf_signal, "osf_signal" , NULL, NULL, NULL },
 #endif
@@ -1184,18 +1166,6 @@
 #ifdef TARGET_NR_select
 { TARGET_NR_select, "select" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_semctl
-{ TARGET_NR_semctl, "semctl" , NULL, print_semctl, NULL },
-#endif
-#ifdef TARGET_NR_semget
-{ TARGET_NR_semget, "semget" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_semop
-{ TARGET_NR_semop, "semop" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_semtimedop
-{ TARGET_NR_semtimedop, "semtimedop" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_send
 { TARGET_NR_send, "send" , NULL, NULL, NULL },
 #endif
@@ -1323,18 +1293,6 @@
 #ifdef TARGET_NR_sgetmask
 { TARGET_NR_sgetmask, "sgetmask" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_shmat
-{ TARGET_NR_shmat, "shmat" , NULL, NULL, print_syscall_ret_addr },
-#endif
-#ifdef TARGET_NR_shmctl
-{ TARGET_NR_shmctl, "shmctl" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_shmdt
-{ TARGET_NR_shmdt, "shmdt" , NULL, NULL, NULL },
-#endif
-#ifdef TARGET_NR_shmget
-{ TARGET_NR_shmget, "shmget" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_shutdown
 { TARGET_NR_shutdown, "shutdown" , NULL, NULL, NULL },
 #endif
-- 
2.17.1


