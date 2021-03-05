Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C032F231
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:10:50 +0100 (CET)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEuX-0007Oo-C8
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE45-0007X5-OY
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:41 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007k7-GB
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:35 -0500
Received: by mail-wr1-x444.google.com with SMTP id b18so2899690wrn.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ILYZvPcCVTBUNwDjYtIInGC1zkJw49OBNp2JuBXNF0U=;
 b=wKEzx2wUwsV+RUd/deycZ64CtwHDIe4Cs4wxz2N2MUq+hreOQY3WZog5CAHEkiFR8v
 zk6sNp3BniEE/Z9t0iHf0B7eh54GwIZuuxtJphr+lgM1rS9SQXylkobcDMapDf1FbkKH
 qRqi8394vYPuR0+8MA4IFlGE9/vIdWHXq/kT0N+44V7OyomHlG8CoRXWpXRKiUdz206D
 Iq3zphDDlURIaUZH7M65RmpulK8qeZj1iF3tKM2pBkXk0/hdPrDNTJGlFGLYNlZFSYcf
 wrHnn2xM4PFbJeFWUsb16WpcrB1jrALGrgrHjSrU1BBwVFJZeYhqzYTQCDuTCkUHoPXO
 1CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILYZvPcCVTBUNwDjYtIInGC1zkJw49OBNp2JuBXNF0U=;
 b=VrpxTI0fehnN4Jex3zkIY8VdA6l3biH7+XKb/wxUrp1M9vT40FogScuz8xRF5FKiC1
 jNAgUtEqlRzfKFgpg4UB0g9gnCRheplLn6AMFgBhDNtQF60DEuY6A6XaGg+hMEQuanjd
 GRjhsZjUEJBe/997n1SV3ELndCMQzFcHtIeIfY5dP40+s5A2NDr8l1nXOk/KlYlCrT7Y
 3Cm1FagQfrcIFLUsglexQSOtKQI5pBkCRJL2igjJBOeWZMQFtJTy3HpUXSfLrqFKkHuA
 1L6d+Pl9a7BxU57pWA4fxxk28TgfrPaQN68swOUIQkVhWWzNd1lq2r1jsYS9zBht1skC
 qX9Q==
X-Gm-Message-State: AOAM532LiEABYwaoqX4A0OBqrsUyomuDANGt444Y8LplL1QAkpybumtY
 U3C3s+6UQM2kNeyl+f/04fdPuTXYUEKzHg==
X-Google-Smtp-Source: ABdhPJy3Ct2wweXjofahWlBdlVcVjg/v+7THPx1xu566IM3dpcyRk61t2h/X7W0jv5v2RTC1Mu8CaA==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr10413673wrr.49.1614964551005; 
 Fri, 05 Mar 2021 09:15:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/49] hw/arm/mps2: Update old infocenter.arm.com URLs
Date: Fri,  5 Mar 2021 17:15:15 +0000
Message-Id: <20210305171515.1038-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

Update old infocenter.arm.com URLs to the equivalent developer.arm.com
ones (the old URLs should redirect, but we might as well avoid the
redirection notice, and the new URLs are pleasantly shorter).

This commit covers the links to the MPS2 board TRM, the various
Application Notes, the IoTKit and SSE-200 documents.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-25-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h          |  4 ++--
 include/hw/misc/armsse-cpuid.h   |  2 +-
 include/hw/misc/armsse-mhu.h     |  2 +-
 include/hw/misc/iotkit-secctl.h  |  2 +-
 include/hw/misc/iotkit-sysctl.h  |  2 +-
 include/hw/misc/iotkit-sysinfo.h |  2 +-
 include/hw/misc/mps2-fpgaio.h    |  2 +-
 hw/arm/mps2-tz.c                 | 11 +++++------
 hw/misc/armsse-cpuid.c           |  2 +-
 hw/misc/armsse-mhu.c             |  2 +-
 hw/misc/iotkit-sysctl.c          |  2 +-
 hw/misc/iotkit-sysinfo.c         |  2 +-
 hw/misc/mps2-fpgaio.c            |  2 +-
 hw/misc/mps2-scc.c               |  2 +-
 14 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 676cd4f36b0..09284ca75cf 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -14,9 +14,9 @@
  * hardware, which include the IoT Kit and the SSE-050, SSE-100 and
  * SSE-200. Currently we model:
  *  - the Arm IoT Kit which is documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ *    https://developer.arm.com/documentation/ecm0601256/latest
  *  - the SSE-200 which is documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *    https://developer.arm.com/documentation/101104/latest/
  *
  * The IoTKit contains:
  *  a Cortex-M33
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
index a61355e5161..9c0926322cb 100644
--- a/include/hw/misc/armsse-cpuid.h
+++ b/include/hw/misc/armsse-cpuid.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "CPU_IDENTITY" register block which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * QEMU interface:
  *  + QOM property "CPUID": the value to use for the CPUID register
