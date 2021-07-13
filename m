Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8553C71E5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:11:40 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J8N-0001tL-AV
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifn-0000LF-7D
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:07 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifl-00067W-8n
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:06 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MA88C-1lssXC0q5a-00BfXv; Tue, 13
 Jul 2021 15:42:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/12] linux-user: update syscall_nr.h to Linux v5.13
Date: Tue, 13 Jul 2021 15:41:50 +0200
Message-Id: <20210713134152.288423-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aHqhiTotPPHP5VvVS4Rah0E20i4e3afHwFMnFWIxdeYqwbUQud0
 3c0l2DAUh0Y34QEWhm7C2pYo5pxWAO9/HWZOXy94nYDYtzk7QBan5nQvsGM9vdoZd1WHAD7
 HByEAdFRHsM4MpTll3EgqEQxrFXs0raXkzvvYkHCPmZVlycAtN2c9RtVJT8l+XMlvauQ2C5
 Vc0PC/Agz62cSgJhJMaLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I35201S4Sa4=:vOQwceT7dDsg2eqa1AfBqN
 9/01vvrnczCePUPnaUARHIKxzF/oXSgimbOPXEiQNaVayi7CGFIW+IQBU7vP6ClnMB7163zxd
 KpWGXuBNzF6kezM/teeNMKpMPutaw4rshTdI3JnEh+S7U5lt6T2jZCP/MQuKr6k8e4+00/GCx
 X+fdF9L2ryzwKU8bXUlzsoQRzhUlHMasxN1aeJM95wVO49YgQF2d9i7xDnt8KvU09C0r+s84d
 z4835xxkWiRvEPmO7dVmrj4b2FWUiZQ1qQyYvV9YoE/5YcB5c3hFfruma1diOw9N2tVZ9kHKg
 UCxrrVg1NnVc0vWW+jy42XyCq8gDpiJxxt3W1LX0QLOms+Rhj7LEHKUIOwuP10IYJ53lEMI2q
 cPPCo/5aWsVMKkW0U/geHe09QA0u8lNhYe1m8RiwIcLjRaAXtDl3VnFHtvd6y/eFOxmTtu+IW
 dxwNPYvPDbL1xL4gW2v8gBMgwk5rNRGJMgFeQENr1o84Gnhm1JHOf2C0mZew5BpahKepQcC/d
 UMhACM/ePH8V3ukOOL7wbaDzG905O/VPMGVAbvaRn0Zba1ErbyfDYIUyVoqoTynjSANS5zBxI
 BHDCZCpuYnpvql1cTYYVnmKjSBZMu7cLSOD1YhM21ILAtd/1mvR2TEfcRLtH4ytU7B2clC78a
 ugWUl4Z5xG81eqt9rlXcG4H7D9nAYVIGvIqZsxQgRLhSIaFfOvyerwbMkRkaC7lpsWW8xqkmG
 o4M8Gl7fqA22uqjAFhuyrtGsHI/+TtK1SgZx9iq+OIp/ARhc4zo7Of6B82PiJnVBYuL6ZGVwQ
 ImX23jFuyi4IWpHeE0QyqFiGKHn9Fz+fZcLOkn7BB+PfZBjL13IHTAYGOKDYHjDWw4dz6N+
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Automatically generated using scripts/gensyscalls.sh

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20210708215756.268805-2-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/syscall_nr.h  |  8 +++++++-
 linux-user/hexagon/syscall_nr.h  | 12 +++++++++++-
 linux-user/nios2/syscall_nr.h    |  8 +++++++-
 linux-user/openrisc/syscall_nr.h |  8 +++++++-
 linux-user/riscv/syscall32_nr.h  |  8 +++++++-
 linux-user/riscv/syscall64_nr.h  |  8 +++++++-
 6 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/linux-user/aarch64/syscall_nr.h b/linux-user/aarch64/syscall_nr.h
index 6fd5b331e780..12ef002d60f9 100644
--- a/linux-user/aarch64/syscall_nr.h
+++ b/linux-user/aarch64/syscall_nr.h
@@ -302,6 +302,12 @@
 #define TARGET_NR_openat2 437
 #define TARGET_NR_pidfd_getfd 438
 #define TARGET_NR_faccessat2 439
-#define TARGET_NR_syscalls 440
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_AARCH64_SYSCALL_NR_H */
diff --git a/linux-user/hexagon/syscall_nr.h b/linux-user/hexagon/syscall_nr.h
index da1314f7132d..b047dbbf6df3 100644
--- a/linux-user/hexagon/syscall_nr.h
+++ b/linux-user/hexagon/syscall_nr.h
@@ -317,6 +317,16 @@
 #define TARGET_NR_fsmount 432
 #define TARGET_NR_fspick 433
 #define TARGET_NR_pidfd_open 434
-#define TARGET_NR_syscalls 436
+#define TARGET_NR_close_range 436
+#define TARGET_NR_openat2 437
+#define TARGET_NR_pidfd_getfd 438
+#define TARGET_NR_faccessat2 439
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_HEXAGON_SYSCALL_NR_H */
diff --git a/linux-user/nios2/syscall_nr.h b/linux-user/nios2/syscall_nr.h
index e37f40179bf3..11a37b32e8b1 100644
--- a/linux-user/nios2/syscall_nr.h
+++ b/linux-user/nios2/syscall_nr.h
@@ -322,6 +322,12 @@
 #define TARGET_NR_openat2 437
 #define TARGET_NR_pidfd_getfd 438
 #define TARGET_NR_faccessat2 439
-#define TARGET_NR_syscalls 440
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_NIOS2_SYSCALL_NR_H */
diff --git a/linux-user/openrisc/syscall_nr.h b/linux-user/openrisc/syscall_nr.h
index a8fc0295109a..f7faddb54c58 100644
--- a/linux-user/openrisc/syscall_nr.h
+++ b/linux-user/openrisc/syscall_nr.h
@@ -323,6 +323,12 @@
 #define TARGET_NR_openat2 437
 #define TARGET_NR_pidfd_getfd 438
 #define TARGET_NR_faccessat2 439
-#define TARGET_NR_syscalls 440
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_OPENRISC_SYSCALL_NR_H */
diff --git a/linux-user/riscv/syscall32_nr.h b/linux-user/riscv/syscall32_nr.h
index 079b804daef5..1327d7dffab9 100644
--- a/linux-user/riscv/syscall32_nr.h
+++ b/linux-user/riscv/syscall32_nr.h
@@ -296,6 +296,12 @@
 #define TARGET_NR_openat2 437
 #define TARGET_NR_pidfd_getfd 438
 #define TARGET_NR_faccessat2 439
-#define TARGET_NR_syscalls 440
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_RISCV_SYSCALL32_NR_H */
diff --git a/linux-user/riscv/syscall64_nr.h b/linux-user/riscv/syscall64_nr.h
index d54224ccec64..6659751933d5 100644
--- a/linux-user/riscv/syscall64_nr.h
+++ b/linux-user/riscv/syscall64_nr.h
@@ -302,6 +302,12 @@
 #define TARGET_NR_openat2 437
 #define TARGET_NR_pidfd_getfd 438
 #define TARGET_NR_faccessat2 439
-#define TARGET_NR_syscalls 440
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+#define TARGET_NR_landlock_create_ruleset 444
+#define TARGET_NR_landlock_add_rule 445
+#define TARGET_NR_landlock_restrict_self 446
+#define TARGET_NR_syscalls 447
 
 #endif /* LINUX_USER_RISCV_SYSCALL64_NR_H */
-- 
2.31.1


