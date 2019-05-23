Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B827FB6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:31:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTol9-0000Su-Oo
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 10:31:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodr-0002rA-1M
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodp-000743-3O
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:22 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTodm-0006xd-EC
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id i3so6051468wml.4
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=joq0WIkgIgBccOnX/tw/4BR0pXLnjvJzCw5NVsq1dWQ=;
	b=u/WfZjtMXauA8pbTUA6Kj0RHoq5/ckKXapm47YjUP12G2AmlSiz7kGj0nfKTG0cceY
	us1SRhMME/tFdQe6EqpNSFTXKR6MfzKa2s6B9CY07M/ZXmubhBUqGIL2VbsPTe794z77
	g/VH0VOPC+0SknaIFUmgjbTfc2sQiCVKczG2F2lUGRCOF2G+M/ISrfHkf61FP6dsHrCV
	yv/qktah/KkNFfgREBRL/7CeOSYhZGZ6Mk0qI6CMfdRygw0TscjPuEzqPUD1lQCTq/9R
	Hxadq75JU6xRYJxXbZ4QEw1LC5Yclcf0kMepgEHnW1OcQc1EpdyzYIFTfehBc6EZtCwJ
	wd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=joq0WIkgIgBccOnX/tw/4BR0pXLnjvJzCw5NVsq1dWQ=;
	b=DZhF1YG80wlkm6iPoHkIM3T1rvr2jW2PRsy80V9Q7UNG+RCpo297GDLyjXGeUjvdqL
	BNY8b2+mfrqUAoC6RDaDLVVkOF7Dh4PTNhjEQlaLbNju/g9YgfxBPgyvaIGnyGTuZR7Q
	U/cVxA7lGJ3ywJwCdpsKGhVmumTAbmKbS4c4vYjPut1dI9WujohSEuJ0mH+jSgZ0Skv6
	zGNRFj7QSCPEnt4eXH3lsZqpIHT2G0IBg418DBSu7b4bx4KpUxdPuHqGJnDQjD5OLWA6
	aoQooZrMxWVWe8I6deExq8bPyq++9tSKLmIiTagC5DQBhv7FFAMg5X9gmMJvDY04AyAK
	9fgA==
X-Gm-Message-State: APjAAAV9I0HQPn8Bd+LhX4HZUrQZO2YFaIIarqcr7u8QpPBDdS0c0av3
	gCwoJKXkhBByAkRFYJxRNykoIiaX3cNWTg==
X-Google-Smtp-Source: APXvYqwCm7O+zwngY4RLYhkKHmfmtstQ8aR57hsRy6DaxpU/lCR+CXDDb1oGAsebSGrHMsZ1RQZlkw==
X-Received: by 2002:a1c:f10f:: with SMTP id p15mr12338204wmh.150.1558621451433;
	Thu, 23 May 2019 07:24:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id z5sm9700617wmi.34.2019.05.23.07.24.10
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 07:24:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 15:23:56 +0100
Message-Id: <20190523142357.5175-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523142357.5175-1-peter.maydell@linaro.org>
References: <20190523142357.5175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 11/12] hw/arm/exynos4210: Add DMA support for
 the Exynos4210
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

QEMU already supports pl330. Instantiate it for Exynos4210.

Relevant part of Linux arch/arm/boot/dts/exynos4.dtsi:

/ {
    soc: soc {
        amba {
            pdma0: pdma@12680000 {
                compatible = "arm,pl330", "arm,primecell";
                reg = <0x12680000 0x1000>;
                interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
                clocks = <&clock CLK_PDMA0>;
                clock-names = "apb_pclk";
                #dma-cells = <1>;
                #dma-channels = <8>;
                #dma-requests = <32>;
            };
            pdma1: pdma@12690000 {
                compatible = "arm,pl330", "arm,primecell";
                reg = <0x12690000 0x1000>;
                interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
                clocks = <&clock CLK_PDMA1>;
                clock-names = "apb_pclk";
                #dma-cells = <1>;
                #dma-channels = <8>;
                #dma-requests = <32>;
            };
            mdma1: mdma@12850000 {
                compatible = "arm,pl330", "arm,primecell";
                reg = <0x12850000 0x1000>;
                interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
                clocks = <&clock CLK_MDMA>;
                clock-names = "apb_pclk";
                #dma-cells = <1>;
                #dma-channels = <8>;
                #dma-requests = <1>;
            };
        };
    };
};

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190520214342.13709-4-philmd@redhat.com
[PMD: Do not set default qdev properties, create the controllers in the SoC
      rather than the board (Peter Maydell), add dtsi in commit message]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/exynos4210.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0bf61134550..f942ed2be96 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -96,6 +96,11 @@
 /* EHCI */
 #define EXYNOS4210_EHCI_BASE_ADDR           0x12580000
 
+/* DMA */
+#define EXYNOS4210_PL330_BASE0_ADDR         0x12680000
+#define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
+#define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
+
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
@@ -160,6 +165,19 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
 
+static void pl330_create(uint32_t base, qemu_irq irq, int nreq)
+{
+    SysBusDevice *busdev;
+    DeviceState *dev;
+
+    dev = qdev_create(NULL, "pl330");
+    qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
+    qdev_init_nofail(dev);
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, base);
+    sysbus_connect_irq(busdev, 0, irq);
+}
+
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
     Exynos4210State *s = g_new0(Exynos4210State, 1);
@@ -410,5 +428,13 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
     sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR,
             s->irq_table[exynos4210_get_irq(28, 3)]);
 
+    /*** DMA controllers ***/
+    pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(35, 1)]), 32);
+    pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(36, 1)]), 32);
+    pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
+                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(34, 1)]), 1);
+
     return s;
 }
-- 
2.20.1


