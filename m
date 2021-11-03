Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3D444999
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:34:28 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miMxn-0006w4-NX
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miMvU-0003jO-Lm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:32:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miMvO-00017h-VJ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:32:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s13so5435528wrb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1pdyf+T3jWSWnsfpovW/Czgl+XS74wBRqPgEw6stK0E=;
 b=qfmS9EOu+YUUQ4STQ/a8Q8xrLsnVnDyzxNGvXipY3jcwxwKadH73GEx7kl/h7kHVHn
 0IEh4ayMNcAtKnA2ZCdtsleK6eS3Ef/rxFcVJlMpeYqMqJvi3p2fwu2UFh3EKLsWPgsU
 MOxn4nphMGQEFILY40T/eJFin7l1MKLWOGnGh+gatwunDPENc4E+aGhS6TGJeSYEIQJG
 FkHiDsuWyCdtcrN5imzKZrUT/6e/tyXhnNEqig2gZwJfao+9jcILPGpgEE0CX3ys0tgy
 XyQApZvfRyzyGPrmJ2vKRF+8JftueU/zO15QeU9lXgxUISNrPX5eT7KKXCJgawm8OovK
 WnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1pdyf+T3jWSWnsfpovW/Czgl+XS74wBRqPgEw6stK0E=;
 b=WswIzgaZXUCn+8DyHhHq9/lqVw66Z0jZo50MyHvft5Bf5gwfLJ3O6hXgWu5MwcQGOY
 69u4vmb5oycuzoUaOYcVC7ybQbcM6V3n6G1oHyN0tWmfR8+niZ8fxtx5uEpXRmWwGyVQ
 5MXal/rsdf1st99U7JSpA1EHszqOYzh5k5QEINz85XF73NgzD/TIHnfadFepoiIBgJS6
 FSMYZJOmYwNcpuVFctUskceEV+UaS9B0nIjnXtx8mrwR0vaGmKOi8tn22VudGCpBFjZU
 7LNkCNi4rfoewYShWyeqkc9c5JY2/xN4mdOAdFlxqNbP9c+wvYbAqamyHNsmRBiyjInr
 Xc+A==
X-Gm-Message-State: AOAM532WXPDfOMwXazH4Vearpho6FtIZWliZgCZoGAHMgPmwtf7Lw1ut
 OljrkOv2j3Z6HSLi05aV/V6PSgM+PYw=
X-Google-Smtp-Source: ABdhPJxIORlCBiFWKfYQup/3B81SDyaYkYXKC0MKQLNXI+7LagfK/+yxR2jiK4pu0bkOYobhb3WKsA==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr42661437wru.108.1635971508250; 
 Wed, 03 Nov 2021 13:31:48 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k6sm2976436wri.83.2021.11.03.13.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:31:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Date: Wed,  3 Nov 2021 21:31:46 +0100
Message-Id: <20211103203146.3630550-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use Qualcomm License Identifier tool [*] to classify linux-user/
files per license type, filtering those matching at least 60% the
"GPLv2 or later" type, and manually add the GPL-2.0-or-later SPDX
comment.

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

