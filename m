Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C38369BAF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:58:15 +0200 (CEST)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2sR-0003J2-2C
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bH-00061G-Lg
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:35 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b8-0008Es-17
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:29 -0400
Received: by mail-il1-x132.google.com with SMTP id j12so27845297ils.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7G+8Uqg5EuLucUk7kbJ9fT+UfpGKcYXpCPIxZdLvNI=;
 b=RMxYi97QBoC0W7YABmotGnW+HVU2NdLj99UiDyzAfVLaZHLt3KptsM1nOXVA3EOjJP
 ydclFv+1XCYDM2H+n+QR+IO0FkQcna0LKnGIetn/RR6v/46TNYZY2HMGmE7+bFVtArC7
 YxlxRgW/FwTjiY4CzvqTM9eYkW5Bp5mDFDRiCylOwnYaONutcAPIrOjCR6wkRE6ZJJax
 YQoz0uthHv/cqewys26oKyRGbkI7yhDeOgtO9UgIna43cLL3CdqREFGWyOLe5Njx5YG1
 MNgklarBObC9iF3rMVLkstv9vIbiMDIGsQDSi7jBZbTfTILFH4Zx100AUvXaP6oKs0zR
 mNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7G+8Uqg5EuLucUk7kbJ9fT+UfpGKcYXpCPIxZdLvNI=;
 b=Pvt5FKQCjh7auZg7DTjwUJbrpc8HkwQSTZz4hi+NBMITI7N/OxzwaYjXSguqtRL6Zo
 64SeoZrCLnTktbKNyi+rY3gphX1wAHqSD2gZbyj04lx8I9WaOLvxHzcMD8GtcoWUPWBh
 MNoDDRK6PqDgQISSXf7JfWV4G82FxO5/bEjbgMiIM0OtCnhDmQjqlz9Q0gbd9BIf5xt/
 izRVrltzQNu3DMcx88XcPCqgii6LSCmjqJkdc1AI3oW3oXTXEV3l87SyiPiNk7UyMFzU
 xQWRwVr1HZg4pRVj812R+m6Av5htHE7JjIf4s21mI6QSHIceIEGuI18AWnHW5hbuN6AW
 IFIg==
X-Gm-Message-State: AOAM533CYhzLZ+354TrBygKWwKEfntG3hRhPWdM4GYYLEjBSb6c1TAeU
 7RA+xSgEMUc3CAl9UBup0ChVGAwaNqDoefkO
X-Google-Smtp-Source: ABdhPJyL7/RDQO/pFnt9ScDhVCFSbh4mQ1oBlZkYb7bmGqH25IyiXWtozzWo6/S8uH+jQzGB1cXvhw==
X-Received: by 2002:a92:4b0b:: with SMTP id m11mr4342065ilg.58.1619210419776; 
 Fri, 23 Apr 2021 13:40:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:19 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] bsd-user: create target_arch_cpu.h
Date: Fri, 23 Apr 2021 14:39:57 -0600
Message-Id: <20210423203959.78275-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Create target_arch_cpu.h to house the target_cpu_loop and target_cpu_init
functions. These are the empty files that will be populated by moving the
appropriate cpu-specific functions out of main.c. This work pre-dates the
linux-user work that moved these to cpu-loop.c, so was done differently. As
there's a number of things linux-user did differently than bsd-user in their
time of divergence, and as the recertification of the code to redo it the same
way will take a fair amount of effort, a separate effort to address the
divergence once everything is in the tree and we can create a common qemu-user
directory for the munane common elements between the two.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h     | 22 ++++++++++++++++++++++
 bsd-user/i386/target_arch_cpu.h    | 22 ++++++++++++++++++++++
 bsd-user/main.c                    |  1 +
 bsd-user/sparc/target_arch_cpu.h   | 22 ++++++++++++++++++++++
 bsd-user/sparc64/target_arch_cpu.h | 19 +++++++++++++++++++
 bsd-user/x86_64/target_arch_cpu.h  | 19 +++++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 create mode 100644 bsd-user/sparc/target_arch_cpu.h
 create mode 100644 bsd-user/sparc64/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
new file mode 100644
index 0000000000..71c89174f2
--- /dev/null
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  arm cpu init and loop
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
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
new file mode 100644
index 0000000000..c05e048b9b
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  i386 cpu init and loop
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
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index fbcc8cc28c..d12b77fbfe 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,6 +41,7 @@
 #include "trace/control.h"
 
 #include "host_os.h"
+#include "target_arch_cpu.h"
 
 int singlestep;
 unsigned long mmap_min_addr;
diff --git a/bsd-user/sparc/target_arch_cpu.h b/bsd-user/sparc/target_arch_cpu.h
new file mode 100644
index 0000000000..dcf7694cba
--- /dev/null
+++ b/bsd-user/sparc/target_arch_cpu.h
@@ -0,0 +1,22 @@
+/*
+ *  sparc cpu init and loop
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
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/sparc64/target_arch_cpu.h b/bsd-user/sparc64/target_arch_cpu.h
new file mode 100644
index 0000000000..c3962a8e9a
--- /dev/null
+++ b/bsd-user/sparc64/target_arch_cpu.h
@@ -0,0 +1,19 @@
+/*
+ *  sparc64 cpu init and loop
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
+#include "../sparc/target_arch_cpu.h"
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
new file mode 100644
index 0000000000..56cb59ae0b
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -0,0 +1,19 @@
+/*
+ *  x86_64 cpu init and loop
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
+#include "../i386/target_arch_cpu.h"
-- 
2.22.1


