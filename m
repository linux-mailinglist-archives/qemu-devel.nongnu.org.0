Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B32D849
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 10:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVuNF-00057Q-56
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 04:55:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVuKy-0003tQ-Nb
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hVuKx-0002m4-Fe
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:53:32 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:49327)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hVuKx-0002lD-7M
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:53:31 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MiMIY-1gzbiB2sWE-00fVo0; Wed, 29 May 2019 10:48:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 10:48:04 +0200
Message-Id: <20190529084804.25950-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qNNE4MHroailQjdAGeAkz+vvhAr7BxeOWnGs00bVrILyPvufVFW
	mlTzwcWDdYZlj9sVwNBMdRXN+9YuczBVHFZRPi4Y3vIVFqi3ZUx0Ne/IEsuSpgk09DaGpXn
	pGfmZ4+ZVklIklvyIReBv+hg3TuC5u5HAz00QPkrvNBr51IiayFRLvgqvQ3Ad+BoZbsakVQ
	xDM2d6Jon047WnLW725lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cGUg4oRVVM4=:iN6xlREUjcKqb7aqNjYv7h
	axhiq50sz9NnEKzY8VgUnxbNRjAnhPbcs6qTAfrE5VWnaRqA9HNdEbGEjv8kVHP5GB/waFfuO
	+2zJoN/5MZ/m/YOu3kQQPx4xYS7VJKaSTQ4Bxd2Bpkp6Y4RJiDNjlQQg5qo0vxvlpOTTueAGD
	uhGwI8rv+cTG3QpEWHsqp3Wc75xWBH8JVaw3hom6LrXwTh8HywuDSRwYa9HLQvfEbSSP/aTgr
	96LgEkFqWTFhMJqPhf1GAKs8TFSmO1Rb8UCkra1Sj0uT2z+vI3xvQmEghxs5wk4ag7d/Sntgs
	eOMZRiWn1VxSZ/8/0c75K5S5y3gL5740OnXT6U7VXsDEG4w8lyZ+ymlfcQe/k0y2eDrBVOf7k
	imPFTDAc3g8TpolauNhP4LeaCOtalQPNgHIZ0vo8bvm6HTR8yp0TlMWbLPhnwt6blXzM/ZwEy
	JPECOeFJD8mr1DHm7TcAjzEGceSHyE6YG5sXtg8MvpPXrjLNynsiQA6NunHeEdyJDWJn7K6Sx
	YFYRA2+yZgCpGbHZ/7YJefq6+mhIGpSAIYczNJz49jUN99v/LWWRpXmhwa97Ys/gD31DH+BZG
	iQhrTx6ORyMrqf70KMLAWpbosjJmeHqH2QEMG7TtSz8ZMRYDzXY+2FT/ykMo/monkzMmN+ykX
	T0hGYNB1Eu8e364WaY0d+HTneVV3sPRogTErfyicDrvkbn0AHjS/XNxT5T68Jj5UKs5Bj3blR
	RINIc+fQOe5HakEsJSzj3IW2P5GfeVJ/hblQUA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-devel] [PATCH v2] linux-user: emulate msgsnd(),
 msgrcv() and semtimedop()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we have updated kernel headers to 5.2-rc1 we have introduced
new syscall numbers that can be not supported by older kernels
and fail with ENOSYS while the guest emulation succeeded before
because the syscalls were emulated with ipc().

This patch fixes the problem by using ipc() if the new syscall
returns ENOSYS.

Fixes: 86e636951ddc ("linux-user: fix __NR_semtimedop undeclared error")
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---

