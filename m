Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17553FF847
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:12:03 +0200 (CEST)
Received: from localhost ([::1]:46980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwoL-0008KC-Ng
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRN-00077c-7B
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRB-00032o-EY
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:16 -0400
Received: by mail-il1-x133.google.com with SMTP id i13so3575511ilm.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XIdYQ+5cl7tWHxDF6skLL3TOWZUYbnuwJ9DfsPMOy5U=;
 b=tth9YHT2+S9N1hgWz9D9mz62N9tJ3HX8m+RN1Vg9XI6tu4Nb5D7DeWh3pjA2x7AQ6U
 BqJg4w5/IAY7IfjslAdO0pWqvExXCxlD8GFQXgR6eHW3WcyDCg4kaNAsKv9XZNhZ2nnR
 AR8/6iVhfXyQL8UWJjYMTqK1X0DhagGSQXUbUpVgZNhDxrB6MzEDefcbq+YzKvFFMwXp
 CLsXHbzpicV33NVmGfnOGBgkXURuZDra8lLKbZxKNqeqZWSsljyNu9OhEXX3ifnhK0mv
 qjHaZpAWEEnau3SAZ5nBlTzvQnwB0TVUcSyx8kvMDlUt4BVpkJ21GsF7fiHa2t15tG+9
 U3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIdYQ+5cl7tWHxDF6skLL3TOWZUYbnuwJ9DfsPMOy5U=;
 b=ZzL8XxTbocz5gcJWShZIg9Nv5kvzvD0EeiCMHQ41sN5IxmaInwd7LPgl9DBXqWSB+e
 keHXazDaFNAcVH8ga+7f6bEsi9uA3uKYUuhbcb3743MV899KlrEhdwRScTeBBPjVNbWq
 pub3YVM26hGfQbi69sdQcsKOmjJcU/VE1TbIGmWLjJNLi24megpinbEryOJRMZXavWRU
 tRCmdzFhz0ApS4Ln8I+e2Pk2YdkoBfGEtg6kxREspqcRsFFms/mYnNpdukbM0cCHFVmy
 mf3XzFGO5nkfx5IZ4XSuLe/bLziEvNjiOgXCtwK4dFkL3kmgTF7ffkwsJkMeqFlcn7aA
 Onng==
X-Gm-Message-State: AOAM531pCZA5gY25mjYD3oRIwPCIrDCYulXpIpK3ssn3FQrsdCY9cHqP
 ylkTfPW8WNfhMNbL56ab2at7GuBrpVAqVA==
X-Google-Smtp-Source: ABdhPJyV1UQZHwx3IXAMT5weaInfxqd9bmMCE3KYZX2vqZmNtUKj/lzf3xjb9L+8FzC8xu3t93nbEw==
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr535654ilq.220.1630626483972; 
 Thu, 02 Sep 2021 16:48:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:03 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/43] bsd-user: pull in target_arch_thread.h update
 target_arch_elf.h
Date: Thu,  2 Sep 2021 17:47:07 -0600
Message-Id: <20210902234729.76141-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Update target_arch_elf.h to remove thread_init. Move its contents to
target_arch_thread.h and rename to target_thread_init(). Update
elfload.c to call it. Create thread_os_thread.h to hold the os specific
parts of the thread and threat manipulation routines. Currently, it just
includes target_arch_thread.h. target_arch_thread.h contains the at the
moment unused target_thread_set_upcall which will be used in the future
when creating actual thread (i386 has this stubbed, but other
architectures in the bsd-user tree have real ones). FreeBSD doesn't do
AT_HWCAP, so remove that code. Linux does, and this code came from there.

These changes are all interrelated and could be brokend own, but seem to
represent a reviewable changeset since most of the change is boiler
plate.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c                   |  4 ++-
 bsd-user/freebsd/target_os_thread.h  | 25 +++++++++++++
 bsd-user/i386/target_arch_elf.h      | 52 ++--------------------------
 bsd-user/i386/target_arch_thread.h   | 47 +++++++++++++++++++++++++
 bsd-user/netbsd/target_os_thread.h   | 25 +++++++++++++
 bsd-user/openbsd/target_os_thread.h  | 25 +++++++++++++
 bsd-user/x86_64/target_arch_elf.h    | 38 ++------------------
 bsd-user/x86_64/target_arch_thread.h | 40 +++++++++++++++++++++
 8 files changed, 171 insertions(+), 85 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_thread.h
 create mode 100644 bsd-user/i386/target_arch_thread.h
 create mode 100644 bsd-user/netbsd/target_os_thread.h
 create mode 100644 bsd-user/openbsd/target_os_thread.h
 create mode 100644 bsd-user/x86_64/target_arch_thread.h

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index ccb1744800..c28ef34143 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -24,6 +24,7 @@
 #include "qemu/path.h"
 
 #include "target_arch_elf.h"
+#include "target_os_thread.h"
 
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
@@ -1001,5 +1002,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
-    init_thread(regs, infop);
+
+    target_thread_init(regs, infop);
 }
diff --git a/bsd-user/freebsd/target_os_thread.h b/bsd-user/freebsd/target_os_thread.h
new file mode 100644
index 0000000000..77433acdff
--- /dev/null
+++ b/bsd-user/freebsd/target_os_thread.h
@@ -0,0 +1,25 @@
+/*
+ *  FreeBSD thread dependent code and definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_OS_THREAD_H_
+#define _TARGET_OS_THREAD_H_
+
+#include "target_arch_thread.h"
+
+#endif /* !_TARGET_OS_THREAD_H_ */
diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
index 84f61bd930..eb760e07fa 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -19,62 +19,16 @@
 #ifndef _TARGET_ARCH_ELF_H_
 #define _TARGET_ARCH_ELF_H_
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6) {
-        family = 6;
-    }
-    if (family >= 3) {
-        elf_platform[1] = '0' + family;
-    }
-    return elf_platform;
-}
-
-#define ELF_HWCAP get_elf_hwcap()
-
-static uint32_t get_elf_hwcap(void)
-{
-    X86CPU *cpu = X86_CPU(thread_cpu);
-
-    return cpu->env.features[FEAT_1_EDX];
-}
-
 #define ELF_START_MMAP 0x80000000
