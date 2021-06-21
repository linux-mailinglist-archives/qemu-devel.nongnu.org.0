Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A68A3AF1BF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:17:11 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNXq-0004cz-Je
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnf-0008Ed-RU
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnd-0007qo-Qd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o39-20020a05600c5127b02901d23584fd9bso11539700wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MGyEzqniHlP5XPmzM1wM9A7R5C1K6idS678NNQDpiHQ=;
 b=HTFc6vsq4nja0Xzg4fUFOHcapWgNGK3frwYRNpOFqB9T9ARAY4glim/ARNEm97b1lT
 dTnDO5tHMd3Bzg+W1TQjti/B0vxvoYRtarwq3I5U7w6awUCvKe86xVAKmeo5byOJEvcc
 4TnLQ2MLMzEGor8C8i42yT6ERKVoQ++/PleM/tD0HDpkG17YGK2g1SS7ignFDjhCPwYf
 Lw0Qyn0tt7U9wS6sldV3BvpMOj/htTPM+rQSTmPmYHrS/vADjybZKN7mE0ksph3w1ohy
 edCcWc0F7kFih/SrgM+Url1JobrB3dBO2kkMvmRpoNNgjFodQ+QdCsOIo8iN8QMcD6a5
 wvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGyEzqniHlP5XPmzM1wM9A7R5C1K6idS678NNQDpiHQ=;
 b=TFq4G1AZpEuNSvdp+eF7Po8/WQScfH4hoFaXrROSxiz4+5jH1wPN3149GOvOvnaDzw
 uTx29g9fLCjb0XpPEKRlPYgZnFIo1vqvfql5xIbIMSL3hxcS5180hnmkLkHisfsqH4W5
 kTOn1iIjd6AsrbKlp5YNkBzj9mtc4q1M+UCDqK2TkAFfuPdKCsza+++hkERZQH4BNEuR
 1ZS4RVKtdbJ7gnSeg/KF7taIjIOGmGELzzMJhFjIPSGd0WsYYYRceLdEj/gG67yfMSCP
 ntmfbGZ58hKyGb1B9cVx829SOFL/VZ7jQVku6OPUSEgyYBPukKeOiB0JsnwA5mw8Y7W2
 kfJQ==
X-Gm-Message-State: AOAM531HF72MC+ZcjQyxaosvsE8rt0vI4xs7xhigK4133p9GQA+cgjxr
 9ABZctUx0C6Z+d3uLg7NmfohcJx7OLgY7o8l
X-Google-Smtp-Source: ABdhPJzp2Y+2W1j6ddfZhwxFa44AV7r4XRDhthsfAH4PwU+iCZbh5smboLPA6Qhy5LgqKIpB+K8Dcw==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr7939279wmm.108.1624292964607; 
 Mon, 21 Jun 2021 09:29:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/57] docs/system: arm: Add nRF boards description
Date: Mon, 21 Jun 2021 17:28:33 +0100
Message-Id: <20210621162833.32535-58-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

This adds the target guide for BBC Micro:bit.

Information is taken from https://wiki.qemu.org/Features/MicroBit
and from hw/arm/nrf51_soc.c.

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20210621075625.540471-1-erdnaxe@crans.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nrf.rst    | 51 ++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 docs/system/arm/nrf.rst

diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
new file mode 100644
index 00000000000..eda87bd7602
--- /dev/null
+++ b/docs/system/arm/nrf.rst
@@ -0,0 +1,51 @@
+Nordic nRF boards (``microbit``)
+================================
+
+The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
+are designed to be used for low-power and short-range wireless solutions.
+
+.. _Nordic nRF: https://www.nordicsemi.com/Products
+
+The nRF51 series is the first series for short range wireless applications.
+It is superseded by the nRF52 series.
+The following machines are based on this chip :
+
+- ``microbit``       BBC micro:bit board with nRF51822 SoC
+
+There are other series such as nRF52, nRF53 and nRF91 which are currently not
+supported by QEMU.
+
+Supported devices
+-----------------
+
+ * ARM Cortex-M0 (ARMv6-M)
+ * Serial ports (UART)
+ * Clock controller
+ * Timers
+ * Random Number Generator (RNG)
+ * GPIO controller
+ * NVMC
+ * SWI
+
+Missing devices
+---------------
+
+ * Watchdog
+ * Real-Time Clock (RTC) controller
+ * TWI (i2c)
+ * SPI controller
+ * Analog to Digital Converter (ADC)
+ * Quadrature decoder
+ * Radio
+
+Boot options
+------------
+
+The Micro:bit machine can be started using the ``-device`` option to load a
+firmware in `ihex format`_. Example:
+
+.. _ihex format: https://en.wikipedia.org/wiki/Intel_HEX
+
+.. code-block:: bash
+
+  $ qemu-system-arm -M microbit -device loader,file=test.hex
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 8b8547f9a9e..13b3eeaf076 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/musicpal
    arm/gumstix
+   arm/nrf
    arm/nseries
    arm/nuvoton
    arm/orangepi
diff --git a/MAINTAINERS b/MAINTAINERS
index 0ca6b7de94a..e8ba494c3f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1031,6 +1031,7 @@ F: hw/*/microbit*.c
 F: include/hw/*/nrf51*.h
 F: include/hw/*/microbit*.h
 F: tests/qtest/microbit-test.c
+F: docs/system/arm/nrf.rst
 
 AVR Machines
 -------------
-- 
2.20.1


