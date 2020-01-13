Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F8139B07
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 21:56:50 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir6kr-0003W8-W5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 15:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6T8-0004bL-88
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ir6T7-0006JF-Ai
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:37:50 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:46992 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ir6T7-0006Ho-4G
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 15:37:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E54991A1FB3;
 Mon, 13 Jan 2020 21:37:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CE5771A1F9E;
 Mon, 13 Jan 2020 21:37:46 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/20] linux-user: xtensa: Remove unused constant
 TARGET_NR_syscall_count
Date: Mon, 13 Jan 2020 21:34:31 +0100
Message-Id: <1578947683-21011-9-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, laurent@vivier.eu,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Currently, there is no usage of TARGET_NR_syscall_count for target
xtensa, and there is no obvious indication if there is some planned
usage in future.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>

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