diff --git a/include/hw/misc/armsse-mhu.h b/include/hw/misc/armsse-mhu.h
index 2671b5b978b..41925ded89b 100644
--- a/include/hw/misc/armsse-mhu.h
+++ b/include/hw/misc/armsse-mhu.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the Message Handling Unit (MHU) which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * QEMU interface:
  *  + sysbus MMIO region 0: the system information register bank
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 54c212b515c..227d44abe49 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -11,7 +11,7 @@
 
 /* This is a model of the security controller which is part of the
  * Arm IoT Kit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  *
  * QEMU interface:
  *  + sysbus MMIO region 0 is the "secure privilege control block" registers
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 2b5636b218c..2bc391138db 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system control element" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * Specifically, it implements the "system information block" and
  * "system control register" blocks.
  *
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 7e620e2eafe..055771d2098 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system information block" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * QEMU interface:
  *  + QOM property "SYS_VERSION": value to use for SYS_VERSION register
  *  + QOM property "SYS_CONFIG": value to use for SYS_CONFIG register
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 0d3c8eef56c..e04fd590b63 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -12,7 +12,7 @@
 /* This is a model of the FPGAIO register block in the AN505
  * FPGA image for the MPS2 dev board; it is documented in the
  * application note:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  *
  * QEMU interface:
  *  + sysbus MMIO region 0: the register bank
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7466e71ab76..7983dc305b7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -23,21 +23,20 @@
  * https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/mps2
  *
  * Board TRM:
- * http://infocenter.arm.com/help/topic/com.arm.doc.100112_0200_06_en/versatile_express_cortex_m_prototyping_systems_v2m_mps2_and_v2m_mps2plus_technical_reference_100112_0200_06_en.pdf
+ * https://developer.arm.com/documentation/100112/latest/
  * Application Note AN505:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  * Application Note AN521:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
+ * https://developer.arm.com/documentation/dai0521/latest/
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
- *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ *  https://developer.arm.com/documentation/ecm0601256/latest
  * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
  * most of the device layout:
- *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
- *
+ *  https://developer.arm.com/documentation/101104/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index d58138dc28c..e785a090519 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "CPU_IDENTITY" register block which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * It consists of one read-only CPUID register (set by QOM property), plus the
  * usual ID registers.
diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c
index a45d97fada8..0be7f0fc874 100644
--- a/hw/misc/armsse-mhu.c
+++ b/hw/misc/armsse-mhu.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the Message Handling Unit (MHU) which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 964b48c74d9..222511c4b04 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system control element" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * Specifically, it implements the "system control register" blocks.
  */
 
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index b2dcfc4376c..52e70053df7 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system information block" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * It consists of 2 read-only version/config registers, plus the
  * usual ID registers.
  */
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b04fcda844c..f3db88ddcc8 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -12,7 +12,7 @@
 /* This is a model of the "FPGA system control and I/O" block found
  * in the AN505 FPGA image for the MPS2 devboard.
  * It is documented in AN505:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 562ace06a58..140a4b9ceba 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -13,7 +13,7 @@
  * found in the FPGA images of MPS2 development boards.
  *
  * Documentation of it can be found in the MPS2 TRM:
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.100112_0100_03_en/index.html
+ * https://developer.arm.com/documentation/100112/latest/
  * and also in the Application Notes documenting individual FPGA images.
  */
 
-- 
2.20.1


