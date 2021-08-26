Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B278F3F9036
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:38:11 +0200 (CEST)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN4c-0001fa-No
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg2-0006LP-2T
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:46 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfz-0006vG-OS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:45 -0400
Received: by mail-io1-xd44.google.com with SMTP id y18so5636780ioc.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVlTkYRVGJlqiTWoz2cLOJ7c2mDf7upodkhWwMlHYyI=;
 b=BBHgxveGcIZ8gQ+zAvITahbi10wy1fbGUu6aGztZQn6XZIP8uoBCywc4eF8TCPRCYP
 EtDga44tOuP7t8BvrIeh0B4lx6cEG0pO0llYFSL5ht5kfge9Du7mkGadjB1pOhyBY1T7
 OaatibUksTiNfInfDy9hhD28q04P1leSwCd98uvPmxzmx8lZVtarxXt3xQ00zD6Y9k9O
 3RvRtAtOnmlwDmtuhP59/SVvIZgzFxuyh8sQSZPH9s9grlFnChYqheKgDw1TU2y7vJHG
 /ZJ1+dazgwjK9KN8lKYrxr2VNXaylElz/i+V0ePc2Oa/09oUbqQFWvNLtEjf1J5mn8lJ
 f8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVlTkYRVGJlqiTWoz2cLOJ7c2mDf7upodkhWwMlHYyI=;
 b=QhQRpeb4owLIgaA/L0nMopNCkiepvyjDYGFT1OtI4GvzUJWaij/SAnhNp7i7ShPlCm
 vSIypC1mDEUjI0yVegWmNxxHymjL+LwB4sxzm/L8HbsiJ2ZOpsvQEM7f7/W1zZSpe5xc
 MnMUKSycCkVSOPFowWLlRr2GFnrLXD+8LlCJfF8I95D5C2eBnivoyhts4cQEZoVDMA/l
 cEpEmx2/eliOpvzbh2T+CHGVPjYZIs6mlZ4afp5FoD582RNwmGy7MJGJoU8oIw/wMJ/S
 jSAQWufGBa9epQZz6shijADfldCmBtO4UM9aUKC3YVTvSaysutulEWC8Rc6SzUJ5eSvk
 7oNA==
X-Gm-Message-State: AOAM531j3+pL4YH/QZfX4Jy0MGvsp054zTWjQ2vVcBSfFpb0Bm4tyAEh
 qVLRcHG+W9qwfv3k351DZOdJ1cMXKFEwM7ZI
X-Google-Smtp-Source: ABdhPJz30wFpq4LzwXncTvU7/ELkvkjvjl3vwTzgLwP6ZzmV3CiyY2ZFGra8csesbz/tAOsroI2c/w==
X-Received: by 2002:a05:6638:250a:: with SMTP id
 v10mr5100957jat.21.1630012361766; 
 Thu, 26 Aug 2021 14:12:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:40 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/43] bsd-user: pull in target_arch_thread.h update
 target_arch_elf.h
Date: Thu, 26 Aug 2021 15:11:39 -0600
Message-Id: <20210826211201.98877-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
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
 bsd-user/freebsd/target_os_thread.h  | 25 +++++++++++++++
 bsd-user/i386/target_arch_elf.h      | 47 ++--------------------------
 bsd-user/i386/target_arch_thread.h   | 47 ++++++++++++++++++++++++++++
 bsd-user/netbsd/target_os_thread.h   | 25 +++++++++++++++
 bsd-user/openbsd/target_os_thread.h  | 25 +++++++++++++++
 bsd-user/x86_64/target_arch_elf.h    | 35 ++-------------------
 bsd-user/x86_64/target_arch_thread.h | 40 +++++++++++++++++++++++
 8 files changed, 171 insertions(+), 77 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_thread.h
 create mode 100644 bsd-user/i386/target_arch_thread.h
 create mode 100644 bsd-user/netbsd/target_os_thread.h
 create mode 100644 bsd-user/openbsd/target_os_thread.h
 create mode 100644 bsd-user/x86_64/target_arch_thread.h

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 8a6a72bf05..70a0f81f3d 100644
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
index 84fbc8ba4c..eb760e07fa 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -19,57 +19,16 @@
 #ifndef _TARGET_ARCH_ELF_H_
 #define _TARGET_ARCH_ELF_H_
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
-        family = 6;
-    if (family >= 3)
-        elf_platform[1] = '0' + family;
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
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->esp = infop->start_stack;
-    regs->eip = infop->entry;
-
-    /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
-       starts %edx contains a pointer to a function which might be
-       registered using `atexit'.  This provides a mean for the
-       dynamic linker to call DT_FINI functions for shared libraries
-       that have been loaded before the code runs.
-
-       A value of 0 tells we have no such handler.  */
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
index 202bf2c447..c2f8553962 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -19,45 +19,16 @@
 #ifndef _TARGET_ARCH_ELF_H_
 #define _TARGET_ARCH_ELF_H_
 
-#define ELF_PLATFORM get_elf_platform()
-
-static const char *get_elf_platform(void)
-{
-    static char elf_platform[] = "i386";
-    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
-        family = 6;
-    if (family >= 3)
-        elf_platform[1] = '0' + family;
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
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
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


