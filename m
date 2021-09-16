Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26A740DDCA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:18:01 +0200 (CEST)
Received: from localhost ([::1]:35574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt9E-00087C-SB
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4E-0002pI-11
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4A-0004AC-1P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:49 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N9M5y-1mwrkM3GNw-015Flj; Thu, 16
 Sep 2021 17:12:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] linux-user: Split linux-user internals out of qemu.h
Date: Thu, 16 Sep 2021 17:12:34 +0200
Message-Id: <20210916151237.1188301-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V4s7CQEhUJO/NWf7sJzAr5+3imx5G8IIA1hKL4sAauocAzwi5KD
 HvyqrYdZk+9jcFp5kqxM8P3Mn8CRkm954lOtY2ngnX94YsAnEWi5W4joYLtjSaCWwjpJfeG
 ekeGpNuBgMtFzlGZkH+9fwtZHRLjNAiZPlBTDX/bT6SoTil714M6FXD8U48ChX6VkpwAwUj
 ndWHR+f+NViT30gUkpUXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BybJqHsY1JA=:YfOJLWb1yoBQttgpjFrWU4
 ymo8WOElWqeM0kMwFYzSS4WMI8bnnF802PSKi2nfHS3oPOUTbpl/xCZevNBjxEPPU/rRIYPZ1
 J8W3N9Abrt/ZO4cX5FKRqkxtoXOna0mezhcVpt2yHGa1lt2G9Gic742VGtMBbneSH6LcyKEZw
 oqRQN4XF9Sn0sHJNKGuQS5w7e3Ph5jP2jXSyIklYUTQfJo+u0kQerXdVxubPSqPLpSxIf634V
 E3PCJQvL0ooXYbBMIG6tRbUr7Xx72Ou4GDdHjhwvI2QeV2Rl8rUHCQSLLHwwE0LASwaJdtASl
 2xeKEDNzH1R8I/NaMdP4q5JXeud2LlXPg2RUc/1n+l5YQZkudxQe9HtIXZFMbQQI/t5ZsIia4
 NHRPa9ww4LzPlVmNoymzD5jfz8ZMnjmTEv9lCgWCoupaUPxmrmuSlaXMwQY+AbprLV+d2OC08
 00trCzSPVxybmRncaEzn1hPFxwudgZ59cpMYaliZkF3w1486mvzd5LzLbUNnElMZ+eFrM+kgF
 kPWSZ7bmQ8IVGVyDfFekphrSzPyeBgMe5wxJJa2yC7vJ+y8v1VoDAHA6rPMAiPqktVKEZNFua
 CyfY8GJadOJqHMfLHGh0FoX5KtZFsSi2ujkNY2irTsBvCkC9Dl3wMI4s9jzmdLBsgGHZxszHQ
 axoqPJ7hbY9d5zZzhsaMODItL/7YAnyVovE23Abyy/Pa1y7pnxcVU2afL+4VWf7A+GhM9qiln
 Uu6xb43zH+z08IxvbnYf3Z1ye8qAoSSrrbmD6Q==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

qemu.h is included in various non-linux-user files (which
mostly want the TaskState struct and the functions for
doing usermode access to guest addresses like lock_user(),
unlock_user(), get_user*(), etc).

Split out the parts that are only used in linux-user itself
into a new user-internals.h. This leaves qemu.h with basically
three things:
 * the definition of the TaskState struct
 * the user-access functions and macros
 * do_brk()
all of which are needed by code outside linux-user that
includes qemu.h.

The addition of all the extra #include lines was done with
  sed -i '/include.*qemu\.h/a #include "user-internals.h"' $(git grep -l 'include.*qemu\.h' linux-user)
