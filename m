Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68213821B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 16:49:22 +0100 (CET)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqJ0r-00033J-BG
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 10:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIvT-00050P-Sf
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iqIvS-0007Py-Td
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:43:47 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:48055 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iqIvS-0007KC-Ln
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 10:43:46 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6EE1B1A1FDA;
 Sat, 11 Jan 2020 16:43:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 526931A1187;
 Sat, 11 Jan 2020 16:43:44 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/19] linux-user: xtensa: Remove unused constant
 TARGET_NR_syscall_count
Date: Sat, 11 Jan 2020 16:40:29 +0100
Message-Id: <1578757241-29583-8-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, laurent@vivier.eu,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Currently, there is no usage of TARGET_NR_syscall_count for target
xtensa, and there is no obvious indication if there is some planned
usage in future.

---

cc: Max Filippov <jcmvbkbc@gmail.com>
---
 linux-user/xtensa/syscall_nr.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/xtensa/syscall_nr.h b/linux-user/xtensa/syscall_nr.h
index 3d19d0c..39bff65 100644
--- a/linux-user/xtensa/syscall_nr.h
+++ b/linux-user/xtensa/syscall_nr.h
@@ -466,6 +466,4 @@
 #define TARGET_NR_pidfd_open                         434
 #define TARGET_NR_clone3                             435
 
-#define TARGET_NR_syscall_count                      436
-
 #endif /* XTENSA_SYSCALL_NR_H */
-- 
2.7.4


