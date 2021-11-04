Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C756444F9B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:22:18 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX4j-00048l-DG
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyl-0004qf-3F
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyg-0000hK-39
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id d13so7069711wrf.11
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 00:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WivuKY8m05Kav2fktQgAtG5eYI6su38CkKIQUTc7uNo=;
 b=VmC0WRErfNPi/SuNo71Jz3H8noXbrp/7VcZJ+xgz2M4SzElB4lzK6xumVkLFnzib9w
 qG72qHrEaDlxvzztrUMnc5Ry8Afpfr/7QCkN9fWi0y4FYZBXN9nJukRqYwSz1VI5CnnB
 ytwo4WmCUkUG8PcHoOU+2fZCeh/4vPO6FkXbDDq+OwB4A7sBjN0XW3Dc2Ra6I/a0kO5n
 GfYmL6Rp4iLeLPp/ZnxXq2URG92FQDQ4Lfau0xXSNHzVSrQnAIEgdcIiT1FKkXg+ACO8
 LZEsdcqb+XbDZtJb3XFp19H88yrMJMwK7HsNR6+WhF+gy1f8XE7jtW4tVSUT+DVFlP5V
 KRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WivuKY8m05Kav2fktQgAtG5eYI6su38CkKIQUTc7uNo=;
 b=0055o6DhPTWvLF5v56MsiD//h5gW5/pcoZ0kXK6kJPK/07PjlxyZiCiU1uA6RcI2QH
 isEOHR6J5nCipesEs1bmkj+FCvkVJ/NS8hLnkUdtNaq4Jbct8pAl+e1VLZv4UGACmwZ7
 KMS1DSqJYuvWsxfhWapAxkATdLNrSa9xG+LvX4bWSVKAyzLw/r0pJP5uG2PdXKb6uclt
 CzjfehPUOB1CrjeAsakGK8drOionBV1pcj88SFNp9U8G0Cgy4blZhe9RvQZhvByD9LTY
 7vSErVzerSq8Kf6DKBoG5JUBXqiZ35cydg/0aLwoLlOWlhu4DuL2d4ySWL/rztVSwCuT
 HVdQ==
X-Gm-Message-State: AOAM533ZSCVL7PAnt2KzF5CfG8Oa4yjtjNNJLs/Dcab+jNZx+kqy+VKG
 t7Nbe3WI7iVkNhQ31ZBs91CGhL025wM=
X-Google-Smtp-Source: ABdhPJzCWquGLavWuWqHdxUS0MNwC2mJsFp5jm9y3MfVGE9y7A/Lbewq6TSg4UV8iXiYRa9Nq7l1Og==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr38403638wrz.127.1636010154294; 
 Thu, 04 Nov 2021 00:15:54 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x21sm7511598wmc.14.2021.11.04.00.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 00:15:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] linux-user: Add GPL-2.0-or-later SPDX license
 identifier
Date: Thu,  4 Nov 2021 08:15:41 +0100
Message-Id: <20211104071541.3813306-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211104071541.3813306-1-f4bug@amsat.org>
References: <20211104071541.3813306-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to help license compliance tools (following [1] guidance),
use Qualcomm License Identifier tool [*] to classify linux-user/
files per license type, filtering those matching at least 60% the
"GPLv2 or later" type, and manually add the GPL-2.0-or-later SPDX
comment.

Full, abbreviated, oddly-indented/wrapped license texts are kept
unmodified.

Example of the tool output:

  $ license-identifier --output_format easy_read \
      --threshold 0.6 --input_path linux-user \
    | egrep '(Name of the input file|Matched license type is|The found license text has the score of)'
    | fgrep -1 GPL-2.0+
  Name of the input file: linux-user/cpu_loop-common.h
  Matched license type is GPL-2.0+
  The found license text has the score of 0.69
  --
  Name of the input file: linux-user/exit.c
  Matched license type is GPL-2.0+
  The found license text has the score of 0.685
  --
  Name of the input file: linux-user/fd-trans.c
  Matched license type is GPL-2.0+
  The found license text has the score of 0.715
  --
  Name of the input file: linux-user/fd-trans.h
  Matched license type is GPL-2.0+
  The found license text has the score of 0.715
  --
  Name of the input file: linux-user/flatload.c
  Matched license type is GPL-2.0+
  The found license text has the score of 0.715
  --
  ...

