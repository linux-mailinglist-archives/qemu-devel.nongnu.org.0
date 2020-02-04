Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79B151A5D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 13:11:30 +0100 (CET)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyx3A-00033l-Ag
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 07:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iywzp-0006o6-Qd
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iywzo-0008DX-Mx
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:08:01 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37993 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iywzo-0008BC-FM
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:08:00 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 523411A204C;
 Tue,  4 Feb 2020 13:07:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 317831A1D22;
 Tue,  4 Feb 2020 13:07:53 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] linux-user: alpha: Update syscall numbers to kernel 5.5
 level
Date: Tue,  4 Feb 2020 13:07:30 +0100
Message-Id: <1580818058-16159-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580818058-16159-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580818058-16159-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update alpha syscall numbers based on Linux kernel v5.5.

CC: Richard Henderson <rth@twiddle.net>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/syscall_nr.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/linux-user/alpha/syscall_nr.h b/linux-user/alpha/syscall_nr.h
index 2e5541b..c29fc17 100644
--- a/linux-user/alpha/syscall_nr.h
+++ b/linux-user/alpha/syscall_nr.h
@@ -453,5 +453,40 @@
 #define TARGET_NR_getrandom                     511
 #define TARGET_NR_memfd_create                  512
 #define TARGET_NR_execveat                      513
+#define TARGET_NR_seccomp                       514
+#define TARGET_NR_bpf                           515
+#define TARGET_NR_userfaultfd                   516
+#define TARGET_NR_membarrier                    517
+#define TARGET_NR_mlock2                        518
+#define TARGET_NR_copy_file_range               519
+#define TARGET_NR_preadv2                       520
+#define TARGET_NR_pwritev2                      521
+#define TARGET_NR_statx                         522
+#define TARGET_NR_io_pgetevents                 523
+#define TARGET_NR_pkey_mprotect                 524
+#define TARGET_NR_pkey_alloc                    525
+#define TARGET_NR_pkey_free                     526
+#define TARGET_NR_rseq                          527
+#define TARGET_NR_statfs64                      528
+#define TARGET_NR_fstatfs64                     529
+#define TARGET_NR_getegid                       530
+#define TARGET_NR_geteuid                       531
+#define TARGET_NR_getppid                       532
+/*
+ * all other architectures have common numbers for new syscall, alpha
+ * is the exception.
+ */
+#define TARGET_NR_pidfd_send_signal             534
+#define TARGET_NR_io_uring_setup                535
+#define TARGET_NR_io_uring_enter                536
+#define TARGET_NR_io_uring_register             537
+#define TARGET_NR_open_tree                     538
+#define TARGET_NR_move_mount                    539
+#define TARGET_NR_fsopen                        540
+#define TARGET_NR_fsconfig                      541
+#define TARGET_NR_fsmount                       542
+#define TARGET_NR_fspick                        543
+#define TARGET_NR_pidfd_open                    544
+/* 545 reserved for clone3 */
 
 #endif
-- 
2.7.4