(and then undoing the change to fpa11.h).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-8-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/cpu_loop.c    |   1 +
 linux-user/aarch64/signal.c      |   1 +
 linux-user/alpha/cpu_loop.c      |   1 +
 linux-user/alpha/signal.c        |   1 +
 linux-user/arm/cpu_loop.c        |   1 +
 linux-user/arm/signal.c          |   1 +
 linux-user/cris/cpu_loop.c       |   1 +
 linux-user/cris/signal.c         |   1 +
 linux-user/elfload.c             |   1 +
 linux-user/exit.c                |   1 +
 linux-user/fd-trans.c            |   1 +
 linux-user/flatload.c            |   1 +
 linux-user/hexagon/cpu_loop.c    |   1 +
 linux-user/hexagon/signal.c      |   1 +
 linux-user/hppa/cpu_loop.c       |   1 +
 linux-user/hppa/signal.c         |   1 +
 linux-user/i386/cpu_loop.c       |   1 +
 linux-user/i386/signal.c         |   1 +
 linux-user/linuxload.c           |   1 +
 linux-user/m68k/cpu_loop.c       |   1 +
 linux-user/m68k/signal.c         |   1 +
 linux-user/main.c                |   1 +
 linux-user/microblaze/cpu_loop.c |   1 +
 linux-user/microblaze/signal.c   |   1 +
 linux-user/mips/cpu_loop.c       |   1 +
 linux-user/mips/signal.c         |   1 +
 linux-user/mmap.c                |   1 +
 linux-user/nios2/cpu_loop.c      |   1 +
 linux-user/nios2/signal.c        |   1 +
 linux-user/openrisc/cpu_loop.c   |   1 +
 linux-user/openrisc/signal.c     |   1 +
 linux-user/ppc/cpu_loop.c        |   1 +
 linux-user/ppc/signal.c          |   1 +
 linux-user/qemu.h                | 164 +--------------------------
 linux-user/riscv/cpu_loop.c      |   1 +
 linux-user/riscv/signal.c        |   1 +
 linux-user/s390x/cpu_loop.c      |   1 +
 linux-user/s390x/signal.c        |   1 +
 linux-user/semihost.c            |   1 +
 linux-user/sh4/cpu_loop.c        |   1 +
 linux-user/sh4/signal.c          |   1 +
 linux-user/signal.c              |   1 +
 linux-user/sparc/cpu_loop.c      |   1 +
 linux-user/sparc/signal.c        |   1 +
 linux-user/strace.c              |   1 +
 linux-user/syscall.c             |   1 +
 linux-user/uaccess.c             |   1 +
 linux-user/uname.c               |   1 +
 linux-user/user-internals.h      | 184 +++++++++++++++++++++++++++++++
 linux-user/vm86.c                |   1 +
 linux-user/xtensa/cpu_loop.c     |   1 +
 linux-user/xtensa/signal.c       |   1 +
 52 files changed, 235 insertions(+), 163 deletions(-)
 create mode 100644 linux-user/user-internals.h

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5cac76f67b09..5425b85659a9 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "qemu/guest-random.h"
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e57..49025648cb4f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 8464047368a3..1b00a81385b7 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 1129ffeea1d8..3a820f616b3f 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 5556d381463b..07032b300610 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 1dfcfd2d57bf..ed144f9455d2 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 8c9fc3127ec3..b9085619c4c2 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 1e02194377b5..2c39bdf7277f 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c291f3cee09f..5f9e2141ad1e 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "disas/disas.h"
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 527e29cbc198..68a3a6f9df01 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #ifdef CONFIG_GPROF
 #include <sys/gmon.h>
 #endif
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 48203c1af9d6..69410899590c 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -27,6 +27,7 @@
 #include <linux/if_bridge.h>
 #endif
 #include "qemu.h"
+#include "user-internals.h"
 #include "fd-trans.h"
 #include "signal-common.h"
 
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 99550061db8d..e4c2f89a2267 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -36,6 +36,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "flat.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 348d2dc34130..bee2a9e4ea93 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "internal.h"
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 85eab5e94382..c7f0bf6b9283 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index c3661994a570..81607a9b2714 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 0e266f472d5a..c2fbc26ebb6b 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fcc410a426ae..f6a1cc632b1d 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "user-mmap.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 841cd1965100..3b4b55fc0a24 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 27be7090d8f1..2ed5fc45ed8c 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "loader.h"
 
 #define NGROUPS 32
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 3a330401bf2d..ebf32be78f83 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index d06230655e98..4f8eb6f727e4 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/main.c b/linux-user/main.c
index a76aec733689..9edc0b222076 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -30,6 +30,7 @@
 
 #include "qapi/error.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/config-file.h"
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 0d2c8f8dea8a..52222eb93fbf 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 4c483bd8c606..b822679d1805 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 7dfaa0cb1e11..cb03fb066b9b 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "elf.h"
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81ae..d174b3453cc0 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4b182444bbdc..c125031b9046 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/log.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "user-mmap.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 68f95d7ad7b2..34290fb3b51c 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index cc3872f11da2..a77e8a40f468 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6c67859887b..f6360db47c28 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 5c5640a28487..ca2532bf500f 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index ace431238c27..840b23736bfe 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a375a..e4d0dfa3bf75 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index a82a46236e64..92290a55c0de 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -1,7 +1,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "hostdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
@@ -10,7 +9,6 @@
 
 #include "exec/user/abitypes.h"
 
