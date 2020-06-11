Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2081F6726
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 13:49:27 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjLi2-0001CR-6J
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 07:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcR-0001xm-CE; Thu, 11 Jun 2020 07:43:39 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39957)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcQ-0001rJ-IZ; Thu, 11 Jun 2020 07:43:39 -0400
Received: by mail-wr1-x443.google.com with SMTP id h5so5822921wrc.7;
 Thu, 11 Jun 2020 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8b3HXRDRgYc7wWaPey7dft5cQmLY7o7QcJ77viT780g=;
 b=IOPrqH/Ye4O+raoOM2jedEclGHK08/B0sAxd+yvVWJOrO6r0wYafpnOIJdZRPqCiNL
 /mKWQcoHedYDBGQvy76H/r2QosdGWjMl0HklZer+4PQ+J2tZUzWN4pYw/g3v2vKcljMu
 icIa4U8uxPlEVPcGhSAuUAnJmyqIDn7Lyhx2t4SyTF6T6h0kP5xxcKGRhKgAWaRfhwfr
 erMV+tVnNes3kEjtoM4gctqxuBSDIzM7chykfLdgsRrTu1juit5DR5JiXix70c+CjrYz
 pVZUZL05XzLEJojEXoAIj4mAcnHcp4xKbSxKhfjqGfabdLqZdF1mRZT4Xyel21ZkT9NZ
 OqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8b3HXRDRgYc7wWaPey7dft5cQmLY7o7QcJ77viT780g=;
 b=sxIKasVEuBr9V6F2h5IdPIluge65F1D2IRy5MOMu1J0q3XZirxLE33y3hwwv8oJmVB
 yW1+4RPF7dOa+XFcwAg90XfLT/4nos4rh5+i7BhJnpyfJwK+pqNNUqjPqJZxdjTbTqV8
 AXGjJq9dFI/EAq/2wcqQBuVJiRkIcr+Zl4QyigpPkaw22QYqDjqq7+HdqijaJx7H60+e
 KngxeMUphAQp+TsbLmHjyi2x2iiXwJpoPqtQxc4TkV9OPSJMns0N/mnDqL9B871znac7
 UDmLBLd4vnJMAEXLS3J3i68Y1NjRxgIclrECWfz+nP2BJn8cpgVedFt1vvoCOeiPOCZ2
 eAJw==
X-Gm-Message-State: AOAM530PlbGXvfnQG6buCByr1YJoZJQX5CDfZS92G7v0RkATtkH2kEUT
 NApaiSrovSqZPJjv3LqYTP+AUj4I
X-Google-Smtp-Source: ABdhPJwln6u2PrOtmnmJUWxncBkooV2OJxy4+TvhwcjmVb5YEMawrNrmQzlE75zeq5NQloWFP8fPHQ==
X-Received: by 2002:a5d:50c9:: with SMTP id f9mr9493024wrt.9.1591875806373;
 Thu, 11 Jun 2020 04:43:26 -0700 (PDT)
Received: from x1w.redhat.com (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h29sm4832863wrc.78.2020.06.11.04.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:43:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] hw/sh4: Extract timer definitions to
 'hw/timer/tmu012.h'
Date: Thu, 11 Jun 2020 13:43:14 +0200
Message-Id: <20200611114317.13044-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200611114317.13044-1-f4bug@amsat.org>
References: <20200611114317.13044-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract timer definitions to 'hw/timer/tmu012.h'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sh4/sh.h       |  9 ---------
 include/hw/timer/tmu012.h | 23 +++++++++++++++++++++++
 hw/sh4/sh7750.c           |  1 +
 hw/timer/sh_timer.c       |  2 ++
 4 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/timer/tmu012.h

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index fe773cb01d..93f464bf4c 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -27,15 +27,6 @@ typedef struct {
 
 int sh7750_register_io_device(struct SH7750State *s,
 			      sh7750_io_device * device);
-/* sh_timer.c */
-#define TMU012_FEAT_TOCR   (1 << 0)
-#define TMU012_FEAT_3CHAN  (1 << 1)
-#define TMU012_FEAT_EXTCLK (1 << 2)
-void tmu012_init(MemoryRegion *sysmem, hwaddr base,
-                 int feat, uint32_t freq,
-		 qemu_irq ch0_irq, qemu_irq ch1_irq,
-		 qemu_irq ch2_irq0, qemu_irq ch2_irq1);
-
 
 /* sh_serial.c */
 #define SH_SERIAL_FEAT_SCIF (1 << 0)
diff --git a/include/hw/timer/tmu012.h b/include/hw/timer/tmu012.h
new file mode 100644
index 0000000000..808ed8de1d
--- /dev/null
+++ b/include/hw/timer/tmu012.h
@@ -0,0 +1,23 @@
+/*
+ * SuperH Timer
+ *
+ * Copyright (c) 2007 Magnus Damm
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef HW_TIMER_TMU012_H
+#define HW_TIMER_TMU012_H
+
+#include "exec/hwaddr.h"
+
+#define TMU012_FEAT_TOCR   (1 << 0)
+#define TMU012_FEAT_3CHAN  (1 << 1)
+#define TMU012_FEAT_EXTCLK (1 << 2)
+
+void tmu012_init(MemoryRegion *sysmem, hwaddr base,
+                 int feat, uint32_t freq,
+                 qemu_irq ch0_irq, qemu_irq ch1_irq,
+                 qemu_irq ch2_irq0, qemu_irq ch2_irq1);
+
+#endif
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index d660714443..f8ac3ec6e3 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -30,6 +30,7 @@
 #include "sh7750_regs.h"
 #include "sh7750_regnames.h"
 #include "hw/sh4/sh_intc.h"
+#include "hw/timer/tmu012.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 13c4051808..b9cbacf5d0 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -9,10 +9,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/memory.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "qemu/timer.h"
+#include "hw/timer/tmu012.h"
 #include "hw/ptimer.h"
 
 //#define DEBUG_TIMER
-- 
2.21.3


