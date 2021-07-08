Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59CA3C1B52
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:02:03 +0200 (CEST)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1c5q-0002ra-Nw
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2M-0008Vv-GB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:26 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2J-00065o-SC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:26 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYcy3-1lefgr2zAZ-00Vdgy; Thu, 08
 Jul 2021 23:57:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user: update syscall_nr.h to Linux v5.13
Date: Thu,  8 Jul 2021 23:57:54 +0200
Message-Id: <20210708215756.268805-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708215756.268805-1-laurent@vivier.eu>
References: <20210708215756.268805-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5RtnhDiY/iPnLpgE3zOUHt53p6O6MprbTOVvQed0rFPdWYLpEq0
 oCtZZoeUUVZyIhjERVsbNSJhKLA10F4TmJjK7khxAwgTZPYhikW8NBkUkuHU/U17BxR0snm
 P1/VNEZ28MoqAMMitKRJnkS38WRYmCYrH1KXEXTxiSPd3s5EE1xOtAColoVVzEq3m9IyDvi
 36WOK65Tjp1NYbm6oG7KQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d7KdbuV90Yc=:YosdgQ2HkERlvwpHsgYFki
 6AopdWEslqIqCCoAhtVpwwItTjDaYvXHxIsN60valCEejvGfohlEWAe1SBjV0MkZrFiLzHd/0
 oJyCWFKFwUg6zF3PWezoFDOtptqT5+EbpVv1YZaNJBxvqsFde2R8e1Iv1h0oSdWIZTHcUjTvQ
 L8rckrfpcOPt9Xh0VPntwQdY/rkTucWs39gzH3h3qaoaNPcRzFwxMFA3D3tyEnvXEIjT1/LS1
 PGLJUtS2kr0RmXBFMugWedf5o22RLEwmNPQlSBBbqmO9bPdqryHVjWaAtSdNW5yowgQK6d7HL
 pi353o8lKBIaKxmK9gct8ysdV94dInUG1+Birv4gOKlGINs/0JkcWAovuZ2Jgs7TvkA8mI8NR
 P1pISus3eNTDoaE9CZ4i/ZADJ/xMPOYCEKj9F5LjyazDHIcyY81Q+t1JqNArBBFpyrRGlxhRR
 65SJY8VynEKLJ86hpKuFb4DLE0KDmKnfABGYSTuRcWUAKKGsF6L4A3n7nM4mLt3Df0WNJxKjs
 A5gmJxGA7bvf8fGbI+CTMYMZsKSdIzF6g4NaM4qZXJcpicKiB9oxuL6kfWlllYbAEfH5f9+IG
 PAc//irEINkZez+/kz+ZFprbSj8exofg3NnaBpHPYiUo6jLVdJnvI7I2CuSA5qtktHo3UbRd5
 Ka9hz35mCOEn7HMWeYInA1xAD0i8iwEN/QhRH2jE30018TbHKNie2Arqidc5M7PzZeL0IM4Ak
 kEQK9SsCoBe+qm7QoF2GMVnOJLvtvbPX8375ooW4IX5M/rxtjaeb2KvY+ZVBVAcw/mGAbvRUj
 /oO765upiKlIVcWl/5lpbgsdYg9djvYJcxxgxPJr1KH7ZkOPVgM2tNbV8SMUGxFz/pz/gaS
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Automatically generated using scripts/gensyscalls.sh

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


