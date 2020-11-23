Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DE2C04E2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:50:31 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAMX-0005im-BL
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFp-0004Wk-9l
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:33 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFn-0002j4-Gm
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id d142so17578102wmd.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ab4fkWwXMlGciLYLrrYNWUjnqvr0D03zuc6QTmDsLEc=;
 b=kiSLoZrUy2UmkMRtXFgXdIGl4x/3xJ75+rJtS+Vwq/DQkrR+wIz+BxY+ehTHYn9hLh
 WPj+fBO+L1Mtx/v3Wu9cY5HRh2FUe7+FRK79JaZ68yEcIOoZ360rvTFAomA8Y2SZMqqj
 jl80JZLOPh3i82pE9yL3tvp5RfXTnZ1URZxbkFSW2xVASNeJuFBSOsxGp66uxqsJFqf4
 SvMAtSzCMIzYDdQoYW8VQz1jKl42b8rq3I+0IAGvb2NvjBeNTttOcNW9Mt+v14VBYhCd
 6UsGqLtRxuiafUAzMz36qrKFCOe8y6uXRlBcpuvi/OwCO4iUVg/FSFRZwy7Mr/IbeOPB
 tOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ab4fkWwXMlGciLYLrrYNWUjnqvr0D03zuc6QTmDsLEc=;
 b=fcw5fAoLwXk+udQsR8MfUNIRv+IB5xXWX0H0lQCLTMS3c2JPMErfJK4GNXoGvQoHgI
 SQvhRpXcmzSmpJUDDIzGBkCywPls0GRKBYgmEoaSGRFM5ncw2klKgOu+SuqI5wZ6gHGr
 Kl/B45JDSytQiUO1k1tSTRWKpHxiq9V4AQWi1sJc6ixASjvSZpbsnInzU7yTwR3bm/Mc
 wISE2crgznmBhXnxe/X+Zs5TO/g+SVYx/XjZZ2GKGyzASdS9xViC+6XKu57srtB1qpvS
 SMX/Y+BiAXvW3qANhZ0OxEl78kAec1KyR4+XTpAOJninDoQJibufsbOgaJmdunK0ZAKz
 ZZnw==
X-Gm-Message-State: AOAM532EQoxAJsb4s6Hu5C8rN7EDqEBGqevIujInE+jHMnSYtS3ymDGP
 FlbwKgO5qmn1weLDwepyIywHWVm1WfpSig==
X-Google-Smtp-Source: ABdhPJw7oWeFOShOF8l0sC1Yh43OS+LX4REriYltsMkQnHNvZbRMfK5JKD2jEi2x8IQPiGfqi5/Weg==
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr24853073wmi.152.1606131809668; 
 Mon, 23 Nov 2020 03:43:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] docs/system/arm: Document the various raspi boards
Date: Mon, 23 Nov 2020 11:43:02 +0000
Message-Id: <20201123114315.13372-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Document the following Raspberry Pi models:

 - raspi0               Raspberry Pi Zero (revision 1.2)
 - raspi1ap             Raspberry Pi A+ (revision 1.1)
 - raspi2b              Raspberry Pi 2B (revision 1.1)
 - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
 - raspi3b              Raspberry Pi 3B (revision 1.2)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120173953.2539469-3-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/raspi.rst  | 43 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 45 insertions(+)
 create mode 100644 docs/system/arm/raspi.rst

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
new file mode 100644
index 00000000000..922fe375a67
--- /dev/null
+++ b/docs/system/arm/raspi.rst
@@ -0,0 +1,43 @@
+Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
+======================================================================================
+
+
+QEMU provides models of the following Raspberry Pi boards:
+
+``raspi0`` and ``raspi1ap``
+  ARM1176JZF-S core, 512 MiB of RAM
+``raspi2b``
+  Cortex-A7 (4 cores), 1 GiB of RAM
+``raspi3ap``
+  Cortex-A53 (4 cores), 512 MiB of RAM
+``raspi3b``
+  Cortex-A53 (4 cores), 1 GiB of RAM
+
+
+Implemented devices
+-------------------
+
+ * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
+ * Interrupt controller
+ * DMA controller
+ * Clock and reset controller (CPRMAN)
+ * System Timer
+ * GPIO controller
+ * Serial ports (BCM2835 AUX - 16550 based - and PL011)
+ * Random Number Generator (RNG)
+ * Frame Buffer
+ * USB host (USBH)
+ * GPIO controller
+ * SD/MMC host controller
+ * SoC thermal sensor
+ * USB2 host controller (DWC2 and MPHI)
+ * MailBox controller (MBOX)
+ * VideoCore firmware (property)
+
+
+Missing devices
+---------------
+
+ * Peripheral SPI controller (SPI)
+ * Analog to Digital Converter (ADC)
+ * Pulse Width Modulation (PWM)
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index a0d5c57799c..bde4b8e044e 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
    arm/nuvoton
    arm/orangepi
    arm/palm
+   arm/raspi
    arm/xscale
    arm/collie
    arm/sx1
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f4639f00d5..fbb068196a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -803,6 +803,7 @@ F: hw/arm/raspi_platform.h
 F: hw/*/bcm283*
 F: include/hw/arm/raspi*
 F: include/hw/*/bcm283*
+F: docs/system/arm/raspi.rst
 
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


