Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B903C2760
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:14:57 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t9U-0001YB-FX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4z-0001RV-4R
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:17 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4q-0000tG-Ka
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so12833410wri.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dHPWbK5KgEsozA6CwOuy0L1hAHPICBDNahq3VbvQpN8=;
 b=T/vWH5iK5VSDQ/EvLN1KzB1zRhCvsYSiTlYt9B9D1cUZzzmOXsa9pMILdJ5nHWjSTI
 5MSBZ9TV7VfcTuwIij8q8tJmbv0TAzFeTOJPJ3Km2pjfUZvCQTU7CLJQ1L6jU/Eh6C0N
 W5gB8nSwh0rmS7tuC0A1qfG53WqdnoQraI/gj71VkecsE9tkK9ykj4tAZHV3Kos11pCf
 4GXmeZkd8v6Gsb08k9ifQxEuy3g6gQxr/ZXbbWNfe8keXQdVeW5jw3jp3SkrTwBwkGLk
 Z1PKzEcfTYSfvDyLyksFV3fDR76CkkizGKOgn1B1sFeHdK7+SSyU+e3hRn0QOptj5iSJ
 soVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dHPWbK5KgEsozA6CwOuy0L1hAHPICBDNahq3VbvQpN8=;
 b=gUw8ebscQtDowd/tEelGyRrvJqjOLh8flk01wad94gWkQC//UkUU0DC7m9fMBchukk
 N1yyQTvheiJHsqdM+5McpXKV7LVSG4b+a+HGubsoiREz/Yeu1YK/+O04DIqokLzoYy2B
 fCGQvPmpm7efMzPN6mFsbR8dZ8+R1wmdaFUkCjjKfBmpv5755JEPUriQTiBFQprKuSnb
 wvr2wVrh4T28u2dVKnhZBmqBqgIRcGe3i8hmG7qULI9uZTDRl2mfE7Ht++h1VvEC7lcY
 hbzFBNPnduTux7OrhkYOZ0hqEgUuvVOi1HJ3FrDJc0O4VZDZRdBye+h7i3By3zTRM+x3
 okdA==
X-Gm-Message-State: AOAM530KK7+UA6IYhLR871HC9TDUroS2Nqp30qzdUa6XwiTXoS2Ae28u
 a6EOA+JSV91H51LsPMM0BkcEKdEaD52cNQn3
X-Google-Smtp-Source: ABdhPJwp/zplchst3Koj5KvdjmMu7CrYNzJRUu0YXWc7kCKlDUeo9aCjdxHQFCDV3J5QY/4fYfbQsg==
X-Received: by 2002:adf:f885:: with SMTP id u5mr1664506wrp.84.1625847007298;
 Fri, 09 Jul 2021 09:10:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] docs/system: arm: Add stm32 boards description
Date: Fri,  9 Jul 2021 17:09:49 +0100
Message-Id: <20210709161003.25874-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Alexandre Iooss <erdnaxe@crans.org>

This adds the target guide for Netduino 2, Netduino Plus 2 and STM32VLDISCOVERY.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210617165647.2575955-4-erdnaxe@crans.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/stm32.rst  | 66 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 68 insertions(+)
 create mode 100644 docs/system/arm/stm32.rst

diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
new file mode 100644
index 00000000000..508b92cf862
--- /dev/null
+++ b/docs/system/arm/stm32.rst
@@ -0,0 +1,66 @@
+STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
+========================================================================================
+
+The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
+STMicroelectronics.
+
+.. _STM32: https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html
+
+The STM32F1 series is based on ARM Cortex-M3 core. The following machines are
+based on this chip :
+
+- ``stm32vldiscovery``  STM32VLDISCOVERY board with STM32F100RBT6 microcontroller
+
+The STM32F2 series is based on ARM Cortex-M3 core. The following machines are
+based on this chip :
+
+- ``netduino2``         Netduino 2 board with STM32F205RFT6 microcontroller
+
+The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
+compatible with STM32F2 series. The following machines are based on this chip :
+
+- ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
+
+There are many other STM32 series that are currently not supported by QEMU.
+
+Supported devices
+-----------------
+
+ * ARM Cortex-M3, Cortex M4F
+ * Analog to Digital Converter (ADC)
+ * EXTI interrupt
+ * Serial ports (USART)
+ * SPI controller
+ * System configuration (SYSCFG)
+ * Timer controller (TIMER)
+
+Missing devices
+---------------
+
+ * Camera interface (DCMI)
+ * Controller Area Network (CAN)
+ * Cycle Redundancy Check (CRC) calculation unit
+ * Digital to Analog Converter (DAC)
+ * DMA controller
+ * Ethernet controller
+ * Flash Interface Unit
+ * GPIO controller
+ * I2C controller
+ * Inter-Integrated Sound (I2S) controller
+ * Power supply configuration (PWR)
+ * Random Number Generator (RNG)
+ * Real-Time Clock (RTC) controller
+ * Reset and Clock Controller (RCC)
+ * Secure Digital Input/Output (SDIO) interface
+ * USB OTG
+ * Watchdog controller (IWDG, WWDG)
+
+Boot options
+------------
+
+The STM32 machines can be started using the ``-kernel`` option to load a
+firmware. Example:
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M stm32vldiscovery -kernel firmware.bin
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 13b3eeaf076..705b8835e48 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -97,6 +97,7 @@ undocumented; you can get a complete list by running
    arm/collie
    arm/sx1
    arm/stellaris
+   arm/stm32
    arm/virt
    arm/xlnx-versal-virt
 
diff --git a/MAINTAINERS b/MAINTAINERS
index f5919498af4..bad893bfd90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -898,6 +898,7 @@ M: Alexandre Iooss <erdnaxe@crans.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/stm32vldiscovery.c
+F: docs/system/arm/stm32.rst
 
 Versatile Express
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


