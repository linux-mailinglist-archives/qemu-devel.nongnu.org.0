Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D9318B5A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:02:44 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABcJ-0001kj-C0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYu-0007xU-HZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYs-0008Nl-HJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so5656739wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z8oR6cjhvDNb7fmg2sC9i29QfpU4+AsUPB9KwGEI9Q0=;
 b=b7zkPbj5BU+kJeBFrE6YLlanpx3LqQ2FqwK6CwQZVXrul3hpEw9GXtGjpsnWSXPgIR
 6kEbPQ9yINGL+BosAYurmEvzy98Hv09Lb9p4jXOnZrINnHTNsKHUGbtr9N3sZllpWxyl
 Piy5w3QcZPSCCUvbF6KOW+u8L9TAMScyIcNszGpGmm8tpC5i+qKJ5anlWaFCWoDMcv31
 aYl4WiqHX1Cw0/dF/A3iHSu0NsjKlYm17Qni7qbmT5XIDjGdvv32qggYlikAcqNUDdEs
 f0hlp0fgzURxVT8oskmsItySrZDI/uA32mQhlnPEJ2o2atKm1VX03pyH4KTYHfYBLT4t
 WOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8oR6cjhvDNb7fmg2sC9i29QfpU4+AsUPB9KwGEI9Q0=;
 b=etzz5NKsmSV8t4nnrZmTuEQoZHlrcHHsnO4+IznrqKyaRQ9/9pIMm2uxIksNHkVS/a
 FE//WhEVsyB2GlY6bSzii8E49Jaz+etayKdLdTlN4IxycFv8670IqdrWqKka+jvUaJkW
 v93GnKHujhwpv+mA5mr1XGs+4yTIhmKZVwzb26kK4l5c6nppHOQLne0Q3Dysdqt5Touw
 ZAfxgSqHU39yEtYCsVqP40GDpVvp+QsD+UxORb7Zd7WjLtzqh9Pp9okr8bmmQRU/5Ske
 H/5oUTTBJhniKg6ZFiKfE++zZWuRnBo09ImGhEuz3Ah6mB77cYJWeGg+fo/58O8vDXa9
 TN6A==
X-Gm-Message-State: AOAM5333VLic0PRLl+YcIfWcmFC932gAQBlc6oUD2AcHVzZrUjzbjvAP
 tFBXojlEzcGvl3fXkc7h+I2J9gBidBeVRA==
X-Google-Smtp-Source: ABdhPJwbhc/jN0NbzeRhJnJXPs/782/XC+/B0OQOLpgj7fRSnR3NGoO8OgBtrzzAkjLVHDMPMHN31g==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr5132083wmc.185.1613048349152; 
 Thu, 11 Feb 2021 04:59:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] arm: Update infocenter.arm.com URLs
Date: Thu, 11 Feb 2021 12:58:23 +0000
Message-Id: <20210211125900.22777-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update infocenter.arm.com URLs for various pieces of Arm
documentation to the new developer.arm.com equivalents.  (There is a
redirection in place from the old URLs, but we might as well update
our comments in case the redirect ever disappears in future.)

This patch covers all the URLs which are not MPS2/SSE-200/IoTKit
related (those are dealt with in a different patch).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210205171456.19939-1-peter.maydell@linaro.org
---
 include/hw/dma/pl080.h                 | 7 ++++---
 include/hw/misc/arm_integrator_debug.h | 2 +-
 include/hw/ssi/pl022.h                 | 5 +++--
 hw/arm/aspeed_ast2600.c                | 2 +-
 hw/arm/musca.c                         | 4 ++--
 hw/misc/arm_integrator_debug.c         | 2 +-
 hw/timer/arm_timer.c                   | 7 ++++---
 7 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index 1883f042701..3c9659e4381 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -10,11 +10,12 @@
  * (at your option) any later version.
  */
 