[1] https://www.linuxfoundation.org/blog/solving-license-compliance-at-the-source-adding-spdx-license-ids/
[2] Qualcomm Open Source Technology Group License Identifier tool
    https://www.codeaurora.org/projects/qualcomm-ostg-lid
    https://github.com/quic/lid#usage

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/aarch64/target_elf.h      | 1 +
 linux-user/aarch64/target_fcntl.h    | 1 +
 linux-user/alpha/target_elf.h        | 1 +
 linux-user/alpha/target_fcntl.h      | 1 +
 linux-user/arm/target_elf.h          | 1 +
 linux-user/arm/target_fcntl.h        | 1 +
 linux-user/cpu_loop-common.h         | 1 +
 linux-user/cris/target_elf.h         | 1 +
 linux-user/cris/target_fcntl.h       | 1 +
 linux-user/fd-trans.h                | 1 +
 linux-user/hexagon/sockbits.h        | 1 +
 linux-user/hexagon/target_cpu.h      | 1 +
 linux-user/hexagon/target_elf.h      | 1 +
 linux-user/hexagon/target_fcntl.h    | 1 +
 linux-user/hexagon/target_signal.h   | 1 +
 linux-user/hexagon/target_structs.h  | 1 +
 linux-user/hexagon/target_syscall.h  | 1 +
 linux-user/hexagon/termbits.h        | 1 +
 linux-user/hppa/target_elf.h         | 1 +
 linux-user/hppa/target_fcntl.h       | 1 +
 linux-user/i386/target_elf.h         | 1 +
 linux-user/i386/target_fcntl.h       | 1 +
 linux-user/loader.h                  | 1 +
 linux-user/m68k/target_elf.h         | 1 +
 linux-user/m68k/target_fcntl.h       | 1 +
 linux-user/microblaze/target_elf.h   | 1 +
 linux-user/microblaze/target_fcntl.h | 1 +
 linux-user/mips/target_fcntl.h       | 1 +
 linux-user/mips64/target_elf.h       | 1 +
 linux-user/nios2/target_elf.h        | 1 +
 linux-user/nios2/target_fcntl.h      | 1 +
 linux-user/openrisc/target_elf.h     | 1 +
 linux-user/openrisc/target_fcntl.h   | 1 +
 linux-user/ppc/target_elf.h          | 1 +
 linux-user/ppc/target_fcntl.h        | 1 +
 linux-user/riscv/target_elf.h        | 1 +
 linux-user/riscv/target_fcntl.h      | 1 +
 linux-user/s390x/target_cpu.h        | 1 +
 linux-user/s390x/target_elf.h        | 1 +
 linux-user/s390x/target_fcntl.h      | 1 +
 linux-user/safe-syscall.h            | 1 +
 linux-user/sh4/target_elf.h          | 1 +
 linux-user/sh4/target_fcntl.h        | 1 +
 linux-user/signal-common.h           | 1 +
 linux-user/sparc/target_elf.h        | 1 +
 linux-user/sparc/target_fcntl.h      | 1 +
 linux-user/strace.h                  | 1 +
 linux-user/user-internals.h          | 1 +
 linux-user/user-mmap.h               | 1 +
 linux-user/x86_64/target_elf.h       | 1 +
 linux-user/x86_64/target_fcntl.h     | 1 +
 linux-user/xtensa/target_elf.h       | 1 +
 linux-user/xtensa/target_fcntl.h     | 1 +
 linux-user/aarch64/cpu_loop.c        | 1 +
 linux-user/aarch64/signal.c          | 1 +
 linux-user/alpha/cpu_loop.c          | 1 +
 linux-user/alpha/signal.c            | 1 +
 linux-user/arm/cpu_loop.c            | 1 +
 linux-user/arm/signal.c              | 1 +
 linux-user/cris/cpu_loop.c           | 1 +
 linux-user/cris/signal.c             | 1 +
 linux-user/exit.c                    | 1 +
 linux-user/fd-trans.c                | 1 +
 linux-user/flatload.c                | 1 +
 linux-user/hexagon/cpu_loop.c        | 1 +
 linux-user/hexagon/signal.c          | 1 +
 linux-user/hppa/cpu_loop.c           | 1 +
 linux-user/hppa/signal.c             | 1 +
 linux-user/i386/cpu_loop.c           | 1 +
 linux-user/i386/signal.c             | 1 +
 linux-user/m68k/cpu_loop.c           | 1 +
 linux-user/m68k/signal.c             | 1 +
 linux-user/main.c                    | 1 +
 linux-user/microblaze/cpu_loop.c     | 1 +
 linux-user/microblaze/signal.c       | 1 +
 linux-user/mips/cpu_loop.c           | 1 +
 linux-user/mips/signal.c             | 1 +
 linux-user/mips64/cpu_loop.c         | 1 +
 linux-user/mips64/signal.c           | 1 +
 linux-user/mmap.c                    | 1 +
 linux-user/nios2/cpu_loop.c          | 1 +
 linux-user/nios2/signal.c            | 1 +
 linux-user/openrisc/cpu_loop.c       | 1 +
 linux-user/openrisc/signal.c         | 1 +
 linux-user/ppc/cpu_loop.c            | 1 +
 linux-user/ppc/signal.c              | 1 +
 linux-user/riscv/cpu_loop.c          | 1 +
 linux-user/riscv/signal.c            | 1 +
 linux-user/s390x/cpu_loop.c          | 1 +
 linux-user/s390x/signal.c            | 1 +
 linux-user/sh4/cpu_loop.c            | 1 +
 linux-user/sh4/signal.c              | 1 +
 linux-user/signal.c                  | 1 +
 linux-user/sparc/cpu_loop.c          | 1 +
 linux-user/sparc/signal.c            | 1 +
 linux-user/syscall.c                 | 1 +
 linux-user/uname.c                   | 1 +
 linux-user/vm86.c                    | 1 +
 linux-user/x86_64/cpu_loop.c         | 1 +
 linux-user/x86_64/signal.c           | 1 +
 linux-user/xtensa/cpu_loop.c         | 1 +
 linux-user/xtensa/signal.c           | 1 +
 102 files changed, 102 insertions(+)