[*] Qualcomm Open Source Technology Group License Identifier tool
    https://www.codeaurora.org/projects/qualcomm-ostg-lid
    https://github.com/quic/lid#usage

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/aarch64/target_elf.h      | 2 ++
 linux-user/aarch64/target_fcntl.h    | 2 ++
 linux-user/alpha/target_elf.h        | 2 ++
 linux-user/alpha/target_fcntl.h      | 2 ++
 linux-user/arm/target_elf.h          | 2 ++
 linux-user/arm/target_fcntl.h        | 2 ++
 linux-user/cpu_loop-common.h         | 2 ++
 linux-user/cris/target_elf.h         | 2 ++
 linux-user/cris/target_fcntl.h       | 2 ++
 linux-user/fd-trans.h                | 2 ++
 linux-user/hexagon/sockbits.h        | 2 ++
 linux-user/hexagon/target_cpu.h      | 2 ++
 linux-user/hexagon/target_elf.h      | 2 ++
 linux-user/hexagon/target_fcntl.h    | 2 ++
 linux-user/hexagon/target_signal.h   | 2 ++
 linux-user/hexagon/target_structs.h  | 2 ++
 linux-user/hexagon/target_syscall.h  | 2 ++
 linux-user/hexagon/termbits.h        | 2 ++
 linux-user/hppa/target_elf.h         | 2 ++
 linux-user/hppa/target_fcntl.h       | 2 ++
 linux-user/i386/target_elf.h         | 2 ++
 linux-user/i386/target_fcntl.h       | 2 ++
 linux-user/loader.h                  | 2 ++
 linux-user/m68k/target_elf.h         | 2 ++
 linux-user/m68k/target_fcntl.h       | 2 ++
 linux-user/microblaze/target_elf.h   | 2 ++
 linux-user/microblaze/target_fcntl.h | 2 ++
 linux-user/mips/target_fcntl.h       | 2 ++
 linux-user/mips64/target_elf.h       | 2 ++
 linux-user/nios2/target_elf.h        | 2 ++
 linux-user/nios2/target_fcntl.h      | 2 ++
 linux-user/openrisc/target_elf.h     | 2 ++
 linux-user/openrisc/target_fcntl.h   | 2 ++
 linux-user/ppc/target_elf.h          | 2 ++
 linux-user/ppc/target_fcntl.h        | 2 ++
 linux-user/riscv/target_elf.h        | 2 ++
 linux-user/riscv/target_fcntl.h      | 2 ++
 linux-user/s390x/target_cpu.h        | 2 ++
 linux-user/s390x/target_elf.h        | 2 ++
 linux-user/s390x/target_fcntl.h      | 2 ++
 linux-user/safe-syscall.h            | 2 ++
 linux-user/sh4/target_elf.h          | 2 ++
 linux-user/sh4/target_fcntl.h        | 2 ++
 linux-user/signal-common.h           | 2 ++
 linux-user/sparc/target_elf.h        | 2 ++
 linux-user/sparc/target_fcntl.h      | 2 ++
 linux-user/strace.h                  | 2 ++
 linux-user/user-internals.h          | 2 ++
 linux-user/user-mmap.h               | 2 ++
 linux-user/x86_64/target_elf.h       | 2 ++
 linux-user/x86_64/target_fcntl.h     | 2 ++
 linux-user/xtensa/target_elf.h       | 2 ++
 linux-user/xtensa/target_fcntl.h     | 2 ++
 linux-user/aarch64/cpu_loop.c        | 2 ++
 linux-user/aarch64/signal.c          | 2 ++
 linux-user/alpha/cpu_loop.c          | 2 ++
 linux-user/alpha/signal.c            | 2 ++
 linux-user/arm/cpu_loop.c            | 2 ++
 linux-user/arm/signal.c              | 2 ++
 linux-user/cris/cpu_loop.c           | 2 ++
 linux-user/cris/signal.c             | 2 ++
 linux-user/exit.c                    | 2 ++
 linux-user/fd-trans.c                | 2 ++
 linux-user/flatload.c                | 2 ++
 linux-user/hexagon/cpu_loop.c        | 2 ++
 linux-user/hexagon/signal.c          | 2 ++
 linux-user/hppa/cpu_loop.c           | 2 ++
 linux-user/hppa/signal.c             | 2 ++
 linux-user/i386/cpu_loop.c           | 2 ++
 linux-user/i386/signal.c             | 2 ++
 linux-user/m68k/cpu_loop.c           | 2 ++
 linux-user/m68k/signal.c             | 2 ++
 linux-user/main.c                    | 2 ++
 linux-user/microblaze/cpu_loop.c     | 2 ++
 linux-user/microblaze/signal.c       | 2 ++
 linux-user/mips/cpu_loop.c           | 2 ++
 linux-user/mips/signal.c             | 2 ++
 linux-user/mips64/cpu_loop.c         | 2 ++
 linux-user/mips64/signal.c           | 2 ++
 linux-user/mmap.c                    | 2 ++
 linux-user/nios2/cpu_loop.c          | 2 ++
 linux-user/nios2/signal.c            | 2 ++
 linux-user/openrisc/cpu_loop.c       | 2 ++
 linux-user/openrisc/signal.c         | 2 ++
 linux-user/ppc/cpu_loop.c            | 2 ++
 linux-user/ppc/signal.c              | 2 ++
 linux-user/riscv/cpu_loop.c          | 2 ++
 linux-user/riscv/signal.c            | 2 ++
 linux-user/s390x/cpu_loop.c          | 2 ++
 linux-user/s390x/signal.c            | 2 ++
 linux-user/sh4/cpu_loop.c            | 2 ++
 linux-user/sh4/signal.c              | 2 ++
 linux-user/signal.c                  | 2 ++
 linux-user/sparc/cpu_loop.c          | 2 ++
 linux-user/sparc/signal.c            | 2 ++
 linux-user/syscall.c                 | 2 ++
 linux-user/uname.c                   | 2 ++
 linux-user/vm86.c                    | 2 ++
 linux-user/x86_64/cpu_loop.c         | 2 ++
 linux-user/x86_64/signal.c           | 2 ++
 linux-user/xtensa/cpu_loop.c         | 2 ++
 linux-user/xtensa/signal.c           | 2 ++
 linux-user/errnos.c.inc              | 2 ++
 103 files changed, 206 insertions(+)

