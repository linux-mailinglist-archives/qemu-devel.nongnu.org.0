Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E56A43ED
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9j-0007Td-1g; Mon, 27 Feb 2023 09:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9X-0007Jr-EJ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9V-0000Dd-E4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id t15so6351833wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PZo3682M7EwepHbREv9enem8cosk7pXWG1PM7HlrsYo=;
 b=Ks4WknWPZGe2FdFhXgH3OoocOs56ovZjVwELGPfF71QChumsyGUo/WA0xGlLvC8zP3
 xI1Lu3/fXYNSiBa/LaJAw8rgB9xwJ2Qc0N9fIqvPjMx3EArKWMEv0IpPOy9/JzWJwqqx
 60UCAz96Ac4t3Ab5qstqq4mydKgoYwZhMgOCuK1R/3AqnQSLUIOpakNP9DQBOCxmXgo9
 WdwLoDwixUWrXGtCWNXFTNlj/V65Pq0zlFG7TzZsixXGH7rxF4AxX0FvmQpNXGD/vqPr
 y62QeEKU/clAvdnxjkAmT2QWH54sdfRCmH92vdl5avneiwvkYXyVKJ8ndE2hQqgZ8MOY
 RHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZo3682M7EwepHbREv9enem8cosk7pXWG1PM7HlrsYo=;
 b=KoKTDj40jh/b3HkwMj1lrohofOZDNi/tsF+ligbDHy37CrQKPOPX0STm8MpuvjqLxZ
 9XAdxRDef7ZoQasVotRmdaHdECGJv/QOk5qmw/DFgsDgz8TxCCUtyw2oOqEn2Vl7j7Qs
 RG5pEI9Jw5y7fxjvMIHOi1tsn2iISXlS+cUA/DZe0HxwTSxj8YyyDONC0F6eLMDPduKv
 M5DsOKvo60Ooqo/SfGyhd7whzWz5osG01D6I2GAoCXffDqcn89k0gZU3O6uvokzCvlOK
 uCO58hyTJTKq85bJWZTfQpie2xYYXzbLhfzKLYIcio8BBPpGKUjRJHrbv2UTwnSlxw95
 bGgg==
X-Gm-Message-State: AO0yUKVSue9X0P0h2wEsDOQ2+2ksqHxaN93qHQV5ZY2yxhVQWN4kGgmY
 YCwfTVtixDMC4SUTv6ayROPZ0KwhGFcc8tfW
X-Google-Smtp-Source: AK7set/bd940BKAUliIKqBzFTmkhBTBCo1xhj5qHTE9aZ4ysH+hLu7jj65Y9g20EBr3ZfIvjpVgAfw==
X-Received: by 2002:a05:6000:1005:b0:2c9:97f8:2604 with SMTP id
 a5-20020a056000100500b002c997f82604mr5485344wrx.14.1677506809901; 
 Mon, 27 Feb 2023 06:06:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003dec22de1b1sm9988365wmq.10.2023.02.27.06.06.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 060/126] hw/isa: Un-inline isa_bus_from_device()
Date: Mon, 27 Feb 2023 15:01:07 +0100
Message-Id: <20230227140213.35084-51-philmd@linaro.org>
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

No point in inlining isa_bus_from_device() which is only
used at device realization time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230210163744.32182-9-philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c     | 5 +++++
 include/hw/isa/isa.h | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 845686cb12..2464357971 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -164,6 +164,11 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
     return qdev_realize_and_unref(&dev->parent_obj, &bus->parent_obj, errp);
 }
 
+ISABus *isa_bus_from_device(ISADevice *dev)
+{
+    return ISA_BUS(qdev_get_parent_bus(DEVICE(dev)));
+}
+
 ISADevice *isa_vga_init(ISABus *bus)
 {
     vga_interface_created = true;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 34fa8977e9..1d3ffec4de 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -83,6 +83,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
+ISABus *isa_bus_from_device(ISADevice *dev);
 
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
@@ -120,9 +121,4 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *portio,
                              void *opaque, const char *name);
 
-static inline ISABus *isa_bus_from_device(ISADevice *d)
-{
-    return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
-}
-
 #endif
-- 
2.38.1


