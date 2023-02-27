Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF936A4483
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAR-0008H5-DA; Mon, 27 Feb 2023 09:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9s-0007jp-OY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9r-0000F2-1b
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id h14so6362568wru.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wvgc1q+JeB9mB1p5KKDFDthHdUae8hWBwy/9CcINALg=;
 b=Ye+RJJYYiExrYT2Kv7dBdmNHikfxupx84XMOdqPhIB0aA9MCFslL8IuTCSt5wex5F5
 IHBsiYcpvDMgCp3eXhYwDc05oQnhfO/n7mp7YgnLwxyFOEQMBlqKrHn8LcFe+/5hfASl
 HstlfmP/GHUraPaYzLxhVLk0yGOFCmj2MnyUnvAKNIltsHh0xo8k2wpEaqimXvn5DS6K
 okdLONUiLz/S0mI4zBeNHVURE7VNPTz0xtnkE3y6n7odPbT85IVVe9EPBKB23ya9CKkT
 GUau2cVGIFhQb0+7+Y9QlsFWgebMg47h34DeJJ+A3RNHoPl11GpoBRLfIC6blCTVOR7J
 Cvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wvgc1q+JeB9mB1p5KKDFDthHdUae8hWBwy/9CcINALg=;
 b=ZBVcRcU44YorH63vZfFCn+U2GpqGDfzzcpR6pkVBNyH9oSa8oD9weqgiQGFo3LHwfZ
 Gs5++gV6SgvP7suGy+JxikOJuWbCbaTsnr8rfKULlPucQTDM/EAVXpw+hS1+1wFhubtO
 B08DpMNzM1nYq4gD2x3wvEAMpYEMVxSHRDfY3ve/46HMGmV70/+bgJbva548Wh0Drprq
 7rrUsemsgYzr/wpr65bWJsEKf2H1UUm3Gn5Jdu8P4/QRJk0fiLPtL3Hw4M1oRLdbv/1J
 a+La1avZiD4T0xoyKcj+Z3e1Ol3sPPVG9wek9D88iQy0VgZIHN8rv/tcY6OioYfhQJQv
 utZw==
X-Gm-Message-State: AO0yUKWeL+g9MX4V2V1SQVR+pfS1ixQar5xKki8gb2GdROKyNiXcMzGW
 QwKVPKeEfQoBqM9olIf0DswKTek88cEjnBO5
X-Google-Smtp-Source: AK7set/9+LfqykWHzKcyg+s/YtxNnf+WSvmHmEhFOQ2zgbqr7uPa24h/ROfXoXP16DTMlHkBXA+qwQ==
X-Received: by 2002:adf:e450:0:b0:2c3:fb3e:ae85 with SMTP id
 t16-20020adfe450000000b002c3fb3eae85mr22364261wrm.44.1677506832595; 
 Mon, 27 Feb 2023 06:07:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b002c5584d0e3dsm7294008wrs.24.2023.02.27.06.07.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 064/126] hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()
Date: Mon, 27 Feb 2023 15:01:11 +0100
Message-Id: <20230227140213.35084-55-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

isa_get_irq() was added in commit 3a38d437ca
("Add isa_reserve_irq()" Fri Aug 14 11:36:15 2009) as:

    a temporary interface to be used to allocate ISA IRQs for
    devices which have not yet been converted to qdev, and for
    special cases which are not suited for qdev conversions,
    such as the 'ferr'.

We still use it 14 years later, using the global 'isabus'
singleton. In order to get rid of such *temporary* interface,
extract isa_bus_get_irq() which can take any ISABus* object.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230215161641.32663-3-philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 14 ++++++++++----
 include/hw/isa/isa.h |  8 ++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 80d8fb4c5b..a289eccfb1 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -72,6 +72,13 @@ void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in)
     bus->irqs_in = irqs_in;
 }
 
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum)
+{
+    assert(irqnum < ISA_NUM_IRQS);
+    assert(bus->irqs_in);
+    return bus->irqs_in[irqnum];
+}
+
 /*
  * isa_get_irq() returns the corresponding input qemu_irq entry for the i8259.
  *
@@ -81,14 +88,13 @@ void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in)
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs_in[isairq];
+    return isa_bus_get_irq(isabus, isairq);
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
-    qemu_irq irq = isa_get_irq(isadev, isairq);
-    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
+    qemu_irq input_irq = isa_get_irq(isadev, isairq);
+    qdev_connect_gpio_out(DEVICE(isadev), gpioirq, input_irq);
 }
 
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16)
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 3a60f6afa6..40d6224a4e 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -72,6 +72,14 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
 void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_bus_get_dma(ISABus *bus, int nchan);
+/**
+ * isa_bus_get_irq: Return input IRQ on ISA bus.
+ * @bus: the #ISABus to plug ISA devices on.
+ * @irqnum: the ISA IRQ number.
+ *
+ * Return IRQ @irqnum from the PIC associated on ISA @bus.
+ */
+qemu_irq isa_bus_get_irq(ISABus *bus, unsigned irqnum);
 ISADevice *isa_new(const char *name);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
-- 
2.38.1


