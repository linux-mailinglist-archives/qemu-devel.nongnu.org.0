Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1572E8295
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:58:30 +0100 (CET)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6tp-0004ZG-Ml
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6ls-0002Q0-6g
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:17 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lq-0006aN-En
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id d26so20998065wrb.12
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkkCkigPnvkDdlnvDUJIeN8a+2TZP6cajuRXrtCGtgw=;
 b=npSCuc/1hjruJrlW02Oq+QrLldqb2szca1XJo4t2M8b1XLorxRwU3qBRFjV4VIXKn4
 VAziqQwbDQvAnwJyVyHgh2I0VWk2mCkyLfFg05UK0++lgbBQ9I424IJm6NOOaas4813m
 A/w7EsmgI4hd8FLfyTS8LnCcyE/+808n/Io3X3gU9fAA4U8UxNN1IqX5TQCmoQVahloe
 tLuZSSBhWP6YSpZVgZ0TIHthcDHEgCRL99sysGytQMBEF8G6GDLVdSlTLUp4uJM4nfrA
 PnflhLtkxFUt2w7pv/3vTB9rZcDvLFSPBdXtvChdApFD2UkoRo8B7nVqW6X/cRTcsB5i
 Af8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CkkCkigPnvkDdlnvDUJIeN8a+2TZP6cajuRXrtCGtgw=;
 b=AalaL7exzG9SSx0t7UvZAFo8SkCJnrOSvSFCy4vdheFrnQnHeGb52AaHIy0C7Zhz3e
 Y5WLG4PhMHNFtDyVCaUqnZ5n4QMzDD23r46BwTTTmv9w469mC2hF9YlG2AciItx8TBi7
 zU3puuR8p8KGDKghn3C2+wpjzDnAM2mu9ae4Vjswilb6H4Ha0ZGjzTfLfl7TWW5Wq0Wm
 1P1wpH/7RWSaTmm5TZarqWfvtXMGWj6kpaDo8Q9RLFP4oGiCwiTmqOLIamYuJMLMmebQ
 KxTa64NpVuGpfW7sMOKNd+eJZ2Np0PLlmYTV99UbRaWOI0tUF6lymLW7hYML6LVXzeHA
 tWQA==
X-Gm-Message-State: AOAM530KjMKaIInt3nGbUUqv4duNnQ8I5JxIXSgFD3lX44am7kOIrhUj
 zoPK0/9cWwl8GgfAhWCCIpo7V6cbHbw=
X-Google-Smtp-Source: ABdhPJyV8YR4FTlTCmVi3ndNvh4kOICiBdMBQ/eOrpLHv91aVd36Y1udH3KPtyOr8H9Coct2Kl+rnA==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr67758313wrq.352.1609455012945; 
 Thu, 31 Dec 2020 14:50:12 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id z6sm13543546wmi.15.2020.12.31.14.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/18] hw/pci-host/bonito: Rename PCIBonitoState ->
 BonitoPciState
Date: Thu, 31 Dec 2020 23:49:05 +0100
Message-Id: <20201231224911.1467352-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

As we use BonitoState for the whole device, rename
the PCI function device as BonitoPciState.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 06f5e683c81..1c88ccc6af8 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -200,7 +200,7 @@ FIELD(PCIMAP, 2G,               18, 1)
 
 typedef struct BonitoState BonitoState;
 
