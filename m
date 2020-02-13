Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9815B6DF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 02:50:26 +0100 (CET)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j23e5-0002iz-54
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 20:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j23bc-0005xu-7Q
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j23bb-0004TU-2d
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:52 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:38874 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j23ba-0002zK-O9
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 20:47:51 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9E2F61A210C;
 Thu, 13 Feb 2020 02:46:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 716411A20DD;
 Thu, 13 Feb 2020 02:46:47 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] linux-user: arm: Update syscall numbers to kernel 5.5
 level
Date: Thu, 13 Feb 2020 02:46:26 +0100
Message-Id: <1581558393-9182-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581558393-9182-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1581558393-9182-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update arm syscall numbers based on Linux kernel v5.5.

CC: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/syscall_nr.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/linux-user/arm/syscall_nr.h b/linux-user/arm/syscall_nr.h
index e7eda0d..6db9235 100644
--- a/linux-user/arm/syscall_nr.h
+++ b/linux-user/arm/syscall_nr.h
@@ -399,5 +399,49 @@
 #define TARGET_NR_userfaultfd                  (388)
 #define TARGET_NR_membarrier                   (389)
 #define TARGET_NR_mlock2                       (390)
+#define TARGET_NR_copy_file_range              (391)
+#define TARGET_NR_preadv2                      (392)
+#define TARGET_NR_pwritev2                     (393)
+#define TARGET_NR_pkey_mprotect                (394)
+#define TARGET_NR_pkey_alloc                   (395)
+#define TARGET_NR_pkey_free                    (396)
+#define TARGET_NR_statx                        (397)
+#define TARGET_NR_rseq                         (398)
+#define TARGET_NR_io_pgetevents                (399)
+#define TARGET_NR_migrate_pages                (400)
+#define TARGET_NR_kexec_file_load              (401)
+/* 402 is unused */
+#define TARGET_NR_clock_gettime64              (403)
+#define TARGET_NR_clock_settime64              (404)
+#define TARGET_NR_clock_adjtime64              (405)
+#define TARGET_NR_clock_getres_time64          (406)
+#define TARGET_NR_clock_nanosleep_time64       (407)
+#define TARGET_NR_timer_gettime64              (408)
+#define TARGET_NR_timer_settime64              (409)
+#define TARGET_NR_timerfd_gettime64            (410)
+#define TARGET_NR_timerfd_settime64            (411)
+#define TARGET_NR_utimensat_time64             (412)
+#define TARGET_NR_pselect6_time64              (413)
+#define TARGET_NR_ppoll_time64                 (414)
+#define TARGET_NR_io_pgetevents_time64         (416)
+#define TARGET_NR_recvmmsg_time64              (417)
+#define TARGET_NR_mq_timedsend_time64          (418)
+#define TARGET_NR_mq_timedreceive_time64       (419)
+#define TARGET_NR_semtimedop_time64            (420)
+#define TARGET_NR_rt_sigtimedwait_time64       (421)
+#define TARGET_NR_futex_time64                 (422)
+#define TARGET_NR_sched_rr_get_interval_time64 (423)
+#define TARGET_NR_pidfd_send_signal            (424)
+#define TARGET_NR_io_uring_setup               (425)
+#define TARGET_NR_io_uring_enter               (426)
+#define TARGET_NR_io_uring_register            (427)
+#define TARGET_NR_open_tree                    (428)
+#define TARGET_NR_move_mount                   (429)
+#define TARGET_NR_fsopen                       (430)
+#define TARGET_NR_fsconfig                     (431)
+#define TARGET_NR_fsmount                      (432)
+#define TARGET_NR_fspick                       (433)
+#define TARGET_NR_pidfd_open                   (434)
+#define TARGET_NR_clone3                       (435)
 
 #endif
-- 
2.7.4