diff --git a/linux-user/aarch64/target_elf.h b/linux-user/aarch64/target_elf.h
index a7eb962fba7..c04ba43cd94 100644
--- a/linux-user/aarch64/target_elf.h
+++ b/linux-user/aarch64/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef AARCH64_TARGET_ELF_H
 #define AARCH64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/aarch64/target_fcntl.h b/linux-user/aarch64/target_fcntl.h
index efdf6e5f058..e41ae75c6c5 100644
--- a/linux-user/aarch64/target_fcntl.h
+++ b/linux-user/aarch64/target_fcntl.h
@@ -1,16 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef AARCH64_TARGET_FCNTL_H
 #define AARCH64_TARGET_FCNTL_H
 
 #define TARGET_O_DIRECTORY      040000 /* must be a directory */
 #define TARGET_O_NOFOLLOW      0100000 /* don't follow links */
 #define TARGET_O_DIRECT        0200000 /* direct disk access hint */
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/alpha/target_elf.h b/linux-user/alpha/target_elf.h
index 344e9f4d395..52a51e1b23b 100644
--- a/linux-user/alpha/target_elf.h
+++ b/linux-user/alpha/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef ALPHA_TARGET_ELF_H
 #define ALPHA_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
index 99774d73172..5510087c8eb 100644
--- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef ALPHA_TARGET_FCNTL_H
 #define ALPHA_TARGET_FCNTL_H
 
 #define TARGET_O_NONBLOCK           04
 #define TARGET_O_APPEND            010
 #define TARGET_O_CREAT           01000 /* not fcntl */
 #define TARGET_O_TRUNC           02000 /* not fcntl */
 #define TARGET_O_EXCL            04000 /* not fcntl */
 #define TARGET_O_NOCTTY         010000 /* not fcntl */
 #define TARGET_O_DSYNC          040000
 #define TARGET_O_LARGEFILE           0 /* not necessary, always 64-bit */
 #define TARGET_O_DIRECTORY     0100000 /* must be a directory */
 #define TARGET_O_NOFOLLOW      0200000 /* don't follow links */
diff --git a/linux-user/arm/target_elf.h b/linux-user/arm/target_elf.h
index 58ff6a0986f..529008540be 100644
--- a/linux-user/arm/target_elf.h
+++ b/linux-user/arm/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef ARM_TARGET_ELF_H
 #define ARM_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/arm/target_fcntl.h b/linux-user/arm/target_fcntl.h
