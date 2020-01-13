Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A134139AD1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:38:29 +0100 (CET)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6Ta-0003nU-2K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RX-0001ae-0W
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6RS-0004fw-Na
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:10 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46660 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6RS-0004eZ-GN
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:36:06 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 61DFA1A20B1;
 Mon, 13 Jan 2020 21:36:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 3C4191A1F9E;
 Mon, 13 Jan 2020 21:36:04 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/20] linux-user: x86_64: Update syscall numbers to kernel
 5.5 rc3 level
Date: Mon, 13 Jan 2020 21:34:29 +0100
Message-Id: <1578947683-21011-7-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 laurent@vivier.eu, amarkovic@wavecomp.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update x86_64 syscall numbers based on Linux kernel tag v5.5-rc3
(commit 46cf053e).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>

---

cc: Paolo Bonzini <pbonzini@redhat.com>
cc: Richard Henderson <rth@twiddle.net>
cc: Eduardo Habkost <ehabkost@redhat.com>
---
 linux-user/x86_64/syscall_nr.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/linux-user/x86_64/syscall_nr.h b/linux-user/x86_64/syscall_nr.h
index 9b6981e..e5d14ec 100644
--- a/linux-user/x86_64/syscall_nr.h
+++ b/linux-user/x86_64/syscall_nr.h
@@ -328,5 +328,29 @@
 #define TARGET_NR_membarrier            324
 #define TARGET_NR_mlock2                325
 #define TARGET_NR_copy_file_range       326
+#define TARGET_NR_preadv2               327
+#define TARGET_NR_pwritev2              328
+#define TARGET_NR_pkey_mprotect         329
+#define TARGET_NR_pkey_alloc            330
+#define TARGET_NR_pkey_free             331
+#define TARGET_NR_statx                 332
+#define TARGET_NR_io_pgetevents         333
+#define TARGET_NR_rseq                  334
+/*
+ * don't use numbers 387 through 423, add new calls after the last
+ * 'common' entry
+ */
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