-#include "exec/user/thunk.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
@@ -166,93 +164,9 @@ typedef struct TaskState {
     struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
-extern char *exec_path;
-void init_task_state(TaskState *ts);
-void task_settid(TaskState *);
-void stop_all_tasks(void);
-extern const char *qemu_uname_release;
-extern unsigned long mmap_min_addr;
-
-typedef struct IOCTLEntry IOCTLEntry;
-
-typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
-                             int fd, int cmd, abi_long arg);
-
-struct IOCTLEntry {
-    int target_cmd;
-    unsigned int host_cmd;
-    const char *name;
-    int access;
-    do_ioctl_fn *do_ioctl;
-    const argtype arg_type[5];
-};
-
-extern IOCTLEntry ioctl_entries[];
-
-#define IOC_R 0x0001
-#define IOC_W 0x0002
-#define IOC_RW (IOC_R | IOC_W)
-
-/*
- * Returns true if the image uses the FDPIC ABI. If this is the case,
- * we have to provide some information (loadmap, pt_dynamic_info) such
- * that the program can be relocated adequately. This is also useful
- * when handling signals.
- */
-int info_is_fdpic(struct image_info *info);
-
-void target_set_brk(abi_ulong new_brk);
-abi_long do_brk(abi_ulong new_brk);
-void syscall_init(void);
-abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
-                    abi_long arg2, abi_long arg3, abi_long arg4,
-                    abi_long arg5, abi_long arg6, abi_long arg7,
-                    abi_long arg8);
-extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
-const char *target_strerror(int err);
-int get_osversion(void);
-void init_qemu_uname_release(void);
-void fork_start(void);
-void fork_end(int child);
-
-/**
- * probe_guest_base:
- * @image_name: the executable being loaded
- * @loaddr: the lowest fixed address in the executable
- * @hiaddr: the highest fixed address in the executable
- *
- * Creates the initial guest address space in the host memory space.
- *
- * If @loaddr == 0, then no address in the executable is fixed,
- * i.e. it is fully relocatable.  In that case @hiaddr is the size
- * of the executable.
- *
- * This function will not return if a valid value for guest_base
- * cannot be chosen.  On return, the executable loader can expect
- *
- *    target_mmap(loaddr, hiaddr - loaddr, ...)
- *
- * to succeed.
- */
-void probe_guest_base(const char *image_name,
-                      abi_ulong loaddr, abi_ulong hiaddr);
-
 #include "qemu/log.h"
 
-/* syscall.c */
-int host_to_target_waitstatus(int status);
-
-#ifdef TARGET_I386
-/* vm86.c */
-void save_v86_state(CPUX86State *env);
-void handle_vm86_trap(CPUX86State *env, int trapno);
-void handle_vm86_fault(CPUX86State *env);
-int do_vm86(CPUX86State *env, long subfunction, abi_ulong v86_addr);
-#elif defined(TARGET_SPARC64)
-void sparc64_set_context(CPUSPARCState *env);
-void sparc64_get_context(CPUSPARCState *env);
-#endif
+abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
 
@@ -437,80 +351,4 @@ void *lock_user_string(abi_ulong guest_addr);
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
 #include <pthread.h>