index c8ff6b2505a..841fea07d09 100644
--- a/linux-user/arm/target_fcntl.h
+++ b/linux-user/arm/target_fcntl.h
@@ -1,17 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef ARM_TARGET_FCNTL_H
 #define ARM_TARGET_FCNTL_H
 
 #define TARGET_O_DIRECTORY      040000 /* must be a directory */
 #define TARGET_O_NOFOLLOW      0100000 /* don't follow links */
 #define TARGET_O_DIRECT        0200000 /* direct disk access hint */
 #define TARGET_O_LARGEFILE     0400000
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 8828af28a4d..acd5360fcd3 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef CPU_LOOP_COMMON_H
diff --git a/linux-user/cris/target_elf.h b/linux-user/cris/target_elf.h
index 99eb4ec7046..aa85eed7d38 100644
--- a/linux-user/cris/target_elf.h
+++ b/linux-user/cris/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef CRIS_TARGET_ELF_H
 #define CRIS_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/cris/target_fcntl.h b/linux-user/cris/target_fcntl.h
index df0aceea344..506f11f1221 100644
--- a/linux-user/cris/target_fcntl.h
+++ b/linux-user/cris/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef CRIS_TARGET_FCNTL_H
 #define CRIS_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index 1b9fa2041c0..742a32421a8 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef FD_TRANS_H
 #define FD_TRANS_H
 
 #include "qemu/lockable.h"
 
diff --git a/linux-user/hexagon/sockbits.h b/linux-user/hexagon/sockbits.h
index b7ad5dc60e5..814283369ef 100644
--- a/linux-user/hexagon/sockbits.h
+++ b/linux-user/hexagon/sockbits.h
@@ -1,18 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "../generic/sockbits.h"
diff --git a/linux-user/hexagon/target_cpu.h b/linux-user/hexagon/target_cpu.h
index ecb76e9268e..d5045316912 100644
--- a/linux-user/hexagon/target_cpu.h
+++ b/linux-user/hexagon/target_cpu.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef HEXAGON_TARGET_CPU_H
 #define HEXAGON_TARGET_CPU_H
 
diff --git a/linux-user/hexagon/target_elf.h b/linux-user/hexagon/target_elf.h
index b4e9f405272..012f4f37c48 100644
--- a/linux-user/hexagon/target_elf.h
+++ b/linux-user/hexagon/target_elf.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef HEXAGON_TARGET_ELF_H
 #define HEXAGON_TARGET_ELF_H
 
diff --git a/linux-user/hexagon/target_fcntl.h b/linux-user/hexagon/target_fcntl.h
index 2892db80989..396a525024e 100644
--- a/linux-user/hexagon/target_fcntl.h
+++ b/linux-user/hexagon/target_fcntl.h
@@ -1,18 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "../generic/fcntl.h"
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 9e0223d3222..8bb71339662 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef HEXAGON_TARGET_SIGNAL_H
 #define HEXAGON_TARGET_SIGNAL_H
 
diff --git a/linux-user/hexagon/target_structs.h b/linux-user/hexagon/target_structs.h
index c217d9442ae..45eb9b2d109 100644
--- a/linux-user/hexagon/target_structs.h
+++ b/linux-user/hexagon/target_structs.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 /*
  * Hexagon specific structures for linux-user
  */
diff --git a/linux-user/hexagon/target_syscall.h b/linux-user/hexagon/target_syscall.h
index 7f91a4abc77..309974bba38 100644
--- a/linux-user/hexagon/target_syscall.h
+++ b/linux-user/hexagon/target_syscall.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef HEXAGON_TARGET_SYSCALL_H
 #define HEXAGON_TARGET_SYSCALL_H
 
diff --git a/linux-user/hexagon/termbits.h b/linux-user/hexagon/termbits.h
index 49f974cdde1..8292675e522 100644
--- a/linux-user/hexagon/termbits.h
+++ b/linux-user/hexagon/termbits.h
@@ -1,18 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "../generic/termbits.h"
diff --git a/linux-user/hppa/target_elf.h b/linux-user/hppa/target_elf.h
index 82b4e9535e1..961f979c288 100644
--- a/linux-user/hppa/target_elf.h
+++ b/linux-user/hppa/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef HPPA_TARGET_ELF_H
 #define HPPA_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
index 4eb0ec98e25..41d554e7db6 100644
--- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef HPPA_TARGET_FCNTL_H
 #define HPPA_TARGET_FCNTL_H
 
 #define TARGET_O_NONBLOCK    000200000
 #define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY flag */
 #define TARGET_O_APPEND      000000010
 #define TARGET_O_CREAT       000000400 /* not fcntl */
 #define TARGET_O_EXCL        000002000 /* not fcntl */
 #define TARGET_O_NOCTTY      000400000 /* not fcntl */
 #define TARGET_O_DSYNC       001000000
 #define TARGET_O_LARGEFILE   000004000
 #define TARGET_O_DIRECTORY   000010000 /* must be a directory */
 #define TARGET_O_NOFOLLOW    000000200 /* don't follow links */
diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
index 1c6142e7da0..ca7e5ba5d52 100644
--- a/linux-user/i386/target_elf.h
+++ b/linux-user/i386/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef I386_TARGET_ELF_H
 #define I386_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "qemu32";
 }
 #endif
diff --git a/linux-user/i386/target_fcntl.h b/linux-user/i386/target_fcntl.h
index 4819743dae4..e5a77588360 100644
--- a/linux-user/i386/target_fcntl.h
+++ b/linux-user/i386/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef I386_TARGET_FCNTL_H
 #define I386_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/loader.h b/linux-user/loader.h
index f375ee0679b..f3528262b00 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * loader.h: prototypes for linux-user guest binary loader
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_USER_LOADER_H
 #define LINUX_USER_LOADER_H
 
diff --git a/linux-user/m68k/target_elf.h b/linux-user/m68k/target_elf.h
index 998fe0fe2f3..27017e418e0 100644
--- a/linux-user/m68k/target_elf.h
+++ b/linux-user/m68k/target_elf.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef M68K_TARGET_ELF_H
 #define M68K_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     if (eflags == 0 || (eflags & EF_M68K_M68000)) {
         /* 680x0 */
         return "m68040";
     }
 
     /* Coldfire */
     return "any";
 }
 #endif
diff --git a/linux-user/m68k/target_fcntl.h b/linux-user/m68k/target_fcntl.h
index 068bc3243e0..b692250dd20 100644
--- a/linux-user/m68k/target_fcntl.h
+++ b/linux-user/m68k/target_fcntl.h
@@ -1,17 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef M68K_TARGET_FCNTL_H
 #define M68K_TARGET_FCNTL_H
 
 #define TARGET_O_DIRECTORY      040000 /* must be a directory */
 #define TARGET_O_NOFOLLOW      0100000 /* don't follow links */
 #define TARGET_O_DIRECT        0200000 /* direct disk access hint */
 #define TARGET_O_LARGEFILE     0400000
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/microblaze/target_elf.h b/linux-user/microblaze/target_elf.h
index 8a8f1debff9..e30550e3bb7 100644
--- a/linux-user/microblaze/target_elf.h
+++ b/linux-user/microblaze/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef MICROBLAZE_TARGET_ELF_H
 #define MICROBLAZE_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/microblaze/target_fcntl.h b/linux-user/microblaze/target_fcntl.h
index 45402275fff..846bf2c2833 100644
--- a/linux-user/microblaze/target_fcntl.h
+++ b/linux-user/microblaze/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef MICROBLAZE_TARGET_FCNTL_H
 #define MICROBLAZE_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/mips/target_fcntl.h b/linux-user/mips/target_fcntl.h
index 6fc7b8a12bf..298518fd805 100644
--- a/linux-user/mips/target_fcntl.h
+++ b/linux-user/mips/target_fcntl.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef MIPS_TARGET_FCNTL_H
 #define MIPS_TARGET_FCNTL_H
 
 #define TARGET_O_APPEND         0x0008
 #define TARGET_O_DSYNC          0x0010
 #define TARGET_O_NONBLOCK       0x0080
 #define TARGET_O_CREAT          0x0100  /* not fcntl */
 #define TARGET_O_TRUNC          0x0200  /* not fcntl */
 #define TARGET_O_EXCL           0x0400  /* not fcntl */
 #define TARGET_O_NOCTTY         0x0800  /* not fcntl */
 #define TARGET_FASYNC           0x1000  /* fcntl, for BSD compatibility */
 #define TARGET_O_LARGEFILE      0x2000  /* allow large file opens */
 #define TARGET___O_SYNC         0x4000
diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
index 5f2f2df29f7..b4e2ef8aff5 100644
--- a/linux-user/mips64/target_elf.h
+++ b/linux-user/mips64/target_elf.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef MIPS64_TARGET_ELF_H
 #define MIPS64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     if ((eflags & EF_MIPS_ARCH) == EF_MIPS_ARCH_64R6) {
         return "I6400";
     }
     if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
         return "R5900";
     }
     return "5KEf";
 }
 #endif