-
-/*
- * This is used to ensure we don't load something for the wrong architecture.
- */
+#define ELF_ET_DYN_LOAD_ADDR    0x01001000
 #define elf_check_arch(x) (((x) == EM_386) || ((x) == EM_486))
 
-/*
- * These are used to set parameters in the core dumps.
- */
+#define ELF_HWCAP       0 /* FreeBSD doesn't do AT_HWCAP{,2} on x86 */
+
 #define ELF_CLASS       ELFCLASS32
 #define ELF_DATA        ELFDATA2LSB
 #define ELF_ARCH        EM_386
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->esp = infop->start_stack;
-    regs->eip = infop->entry;
-
-    /*
-     * SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
-     * starts %edx contains a pointer to a function which might be
-     * registered using `atexit'.  This provides a mean for the
-     * dynamic linker to call DT_FINI functions for shared libraries
-     * that have been loaded before the code runs.
-     *
-     * A value of 0 tells we have no such handler.
-     */
-    regs->edx = 0;
-}
-
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
diff --git a/bsd-user/i386/target_arch_thread.h b/bsd-user/i386/target_arch_thread.h
new file mode 100644
index 0000000000..e65e476f75
--- /dev/null
+++ b/bsd-user/i386/target_arch_thread.h
@@ -0,0 +1,47 @@
+/*
+ *  i386 thread support
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_ARCH_THREAD_H_
+#define _TARGET_ARCH_THREAD_H_
+
+/* Compare to vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUX86State *regs, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    /* XXX */
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    regs->esp = infop->start_stack;
+    regs->eip = infop->entry;
+
+    /*
+     * SVR4/i386 ABI (pages 3-31, 3-32) says that when the program starts %edx
+     * contains a pointer to a function which might be registered using
+     * `atexit'.  This provides a mean for the dynamic linker to call DT_FINI
+     * functions for shared libraries that have been loaded before the code
+     * runs.
+     *
+     * A value of 0 tells we have no such handler.
+     */
+    regs->edx = 0;
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
diff --git a/bsd-user/netbsd/target_os_thread.h b/bsd-user/netbsd/target_os_thread.h
new file mode 100644
index 0000000000..904dd1bf78
--- /dev/null
+++ b/bsd-user/netbsd/target_os_thread.h
@@ -0,0 +1,25 @@
+/*
+ *  NetBSD thread dependent code and definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_OS_THREAD_H_
+#define _TARGET_OS_THREAD_H_
+
+#include "target_arch_thread.h"
+
+#endif /* !_TARGET_OS_THREAD_H_ */
diff --git a/bsd-user/openbsd/target_os_thread.h b/bsd-user/openbsd/target_os_thread.h
new file mode 100644
index 0000000000..01ed0d9fc8
--- /dev/null
+++ b/bsd-user/openbsd/target_os_thread.h
@@ -0,0 +1,25 @@
+/*
+ *  OpenBSD thread dependent code and definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_OS_THREAD_H_
+#define _TARGET_OS_THREAD_H_
+
+#include "target_arch_thread.h"
+
+#endif /* !_TARGET_OS_THREAD_H_ */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
index e7c8aa2755..c2f8553962 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -19,48 +19,16 @@
 #ifndef _TARGET_ARCH_ELF_H_
 #define _TARGET_ARCH_ELF_H_
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6) {
-        family = 6;
-    }
-    if (family >= 3) {
-        elf_platform[1] = '0' + family;
-    }
-    return elf_platform;
-}
-
-#define ELF_HWCAP get_elf_hwcap()
-
-static uint32_t get_elf_hwcap(void)
-{
-    X86CPU *cpu = X86_CPU(thread_cpu);
-
-    return cpu->env.features[FEAT_1_EDX];
-}
-
 #define ELF_START_MMAP 0x2aaaaab000ULL
+#define ELF_ET_DYN_LOAD_ADDR    0x01021000
 #define elf_check_arch(x) (((x) == ELF_ARCH))
 
+#define ELF_HWCAP      0 /* FreeBSD doesn't do AT_HWCAP{,2} on x86 */
+
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2LSB
 #define ELF_ARCH       EM_X86_64
 
-static inline void init_thread(struct target_pt_regs *regs,
-                               struct image_info *infop)
-{
-    regs->rax = 0;
-    regs->rsp = infop->start_stack;
-    regs->rip = infop->entry;
-    if (bsd_type == target_freebsd) {
-        regs->rdi = infop->start_stack;
-    }
-}
-
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
new file mode 100644
index 0000000000..d105e43fd3
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_thread.h
@@ -0,0 +1,40 @@
+/*
+ *  x86_64 thread support
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_ARCH_THREAD_H_
+#define _TARGET_ARCH_THREAD_H_
+
+/* Compare to vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUX86State *regs, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    /* XXX */
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+    struct image_info *infop)
+{
+    regs->rax = 0;
+    regs->rsp = infop->start_stack;
+    regs->rip = infop->entry;
+    if (bsd_type == target_freebsd) {
+        regs->rdi = infop->start_stack;
+    }
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.32.0