-
-static inline int is_error(abi_long ret)
-{
-    return (abi_ulong)ret >= (abi_ulong)(-4096);
-}
-
-#if TARGET_ABI_BITS == 32
-static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
-{
-#ifdef TARGET_WORDS_BIGENDIAN
-    return ((uint64_t)word0 << 32) | word1;
-#else
-    return ((uint64_t)word1 << 32) | word0;
-#endif
-}
-#else /* TARGET_ABI_BITS == 32 */
-static inline uint64_t target_offset64(uint64_t word0, uint64_t word1)
-{
-    return word0;
-}
-#endif /* TARGET_ABI_BITS != 32 */
-
-void print_termios(void *arg);
-
-/* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
-#ifdef TARGET_ARM
-static inline int regpairs_aligned(void *cpu_env, int num)
-{
-    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
-}
-#elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
-/*
- * SysV AVI for PPC32 expects 64bit parameters to be passed on odd/even pairs
- * of registers which translates to the same as ARM/MIPS, because we start with
- * r3 as arg1
- */
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_SH4)
-/* SH4 doesn't align register pairs, except for p{read,write}64 */
-static inline int regpairs_aligned(void *cpu_env, int num)
-{
-    switch (num) {
-    case TARGET_NR_pread64:
-    case TARGET_NR_pwrite64:
-        return 1;
-
-    default:
-        return 0;
-    }
-}
-#elif defined(TARGET_XTENSA)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#elif defined(TARGET_HEXAGON)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
-#else
-static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
-#endif
-
-/**
- * preexit_cleanup: housekeeping before the guest exits
- *
- * env: the CPU state
- * code: the exit code
- */
-void preexit_cleanup(CPUArchState *env, int code);
-
-/*
- * Include target-specific struct and function definitions;
- * they may need access to the target-independent structures
- * above, so include them last.
- */
-#include "target_cpu.h"
-#include "target_structs.h"
-
 #endif /* QEMU_H */
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 47978c4e3543..9859a366e420 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "elf.h"
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9af6..f7f33bc90aed 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index ae70f630532d..69b69981f67d 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bf8a8fbfe9fc..80f34086d7b5 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index f53ab526fbab..17f074ac5652 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "semihosting/console.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include <termios.h>
 
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 06e4a4d00751..65b8972e3c96 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index 0451e65806a1..d70d744befc2 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 0fa15f088b01..6af66123d0f7 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,6 +22,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "loader.h"
 #include "trace.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index b2c061119430..ad29b4eb6a31 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570e8..3bc023d281a7 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index ee3429fae82a..2cdbf030ba44 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -15,6 +15,7 @@
 #include <linux/netlink.h>
 #include <sched.h>
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 
 struct syscallname {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9873830b465b..e4ffdec0d83c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 #include "strace.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c6..425cbf677f76 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -3,6 +3,7 @@
 #include "qemu/cutils.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 
 void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
 {
diff --git a/linux-user/uname.c b/linux-user/uname.c
index a09ffe1ea7bd..1d82608c100f 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 //#include "qemu-common.h"
 #include "uname.h"
 
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
new file mode 100644
index 000000000000..1729a8b62e18
--- /dev/null
+++ b/linux-user/user-internals.h
@@ -0,0 +1,184 @@
+/*
+ * user-internals.h: prototypes etc internal to the linux-user implementation
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef LINUX_USER_USER_INTERNALS_H
+#define LINUX_USER_USER_INTERNALS_H
+
+#include "hostdep.h"
+#include "exec/user/thunk.h"
+
+extern char *exec_path;
+void init_task_state(TaskState *ts);
+void task_settid(TaskState *);
+void stop_all_tasks(void);
+extern const char *qemu_uname_release;
+extern unsigned long mmap_min_addr;
+
+typedef struct IOCTLEntry IOCTLEntry;
+
+typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
+                             int fd, int cmd, abi_long arg);
+
+struct IOCTLEntry {
+    int target_cmd;
+    unsigned int host_cmd;
+    const char *name;
+    int access;
+    do_ioctl_fn *do_ioctl;
+    const argtype arg_type[5];
+};
+
+extern IOCTLEntry ioctl_entries[];
+
+#define IOC_R 0x0001
+#define IOC_W 0x0002
+#define IOC_RW (IOC_R | IOC_W)
+
+/*
+ * Returns true if the image uses the FDPIC ABI. If this is the case,
+ * we have to provide some information (loadmap, pt_dynamic_info) such
+ * that the program can be relocated adequately. This is also useful
+ * when handling signals.
+ */
+int info_is_fdpic(struct image_info *info);
+
+void target_set_brk(abi_ulong new_brk);
+void syscall_init(void);
+abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
+                    abi_long arg2, abi_long arg3, abi_long arg4,
+                    abi_long arg5, abi_long arg6, abi_long arg7,
+                    abi_long arg8);
+extern __thread CPUState *thread_cpu;
+void cpu_loop(CPUArchState *env);
+const char *target_strerror(int err);
+int get_osversion(void);
+void init_qemu_uname_release(void);
+void fork_start(void);
+void fork_end(int child);
+
+/**
+ * probe_guest_base:
+ * @image_name: the executable being loaded
+ * @loaddr: the lowest fixed address in the executable
+ * @hiaddr: the highest fixed address in the executable
+ *
+ * Creates the initial guest address space in the host memory space.
+ *
+ * If @loaddr == 0, then no address in the executable is fixed,
+ * i.e. it is fully relocatable.  In that case @hiaddr is the size
+ * of the executable.
+ *
+ * This function will not return if a valid value for guest_base
+ * cannot be chosen.  On return, the executable loader can expect
+ *
+ *    target_mmap(loaddr, hiaddr - loaddr, ...)
+ *
+ * to succeed.
+ */
+void probe_guest_base(const char *image_name,
+                      abi_ulong loaddr, abi_ulong hiaddr);
+
+/* syscall.c */
+int host_to_target_waitstatus(int status);
+
+#ifdef TARGET_I386
+/* vm86.c */
+void save_v86_state(CPUX86State *env);
+void handle_vm86_trap(CPUX86State *env, int trapno);
+void handle_vm86_fault(CPUX86State *env);
+int do_vm86(CPUX86State *env, long subfunction, abi_ulong v86_addr);
+#elif defined(TARGET_SPARC64)
+void sparc64_set_context(CPUSPARCState *env);
+void sparc64_get_context(CPUSPARCState *env);
+#endif
+
+static inline int is_error(abi_long ret)
+{
+    return (abi_ulong)ret >= (abi_ulong)(-4096);
+}
+
+#if TARGET_ABI_BITS == 32
+static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
+{
+#ifdef TARGET_WORDS_BIGENDIAN
+    return ((uint64_t)word0 << 32) | word1;
+#else
+    return ((uint64_t)word1 << 32) | word0;
+#endif
+}
+#else /* TARGET_ABI_BITS == 32 */
+static inline uint64_t target_offset64(uint64_t word0, uint64_t word1)
+{
+    return word0;
+}
+#endif /* TARGET_ABI_BITS != 32 */
+
+void print_termios(void *arg);
+
+/* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
+#ifdef TARGET_ARM
+static inline int regpairs_aligned(void *cpu_env, int num)
+{
+    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
+}
+#elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
+/*
+ * SysV AVI for PPC32 expects 64bit parameters to be passed on odd/even pairs
+ * of registers which translates to the same as ARM/MIPS, because we start with
+ * r3 as arg1
+ */
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_SH4)
+/* SH4 doesn't align register pairs, except for p{read,write}64 */
+static inline int regpairs_aligned(void *cpu_env, int num)
+{
+    switch (num) {
+    case TARGET_NR_pread64:
+    case TARGET_NR_pwrite64:
+        return 1;
+
+    default:
+        return 0;
+    }
+}
+#elif defined(TARGET_XTENSA)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_HEXAGON)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#else
+static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
+#endif
+
+/**
+ * preexit_cleanup: housekeeping before the guest exits
+ *
+ * env: the CPU state
+ * code: the exit code
+ */
+void preexit_cleanup(CPUArchState *env, int code);
+
+/*
+ * Include target-specific struct and function definitions;
+ * they may need access to the target-independent structures
+ * above, so include them last.
+ */
+#include "target_cpu.h"
+#include "target_structs.h"
+
+#endif
diff --git a/linux-user/vm86.c b/linux-user/vm86.c
index 4412522c4c4e..c2facf3fc2de 100644
--- a/linux-user/vm86.c
+++ b/linux-user/vm86.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "user-internals.h"
 
 //#define DEBUG_VM86
 
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index bb5335e2b6cb..622afbcd345d 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 72771e1294b6..7a3bfb92cadc 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "user-internals.h"
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-- 
2.31.1


