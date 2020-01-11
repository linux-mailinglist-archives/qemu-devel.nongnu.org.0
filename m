Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406B138212
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 16:44:05 +0100 (CET)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqIvk-0004VL-AC
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 10:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIu3-0002Ws-6H
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:42:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqItx-0002SJ-0B
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:42:17 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46799 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iqItw-0002O1-EU
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:42:12 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7669C1A1EAC;
 Sat, 11 Jan 2020 16:42:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 5C68B1A1187;
 Sat, 11 Jan 2020 16:42:08 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/19] linux-user: m68k: Update syscall numbers to kernel
 5.5 rc3 level
Date: Sat, 11 Jan 2020 16:40:24 +0100
Message-Id: <1578757241-29583-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update m68k syscall numbers based on Linux kernel tag v5.5-rc3
(commit 46cf053e).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>

---

cc: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/syscall_nr.h | 50 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/linux-user/m68k/syscall_nr.h b/linux-user/m68k/syscall_nr.h
index d33d8e9..01aee34 100644
--- a/linux-user/m68k/syscall_nr.h
+++ b/linux-user/m68k/syscall_nr.h
@@ -382,5 +382,53 @@
 #define TARGET_NR_copy_file_range       376
 #define TARGET_NR_preadv2               377
 #define TARGET_NR_pwritev2              378
-
+#define TARGET_NR_statx                 379
+#define TARGET_NR_seccomp               380
+#define TARGET_NR_pkey_mprotect         381
+#define TARGET_NR_pkey_alloc            382
+#define TARGET_NR_pkey_free             383
+#define TARGET_NR_rseq                  384
+/* room for arch specific calls */
+#define TARGET_NR_semget                393
+#define TARGET_NR_semctl                394
+#define TARGET_NR_shmget                395
+#define TARGET_NR_shmctl                396
+#define TARGET_NR_shmat                 397
+#define TARGET_NR_shmdt                 398
+#define TARGET_NR_msgget                399
+#define TARGET_NR_msgsnd                400
+#define TARGET_NR_msgrcv                401
+#define TARGET_NR_msgctl                402
+#define TARGET_NR_clock_gettime64       403
+#define TARGET_NR_clock_settime64       404
+#define TARGET_NR_clock_adjtime64       405
+#define TARGET_NR_clock_getres_time64   406
+#define TARGET_NR_clock_nanosleep_time64 407
+#define TARGET_NR_timer_gettime64       408
+#define TARGET_NR_timer_settime64       409
+#define TARGET_NR_timerfd_gettime64     410
+#define TARGET_NR_timerfd_settime64     411
+#define TARGET_NR_utimensat_time64      412
+#define TARGET_NR_pselect6_time64       413
+#define TARGET_NR_ppoll_time64          414
+#define TARGET_NR_io_pgetevents_time64  416
+#define TARGET_NR_recvmmsg_time64       417
+#define TARGET_NR_mq_timedsend_time64   418
+#define TARGET_NR_mq_timedreceive_time64 419
+#define TARGET_NR_semtimedop_time64     420
+#define TARGET_NR_rt_sigtimedwait_time64 421
+#define TARGET_NR_futex_time64          422
+#define TARGET_NR_sched_rr_get_interval_time64 423
+#define TARGET_NR_pidfd_send_signal     424
+#define TARGET_NR_io_uring_setup        425
+#define TARGET_NR_io_uring_enter        426
+#define TARGET_NR_io_uring_register     427
+#define TARGET_NR_open_tree             428
+#define TARGET_NR_move_mount            429
+#define TARGET_NR_fsopen                430
+#define TARGET_NR_fsconfig              431
+#define TARGET_NR_fsmount               432
+#define TARGET_NR_fspick                433
+#define TARGET_NR_pidfd_open            434
+/* 435 reserved for clone3 */
 #endif
-- 
2.7.4


