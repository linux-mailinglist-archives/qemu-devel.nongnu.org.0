Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF36A440F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe81-0004AX-0V; Mon, 27 Feb 2023 09:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7p-0003yq-7G
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7n-0008EE-BC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r18so6369013wrx.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AN153Vj8pXVM2GwG9IIVuPeVKK7hQugdeZLVdVf4s1A=;
 b=emCkhSLfO5K+vBe0M1b7Rn6XHGx1cw7YftBd+Nm5Nqp78w5iqLEA6ZNAyCTTtxGJhn
 UAbNDYIlhVhIP3Px+kT7WXvvyJmxa4tSWJylKFTmovJNIXfMUNBjY8Nuk5miuT8xef6v
 PBNRhVwC/WGF+CTEsY2xG8y7n4O4EQN2W0Frmj2XJqUoSnDqwrYV4M1dQH4BXx0AAMO6
 nH98SfLSqju7v4aKuLhWWElgZrmCL69DgwtHCPPp9yG92g6jH7/Q3UmkOg9dL1BD/K0J
 qhQu8OzyG9RgMVwe3CELSfLDvjpqQ4rDKQp5f9yqMkrIcgSsKg/TJFvkL23OaKjx/RfP
 R8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AN153Vj8pXVM2GwG9IIVuPeVKK7hQugdeZLVdVf4s1A=;
 b=ewue0StMFBXHc6MoSbumgnmZAm+tOL9ji353p6F4c100JYbtYPyZA8MokykyeD+0H/
 daI0+r0KhBPIoegxDql0TORbnLq6MktSZS4IXxuvKKek4cHyKad8HboDU/UVGaSx96x9
 cIPNgxgKsyqIMjcEMFn6jMiPdgd9C14WeFK9r2uflh5rw1urIyR9CNfYwsubksiuDbAG
 0bUJ+d0x3GFSNag9H85vwITFW7Wg8CRayxbMXId7W5vvcXnV+LLBj6Lh6RYqm3+E1yrA
 hnGIC3YR2bYSZX701yHO8bzeJt6S38iWStmCjiVlOurKSJBm2EvRTuIZxH/ETXL4weiO
 Yi+A==
X-Gm-Message-State: AO0yUKW1N54ntJoznLFCgxFPYNG7kNLTvcsSwEwliMw194Y2steClXDc
 y/L+XeKTgra74JzIMGaqIuKSI4q0O6NgX4iB
X-Google-Smtp-Source: AK7set8d3mwEoJSOCOJkElomET7JrM79G+tdW4NQmBI3+Rq8vKdstK7s1unGISlK94R6xd/4QNMVsA==
X-Received: by 2002:a05:6000:50:b0:2c9:23c4:8f93 with SMTP id
 k16-20020a056000005000b002c923c48f93mr6419699wrx.57.1677506705028; 
 Mon, 27 Feb 2023 06:05:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c379300b003e2052bad94sm12634096wmr.33.2023.02.27.06.05.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 041/126] hw/isa/lpc_ich9: Unexport PIRQ functions
Date: Mon, 27 Feb 2023 15:00:48 +0100
Message-Id: <20230227140213.35084-32-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

No need to rely on the board to wire up the ICH9 PCI IRQs. All functions
access private state of the LPC device which suggests that it should
wire up the IRQs.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c       |  3 ---
 hw/isa/lpc_ich9.c      | 11 ++++++++---
 include/hw/i386/ich9.h |  3 ---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66cd718b70..5dfaeeed5f 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -270,9 +270,6 @@ static void pc_q35_init(MachineState *machine)
     for (i = 0; i < GSI_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc, ICH9_LPC_NB_PIRQS);
-    pci_bus_map_irqs(host_bus, ich9_lpc_map_irq);
-    pci_bus_set_route_irq_fn(host_bus, ich9_route_intx_pin_to_irq);
     isa_bus = ich9_lpc->isa_bus;
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1fba3c210c..54a8839cd2 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -259,7 +259,7 @@ static void ich9_lpc_update_apic(ICH9LPCState *lpc, int gsi)
     qemu_set_irq(lpc->gsi[gsi], level);
 }
 
-void ich9_lpc_set_irq(void *opaque, int pirq, int level)
+static void ich9_lpc_set_irq(void *opaque, int pirq, int level)
 {
     ICH9LPCState *lpc = opaque;
     int pic_irq, pic_dis;
@@ -275,7 +275,7 @@ void ich9_lpc_set_irq(void *opaque, int pirq, int level)
 /* return the pirq number (PIRQ[A-H]:0-7) corresponding to
  * a given device irq pin.
  */
-int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
+static int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
 {
     BusState *bus = qdev_get_parent_bus(&pci_dev->qdev);
     PCIBus *pci_bus = PCI_BUS(bus);
@@ -286,7 +286,7 @@ int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx)
     return lpc->irr[PCI_SLOT(pci_dev->devfn)][intx];
 }
 
-PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin)
+static PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin)
 {
     ICH9LPCState *lpc = opaque;
     PCIINTxRoute route;
@@ -680,6 +680,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(d);
     DeviceState *dev = DEVICE(d);
+    PCIBus *pci_bus = pci_get_bus(d);
     ISABus *isa_bus;
 
     if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
@@ -728,6 +729,10 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, lpc->gsi);
 
     i8257_dma_init(isa_bus, 0);
+
+    pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
+    pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
+    pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 36e0ccd16a..921e4c7ef6 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -9,9 +9,6 @@
 #include "hw/acpi/ich9.h"
 #include "qom/object.h"
 
-void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
-int ich9_lpc_map_irq(PCIDevice *pci_dev, int intx);
-PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin);
 void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
 I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
-- 
2.38.1


