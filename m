Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97FA3C71EF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:16:49 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JDM-0004O9-Tb
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifo-0000Rp-Pm
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:08 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:58153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifl-00067p-D6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:08 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N64JK-1l5qQN2NNQ-016MwD; Tue, 13
 Jul 2021 15:41:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] linux-user: Extract target errno to 'target_errno_defs.h'
Date: Tue, 13 Jul 2021 15:41:43 +0200
Message-Id: <20210713134152.288423-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MCaCVf4XjPnD8MnF6nCmbDxmvjtEI5ytFeijjSOxFSPtKWLq0iI
 hYDLrKBf62Dyn3Rhy3XxW2cDvdyh5Dt9OILAabRFHrYEtg+scUifqE/tXOLAP75q4IkUoG7
 JvI2NQzD3wF0NTneFdhIk0vyK1WiPPt+5vbiEHikmzoSEcKoHBM0UPf5gc3tJ1WmJ3t24sH
 6nSv1iFYkR09EP9wWJeuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cRtvW8YfMBI=:ez/wB4Q/1haF+dBMujRGD0
 Ct7J1Tr5PMXxTp8VWDlOt+7SWb8HO4zCAD/V5mDfDe8SYWdk4RR/Ah7GGZpLzdbxQ4BnIBxOP
 3jCDOtkajjpkv1fAQ+CPRPMk0l0AuQy2jEBDVn0Af1k806ucnz9Vtki96LFhC2yqK4e2+zOp9
 AsIpvtDH8W8Nymzl8FDZnoZ5wN/Uyk2kI2TaTyCX6P8NN+2wmRmmGlx6dgmA8VjWiP06c4TYg
 iAj8gQ5ypEWK+dUnWPyMV+R+bSPhK+vtYbHy+A/j61Wr3W6v79vE8dfP3NpfSP78TbfI/e9en
 KEnR4EqqYRggy352/xyJXS1P/f47pxEvfIbiPKFe+a0YbLmH2HEcHfG8Qc8G1MbUmJU8+GRRQ
 Ach6vcAc1j+mtKVyRB3FEOZ1pFY53caAJDHXQ87vkVmQJUsN5ZHug8HymSlb14xVTDg9YokNX
 Fd7Kj86oXvXMglsVqBgHVLUK0KwuqAaDrTvQdCwqCUoYFgXXBriSYoJPGj2lDmJ63Szj9MUjc
 K2RmWRGTecf6xcNicAp/FexPt02862uwgLLTWgECcQC0QdlYAnsOOaa2gh5yjP1OyWyFE9Yhz
 o/+fyfmL9SLIZHqf986LsmJNtQmqMmKPFEuMy8vj96XI2AxGKXhm7pT+85C4E5kAcLZnpWlFi
 tpNg6y1Z6iFrxfiIfAbb4igdgciKn+1L4qRhth2Lknvbdu3p1ipQNkaBgPe7hKcSUDBoXtO5f
 iLV8JrPxuVDdeE7tx6JiNX26/aG9HSTw3e7dORx6KxwaPbIunL2QuRMGwo1dpLHxJUKytYHtA
 hE7pV102kMx34RD2vr/4qgjqEZUrcqanXMfmIpweQtmXx3CV1EB1AjX6vFEqpKibBk7E4ua
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to access the target errno indepently of the rest of the
linux-user code. Move the header containing the generic errno
definitions ('errno_defs.h') to 'generic/target_errno_defs.h',
create a new 'target_errno_defs.h' in each target which itself
includes 'generic/target_errno_defs.h'.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210708170550.1846343-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/target_errno_defs.h                   | 7 +++++++
 linux-user/alpha/target_errno_defs.h                     | 6 ++++++
 linux-user/arm/target_errno_defs.h                       | 7 +++++++
 linux-user/cris/target_errno_defs.h                      | 7 +++++++
 linux-user/{errno_defs.h => generic/target_errno_defs.h} | 4 ++--
 linux-user/hexagon/target_errno_defs.h                   | 7 +++++++
 linux-user/hppa/target_errno_defs.h                      | 6 ++++++
 linux-user/i386/target_errno_defs.h                      | 7 +++++++
 linux-user/m68k/target_errno_defs.h                      | 7 +++++++
 linux-user/microblaze/target_errno_defs.h                | 7 +++++++
 linux-user/mips/target_errno_defs.h                      | 6 ++++++
 linux-user/mips64/target_errno_defs.h                    | 6 ++++++
 linux-user/nios2/target_errno_defs.h                     | 7 +++++++
 linux-user/openrisc/target_errno_defs.h                  | 7 +++++++
 linux-user/ppc/target_errno_defs.h                       | 7 +++++++
 linux-user/riscv/target_errno_defs.h                     | 7 +++++++
 linux-user/s390x/target_errno_defs.h                     | 7 +++++++
 linux-user/safe-syscall.S                                | 2 +-
 linux-user/sh4/target_errno_defs.h                       | 7 +++++++
 linux-user/sparc/target_errno_defs.h                     | 7 ++++++-
 linux-user/sparc/target_syscall.h                        | 2 --
 linux-user/syscall_defs.h                                | 2 +-
 linux-user/x86_64/target_errno_defs.h                    | 7 +++++++
 linux-user/xtensa/target_errno_defs.h                    | 7 +++++++
 24 files changed, 139 insertions(+), 7 deletions(-)
 create mode 100644 linux-user/aarch64/target_errno_defs.h
 create mode 100644 linux-user/alpha/target_errno_defs.h
 create mode 100644 linux-user/arm/target_errno_defs.h
 create mode 100644 linux-user/cris/target_errno_defs.h
 rename linux-user/{errno_defs.h => generic/target_errno_defs.h} (99%)
 create mode 100644 linux-user/hexagon/target_errno_defs.h
 create mode 100644 linux-user/hppa/target_errno_defs.h
 create mode 100644 linux-user/i386/target_errno_defs.h
 create mode 100644 linux-user/m68k/target_errno_defs.h
 create mode 100644 linux-user/microblaze/target_errno_defs.h
 create mode 100644 linux-user/mips/target_errno_defs.h
 create mode 100644 linux-user/mips64/target_errno_defs.h
 create mode 100644 linux-user/nios2/target_errno_defs.h
 create mode 100644 linux-user/openrisc/target_errno_defs.h
 create mode 100644 linux-user/ppc/target_errno_defs.h
 create mode 100644 linux-user/riscv/target_errno_defs.h
 create mode 100644 linux-user/s390x/target_errno_defs.h
 create mode 100644 linux-user/sh4/target_errno_defs.h
 create mode 100644 linux-user/x86_64/target_errno_defs.h
 create mode 100644 linux-user/xtensa/target_errno_defs.h