-struct PCIBonitoState {
+struct BonitoPciState {
     PCIDevice dev;
 
     BonitoState *pcihost;
@@ -229,12 +229,12 @@ struct PCIBonitoState {
     MemoryRegion bonito_localio;
 
 };
-typedef struct PCIBonitoState PCIBonitoState;
+typedef struct BonitoPciState BonitoPciState;
 
 struct BonitoState {
     PCIHostState parent_obj;
     qemu_irq *pic;
-    PCIBonitoState *pci_dev;
+    BonitoPciState *pci_dev;
     MemoryRegion pci_mem;
     MemoryRegion pcimem_lo_alias[3];
 };
@@ -243,9 +243,9 @@ struct BonitoState {
 OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
 
 #define TYPE_PCI_BONITO "Bonito"
-OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
+OBJECT_DECLARE_SIMPLE_TYPE(BonitoPciState, PCI_BONITO)
 
-static void bonito_remap(PCIBonitoState *s)
+static void bonito_remap(BonitoPciState *s)
 {
     static const char *const region_name[3] = {
         "pci.lomem0", "pci.lomem1", "pci.lomem2"
@@ -273,7 +273,7 @@ static void bonito_remap(PCIBonitoState *s)
 static void bonito_northbridge_write(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     uint32_t saddr;
 
     saddr = addr >> 2;
@@ -338,7 +338,7 @@ static void bonito_northbridge_write(void *opaque, hwaddr addr,
 static uint64_t bonito_northbridge_read(void *opaque, hwaddr addr,
                              unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     uint32_t saddr;
 
     saddr = addr >> 2;
@@ -365,7 +365,7 @@ static const MemoryRegionOps bonito_northbridge_ops = {
 static void bonito_pciconf_writel(void *opaque, hwaddr addr,
                                   uint64_t val, unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
     DPRINTF("bonito_pciconf_writel "TARGET_FMT_plx" val %lx\n", addr, val);
@@ -376,7 +376,7 @@ static uint64_t bonito_pciconf_readl(void *opaque, hwaddr addr,
                                      unsigned size)
 {
 
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
 
     DPRINTF("bonito_pciconf_readl "TARGET_FMT_plx"\n", addr);
@@ -399,7 +399,7 @@ static uint64_t bonito_ldma_readl(void *opaque, hwaddr addr,
                                   unsigned size)
 {
     uint32_t val;
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
 
     if (addr >= sizeof(s->bonldma)) {
         return 0;
@@ -413,7 +413,7 @@ static uint64_t bonito_ldma_readl(void *opaque, hwaddr addr,
 static void bonito_ldma_writel(void *opaque, hwaddr addr,
                                uint64_t val, unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
 
     if (addr >= sizeof(s->bonldma)) {
         return;
@@ -436,7 +436,7 @@ static uint64_t bonito_cop_readl(void *opaque, hwaddr addr,
                                  unsigned size)
 {
     uint32_t val;
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
 
     if (addr >= sizeof(s->boncop)) {
         return 0;
@@ -450,7 +450,7 @@ static uint64_t bonito_cop_readl(void *opaque, hwaddr addr,
 static void bonito_cop_writel(void *opaque, hwaddr addr,
                               uint64_t val, unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
 
     if (addr >= sizeof(s->boncop)) {
         return;
@@ -471,7 +471,7 @@ static const MemoryRegionOps bonito_cop_ops = {
 
 static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
     uint32_t cfgaddr;
     uint32_t idsel;
@@ -509,7 +509,7 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
 static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
                                   unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
     uint32_t pciaddr;
@@ -536,7 +536,7 @@ static void bonito_spciconf_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t bonito_spciconf_read(void *opaque, hwaddr addr, unsigned size)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     PCIDevice *d = PCI_DEVICE(s);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
     uint32_t pciaddr;
@@ -578,7 +578,7 @@ static void bonito_host_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
     qemu_irq *pic = s->pic;
-    PCIBonitoState *bonito_state = s->pci_dev;
+    BonitoPciState *bonito_state = s->pci_dev;
     int internal_irq = irq_num - BONITO_IRQ_BASE;
 
     if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
@@ -615,7 +615,7 @@ static int bonito_host_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void bonito_reset(void *opaque)
 {
-    PCIBonitoState *s = opaque;
+    BonitoPciState *s = opaque;
     uint32_t val = 0;
 
     /* set the default value of north bridge registers */
@@ -645,7 +645,7 @@ static const VMStateDescription vmstate_bonito = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PCIBonitoState),
+        VMSTATE_PCI_DEVICE(dev, BonitoPciState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -666,7 +666,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
 
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 {
-    PCIBonitoState *s = PCI_BONITO(dev);
+    BonitoPciState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
     PCIHostState *phb = PCI_HOST_BRIDGE(s->pcihost);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
@@ -760,7 +760,7 @@ PCIBus *bonito_init(qemu_irq *pic)
     DeviceState *dev;
     BonitoState *pcihost;
     PCIHostState *phb;
-    PCIBonitoState *s;
+    BonitoPciState *s;
     PCIDevice *d;
 
     dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
@@ -800,7 +800,7 @@ static void bonito_pci_class_init(ObjectClass *klass, void *data)
 static const TypeInfo bonito_pci_info = {
     .name          = TYPE_PCI_BONITO,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIBonitoState),
+    .instance_size = sizeof(BonitoPciState),
     .class_init    = bonito_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.26.2