diff --git a/linux-user/nios2/target_elf.h b/linux-user/nios2/target_elf.h
index 801e20afafa..218bc2694d4 100644
--- a/linux-user/nios2/target_elf.h
+++ b/linux-user/nios2/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef NIOS2_TARGET_ELF_H
 #define NIOS2_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/nios2/target_fcntl.h b/linux-user/nios2/target_fcntl.h
index 714583215df..47c233b29eb 100644
--- a/linux-user/nios2/target_fcntl.h
+++ b/linux-user/nios2/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef NIOS2_TARGET_FCNTL_H
 #define NIOS2_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/openrisc/target_elf.h b/linux-user/openrisc/target_elf.h
index 265ecd30794..7d8708c9e3c 100644
--- a/linux-user/openrisc/target_elf.h
+++ b/linux-user/openrisc/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef OPENRISC_TARGET_ELF_H
 #define OPENRISC_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "any";
 }
 #endif
diff --git a/linux-user/openrisc/target_fcntl.h b/linux-user/openrisc/target_fcntl.h
index ea31bf8b701..e8a7b046581 100644
--- a/linux-user/openrisc/target_fcntl.h
+++ b/linux-user/openrisc/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef OPENRISC_TARGET_FCNTL_H
 #define OPENRISC_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/ppc/target_elf.h b/linux-user/ppc/target_elf.h
index 06166188542..d7bfffbafa1 100644
--- a/linux-user/ppc/target_elf.h
+++ b/linux-user/ppc/target_elf.h
@@ -1,18 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef PPC_TARGET_ELF_H
 #define PPC_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
 #ifdef TARGET_PPC64
     return "POWER9";
 #else
     return "750";
 #endif
 }
 #endif
diff --git a/linux-user/ppc/target_fcntl.h b/linux-user/ppc/target_fcntl.h
index d74ab710cf7..66454e1b5f5 100644
--- a/linux-user/ppc/target_fcntl.h
+++ b/linux-user/ppc/target_fcntl.h
@@ -1,17 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef PPC_TARGET_FCNTL_H
 #define PPC_TARGET_FCNTL_H
 
 #define TARGET_O_DIRECTORY      040000 /* must be a directory */
 #define TARGET_O_NOFOLLOW      0100000 /* don't follow links */
 #define TARGET_O_LARGEFILE     0200000
 #define TARGET_O_DIRECT        0400000 /* direct disk access hint */
 
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.h
index 9dd65652ee4..0a5e4c72409 100644
--- a/linux-user/riscv/target_elf.h
+++ b/linux-user/riscv/target_elf.h
@@ -1,15 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef RISCV_TARGET_ELF_H
 #define RISCV_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     /* TYPE_RISCV_CPU_ANY */
     return "any";
 }
 #endif
diff --git a/linux-user/riscv/target_fcntl.h b/linux-user/riscv/target_fcntl.h
index 9c3d0fbe2b3..4e159d21500 100644
--- a/linux-user/riscv/target_fcntl.h
+++ b/linux-user/riscv/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef RISCV_TARGET_FCNTL_H
 #define RISCV_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/s390x/target_cpu.h b/linux-user/s390x/target_cpu.h
index 7cd71e2dbab..2cf6b9a7b50 100644
--- a/linux-user/s390x/target_cpu.h
+++ b/linux-user/s390x/target_cpu.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * S/390 specific CPU ABI and functions for linux-user
  *
  * Copyright (c) 2009 Ulrich Hecht
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #ifndef S390X_TARGET_CPU_H
 #define S390X_TARGET_CPU_H
diff --git a/linux-user/s390x/target_elf.h b/linux-user/s390x/target_elf.h
index 8114b59c1d6..0712b055d5e 100644
--- a/linux-user/s390x/target_elf.h
+++ b/linux-user/s390x/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef S390X_TARGET_ELF_H
 #define S390X_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "qemu";
 }
 #endif
diff --git a/linux-user/s390x/target_fcntl.h b/linux-user/s390x/target_fcntl.h
index 36dc50fba05..0d354cd2058 100644
--- a/linux-user/s390x/target_fcntl.h
+++ b/linux-user/s390x/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef S390X_TARGET_FCNTL_H
 #define S390X_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index 6bc03902628..2af86a582d7 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * safe-syscall.h: prototypes for linux-user signal-race-safe syscalls
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_USER_SAFE_SYSCALL_H
 #define LINUX_USER_SAFE_SYSCALL_H
 