diff --git a/linux-user/aarch64/target_errno_defs.h b/linux-user/aarch64/target_errno_defs.h
new file mode 100644
index 000000000000..461b54772846
--- /dev/null
+++ b/linux-user/aarch64/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef AARCH64_TARGET_ERRNO_DEFS_H
+#define AARCH64_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
new file mode 100644
index 000000000000..54770108c02a
--- /dev/null
+++ b/linux-user/alpha/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef ALPHA_TARGET_ERRNO_DEFS_H
+#define ALPHA_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/arm/target_errno_defs.h b/linux-user/arm/target_errno_defs.h
new file mode 100644
index 000000000000..fd8437323843
--- /dev/null
+++ b/linux-user/arm/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef ARM_TARGET_ERRNO_DEFS_H
+#define ARM_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/cris/target_errno_defs.h b/linux-user/cris/target_errno_defs.h
new file mode 100644
index 000000000000..1cf43b17a500
--- /dev/null
+++ b/linux-user/cris/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef CRIS_TARGET_ERRNO_DEFS_H
+#define CRIS_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/errno_defs.h b/linux-user/generic/target_errno_defs.h
similarity index 99%
rename from linux-user/errno_defs.h
rename to linux-user/generic/target_errno_defs.h
index aaf5208d62d6..17d85e0b61b6 100644
--- a/linux-user/errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -5,8 +5,8 @@
  * Taken from asm-generic/errno-base.h and asm-generic/errno.h
  */
 
-#ifndef LINUX_USER_ERRNO_DEFS_H
-#define LINUX_USER_ERRNO_DEFS_H
+#ifndef GENERIC_TARGET_ERRNO_DEFS_H
+#define GENERIC_TARGET_ERRNO_DEFS_H
 
 #define TARGET_EPERM            1      /* Operation not permitted */
 #define TARGET_ENOENT           2      /* No such file or directory */
