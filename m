Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E63E3743
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:55:17 +0200 (CEST)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUHk-0001wh-8y
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU68-0007OE-I5
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:16 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU66-0004ux-7Q
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:16 -0400
Received: by mail-io1-xd44.google.com with SMTP id y1so19935617iod.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eh62M1LCPH1ciwgXY/g56qTwt7JRl2T85rnBwwigqK0=;
 b=bSA0QymQ7WbLrpE7l4wMF7cL6l0jwXB/L0bm0Yj9cyjH916DLJNlCFvmxmuUy1aun+
 AJ5c2qJmgSg6ESr1HPvbtP63TUtzJbZQg0qYqsPMaA9VrLGBIzCOkj0E3JLzZsH+Prb+
 5Q5xgvugesPCATT4uLW/0whSo9sfY9sSbCQPccl71GBu6LYCzm2xR4DSWP9G6PZLS7NP
 g2x8b0H3efIF9tdqhdW4QZShlFFgILxs5U+xcnTrIlhdvgTvFDgqhuzQPUKC1Ac9huXT
 j9QWaeMyWbEvPIU2BJ5J5Fz3fRckdja6XYRqByDGeNSSBGr9V/YUQ/Uyg4XoaI4O95h9
 r3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eh62M1LCPH1ciwgXY/g56qTwt7JRl2T85rnBwwigqK0=;
 b=FzOEAKMC+jQ5HIZxahlRWgYDNF2ke+Bv+2xRjVCtk5FCFVSdAT1HECYXnMnJmNBzF0
 xrfp/WgRI348s4ZPiW0aBMHWakJzJG08Kj7gPzVpRlq89BU7F5CoJYhp2eYXjphQZ1Bg
 S3bXrFEYAare/9tPpC15yJjdpFoVtMaC5RUvM2DvOC+B31E347zqnxZ22DGcxZ/ppeVH
 Rej++wbt9No8ON+BFnJxFuMO5NkWN4pOZxF/Yv8kSBHoXvZCnOQhyqJWwArRnXSrM4c2
 7DVgnZoWrGwHo9Jf8ld+ddvjBD/P7JRoiT1RPQ5v/06Q48I6hnFx0P+ethMd5l9vFIlk
 z8pQ==
X-Gm-Message-State: AOAM533HBsEIyE1UoK8+thqUUESvnEnXDJQncsHRS80I/FJZKf8HhGnX
 szWrSE32a4rLdRVuYpmtUc2DSkasRgP1if4H
X-Google-Smtp-Source: ABdhPJxT23Vl4IPSZsVoFOUDKOU/CZ9hYjnABGZ7CSUS7iTNzyJf/CIZ0CwKCr/SG1zeFTIzaOBzng==
X-Received: by 2002:a05:6638:358b:: with SMTP id
 v11mr3545762jal.128.1628372592587; 
 Sat, 07 Aug 2021 14:43:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 21/49] bsd-user: start to move target CPU functions to
 target_arch*
Date: Sat,  7 Aug 2021 15:42:14 -0600
Message-Id: <20210807214242.82385-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move the CPU functons into target_arch_cpu.c that are unique to each
CPU. These are defined in target_arch.h.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch.h       | 31 +++++++++++++
 bsd-user/i386/target_arch_cpu.c   | 75 +++++++++++++++++++++++++++++++
 bsd-user/main.c                   | 12 -----
 bsd-user/x86_64/target_arch.h     | 31 +++++++++++++
 bsd-user/x86_64/target_arch_cpu.c | 75 +++++++++++++++++++++++++++++++
 meson.build                       |  8 +++-
 6 files changed, 218 insertions(+), 14 deletions(-)
 create mode 100644 bsd-user/i386/target_arch.h
 create mode 100644 bsd-user/i386/target_arch_cpu.c
 create mode 100644 bsd-user/x86_64/target_arch.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.c

