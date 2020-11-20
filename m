Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419982BB197
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:44:11 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgASA-0005Um-Bo
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOI-0001hW-NX; Fri, 20 Nov 2020 12:40:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOF-00048M-DV; Fri, 20 Nov 2020 12:40:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id p19so8812498wmg.0;
 Fri, 20 Nov 2020 09:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFPS6IvkauNVM4Wc9y+2kT0KPNXxkHNZamoA/rs/zQU=;
 b=t1ixQuPwdyzDOdtyTuRIfw/qqPgg1SxIDBVpampSoYktLVvONvDhasYraDAlKYEzlE
 kpyK+cNmIX5nvVoKLyZb9VYobeP4hKoLLob/Fe8hLXa3YfsE3Vycsrb1ZYsdxI6Q66I3
 1ruMpyg49a9KleJxWFmgljTLn5AwM6cOOr0HhQJYgqkn/Oxlw7jyiqaqxwPgAxOM+73G
 BGxL7yuVixQ1aJe4IsNVYnY1kG3Nsvw8NvQrEDxANiuBWr3pfyacrN/vu+vOm28IytmH
 c6+F/NnU3EJYbCMe5N/WFtALBRBB8RTbuknSw4aohHCr5ksacBjn5o2nSmMuJQsSiksp
 wvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SFPS6IvkauNVM4Wc9y+2kT0KPNXxkHNZamoA/rs/zQU=;
 b=Q5BbKbDWdF4q5Pn6H3Z5XM2jXstjajTBRAH8ae6pk8MW8Ec9FAtSSXdKSRNne42eL0
 Drnl/VXlA0M8gKiqf9rmevfMVK/3cn+3PYS2/18MkXWNWntn9mLDrD19SWyEQ1YlDIL6
 qfu0sFwmFcS09Ce2DIF9ztd1KwaInSIrcb4nu5rk8Y7o9njceJhyfu4vXLo7yE3Y+TH3
 fwrFJwbVm9CmL41o+FNvxT8epGciSgJ99uQF0Fklk0a9zP65zpMkVuf6R5BYq8Qqp4mJ
 VlirVZcTj6K0bCeOcB9dEYKSZ8y7dJmEwJHihpUog3YEjFLcWXUol5Wv0WlbJekgUaGN
 b1iQ==
X-Gm-Message-State: AOAM53079e1LRNOKRFKdTzDMnFeNmWI2BRcVMi3OaWMDpjMm6plPKIjF
 MB+Xyc9KL3TSB8Mhyt4zj4VdI6bfIZo=
X-Google-Smtp-Source: ABdhPJxA3HG8q96zrtzL8CMXFsN4sAM25trpMTmbXmo92CxTEmTQy7aHnBPV3MURE61FHADkcRmUbQ==
X-Received: by 2002:a1c:9a41:: with SMTP id c62mr7506284wme.15.1605894005600; 
 Fri, 20 Nov 2020 09:40:05 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q5sm6024481wrf.41.2020.11.20.09.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:40:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 2/4] docs/system/arm: Document the various raspi
 boards
Date: Fri, 20 Nov 2020 18:39:51 +0100
Message-Id: <20201120173953.2539469-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
References: <20201120173953.2539469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the following Raspberry Pi models:

 - raspi0               Raspberry Pi Zero (revision 1.2)
 - raspi1ap             Raspberry Pi A+ (revision 1.1)
 - raspi2b              Raspberry Pi 2B (revision 1.1)
 - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
 - raspi3b              Raspberry Pi 3B (revision 1.2)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.26.2