Notes:
    v2: replace ENOSYS by TARGET_ENOSYS

 linux-user/syscall.c      | 61 +++++++++++++++++++--------------------
 linux-user/syscall_defs.h |  1 +
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5e29e675e9cf..9ecbac463385 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -763,50 +763,21 @@ safe_syscall2(int, nanosleep, const struct timespec *, req,
 safe_syscall4(int, clock_nanosleep, const clockid_t, clock, int, flags,
               const struct timespec *, req, struct timespec *, rem)
 #endif
-#if !defined(__NR_msgsnd) || !defined(__NR_msgrcv) || !defined(__NR_semtimedop)
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
+#ifdef __NR_ipc
 safe_syscall6(int, ipc, int, call, long, first, long, second, long, third,
               void *, ptr, long, fifth)
 #endif
 #ifdef __NR_msgsnd
 safe_syscall4(int, msgsnd, int, msgid, const void *, msgp, size_t, sz,
               int, flags)
-#else
-static int safe_msgsnd(int msgid, const void *msgp, size_t sz, int flags)
-{
-    return safe_ipc(Q_IPCCALL(0, Q_MSGSND), msgid, sz, flags, (void *)msgp, 0);
-}
 #endif
 #ifdef __NR_msgrcv
 safe_syscall5(int, msgrcv, int, msgid, void *, msgp, size_t, sz,
               long, msgtype, int, flags)
-#else
-static int safe_msgrcv(int msgid, void *msgp, size_t sz, long type, int flags)
-{
-    return safe_ipc(Q_IPCCALL(1, Q_MSGRCV), msgid, sz, flags, msgp, type);
-}
 #endif
 #ifdef __NR_semtimedop
 safe_syscall4(int, semtimedop, int, semid, struct sembuf *, tsops,
               unsigned, nsops, const struct timespec *, timeout)
-#else
-static int safe_semtimedop(int semid, struct sembuf *tsops, unsigned nsops,
-                           const struct timespec *timeout)
-{
-    return safe_ipc(Q_IPCCALL(0, Q_SEMTIMEDOP), semid, nsops, 0, tsops,
-                    (long)timeout);
-}
 #endif
 #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
 safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
@@ -3530,11 +3501,21 @@ static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
 static inline abi_long do_semop(int semid, abi_long ptr, unsigned nsops)
 {
     struct sembuf sops[nsops];
+    abi_long ret;
 
     if (target_to_host_sembuf(sops, ptr, nsops))
         return -TARGET_EFAULT;
 
-    return get_errno(safe_semtimedop(semid, sops, nsops, NULL));
+    ret = -TARGET_ENOSYS;
+#ifdef __NR_semtimedop
+    ret = get_errno(safe_semtimedop(semid, sops, nsops, NULL));
+#endif
+#ifdef __NR_ipc
+    if (ret == -TARGET_ENOSYS) {
+        ret = get_errno(safe_ipc(IPCOP_semtimedop, semid, nsops, 0, sops, 0));
+    }
+#endif
+    return ret;
 }
 
 struct target_msqid_ds
@@ -3689,7 +3670,16 @@ static inline abi_long do_msgsnd(int msqid, abi_long msgp,
     }
     host_mb->mtype = (abi_long) tswapal(target_mb->mtype);
     memcpy(host_mb->mtext, target_mb->mtext, msgsz);
+    ret = -TARGET_ENOSYS;
+#ifdef __NR_msgsnd
     ret = get_errno(safe_msgsnd(msqid, host_mb, msgsz, msgflg));
+#endif
+#ifdef __NR_ipc
+    if (ret == -TARGET_ENOSYS) {
+        ret = get_errno(safe_ipc(IPCOP_msgsnd, msqid, msgsz, msgflg,
+                                 host_mb, 0));
+    }
+#endif
     g_free(host_mb);
     unlock_user_struct(target_mb, msgp, 0);
 
@@ -3717,7 +3707,16 @@ static inline abi_long do_msgrcv(int msqid, abi_long msgp,
         ret = -TARGET_ENOMEM;
         goto end;
     }
+    ret = -TARGET_ENOSYS;
+#ifdef __NR_msgrcv
     ret = get_errno(safe_msgrcv(msqid, host_mb, msgsz, msgtyp, msgflg));
+#endif
+#ifdef __NR_ipc
+    if (ret == -TARGET_ENOSYS) {
+        ret = get_errno(safe_ipc(IPCOP_CALL(1, IPCOP_msgrcv), msqid, msgsz,
+                        msgflg, host_mb, msgtyp));
+    }
+#endif
 
     if (ret > 0) {
         abi_ulong target_mtext_addr = msgp + sizeof(abi_ulong);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 7f141f699c1a..3175440e9dd9 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -32,6 +32,7 @@
 #define TARGET_SYS_RECVMMSG     19        /* recvmmsg()            */
 #define TARGET_SYS_SENDMMSG     20        /* sendmmsg()            */
 
+#define IPCOP_CALL(VERSION, OP) ((VERSION) << 16 | (OP))
 #define IPCOP_semop		1
 #define IPCOP_semget		2
 #define IPCOP_semctl		3
-- 
2.20.1


