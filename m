Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E640DDDE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:20:50 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtBx-0004wq-6S
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4K-0002vd-5B
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:56 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4H-0004EJ-SU
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:55 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MV5KC-1mIb2k3Njy-00S33x; Thu, 16
 Sep 2021 17:12:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] linux-user: Split loader-related prototypes into loader.h
Date: Thu, 16 Sep 2021 17:12:31 +0200
Message-Id: <20210916151237.1188301-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FlVO+zfmve3sWUPgFq15bZ6FEhk46NEoheDK38zmcHZyxwGAs1v
 OWoVX1uK4evFVrTV9Y75Frx7XWzEF6b9jix6Om52t9KRZXQKo6XtiZzGBiwOiJp4eh21XlV
 npanhI5VscAlQMX1iRgmqTjxPS82A4aZH07wWphRsCypESOHI6RRnmLjdFTMCaAF83SaTak
 fcJKwkeuOxnEJIf7nSPVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rEcHKdi0Hc=:0X+evSegh57zvvRND+BG42
 kfhMpXPHWGEE8G6/heNo4C3xFDg9SWZeb/OH7UBWTQo0yRm2GmCqXPBvhs22nabyOvHoYuZfq
 reP08bBsX87qcmlQkEce2bx3jVJuklSCSSSsTaHw6I7PS69C9A/IQg+Act2C93GkqyfE2y/KB
 jOxFwG4Z46BfguYA9rJPI55JNZFZaL44CDmT01aMMKnT+skz76aCxOmcYHy8iPfBDbNaP16ri
 ppXVOKe3X5fKQ6CMwhi4rwVM8bhF5aaOGxcebhj6FzQ/uxvSci6xDlOcAvd/PCklmFJRAgL6R
 eH5dQpFjpyUTBQ22L7MMRl/pK4bW6XweRLXEsABbwjU74lHPns+Fkc2NJE9QOHexB2pRrDAcL
 yguJIHWLbe2t53oUrbt4GNBV5LiWaXz/zI4iuY1I6A5ZpqosJ2o9Rztiv8wMC0w8XaD3ry28j
 5RblCI7eOAW+5kXo5IlB0pkxiUvqt9a3j7P7qkd19td1w2qgB/aJfgqgbawDyMmTO1CRocPhs
 kdrcTCGUoEnKWe5ohZnR593txaBuA9/Rl/kDHgQeRM3OYlBI6PnoSLJWJlUSmK3w7VZ43TjgM
 D8KlvaTETsEBaeAa7N0JueCCtu1uICKwPSBgHgnxx8rUvAdrgn8FVW6XionxBBjpd/SSlpeX7
 9D5pfwlEuSgTWwUbX0H8WJ+Qw8V+4BJHF347DVNcCulGINy+MNUC0KbOf9Y2KuFboNA+zo59k
 kAA8+kBJW4F9Kzsks0B8dxk2zVYNl3+lQCzfeQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Split guest-binary loader prototypes out into a new header
loader.h which we include only where required.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-5-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c   |  1 +
 linux-user/flatload.c  |  1 +
 linux-user/linuxload.c |  1 +
 linux-user/loader.h    | 59 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/main.c      |  1 +
 linux-user/qemu.h      | 40 ----------------------------
 linux-user/signal.c    |  1 +
 linux-user/syscall.c   |  1 +
 8 files changed, 65 insertions(+), 40 deletions(-)
 create mode 100644 linux-user/loader.h

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01e9a833fbb6..6244fcd05ce4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -6,6 +6,7 @@
 #include <sys/shm.h>
 
 #include "qemu.h"
+#include "loader.h"
 #include "disas/disas.h"
 #include "qemu/bitops.h"
 #include "qemu/path.h"
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 3e5594cf894d..7484a4a35432 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -36,6 +36,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu.h"
+#include "loader.h"
 #include "flat.h"
 #include "target_flat.h"
 
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 9d4eb5e94b9b..27be7090d8f1 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "loader.h"
 
 #define NGROUPS 32
 