diff --git a/linux-user/aarch64/target_elf.h b/linux-user/aarch64/target_elf.h
index a7eb962fba7..7c50bb656b7 100644
--- a/linux-user/aarch64/target_elf.h
+++ b/linux-user/aarch64/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/aarch64/target_fcntl.h b/linux-user/aarch64/target_fcntl.h
index efdf6e5f058..6a944dce72e 100644
--- a/linux-user/aarch64/target_fcntl.h
+++ b/linux-user/aarch64/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/alpha/target_elf.h b/linux-user/alpha/target_elf.h
index 344e9f4d395..5ce7bc157f8 100644
--- a/linux-user/alpha/target_elf.h
+++ b/linux-user/alpha/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
index 99774d73172..7197ed1bd9e 100644
--- a/linux-user/alpha/target_fcntl.h
+++ b/linux-user/alpha/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/arm/target_elf.h b/linux-user/arm/target_elf.h
index 58ff6a0986f..a0a029275ce 100644
--- a/linux-user/arm/target_elf.h
+++ b/linux-user/arm/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/arm/target_fcntl.h b/linux-user/arm/target_fcntl.h
index c8ff6b2505a..8feb6b67369 100644
--- a/linux-user/arm/target_fcntl.h
+++ b/linux-user/arm/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 8828af28a4d..63979b57d3d 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/cris/target_elf.h b/linux-user/cris/target_elf.h
index 99eb4ec7046..2eccd496331 100644
--- a/linux-user/cris/target_elf.h
+++ b/linux-user/cris/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/cris/target_fcntl.h b/linux-user/cris/target_fcntl.h
index df0aceea344..7f3daecb164 100644
--- a/linux-user/cris/target_fcntl.h
+++ b/linux-user/cris/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index 1b9fa2041c0..2fb94d3f58e 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -1,5 +1,7 @@
 /*
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/sockbits.h b/linux-user/hexagon/sockbits.h
index b7ad5dc60e5..9ee09c52dfe 100644
--- a/linux-user/hexagon/sockbits.h
+++ b/linux-user/hexagon/sockbits.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_cpu.h b/linux-user/hexagon/target_cpu.h
index ecb76e9268e..92bd3bf0846 100644
--- a/linux-user/hexagon/target_cpu.h
+++ b/linux-user/hexagon/target_cpu.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_elf.h b/linux-user/hexagon/target_elf.h
index b4e9f405272..abadb6d91a9 100644
--- a/linux-user/hexagon/target_elf.h
+++ b/linux-user/hexagon/target_elf.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_fcntl.h b/linux-user/hexagon/target_fcntl.h
index 2892db80989..e9ad26fa2fb 100644
--- a/linux-user/hexagon/target_fcntl.h
+++ b/linux-user/hexagon/target_fcntl.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 9e0223d3222..fd9d96c2a47 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_structs.h b/linux-user/hexagon/target_structs.h
index c217d9442ae..f5a5479cda7 100644
--- a/linux-user/hexagon/target_structs.h
+++ b/linux-user/hexagon/target_structs.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/target_syscall.h b/linux-user/hexagon/target_syscall.h
index 7f91a4abc77..6a4cff0f64c 100644
--- a/linux-user/hexagon/target_syscall.h
+++ b/linux-user/hexagon/target_syscall.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/termbits.h b/linux-user/hexagon/termbits.h
index 49f974cdde1..2e40fccbf21 100644
--- a/linux-user/hexagon/termbits.h
+++ b/linux-user/hexagon/termbits.h
@@ -1,7 +1,9 @@
 /*
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hppa/target_elf.h b/linux-user/hppa/target_elf.h
index 82b4e9535e1..4955c00240e 100644
--- a/linux-user/hppa/target_elf.h
+++ b/linux-user/hppa/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
index 4eb0ec98e25..31c95011021 100644
--- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
index 1c6142e7da0..2a5c78906e6 100644
--- a/linux-user/i386/target_elf.h
+++ b/linux-user/i386/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/i386/target_fcntl.h b/linux-user/i386/target_fcntl.h
index 4819743dae4..5d31309254b 100644
--- a/linux-user/i386/target_fcntl.h
+++ b/linux-user/i386/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/loader.h b/linux-user/loader.h
index f375ee0679b..fd25e7be65f 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -1,7 +1,9 @@
 /*
  * loader.h: prototypes for linux-user guest binary loader
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/m68k/target_elf.h b/linux-user/m68k/target_elf.h
index 998fe0fe2f3..3562e775eac 100644
--- a/linux-user/m68k/target_elf.h
+++ b/linux-user/m68k/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/m68k/target_fcntl.h b/linux-user/m68k/target_fcntl.h
index 068bc3243e0..66a5a8c2762 100644
--- a/linux-user/m68k/target_fcntl.h
+++ b/linux-user/m68k/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/microblaze/target_elf.h b/linux-user/microblaze/target_elf.h
index 8a8f1debff9..b64aaa1e2a2 100644
--- a/linux-user/microblaze/target_elf.h
+++ b/linux-user/microblaze/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/microblaze/target_fcntl.h b/linux-user/microblaze/target_fcntl.h
index 45402275fff..08faa3c1553 100644
--- a/linux-user/microblaze/target_fcntl.h
+++ b/linux-user/microblaze/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/mips/target_fcntl.h b/linux-user/mips/target_fcntl.h
index 6fc7b8a12bf..06aa89e5a01 100644
--- a/linux-user/mips/target_fcntl.h
+++ b/linux-user/mips/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
index 5f2f2df29f7..84d4e178176 100644
--- a/linux-user/mips64/target_elf.h
+++ b/linux-user/mips64/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/nios2/target_elf.h b/linux-user/nios2/target_elf.h
index 801e20afafa..ad1856436ef 100644
--- a/linux-user/nios2/target_elf.h
+++ b/linux-user/nios2/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/nios2/target_fcntl.h b/linux-user/nios2/target_fcntl.h
index 714583215df..719defd92a8 100644
--- a/linux-user/nios2/target_fcntl.h
+++ b/linux-user/nios2/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/openrisc/target_elf.h b/linux-user/openrisc/target_elf.h
index 265ecd30794..9c919ad837d 100644
--- a/linux-user/openrisc/target_elf.h
+++ b/linux-user/openrisc/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/openrisc/target_fcntl.h b/linux-user/openrisc/target_fcntl.h
index ea31bf8b701..eca172d17d2 100644
--- a/linux-user/openrisc/target_fcntl.h
+++ b/linux-user/openrisc/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/ppc/target_elf.h b/linux-user/ppc/target_elf.h
index 06166188542..7f01a32b417 100644
--- a/linux-user/ppc/target_elf.h
+++ b/linux-user/ppc/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/ppc/target_fcntl.h b/linux-user/ppc/target_fcntl.h
index d74ab710cf7..5b6e7688acf 100644
--- a/linux-user/ppc/target_fcntl.h
+++ b/linux-user/ppc/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/riscv/target_elf.h b/linux-user/riscv/target_elf.h
index 9dd65652ee4..fbd3510fc5b 100644
--- a/linux-user/riscv/target_elf.h
+++ b/linux-user/riscv/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/riscv/target_fcntl.h b/linux-user/riscv/target_fcntl.h
index 9c3d0fbe2b3..541c85bc5b8 100644
--- a/linux-user/riscv/target_fcntl.h
+++ b/linux-user/riscv/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/s390x/target_cpu.h b/linux-user/s390x/target_cpu.h
index 7cd71e2dbab..60b335643d9 100644
--- a/linux-user/s390x/target_cpu.h
+++ b/linux-user/s390x/target_cpu.h
@@ -2,8 +2,10 @@
  * S/390 specific CPU ABI and functions for linux-user
  *
  * Copyright (c) 2009 Ulrich Hecht
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
diff --git a/linux-user/s390x/target_elf.h b/linux-user/s390x/target_elf.h
index 8114b59c1d6..c61236b93de 100644
--- a/linux-user/s390x/target_elf.h
+++ b/linux-user/s390x/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/s390x/target_fcntl.h b/linux-user/s390x/target_fcntl.h
index 36dc50fba05..0f14258f507 100644
--- a/linux-user/s390x/target_fcntl.h
+++ b/linux-user/s390x/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index 6bc03902628..900c72faf7e 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -1,7 +1,9 @@
 /*
  * safe-syscall.h: prototypes for linux-user signal-race-safe syscalls
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sh4/target_elf.h b/linux-user/sh4/target_elf.h
index f485e0cef27..e0594954e22 100644
--- a/linux-user/sh4/target_elf.h
+++ b/linux-user/sh4/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/sh4/target_fcntl.h b/linux-user/sh4/target_fcntl.h
index 2622d95539d..a19a858ff3b 100644
--- a/linux-user/sh4/target_fcntl.h
+++ b/linux-user/sh4/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 7457f8025c4..e0ce1daaf45 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sparc/target_elf.h b/linux-user/sparc/target_elf.h
index a510ceb6129..677e7a9c10e 100644
--- a/linux-user/sparc/target_elf.h
+++ b/linux-user/sparc/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/sparc/target_fcntl.h b/linux-user/sparc/target_fcntl.h
index c2532989e59..209c72f312e 100644
--- a/linux-user/sparc/target_fcntl.h
+++ b/linux-user/sparc/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/strace.h b/linux-user/strace.h
index 1e232d07fc8..e0b21a8bebf 100644
--- a/linux-user/strace.h
+++ b/linux-user/strace.h
@@ -1,7 +1,9 @@
 /*
  * strace.h: prototypes for linux-user builtin strace handling
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 661612a088b..605da369412 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -1,7 +1,9 @@
 /*
  * user-internals.h: prototypes etc internal to the linux-user implementation
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
index d1dec99c024..7f800f2bab2 100644
--- a/linux-user/user-mmap.h
+++ b/linux-user/user-mmap.h
@@ -1,7 +1,9 @@
 /*
  * user-mmap.h: prototypes for linux-user guest binary loader
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
index 7b76a90de88..c2751593047 100644
--- a/linux-user/x86_64/target_elf.h
+++ b/linux-user/x86_64/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/x86_64/target_fcntl.h b/linux-user/x86_64/target_fcntl.h
index 3c7238e56be..64a79d35e5b 100644
--- a/linux-user/x86_64/target_fcntl.h
+++ b/linux-user/x86_64/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/xtensa/target_elf.h b/linux-user/xtensa/target_elf.h
index a9a3fabd89b..f67b0b00816 100644
--- a/linux-user/xtensa/target_elf.h
+++ b/linux-user/xtensa/target_elf.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/xtensa/target_fcntl.h b/linux-user/xtensa/target_fcntl.h
index dc1ca7eaa50..14c4d5d1d6c 100644
--- a/linux-user/xtensa/target_fcntl.h
+++ b/linux-user/xtensa/target_fcntl.h
@@ -1,5 +1,7 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation, or (at your option) any
  * later version. See the COPYING file in the top-level directory.
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 97e0728b679..c4bbe845420 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 29c52db3f13..74967d1157a 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 4029849d5cd..4896e25d8c4 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index bbe3dd175a7..92437c032cc 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 01cb6eb534e..50e050c0350 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index df9f8e8eb20..a1c218033d1 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 0d5d268609a..2abc7f0286d 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 7f6aca934e1..162df62930a 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/exit.c b/linux-user/exit.c
index fa6ef0b9b44..970b64727b7 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -2,8 +2,10 @@
  *  exit support for qemu
  *
  *  Copyright (c) 2018 Alex Bennée <alex.bennee@linaro.org>
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 69410899590..1ef211e02d5 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1,5 +1,7 @@
 /*
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index e4c2f89a226..d91bf733475 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -1,8 +1,10 @@
 /****************************************************************************/
 /*
  *  QEMU bFLT binary loader.  Based on linux/fs/binfmt_flat.c
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba93..285dde2e800 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -3,8 +3,10 @@
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 74e61739a0a..bc2466f8184 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -3,8 +3,10 @@
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f09..a38f137c3de 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index c2fbc26ebb6..6aa9f203fc6 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f6a1cc632b1..b5a6dfaacc1 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 433efa3d693..2157b998669 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3f..5ebee46a99c 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index ec33482e140..cec8cfe23ef 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d9..afb67bbdd64 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -2,8 +2,10 @@
  *  qemu user main
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index a94467dd2da..18a435aab7f 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index 8ebb6a1b7df..c274b48a098 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b735c99a24a..576b2b40148 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index 8f79e405ecb..011ef25df22 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/mips64/cpu_loop.c b/linux-user/mips64/cpu_loop.c
index 858bc5be78a..b53efeb96f0 100644
--- a/linux-user/mips64/cpu_loop.c
+++ b/linux-user/mips64/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/mips64/signal.c b/linux-user/mips64/signal.c
index 4ed0ed90b3c..f952d63f51d 100644
--- a/linux-user/mips64/signal.c
+++ b/linux-user/mips64/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c125031b904..74c533f5f03 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -2,8 +2,10 @@
  *  mmap support for qemu
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 34290fb3b51..3de3dc609e6 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index a77e8a40f46..334d9997366 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index 3cfdbbf0372..d2824fe17c7 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index be8b68784a2..7e228ea7dce 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 483e669300f..6d6523de64e 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 90a0369632f..083eede016f 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index b301dac802e..31bed421abc 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index a0f9542ce39..a7f4356c0bf 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index d089c8417e7..29743ed13b2 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 676b9481476..102a9e5ead0 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c5..7baa92adcf0 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index faa869fb195..5f303b30e71 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 81c45bfce9c..cc34ec35d3b 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431cd..a59b4bb768c 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 23e1e761de4..de8b6da6f22 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662ff..de22674909d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2,8 +2,10 @@
  *  Linux syscalls
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 1d82608c100..f633116c049 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -2,8 +2,10 @@
  *  cpu to uname machine name map
  *
  *  Copyright (c) 2009 Loïc Minier
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/vm86.c b/linux-user/vm86.c
index c2facf3fc2d..eaf13b61375 100644
--- a/linux-user/vm86.c
+++ b/linux-user/vm86.c
@@ -2,8 +2,10 @@
  *  vm86 linux syscall support
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/x86_64/cpu_loop.c b/linux-user/x86_64/cpu_loop.c
index 8b5af8ea1f1..e0342bd351f 100644
--- a/linux-user/x86_64/cpu_loop.c
+++ b/linux-user/x86_64/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/x86_64/signal.c b/linux-user/x86_64/signal.c
index a509a38045b..ba48fb8b271 100644
--- a/linux-user/x86_64/signal.c
+++ b/linux-user/x86_64/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index a83490ab35a..87c830fa2ac 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -2,8 +2,10 @@
  *  qemu user cpu loop
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 81572a5fc7b..07dd1fd3351 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -2,8 +2,10 @@
  *  Emulation of Linux signals
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
index 963ba1ce9d1..00885dcc420 100644
--- a/linux-user/errnos.c.inc
+++ b/linux-user/errnos.c.inc
@@ -5,8 +5,10 @@
  * Please keep this list sorted alphabetically.
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
-- 
2.31.1


