Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40D5728DE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:56:44 +0200 (CEST)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNs3-0006Bi-50
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoi-00086z-Jc; Tue, 12 Jul 2022 17:53:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoh-0007lj-1O; Tue, 12 Jul 2022 17:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3cSlOAz9yROSb3OzCrsjYgKrXrNnfn/ZSTlPCR363Mk=; b=wHRvOOexGdR9BriGYkjF9K5Mox
 xlygmhiRaueRnMPxly31MjTcF/Qjo0B+e8bx5gTc/bt/4dMXJP/+dUF1lf1CvMN3+spUoJ107KtvE
 /kxz0st0RDXXHyhApxmCPuFQdpoYJfco9vpqRQTk6kApFDVI2mhO3AywIo2BAJ1OURYxbTxv6TwSm
 1gzQuWN8mzU2OxSUtKT+3x4je5joq5DtsrNXciwgpCwwIyYPE8B4dBPkvDSEWdLoZfk6rM2zQjfl9
 HTbuXcVHZcA6n8UHw2iWIDR9vv9yP35gMYibwYDfrzD17ehhwlMxQ1Ajc9vNS0c+cM9shIm1YNKqc
 1QD52uPnbLel1OOhA7CeJHSQqiQuoIifi42b8jxUsVZcUI0VQbHcAEkORkZV+WBXMnGLI0LjOAOF5
 5b4hpU1Q6uypN/CPnw7SUqhtvjuLAqzXx+D99MjAR1KP/igOTTahpJxmcJfLlqw7H+pBh8iOXVGdI
 diVRkwdYS8KRUH5fceouFg5e0eJbKtUsqYSOP52u/+AyQGaezUtxRWlPyKtogzD4lMXaLpIq7UEbT
 DOjVo9q1mokWatyq3TSb8GXjDd3FUc+AwbP76rSnJxXJYCq5q1Iz0k/znTeGto3nBmv7HkYZFV3Hj
 Vx1tta4EPxCIs7frjyNindb+FKXiUy9ufDY4Cuqvg=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnC-000Bqt-VW; Tue, 12 Jul 2022 22:51:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:12 +0100
Message-Id: <20220712215251.7944-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/40] pl050: move PL050State from pl050.c to new pl050.h
 header file
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This allows the QOM types in pl050.c to be used elsewhere by simply including
pl050.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c         | 16 +---------------
 include/hw/input/pl050.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/input/pl050.h

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 209cc001cf..c7980b6ed7 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -19,26 +19,12 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/input/ps2.h"
+#include "hw/input/pl050.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 
-#define TYPE_PL050 "pl050"
-OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
-
-struct PL050State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    void *dev;
-    uint32_t cr;
-    uint32_t clk;
-    uint32_t last;
-    int pending;
-    qemu_irq irq;
-    bool is_mouse;
-};
 
 static const VMStateDescription vmstate_pl050 = {
     .name = "pl050",
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
new file mode 100644
index 0000000000..2bbf7a9d50
--- /dev/null
+++ b/include/hw/input/pl050.h
@@ -0,0 +1,35 @@
+/*
+ * Arm PrimeCell PL050 Keyboard / Mouse Interface
+ *
+ * Copyright (c) 2006-2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef HW_PL050_H
+#define HW_PL050_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/input/ps2.h"
+#include "hw/irq.h"
+
+#define TYPE_PL050 "pl050"
+OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
+
+struct PL050State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    void *dev;
+    uint32_t cr;
+    uint32_t clk;
+    uint32_t last;
+    int pending;
+    qemu_irq irq;
+    bool is_mouse;
+};
+
+#endif
-- 
2.30.2