diff --git a/linux-user/sh4/target_elf.h b/linux-user/sh4/target_elf.h
index f485e0cef27..0b59f734158 100644
--- a/linux-user/sh4/target_elf.h
+++ b/linux-user/sh4/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef SH4_TARGET_ELF_H
 #define SH4_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "sh7785";
 }
 #endif
diff --git a/linux-user/sh4/target_fcntl.h b/linux-user/sh4/target_fcntl.h
index 2622d95539d..c9b1845f233 100644
--- a/linux-user/sh4/target_fcntl.h
+++ b/linux-user/sh4/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef SH4_TARGET_FCNTL_H
 #define SH4_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 7457f8025c4..9202f0edfa5 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef SIGNAL_COMMON_H
diff --git a/linux-user/sparc/target_elf.h b/linux-user/sparc/target_elf.h
index a510ceb6129..3232cf6aa5c 100644
--- a/linux-user/sparc/target_elf.h
+++ b/linux-user/sparc/target_elf.h
@@ -1,18 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef SPARC_TARGET_ELF_H
 #define SPARC_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
 #ifdef TARGET_SPARC64
     return "TI UltraSparc II";
 #else
     return "Fujitsu MB86904";
 #endif
 }
 #endif
diff --git a/linux-user/sparc/target_fcntl.h b/linux-user/sparc/target_fcntl.h
index c2532989e59..31649204665 100644
--- a/linux-user/sparc/target_fcntl.h
+++ b/linux-user/sparc/target_fcntl.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef SPARC_TARGET_FCNTL_H
 #define SPARC_TARGET_FCNTL_H
 
 #define TARGET_O_APPEND         0x0008
 #define TARGET_FASYNC           0x0040  /* fcntl, for BSD compatibility */
 #define TARGET_O_CREAT          0x0200  /* not fcntl */
 #define TARGET_O_TRUNC          0x0400  /* not fcntl */
 #define TARGET_O_EXCL           0x0800  /* not fcntl */
 #define TARGET_O_DSYNC          0x2000
 #define TARGET_O_NONBLOCK       0x4000
 # ifdef TARGET_SPARC64
 #  define TARGET_O_NDELAY       0x0004
 # else
diff --git a/linux-user/strace.h b/linux-user/strace.h
index 1e232d07fc8..660696e24dd 100644
--- a/linux-user/strace.h
+++ b/linux-user/strace.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * strace.h: prototypes for linux-user builtin strace handling
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_USER_STRACE_H
 #define LINUX_USER_STRACE_H
 
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 661612a088b..9c0f7c8fea1 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * user-internals.h: prototypes etc internal to the linux-user implementation
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_USER_USER_INTERNALS_H
 #define LINUX_USER_USER_INTERNALS_H
 
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index d1dec99c024..3f0461d1374 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * user-mmap.h: prototypes for linux-user guest binary loader
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef LINUX_USER_USER_MMAP_H
 #define LINUX_USER_USER_MMAP_H
 
diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
index 7b76a90de88..a81641da9e3 100644
--- a/linux-user/x86_64/target_elf.h
+++ b/linux-user/x86_64/target_elf.h
@@ -1,14 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef X86_64_TARGET_ELF_H
 #define X86_64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return "qemu64";
 }
 #endif
diff --git a/linux-user/x86_64/target_fcntl.h b/linux-user/x86_64/target_fcntl.h
index 3c7238e56be..f62ee59eca0 100644
--- a/linux-user/x86_64/target_fcntl.h
+++ b/linux-user/x86_64/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef X86_64_TARGET_FCNTL_H
 #define X86_64_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/xtensa/target_elf.h b/linux-user/xtensa/target_elf.h
index a9a3fabd89b..fa69fd71e90 100644
--- a/linux-user/xtensa/target_elf.h
+++ b/linux-user/xtensa/target_elf.h
@@ -1,16 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef XTENSA_TARGET_ELF_H
 #define XTENSA_TARGET_ELF_H
 
 static inline const char *cpu_get_model(uint32_t eflags)
 {
     return XTENSA_DEFAULT_CPU_MODEL;
 }
 
 #endif
