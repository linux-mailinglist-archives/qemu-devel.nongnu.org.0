Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E0D160EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 10:36:14 +0100 (CET)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3cp3-0005P3-Sf
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 04:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j3ckL-0007ds-Ve
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:31:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j3ckK-0001zv-D5
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:31:21 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:52875)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j3ckJ-0001wE-9n
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:31:20 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MN5Nt-1inKGo3D8v-00J3Kq; Mon, 17 Feb 2020 10:30:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] linux-user: m68k: Update syscall numbers to kernel 5.5
 level
Date: Mon, 17 Feb 2020 10:30:25 +0100
Message-Id: <20200217093031.678348-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217093031.678348-1-laurent@vivier.eu>
References: <20200217093031.678348-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VlZCd/teDwF7wKwoVy5upIvVpL3eDaOrGdB2z0jQ5VXR1YmSyWo
 wl4EYURv/VCsvUjAQCxDwF2GkFx1wVMko2aMmFqNI3w5cHzT2QB0EEWGRv1DsKN4nxKOuuu
 /r7ZlA1BpS3hNI+8lK2MRHvU3spWHHb5DZwNOML3vQcAIz7h2ttqGDes0RTQ6vf0I+w5Cgk
 +hFgLYow6hLqHTD3b2BkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C3CmSuX4LEQ=:IBDrtGwcl+KmK2/40btjGZ
 h8Hn8uv2sA5JJOiBjrO270dVGFDoJKK8IWYFQxez53J/1i5u8MX5tlBnc3ViYFxzL05JNtfzd
 cB6+MGSH3PBOezmrly3PiaAwBj/xTy01PixauJD/ALUMbTzmlxtV8IUWZn+EmtFYecFyqhvHn
 WWX1/bC4t9qNFjxMBWGvVm5e/PnHVJ4eWI7bSnDy0U7H6F7fHXCHoWE2LgthHSHZFAmMtqvQq
 AVlzXf5aE1NcN+wIW8SXvEZjsu2t0TyB60qBxTQEt/YNWb51bVJ/GK5L2kFi+fEzLjmXHokWq
 zIsy8TfGn74CvjiugPwiDfoxD9umqSa51iDwU0ZAC8rS9fZqpuFd4Dnw3L1MlzkwWGGBg/3JE
 RVZz7wkiipnmlLSd2qaAIaIBBAG9CRMM3LPU51SOaHQC7sb/WiC73NaCHASpGPmW6G52MlMKI
 tinApZySp+br+8/gc6wofYb615oN02AMwhRl8kcc3c/PET30y62qeIU64syXe9dei4Eq6eDk7
 8K8NyRFT1XrZK51fdp3ENfIdWUrWrE36bm36CCp8GBKu+A2RLopUJlu+80yU5PcitjYk233hK
 I7pH/Jz/k7vvw8aQdzcLuXulOi2xY/AWHEKog4Z5o95d7X4vASNGMmHsWrarevkPV4SsfO8iR
 o2U3+GEQ15c9n/Ed6zEMQP0107j0Pnq3RvD0doMBoXWgUqHtHGLLBBDEGDP9AYPpWsLDpr3RB
 RDjAXJaBfzO5+r3dB5MfX5JfcVbLi7IIOSaJy8nBQYe1V4AqmJNrwWVdrm5i4Sv7SqYDqFhnJ
 PpfMUWbYseC+mEO24T4pAmaeZk9XfP77+3AKThPGXE4j71WLhIVa+wt0EHyGr3oi8SVNdeb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Riku Voipio <riku.voipio@iki.fi>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update m68k syscall numbers based on Linux kernel v5.5.

CC: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1581596954-2305-4-git-send-email-aleksandar.markovic@rt-rk.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/syscall_nr.h | 50 +++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/linux-user/m68k/syscall_nr.h b/linux-user/m68k/syscall_nr.h
index d33d8e98a732..01aee343a9b2 100644
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
2.24.1