diff --git a/linux-user/hexagon/target_errno_defs.h b/linux-user/hexagon/target_errno_defs.h
new file mode 100644
index 000000000000..da033a9a9e40
--- /dev/null
+++ b/linux-user/hexagon/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef HEXAGON_TARGET_ERRNO_DEFS_H
+#define HEXAGON_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
new file mode 100644
index 000000000000..d6e9676ce254
--- /dev/null
+++ b/linux-user/hppa/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef HPPA_TARGET_ERRNO_DEFS_H
+#define HPPA_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/i386/target_errno_defs.h b/linux-user/i386/target_errno_defs.h
new file mode 100644
index 000000000000..459b2189e2bd
--- /dev/null
+++ b/linux-user/i386/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef I386_TARGET_ERRNO_DEFS_H
+#define I386_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/m68k/target_errno_defs.h b/linux-user/m68k/target_errno_defs.h
new file mode 100644
index 000000000000..96485a75431d
--- /dev/null
+++ b/linux-user/m68k/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef M68K_TARGET_ERRNO_DEFS_H
+#define M68K_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/microblaze/target_errno_defs.h b/linux-user/microblaze/target_errno_defs.h
new file mode 100644
index 000000000000..91a0bbf9dc05
--- /dev/null
+++ b/linux-user/microblaze/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef MICROBLAZE_TARGET_ERRNO_DEFS_H
+#define MICROBLAZE_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
new file mode 100644
index 000000000000..daef95ea7030
--- /dev/null
+++ b/linux-user/mips/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MIPS_TARGET_ERRNO_DEFS_H
+#define MIPS_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/mips64/target_errno_defs.h b/linux-user/mips64/target_errno_defs.h
new file mode 100644
index 000000000000..82b0a704f62c
--- /dev/null
+++ b/linux-user/mips64/target_errno_defs.h
@@ -0,0 +1,6 @@
+#ifndef MIPS64_TARGET_ERRNO_DEFS_H
+#define MIPS64_TARGET_ERRNO_DEFS_H
+
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/nios2/target_errno_defs.h b/linux-user/nios2/target_errno_defs.h
new file mode 100644
index 000000000000..28120013e24b
--- /dev/null
+++ b/linux-user/nios2/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef NIOS2_TARGET_ERRNO_DEFS_H
+#define NIOS2_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/openrisc/target_errno_defs.h b/linux-user/openrisc/target_errno_defs.h
new file mode 100644
index 000000000000..cdf159746b18
--- /dev/null
+++ b/linux-user/openrisc/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef OR1K_TARGET_ERRNO_DEFS_H
+#define OR1K_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/ppc/target_errno_defs.h b/linux-user/ppc/target_errno_defs.h
new file mode 100644
index 000000000000..a24a973342fc
--- /dev/null
+++ b/linux-user/ppc/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef PPC_TARGET_ERRNO_DEFS_H
+#define PPC_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/riscv/target_errno_defs.h b/linux-user/riscv/target_errno_defs.h
new file mode 100644
index 000000000000..5e377a2fce82
--- /dev/null
+++ b/linux-user/riscv/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef RISCV_TARGET_ERRNO_DEFS_H
+#define RISCV_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/s390x/target_errno_defs.h b/linux-user/s390x/target_errno_defs.h
new file mode 100644
index 000000000000..f4c09700b5ee
--- /dev/null
+++ b/linux-user/s390x/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef S390X_TARGET_ERRNO_DEFS_H
+#define S390X_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index b5df6254aeab..42ea7c40ba36 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -11,7 +11,7 @@
  */
 
 #include "hostdep.h"
-#include "errno_defs.h"
+#include "target_errno_defs.h"
 
 /* We have the correct host directory on our include path
  * so that this will pull in the right fragment for the architecture.
diff --git a/linux-user/sh4/target_errno_defs.h b/linux-user/sh4/target_errno_defs.h
new file mode 100644
index 000000000000..e90adb54ab2c
--- /dev/null
+++ b/linux-user/sh4/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef SH4_TARGET_ERRNO_DEFS_H
+#define SH4_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/sparc/target_errno_defs.h b/linux-user/sparc/target_errno_defs.h
index e00081098674..de4f1ffb0ac0 100644
--- a/linux-user/sparc/target_errno_defs.h
+++ b/linux-user/sparc/target_errno_defs.h
@@ -1,7 +1,12 @@
 #ifndef SPARC_TARGET_ERRNO_DEFS_H
 #define SPARC_TARGET_ERRNO_DEFS_H
 
-/* Target errno definitions taken from asm-sparc/errno.h */
+#include "../generic/target_errno_defs.h"
+
+/*
+ * Generic target errno overridden with definitions taken
+ * from asm-sparc/errno.h
+ */
 #undef TARGET_EWOULDBLOCK
 #define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef TARGET_EINPROGRESS
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index dad501d008cd..087b39d39c4c 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -1,8 +1,6 @@
 #ifndef SPARC_TARGET_SYSCALL_H
 #define SPARC_TARGET_SYSCALL_H
 
-#include "target_errno_defs.h"
-
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
     abi_ulong u_regs[16];
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 18b031a2f6a8..a5ce487dcc38 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2751,7 +2751,7 @@ struct target_drm_i915_getparam {
 
 #include "socket.h"
 
-#include "errno_defs.h"
+#include "target_errno_defs.h"
 
 #define FUTEX_WAIT              0
 #define FUTEX_WAKE              1
diff --git a/linux-user/x86_64/target_errno_defs.h b/linux-user/x86_64/target_errno_defs.h
new file mode 100644
index 000000000000..cb2a0f6e0be4
--- /dev/null
+++ b/linux-user/x86_64/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef X86_64_TARGET_ERRNO_DEFS_H
+#define X86_64_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/xtensa/target_errno_defs.h b/linux-user/xtensa/target_errno_defs.h
new file mode 100644
index 000000000000..66fade2d0c86
--- /dev/null
+++ b/linux-user/xtensa/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef XTENSA_TARGET_ERRNO_DEFS_H
+#define XTENSA_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
-- 
2.31.1


