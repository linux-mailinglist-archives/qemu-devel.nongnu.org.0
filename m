Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4A310EF2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:43:32 +0100 (CET)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l858l-0006N6-Nw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tn-0006wk-Qc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:11 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TO-00045L-JD
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id b3so8451270wrj.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Lp/PXJ/Lg+jhfej9/mPuXMN8i+zU7pqYIRVDjsjSQS8=;
 b=yW1fULBK2cOdQTC7E/RkebMVAZvJry9y1rMYHeYfcGPOZgajhWqHA7pbFakRKXdsGh
 Ni/tZog01acku1CI7ADzAdlZX2xrL6m15HVD7t3f2z/bwTvwnCcn16UnB75tWk22hjfE
 Thb7Bij1e97u/jUv3+eN4Ex85DpD9le0P5Sth8Y8ET8cyQqgy17VKd+BbtDq+hQjwXPn
 4t4e1frVviAiTeXtPM7A6eJaE6dPNyhrDhFKy9QC9UmAJ0g8VCRl85GxS2i62Ek0WCsX
 UwrdNSd/13pJ3rNVc5F3LmUmB5q/qBilitE3HmodEfigdbMznQnK3AkEfC2bKwavNhcf
 HH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lp/PXJ/Lg+jhfej9/mPuXMN8i+zU7pqYIRVDjsjSQS8=;
 b=K0ILzi2KlokA1DPpmkS4Q1M32i0cq8HUcGYaSOcgVCdcDDdKRwa4MgnjTNr0vXNYrP
 5UWtIrJNq2tBcKc9oV67atmo5vJqFdsgMPH2JrGcGqPp3bGCYswpXBqrH+ZwBeH1UpB3
 ADpb2i8DrYiWEMUxlASa15gEpqrCu5Og9I07fLeh4gb+sU1vZgykx39UbDq5+6novOmk
 llgrYU3YlY6+y7XYSTTU+boMEzEpMvy1MgExDaU9z00AI30pBdpz62zYmM+6d6weUJXV
 S7U9sFqZw8o3DSYWlyNutoJ1skdij5Lpmusnk5MjfcTYiPvbna7/Vax8C02bU1RBmRAY
 YZ2A==
X-Gm-Message-State: AOAM530cwGcRJtzvwo3V1HBadgMODfr2Ps9cDrizQe+CiIwEJMgh/y3l
 f1OHHgKhGgpQrsxJeMxXFFinFQ==
X-Google-Smtp-Source: ABdhPJzmo+jZXJpo06gk1+gfg9kSSOxUnpNEObe2Kl0bSJh3VY42bDJKXWnhFL0Nde3fPbGEMxlYQw==
X-Received: by 2002:adf:80e7:: with SMTP id 94mr5129031wrl.5.1612544441264;
 Fri, 05 Feb 2021 09:00:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
Date: Fri,  5 Feb 2021 17:00:19 +0000
Message-Id: <20210205170019.25319-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
There are some other infocenter URLs in the codebase; we should
probably update those too, but they don't really fit in with this
patchset, so I'll do them separately later.
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
index 83c6e18a4ee..7f622bae536 100644
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
index 27feb36616e..944f44f4a31 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -22,21 +22,20 @@
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
index b54657a4f07..64a383e063b 100644
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