diff --git a/linux-user/loader.h b/linux-user/loader.h
new file mode 100644
index 000000000000..f375ee0679b0
--- /dev/null
+++ b/linux-user/loader.h
@@ -0,0 +1,59 @@
+/*
+ * loader.h: prototypes for linux-user guest binary loader
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
+#ifndef LINUX_USER_LOADER_H
+#define LINUX_USER_LOADER_H
+
+/*
+ * Read a good amount of data initially, to hopefully get all the
+ * program headers loaded.
+ */
+#define BPRM_BUF_SIZE  1024
+
+/*
+ * This structure is used to hold the arguments that are
+ * used when loading binaries.
+ */
+struct linux_binprm {
+        char buf[BPRM_BUF_SIZE] __attribute__((aligned));
+        abi_ulong p;
+        int fd;
+        int e_uid, e_gid;
+        int argc, envc;
+        char **argv;
+        char **envp;
+        char *filename;        /* Name of binary */
+        int (*core_dump)(int, const CPUArchState *); /* coredump routine */
+};
+
+void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
+abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
+                              abi_ulong stringp, int push_ptr);
+int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
+             struct target_pt_regs *regs, struct image_info *infop,
+             struct linux_binprm *);
+
+uint32_t get_elf_eflags(int fd);
+int load_elf_binary(struct linux_binprm *bprm, struct image_info *info);
+int load_flt_binary(struct linux_binprm *bprm, struct image_info *info);
+
+abi_long memcpy_to_target(abi_ulong dest, const void *src,
+                          unsigned long len);
+
+extern unsigned long guest_stack_size;
+
+#endif /* LINUX_USER_LOADER_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 4f5167073574..67c5a87ffadd 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -50,6 +50,7 @@
 #include "crypto/init.h"
 #include "fd-trans.h"
 #include "signal-common.h"
+#include "loader.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 76d3f5e7eb98..02c4778c9704 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -173,30 +173,6 @@ void stop_all_tasks(void);
 extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
-/* ??? See if we can avoid exposing so much of the loader internals.  */
-
-/*
- * Read a good amount of data initially, to hopefully get all the
- * program headers loaded.
- */
-#define BPRM_BUF_SIZE  1024
-
-/*
- * This structure is used to hold the arguments that are
- * used when loading binaries.
- */
-struct linux_binprm {
-        char buf[BPRM_BUF_SIZE] __attribute__((aligned));
-        abi_ulong p;
-        int fd;
-        int e_uid, e_gid;
-        int argc, envc;
-        char **argv;
-        char **envp;
-        char *filename;        /* Name of binary */
-        int (*core_dump)(int, const CPUArchState *); /* coredump routine */
-};
-
 typedef struct IOCTLEntry IOCTLEntry;
 
 typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
@@ -217,13 +193,6 @@ extern IOCTLEntry ioctl_entries[];
 #define IOC_W 0x0002
 #define IOC_RW (IOC_R | IOC_W)
 
-void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
-abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
-                              abi_ulong stringp, int push_ptr);
-int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop,
-             struct linux_binprm *);
-
 /*
  * Returns true if the image uses the FDPIC ABI. If this is the case,
  * we have to provide some information (loadmap, pt_dynamic_info) such
@@ -232,12 +201,6 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
  */
 int info_is_fdpic(struct image_info *info);
 
-uint32_t get_elf_eflags(int fd);
-int load_elf_binary(struct linux_binprm *bprm, struct image_info *info);
-int load_flt_binary(struct linux_binprm *bprm, struct image_info *info);
-
-abi_long memcpy_to_target(abi_ulong dest, const void *src,
-                          unsigned long len);
 void target_set_brk(abi_ulong new_brk);
 abi_long do_brk(abi_ulong new_brk);
 void syscall_init(void);
@@ -440,9 +403,6 @@ abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);
 void mmap_fork_start(void);
 void mmap_fork_end(int child);
 
-/* main.c */
-extern unsigned long guest_stack_size;
-
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/linux-user/signal.c b/linux-user/signal.c
index ee1934947ac8..0fa15f088b01 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -23,6 +23,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "loader.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ad635ed3a5fd..b1cd7410d8bb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -129,6 +129,7 @@
 #include "qemu.h"
 #include "strace.h"
 #include "signal-common.h"
+#include "loader.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.31.1


