Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB41A54750D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 15:57:30 +0200 (CEST)
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01cG-00014g-I9
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 09:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a2-0006g5-P8
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:10 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a0-0003Ts-VP
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:10 -0400
Received: by mail-il1-x129.google.com with SMTP id f7so1220553ilr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiXsSVcrhF7BWVAG8uOdFIspQEoyKovlyV1pkZ4B/0A=;
 b=wVCmQt74SDQPB13xwExZaRkydhPWjzENWyPrnrorYdzoEKK05woRFuSnjDbaLdzkky
 VP4e7F0CW8EGNARkYRf30EIEOxUwfzxsFX3x6m6l2PwdELVVmRHbD3WnvDKRFq/t5tTe
 X8KlOe4MGmRkALyUv/u2hWM3NqfoTNRNdMALKrt1FrAffLig8PwTbqFJ432fpbWvYAyT
 pbpePQnTlC5l8Z0INXuvnuHtQgrZnQebp52iV9meQdLVbS6AC1RVBULJjmE89MM0WoW7
 eDecaGEN4crf1gxJhcss+wGL6kTCii7+EfcDHmwPLFh05648hJWH+hkydkJ2X/SE0934
 v6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiXsSVcrhF7BWVAG8uOdFIspQEoyKovlyV1pkZ4B/0A=;
 b=pcyIlaGnV9RnVfDCfJJSbkemv4jbzXtItJBXPtPopxrzAAPDg2boFadQAPD/WLR/PI
 trTW3qUnYLgZKRjKgEJ173b6zWPhL+9RDCWl+p1P5JV/8eVjJPgw8JYO+VWu66noJlnm
 7Drun3cISFDoO8m9oQ1F3EE7Gh42TjZC8mYfLAZf7CJJXGKD/RPH7GrKoRNc3tvk/Knp
 AQ6PgxMTWe3RpodtCoo04+JRFiwNKOLiAm6hGThLJ27AiMRJb7Lxe+Q0OPRl1n3C+F8y
 5zZUfWq1HBEML9XsBpGaM+jPn8z7Iv4mZwjZE7ZbxDrfMV63uVd4wXWJJrhBudp5EgjN
 /9Ew==
X-Gm-Message-State: AOAM530ne2lg2IITs4pw7A9eNszRXBfaU9GaLIMRu51q9KJLRkR4OJPZ
 HUPpj54CuZJ8mw4+uuxXoOWfKHMaUf4A0A==
X-Google-Smtp-Source: ABdhPJzGfr3hoW200lBj5ysOyhxgB+jAaSr334tX70+jDmGxclOdgeBD2Q3QT7cpR3hFfGP7K9kJBA==
X-Received: by 2002:a05:6e02:b23:b0:2d1:b62a:d9ae with SMTP id
 e3-20020a056e020b2300b002d1b62ad9aemr26950494ilu.291.1654955707889; 
 Sat, 11 Jun 2022 06:55:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 6/6] bsd-user/freebsd/os-syscall.c: Implement exit
Date: Sat, 11 Jun 2022 07:55:14 -0600
Message-Id: <20220611135514.92882-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
References: <20220611135514.92882-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the exit system call. Bring in bsd-proc.h to contain all the
process system call implementation and helper routines.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/bsd-proc.h           | 42 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  7 ++++++
 2 files changed, 49 insertions(+)
 create mode 100644 bsd-user/bsd-proc.h

diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
new file mode 100644
index 00000000000..68b66e571d3
--- /dev/null
+++ b/bsd-user/bsd-proc.h
@@ -0,0 +1,42 @@
+/*
+ *  process related system call shims and definitions
+ *
+ *  Copyright (c) 2013-2014 Stacey D. Son
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
+#ifndef BSD_PROC_H_
+#define BSD_PROC_H_
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/resource.h>
+#include <unistd.h>
+
+/* exit(2) */
+static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
+{
+#ifdef TARGET_GPROF
+    _mcleanup();
+#endif
+    gdb_exit(arg1);
+    qemu_plugin_user_exit();
+    _exit(arg1);
+
+    return 0;
+}
+
+#endif /* !BSD_PROC_H_ */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 3a33d54fa4d..71aa0d38e03 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -41,6 +41,7 @@
 #include "user/syscall-trace.h"
 
 #include "bsd-file.h"
+#include "bsd-proc.h"
 
 /* I/O */
 safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
@@ -215,6 +216,12 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 
     switch (num) {
+        /*
+         * process system calls
+         */
+    case TARGET_FREEBSD_NR_exit: /* exit(2) */
+        ret = do_bsd_exit(cpu_env, arg1);
+        break;
 
         /*
          * File system calls.
-- 
2.33.1


