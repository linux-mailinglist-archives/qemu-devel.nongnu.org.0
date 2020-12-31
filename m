Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BED2E8290
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:55:42 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6r7-0000cw-SO
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lj-0002FN-7W
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:07 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lh-0006X2-N9
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c133so8143290wme.4
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B6/juozgCAEtqAlqqeCmHKGqNvNofCEfutV+ADMnaIU=;
 b=b/v6BaEyBbvTf1K8UoFZMv/bKU0SCRamDxou769Qu9Dih+fuS4SrqBmnJg+kEbbpPj
 WsjVFJmzKlZl+Fw4YsKiT9pnBYlXNHLee11LqLvCh5wBPAShEw57/6nWgBpCxf6GatFX
 in5in1BN0RAx7OJKHnahB6t5oXQ6S4OdGAMFDY4wmDXKciOzG2ieR+0YNjJDuLlyVLod
 WnclR76YyZXPk8kPpY4hRTKq5kZ3OH2KUnGpH+W6EiBWkDZ4aYsedvfqeWVSX+vIYj4k
 Zw7Hp/B2NOb6xEeWEnxD6wgp1a/k2XArKxI+A5EnqogmAHTndkfRq4p95Epxrt8uixNK
 l5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B6/juozgCAEtqAlqqeCmHKGqNvNofCEfutV+ADMnaIU=;
 b=ghaW4oa566rLoZoUcqhIYP+9o4YmewlKJ2m1402f77G+B6m+MIMJZ6iCQyheGMuMKM
 cNOID7qHoGSJ9MT6odXwAwFXJK8933B4a8Zq7g1BpXbFgiiaFSOWS9w6DQf1lm6QZDG1
 wPFs1ozfaEhcSBbgFL1GntxoCh3T4dSOP6wPdlmP8Cm+vsA580iNHqHvvTR5YoUu2z2r
 nlvFCuiLTIO+WEVXAZv32CVjioZtH8L66qFce4Xq7RDNojqRsNiFHgYi2FoE0u+dSVod
 xKr6I/EfVtXY04mGsR1kAzCvf1xjTQJLVGlgMn8t9v2TgvYPFmJrn5kSJVFmmprEbpRG
 ccQw==
X-Gm-Message-State: AOAM531EyANhaezQF2DhuX3lj0+Zjf/Jrw8Kb0veVxqZDR0l3xqdfrbz
 LDuzhW1Lg7qEdI8JqgCfNmr5bstGToE=
X-Google-Smtp-Source: ABdhPJxDGgpdFWNz+fyfE5DGnBLV6bvlpnhyp1R7v1YCn+ek5MfCFNd7I9Y/AaD4p436azzS3iUMoQ==
X-Received: by 2002:a1c:1bc6:: with SMTP id b189mr13096299wmb.71.1609455003272; 
 Thu, 31 Dec 2020 14:50:03 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id m17sm78156359wrn.0.2020.12.31.14.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/18] hw/pci-host/bonito: Rename PCI host helpers
Date: Thu, 31 Dec 2020 23:49:03 +0100
Message-Id: <20201231224911.1467352-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename PCI host side related helpers as 'bonito_host_*'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index d91ed82c99e..45f31512b25 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -574,7 +574,7 @@ static const MemoryRegionOps bonito_spciconf_ops = {
 
 #define BONITO_IRQ_BASE 32
 
-static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
+static void bonito_host_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
     qemu_irq *pic = s->pic;
@@ -593,7 +593,7 @@ static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
 }
 
 /* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
-static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
+static int bonito_host_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
@@ -650,14 +650,14 @@ static const VMStateDescription vmstate_bonito = {
     }
 };
 
-static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
+static void bonito_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
-                                     pci_bonito_set_irq, pci_bonito_map_irq,
+                                     bonito_host_set_irq, bonito_host_map_irq,
                                      dev, &bs->pci_mem, get_system_io(),
                                      PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
 
@@ -808,23 +808,23 @@ static const TypeInfo bonito_info = {
     },
 };
 
-static void bonito_pcihost_class_init(ObjectClass *klass, void *data)
+static void bonito_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = bonito_pcihost_realize;
+    dc->realize = bonito_host_realize;
 }
 
-static const TypeInfo bonito_pcihost_info = {
+static const TypeInfo bonito_host_info = {
     .name          = TYPE_BONITO_PCI_HOST_BRIDGE,
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .instance_size = sizeof(BonitoState),
-    .class_init    = bonito_pcihost_class_init,
+    .class_init    = bonito_host_class_init,
 };
 
 static void bonito_register_types(void)
 {
-    type_register_static(&bonito_pcihost_info);
+    type_register_static(&bonito_host_info);
     type_register_static(&bonito_info);
 }
 
-- 
2.26.2