diff --git a/linux-user/xtensa/target_fcntl.h b/linux-user/xtensa/target_fcntl.h
index dc1ca7eaa50..a1133d44f03 100644
--- a/linux-user/xtensa/target_fcntl.h
+++ b/linux-user/xtensa/target_fcntl.h
@@ -1,11 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
  */
 
 #ifndef XTENSA_TARGET_FCNTL_H
 #define XTENSA_TARGET_FCNTL_H
 #include "../generic/fcntl.h"
 #endif
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 97e0728b679..abb8a0f99ec 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 29c52db3f13..6306ddbdfa0 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5cd..3b772830fad 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index bbe3dd175a7..2c96878f824 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 01cb6eb534e..4f96398b824 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index df9f8e8eb20..0ac89d6551f 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0d5d268609a..5200835c994 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 7f6aca934e1..968a4486bea 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/exit.c b/linux-user/exit.c
index fa6ef0b9b44..0a8d88bf664 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  exit support for qemu
  *
  *  Copyright (c) 2018 Alex Bennée <alex.bennee@linaro.org>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 69410899590..ef4c2bdcb0b 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
 
 #include <sys/signalfd.h>
 #include <linux/unistd.h>
 #include <linux/audit.h>
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index e4c2f89a226..d1b60ac0071 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /****************************************************************************/
 /*
  *  QEMU bFLT binary loader.  Based on linux/fs/binfmt_flat.c
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  *
  *      Copyright (C) 2006 CodeSourcery.
  *	Copyright (C) 2000-2003 David McCullough <davidm@snapgear.com>
  *	Copyright (C) 2002 Greg Ungerer <gerg@snapgear.com>
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba93..1307c199e18 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 74e61739a0a..ed24944e44e 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f09..826c8d4971a 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index c2fbc26ebb6..fc98fd6565f 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f6a1cc632b1..486943dbe60 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 433efa3d693..5bdbff09310 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3f..5395f1adaec 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index ec33482e140..f2bf1b88c0a 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d9..3cf8ef42fd8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user main
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index a94467dd2da..77a9859ea80 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 8ebb6a1b7df..c046a957acc 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b735c99a24a..f77adcf7626 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 8f79e405ecb..bd06bb05936 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/mips64/cpu_loop.c b/linux-user/mips64/cpu_loop.c
index 858bc5be78a..f7463aaee9b 100644
--- a/linux-user/mips64/cpu_loop.c
+++ b/linux-user/mips64/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "../mips/cpu_loop.c"
diff --git a/linux-user/mips64/signal.c b/linux-user/mips64/signal.c
index 4ed0ed90b3c..53e05159a7e 100644
--- a/linux-user/mips64/signal.c
+++ b/linux-user/mips64/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #define MIPS_TARGET_SIGNAL_H /* to only include mips64/target_signal.h */
 #include "../mips/signal.c"
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c125031b904..6941167126f 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  mmap support for qemu
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "trace.h"
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 34290fb3b51..1ed76ed7a9d 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index a77e8a40f46..8d1a0213f3f 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 3cfdbbf0372..83a8aee0bf6 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index be8b68784a2..f2366fac9a7 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 483e669300f..3566327217b 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 90a0369632f..440f99df941 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index b301dac802e..fb8c7ad2e66 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index a0f9542ce39..c1ca02f17bb 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e7..0cee4038fed 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 676b9481476..797030be8c4 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c5..e7116cbf0f7 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index faa869fb195..cd23668b348 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 81c45bfce9c..46a2733f593 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431cd..a37c779db47 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 23e1e761de4..f2c1045763e 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662ff..59b38644bcc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Linux syscalls
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #define _ATFILE_SOURCE
 #include "qemu/osdep.h"
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 1d82608c100..c78e013b9b5 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  cpu to uname machine name map
  *
  *  Copyright (c) 2009 Loïc Minier
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/vm86.c b/linux-user/vm86.c
index c2facf3fc2d..7d0e66f0af7 100644
--- a/linux-user/vm86.c
+++ b/linux-user/vm86.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  vm86 linux syscall support
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 
diff --git a/linux-user/x86_64/cpu_loop.c b/linux-user/x86_64/cpu_loop.c
index 8b5af8ea1f1..2a265aceb5b 100644
--- a/linux-user/x86_64/cpu_loop.c
+++ b/linux-user/x86_64/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "../i386/cpu_loop.c"
diff --git a/linux-user/x86_64/signal.c b/linux-user/x86_64/signal.c
index a509a38045b..8c5c075a525 100644
--- a/linux-user/x86_64/signal.c
+++ b/linux-user/x86_64/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #define I386_TARGET_SIGNAL_H /* to only include x86_64/target_signal.h */
 #include "../i386/signal.c"
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35a..310a5e11d80 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 81572a5fc7b..dbb0c4997ae 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -1,20 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
 #include "qemu.h"
-- 
2.31.1