diff --git a/bsd-user/i386/target_arch.h b/bsd-user/i386/target_arch.h
new file mode 100644
index 0000000000..73e9a028fe
--- /dev/null
+++ b/bsd-user/i386/target_arch.h
@@ -0,0 +1,31 @@
+/*
+ * Intel x86 specific prototypes for bsd-user
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
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+/* target_arch_cpu.c */
+void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                int flags);
+void bsd_i386_set_idt(int n, unsigned int dpl);
+void bsd_i386_set_idt_base(uint64_t base);
+
+#define target_cpu_set_tls(env, newtls)
+
+#endif /* ! _TARGET_ARCH_H_ */
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
new file mode 100644
index 0000000000..7f2f755a11
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -0,0 +1,75 @@
+/*
+ *  i386 cpu related code
+ *
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
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu.h"
+#include "qemu/timer.h"
+
+#include "target_arch.h"
+
+static uint64_t *idt_table;
+
+uint64_t cpu_get_tsc(CPUX86State *env)
+{
+    return cpu_get_host_ticks();
+}
+
+int cpu_get_pic_interrupt(CPUX86State *env)
+{
+    return -1;
+}
+
+void bsd_i386_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                     int flags)
+{
+    unsigned int e1, e2;
+    uint32_t *p;
+    e1 = (addr << 16) | (limit & 0xffff);
+    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
+    e2 |= flags;
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+
+static void set_gate(void *ptr, unsigned int type, unsigned int dpl,
+                     uint32_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+/* only dpl matters as we do only user space emulation */
+void bsd_i386_set_idt(int n, unsigned int dpl)
+{
+    set_gate(idt_table + n, 0, dpl, 0, 0);
+}
+
+void bsd_i386_set_idt_base(uint64_t base)
+{
+    idt_table = g2h_untagged(base);
+}
+
diff --git a/bsd-user/main.c b/bsd-user/main.c
index c59edad155..ac435b216a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -72,13 +72,6 @@ void gemu_log(const char *fmt, ...)
     va_end(ap);
 }
 
-#if defined(TARGET_I386)
-int cpu_get_pic_interrupt(CPUX86State *env)
-{
-    return -1;
-}
-#endif
-
 void fork_start(void)
 {
 }
@@ -94,11 +87,6 @@ void fork_end(int child)
 /***********************************************************/
 /* CPUX86 core interface */
 
-uint64_t cpu_get_tsc(CPUX86State *env)
-{
-    return cpu_get_host_ticks();
-}
-
 static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
                      int flags)
 {
diff --git a/bsd-user/x86_64/target_arch.h b/bsd-user/x86_64/target_arch.h
new file mode 100644
index 0000000000..e558e1b956
--- /dev/null
+++ b/bsd-user/x86_64/target_arch.h
@@ -0,0 +1,31 @@
+/*
+ * Intel x86_64 specific prototypes for bsd-user
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
+#ifndef _TARGET_ARCH_H_
+#define _TARGET_ARCH_H_
+
+/* target_arch_cpu.c */
+void bsd_x86_64_write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                int flags);
+void bsd_x86_64_set_idt(int n, unsigned int dpl);
+void bsd_x86_64_set_idt_base(uint64_t base);
+
+#define target_cpu_set_tls(env, newtls)
+
+#endif /* !_TARGET_ARCH_H_ */
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
new file mode 100644
index 0000000000..a2c5b176a4
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -0,0 +1,75 @@
+/*
+ *  x86_64 cpu related code
+ *
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
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu.h"
+#include "qemu/timer.h"
+
+#include "target_arch.h"
+
+static uint64_t *idt_table;
+
+uint64_t cpu_get_tsc(CPUX86State *env)
+{
+    return cpu_get_host_ticks();
+}
+
+int cpu_get_pic_interrupt(CPUX86State *env)
+{
+    return -1;
+}
+
+void bsd_x86_64_write_dt(void *ptr, unsigned long addr,
+        unsigned long limit, int flags)
+{
+    unsigned int e1, e2;
+    uint32_t *p;
+    e1 = (addr << 16) | (limit & 0xffff);
+    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
+    e2 |= flags;
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+static void set_gate64(void *ptr, unsigned int type, unsigned int dpl,
+        uint64_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+    p[2] = tswap32(addr >> 32);
+    p[3] = 0;
+}
+
+/* only dpl matters as we do only user space emulation */
+void bsd_x86_64_set_idt(int n, unsigned int dpl)
+{
+    set_gate64(idt_table + n * 2, 0, dpl, 0, 0);
+}
+
+void bsd_x86_64_set_idt_base(uint64_t base)
+{
+    idt_table = g2h_untagged(base);
+}
diff --git a/meson.build b/meson.build
index f2e148eaf9..5fe6b4aae6 100644
--- a/meson.build
+++ b/meson.build
@@ -2560,9 +2560,13 @@ foreach target : target_dirs
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-    else
+    endif
+    if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-      target_inc += include_directories('bsd-user/freebsd')
+      target_inc += include_directories('bsd-user/' / targetos)
+#     target_inc += include_directories('bsd-user/host/' / config_host['ARCH'])
+      dir = base_dir / abi
+      arch_srcs += files(dir / 'target_arch_cpu.c')
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.32.0


