Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F13139AD3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:38:33 +0100 (CET)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6TU-0003ed-HQ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RQ-0001Vz-Dw
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RP-0004bT-CV
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:04 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46644 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6RP-0004aP-5n
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:03 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0E8121A20B5;
 Mon, 13 Jan 2020 21:36:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E974B1A1FDF;
 Mon, 13 Jan 2020 21:36:00 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/20] linux-user: microblaze: Update syscall numbers to
 kernel 5.5 rc3 level
Date: Mon, 13 Jan 2020 21:34:27 +0100
Message-Id: <1578947683-21011-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578947683-21011-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, laurent@vivier.eu,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update microblaze syscall numbers based on Linux kernel tag v5.5-rc3
(commit 46cf053e).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>

---

cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
---
 linux-user/microblaze/syscall_nr.h | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/linux-user/microblaze/syscall_nr.h b/linux-user/microblaze/syscall_nr.h
index aa2eb93..ec1758e 100644
--- a/linux-user/microblaze/syscall_nr.h
+++ b/linux-user/microblaze/syscall_nr.h
@@ -393,5 +393,50 @@
 #define TARGET_NR_memfd_create          386
 #define TARGET_NR_bpf                   387
 #define TARGET_NR_execveat              388
+#define TARGET_NR_userfaultfd           389
+#define TARGET_NR_membarrier            390
+#define TARGET_NR_mlock2                391
+#define TARGET_NR_copy_file_range       392
+#define TARGET_NR_preadv2               393
+#define TARGET_NR_pwritev2              394
+#define TARGET_NR_pkey_mprotect         395
+#define TARGET_NR_pkey_alloc            396
+#define TARGET_NR_pkey_free             397
+#define TARGET_NR_statx                 398
+#define TARGET_NR_io_pgetevents         399
+#define TARGET_NR_rseq                  400
+/* 401 and 402 are unused */
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
+#define TARGET_NR_clone3                435
 
 #endif
-- 
2.7.4