-/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
+/*
+ * This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
  * The PL080 TRM is:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.pdf
+ * https://developer.arm.com/documentation/ddi0196/latest
  * and the PL081 TRM is:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0218e/DDI0218.pdf
+ * https://developer.arm.com/documentation/ddi0218/latest
  *
  * QEMU interface:
  * + sysbus IRQ 0: DMACINTR combined interrupt line
diff --git a/include/hw/misc/arm_integrator_debug.h b/include/hw/misc/arm_integrator_debug.h
index 0077dacb44d..798b0821646 100644
--- a/include/hw/misc/arm_integrator_debug.h
+++ b/include/hw/misc/arm_integrator_debug.h
@@ -3,7 +3,7 @@
  *
  * Browse the data sheet:
  *
- *    http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0159b/Babbfijf.html
+ *  https://developer.arm.com/documentation/dui0159/b/peripherals-and-interfaces/debug-leds-and-dip-switch-interface
  *
  * Copyright (c) 2013 Alex Bennée <alex@bennee.com>
  *
diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
index 545b52689c1..25d58db5f32 100644
--- a/include/hw/ssi/pl022.h
+++ b/include/hw/ssi/pl022.h
@@ -9,9 +9,10 @@
  * (at your option) any later version.
  */
 
-/* This is a model of the Arm PrimeCell PL022 synchronous serial port.
+/*
+ * This is a model of the Arm PrimeCell PL022 synchronous serial port.
  * The PL022 TRM is:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0194h/DDI0194H_ssp_pl022_trm.pdf
+ * https://developer.arm.com/documentation/ddi0194/latest
  *
  * QEMU interface:
  * + sysbus IRQ: SSPINTR combined interrupt line
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 12e4a16d376..bf31ca351fe 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -216,7 +216,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 /*
  * ASPEED ast2600 has 0xf as cluster ID
  *
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0388e/CIHEBGFG.html
+ * https://developer.arm.com/documentation/ddi0388/e/the-system-control-coprocessors/summary-of-system-control-coprocessor-registers/multiprocessor-affinity-register
  */
 static uint64_t aspeed_calc_affinity(int cpu)
 {
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 945643c3cd7..7a83f7dda7d 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -15,8 +15,8 @@
  * https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-a-test-chip-board
  * https://developer.arm.com/products/system-design/development-boards/iot-test-chips-and-boards/musca-b-test-chip-board
  * We model the A and B1 variants of this board, as described in the TRMs:
- * http://infocenter.arm.com/help/topic/com.arm.doc.101107_0000_00_en/index.html
- * http://infocenter.arm.com/help/topic/com.arm.doc.101312_0000_00_en/index.html
+ * https://developer.arm.com/documentation/101107/latest/
+ * https://developer.arm.com/documentation/101312/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/arm_integrator_debug.c b/hw/misc/arm_integrator_debug.c
index ec0d4b90d3d..9a197278290 100644
--- a/hw/misc/arm_integrator_debug.c
+++ b/hw/misc/arm_integrator_debug.c
@@ -6,7 +6,7 @@
  * to this area.
  *
  * The real h/w is described at:
- *  http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0159b/Babbfijf.html
+ *  https://developer.arm.com/documentation/dui0159/b/peripherals-and-interfaces/debug-leds-and-dip-switch-interface
  *
  * Copyright (c) 2013 Alex Bennée <alex@bennee.com>
  *
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 98e70b2d262..15caff0e41c 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -185,10 +185,11 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     return s;
 }
 
-/* ARM PrimeCell SP804 dual timer module.
+/*
+ * ARM PrimeCell SP804 dual timer module.
  * Docs at
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0271d/index.html
-*/
+ * https://developer.arm.com/documentation/ddi0271/latest/
+ */
 
 #define TYPE_SP804 "sp804"
 OBJECT_DECLARE_SIMPLE_TYPE(SP804State, SP804)
-- 
2.20.1


