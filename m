Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCF382AD8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:22:22 +0200 (CEST)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libKH-0007p6-96
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAB-0004cr-S9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAA-0000f2-0z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id c14so4144613wrx.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2mMu7otbU4f+0YP+cVnXWYR+lxt0gX0e1SgI1n/TCpI=;
 b=ajS/4Q5FdjS0D0HSFo59wi0yxS6puaoxX5Xeh99l8LdjgD5WGzw9fNzaVKKXuKdbxw
 Qf15hwGq48w3ioii7k691ky+KLEb4yVuLbt9TJHIBDcy0KA8+WzaLhso+P2715wZXsEa
 FlZ3bUxuAu58FlHYd//jjVag/D2Hrqvie5QoCCnnsMx5BbJivdzlWQFEtazA+wm7WEoy
 O1h3qDGYUvcGagBaGu5FKwRaa83PlYRMa9Tj9+edQyV7TjDxeC/VuXMAqfmfZrx2Equz
 ZgY3dgD59UBwZPSmneEfSdMVlDb8gEmZfbD6LOJ6ZdZGHyrzzQ2UKbYBEZUBodgVsJVt
 5YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2mMu7otbU4f+0YP+cVnXWYR+lxt0gX0e1SgI1n/TCpI=;
 b=dw+vWV+yn14sYJ3W7UFV/67YPhY2SQUH3BLVQ1l+YnKLrjJU2vVc6pGOeXrxFUqCoD
 xC3mHXZ1zx7YvES2pXopQBDmBMQVRNsCJ73prIbhcib9zdL+bVdiU1tEywG4DXcjvsLV
 edBqNjC337Z0jL7uku4vVlzlnPUNSBbUMwWOsfFsFVCS0bZI/MVd8Xu3TmV8i/E0s6Uc
 /FKOmmsUYdHNF10hbm7mxji8zKyU0hEvY/+syZNwWVrY4lMx2j9HYxaZptQZ1K4+b4yk
 wE5KSJA4MTnQMOlBufn8GZS82MWAHULicom/+MTngnhYXB88mfIbd2UUVxDzMSjqit0u
 hCyQ==
X-Gm-Message-State: AOAM531zhmewjMAJAWbBQc5FH87v8hDrW0w6reZjXznfHr63AwZ1gJRg
 bHRfn0NvQZmqm9Bac23ZbUdyeBfyOh7Wyw==
X-Google-Smtp-Source: ABdhPJwGHDjffIIxBnVTFNlRL8R4GNWt/TfbyhUBDOWWAcJu6O0A0DmbcaS6I/MIRzAUc/MoCHD/JQ==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr4943917wrw.235.1621249911417; 
 Mon, 17 May 2021 04:11:51 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b15sm16628274wru.64.2021.05.17.04.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] exec: Restrict ioport.h to sysemu/
Date: Mon, 17 May 2021 13:11:08 +0200
Message-Id: <20210517111111.1068153-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the ioport.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/ioport.h,sysemu/ioport.h, $(git grep -l exec/ioport.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga_int.h              |  2 +-
 include/hw/dma/i8257.h            |  2 +-
 include/hw/isa/isa.h              |  2 +-
 include/{exec => sysemu}/ioport.h | 10 ++++++----
 softmmu/ioport.c                  |  2 +-
 softmmu/physmem.c                 |  2 +-
 softmmu/qtest.c                   |  2 +-
 target/i386/nvmm/nvmm-all.c       |  2 +-
 target/i386/whpx/whpx-all.c       |  2 +-
 MAINTAINERS                       |  2 +-
 10 files changed, 15 insertions(+), 13 deletions(-)
 rename include/{exec => sysemu}/ioport.h (93%)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index b923633cc4f..8db43e898a3 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -25,7 +25,7 @@
 #ifndef HW_VGA_INT_H
 #define HW_VGA_INT_H
 
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "exec/sysemu/memory.h"
 #include "ui/console.h"
 
diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index f652345d65a..e987a22fdd8 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -2,7 +2,7 @@
 #define HW_I8257_H
 
 #include "hw/isa/isa.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "qom/object.h"
 
 #define TYPE_I8257 "i8257"
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 9c9aabfc3b0..a63f1841111 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -4,7 +4,7 @@
 /* ISA bus */
 
 #include "exec/sysemu/memory.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/include/exec/ioport.h b/include/sysemu/ioport.h
similarity index 93%
rename from include/exec/ioport.h
rename to include/sysemu/ioport.h
index f94f71b19f0..b37c54ce4e5 100644
--- a/include/exec/ioport.h
+++ b/include/sysemu/ioport.h
@@ -21,8 +21,12 @@
  * IO ports API
  */
 
-#ifndef IOPORT_H
-#define IOPORT_H
+#ifndef SYSEMU_IOPORT_H
+#define SYSEMU_IOPORT_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
 #include "exec/sysemu/memory.h"
 
@@ -40,9 +44,7 @@ typedef struct MemoryRegionPortio {
 
 #define PORTIO_END_OF_LIST() { }
 
-#ifndef CONFIG_USER_ONLY
 extern const MemoryRegionOps unassigned_io_ops;
-#endif
 
 typedef struct PortioList {
     const struct MemoryRegionPortio *ports;
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index 6f297027cfe..5fabbb1832a 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -26,7 +26,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "exec/sysemu/memory.h"
 #include "exec/sysemu/address-spaces.h"
 #include "trace.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 31e490185f3..51f05eb989c 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -42,7 +42,7 @@
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "exec/sysemu/memory.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "sysemu/dma.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 2551296c727..5faf99fca13 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -17,7 +17,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "chardev/char-fe.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "exec/sysemu/memory.h"
 #include "hw/irq.h"
 #include "qemu/accel.h"
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 8adbfcb82d9..181e7378b41 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/sysemu/address-spaces.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/nvmm.h"
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 7abc77d1c1f..c7aafa4140b 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/sysemu/address-spaces.h"
-#include "exec/ioport.h"
+#include "sysemu/ioport.h"
 #include "qemu-common.h"
 #include "qemu/accel.h"
 #include "sysemu/whpx.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 48ae2145513..ca8d0feb2bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2398,7 +2398,7 @@ F: tests/tcg/multiarch/gdbstub/
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
-F: include/exec/ioport.h
+F: include/sysemu/ioport.h
 F: include/exec/memop.h
 F: include/exec/sysemu/memory.h
 F: include/exec/ram_addr.h
-- 
2.26.3


