Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4640DDF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:25:07 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtG6-00059D-Qr
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4L-00030T-QY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:40985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4I-0004GH-ML
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:57 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJEpp-1mAaIa47Q3-00KfbI; Thu, 16
 Sep 2021 17:12:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] linux-user: Don't include gdbstub.h in qemu.h
Date: Thu, 16 Sep 2021 17:12:35 +0200
Message-Id: <20210916151237.1188301-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k9SQK62dp9bppCOtgR0jfzRyhPojCs7c9R3310/PyqJk6F0QaMZ
 bFzFAgEahZqEns+gkn5Y+cZVxUgeveV5AsmX7sORn+Yn3+gucbEMo9yl2zqtWpQ8L5ATKTo
 f4o55ZmXHCvOo0PxvyWnTFIucoHDJRg5bznHK2OSPvwZiW/VEj5Cxp0NVLKEAWBe8Gtxu0h
 +vQGu5HSdnsaKzJonBxmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z1wVyVC1350=:CLxW+wuigxGv2tLULeAsJs
 nMEYU05IZN6opAzxrgjF6S2K4ECq6qKIAeOTD+QuCssvD3GhaZzc74gvn+BM6sBJySPm5mYH+
 ZHZuIA+bs1MyuYqAAA2xnpwEmHcAfvv/WNBZqsTEYn6/Je36htDwlqBCEt1iAaoUOO/D53/du
 KKmqvSG+M7q2PKkDJYt/2+FLNhxqc9NM4YQbrx37qShERqg9RcCDsI45OfV+jE2FUBvh5Vj3f
 HLFGLaRtYEqhcbOMeytR+KbmOrzJM5tXGVyNrQZ7iODPwJad5xzW0WTbSlpAxyu2+q2+otxd6
 IXdPTem9MXjeLCgi6JEX7ryjRJ2UMvxCod5kFh9k2luOdd1wCCjJ9OZFDUXXg9nUuZqZoViCB
 SqofC7bynK6gHCLDrHriihJwTMYNSE4ntCDWNdnbLb8F5V7Y1baNgC6HGP61kibpgO3vPV9Xc
 FpAwlz83rkejevgh6CliczyXKKA5zLFgmgCH3V6u33a89JtRHhlG2T+ExgcGf7RbW1ThUy1Dx
 KxWh+pHQHZ53o5Gf8SE5g80hF62TYYQfb17zlVICTtOb6Q3U+0jD5fDqcM/xwTC2iDYzGxLsk
 W+P9kRoH3eJOYiEY3Q3MvUUcCiwJi/+z27sqICVxd/hRRyL2OQrE60NpuGpouPooZB6i8bXYI
 RwoapO5NACuxw2c/4v9j4v10WEGrxAkaTNHiTq4cReyIQSU/mPX3QIWj6tnpgf+dRIPtQXCS3
 jiRLv9FwWAk0+uFwci9LEWV2vgAs+a2wH67Ohg==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Currently the linux-user qemu.h pulls in gdbstub.h. There's no real reason
why it should do this; include it directly from the C files which require
it, and drop the include line in qemu.h.

(Note that several of the C files previously relying on this indirect
include were going out of their way to only include gdbstub.h conditionally
on not CONFIG_USER_ONLY!)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-9-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 gdbstub.c                     | 2 +-
 linux-user/exit.c             | 1 +
 linux-user/main.c             | 1 +
 linux-user/qemu.h             | 1 -
 linux-user/signal.c           | 2 ++
 semihosting/arm-compat-semi.c | 2 +-
 target/m68k/m68k-semi.c       | 2 +-
 target/nios2/nios2-semi.c     | 2 +-
 8 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 5d8e6ae3cd9b..36b85aa50e24 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -31,13 +31,13 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "trace/trace-root.h"
+#include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "exec/gdbstub.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 68a3a6f9df01..fa6ef0b9b44c 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "exec/gdbstub.h"
 #include "qemu.h"
 #include "user-internals.h"
 #ifdef CONFIG_GPROF
diff --git a/linux-user/main.c b/linux-user/main.c
index 9edc0b222076..5ce17e423db1 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -40,6 +40,7 @@
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 92290a55c0de..fda90fc28d68 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -11,7 +11,6 @@
 
 #include "syscall_defs.h"
 #include "target_syscall.h"
-#include "exec/gdbstub.h"
 
 /*
  * This is the size of the host kernel's sigset_t, needed where we make
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 6af66123d0f7..f8346f5ec5fd 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -18,6 +18,8 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
+#include "exec/gdbstub.h"
+
 #include <sys/ucontext.h>
 #include <sys/resource.h>
 
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcfa6..01badea99c81 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -37,12 +37,12 @@
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
 #include "qemu/timer.h"
+#include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
 #define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/gdbstub.h"
 #include "qemu/cutils.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index d919245e4f85..44ec7e4612c6 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -20,11 +20,11 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include "exec/gdbstub.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/gdbstub.h"
 #include "exec/softmmu-semi.h"
 #include "hw/boards.h"
 #endif
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index e508b2fafceb..fe5598bae4d7 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -24,11 +24,11 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include "exec/gdbstub.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
 #include "qemu-common.h"
-#include "exec/gdbstub.h"
 #include "exec/softmmu-semi.h"
 #endif
 #include "qemu/log.h"
-- 
2.31.1


