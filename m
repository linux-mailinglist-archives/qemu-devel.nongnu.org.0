Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13841DDE0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:44:04 +0200 (CEST)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyE7-0008G2-2V
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjV-0000N8-Ax
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjR-00046c-8m
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d21so10620065wra.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=55hOMrop2FTkEEIXtaj0g/HwY66d/fQrrEiGqMXLaFA=;
 b=F/DN9r1trB2AFmBjTpgeTjhauyULh+TpypaF5dPPDzY+hOg5m6HrKfr2sK3lWT2Smz
 qw1NNpJGkqCWMzbuTR66woEumSZ1cAeFvHJDnogmFE7I7a5mOKVTmVvzz7Ca8CMEEsnB
 7YZedc9Pe97U4SgWM6hEV+4zzg+wcgp2Xj6kN/ujsNXajwjZaBoywQ9KL7BFnH6NBCeI
 S4K7qeU7Vj1focC5eEg9v5o2XNCBdWfnLmaKx02LlCLXIaUX0MrnWRgenTGTJw4QGKDv
 6JEmm+ADi4irssdMdA0Tt3jimqi9T6/gNG2kzMK/BtnwF8BTYtkwLk11MUlghhyG9/Uv
 /5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=55hOMrop2FTkEEIXtaj0g/HwY66d/fQrrEiGqMXLaFA=;
 b=jqlzObL6f62dM+8ki5swg33OYPrFZJ8BbLgacF7m4i9/6V7qZdWopQUCo/luuEqs6Y
 5EDCwX4xAlghMhfcv9u4uGIl9vm6BchH9/PC8LPNPNxuZj6qV+SRwP1CjvJ9lzVR6DeM
 +9Iyl33us3+xnP1RYMjVox/XLaL2/UQ5hXwYpmhIldoN4HodoC0kK1B7SVbvDhKfNQRn
 XVZ/F2PGZuKa9fPrDAzt3scO0NmgJcbupEDlYl1xebjoZKNNt4Ar+C+VlbwA2tAbL8cp
 pxk4qvlB1BcAX7OFKDor+q1h4RGvGPipqDBWVMgcDc3woMUsCxdSq2jgqeE4j7hOoJ25
 PNZg==
X-Gm-Message-State: AOAM531BZlrSCNymXIFEbqPwfc5ySR1i3vsx3zjVlkHQdmhWmZvQ1nDX
 QIZ21JnidJ57eVSqgrxA/wFERGXtMb06Mw==
X-Google-Smtp-Source: ABdhPJz8QM9oR//mVWRzMMuL8zfdP8QpnSRbTULhsm+j5L8CS7ixcnJp9PHUmNUZ223KKXlznVrpZA==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr6869581wrr.0.1633014739473;
 Thu, 30 Sep 2021 08:12:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] qbus: Rename qbus_create() to qbus_new()
Date: Thu, 30 Sep 2021 16:11:59 +0100
Message-Id: <20210930151201.9407-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Rename the "allocate and return" qbus creation function to
qbus_new(), to bring it into line with our _init vs _new convention.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Message-id: 20210923121153.23754-6-peter.maydell@linaro.org
---
 include/hw/qdev-core.h      | 2 +-
 hw/core/bus.c               | 2 +-
 hw/hyperv/vmbus.c           | 2 +-
 hw/i2c/core.c               | 2 +-
 hw/isa/isa-bus.c            | 2 +-
 hw/misc/auxbus.c            | 2 +-
 hw/pci/pci.c                | 2 +-
 hw/ppc/spapr_vio.c          | 2 +-
 hw/s390x/ap-bridge.c        | 2 +-
 hw/s390x/css-bridge.c       | 2 +-
 hw/s390x/s390-pci-bus.c     | 2 +-
 hw/ssi/ssi.c                | 2 +-
 hw/xen/xen-bus.c            | 2 +-
 hw/xen/xen-legacy-backend.c | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ebca8cf9fca..4ff19c714bd 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -680,7 +680,7 @@ typedef int (qdev_walkerfn)(DeviceState *dev, void *opaque);
 
 void qbus_init(void *bus, size_t size, const char *typename,
                DeviceState *parent, const char *name);
-BusState *qbus_create(const char *typename, DeviceState *parent, const char *name);
+BusState *qbus_new(const char *typename, DeviceState *parent, const char *name);
 bool qbus_realize(BusState *bus, Error **errp);
 void qbus_unrealize(BusState *bus);
 
diff --git a/hw/core/bus.c b/hw/core/bus.c
index cec49985024..c7831b5293b 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -159,7 +159,7 @@ void qbus_init(void *bus, size_t size, const char *typename,
     qbus_init_internal(bus, parent, name);
 }
 
-BusState *qbus_create(const char *typename, DeviceState *parent, const char *name)
+BusState *qbus_new(const char *typename, DeviceState *parent, const char *name)
 {
     BusState *bus;
 
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index c9887d5a7bc..dbce3b35fba 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2729,7 +2729,7 @@ static void vmbus_bridge_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    bridge->bus = VMBUS(qbus_create(TYPE_VMBUS, dev, "vmbus"));
+    bridge->bus = VMBUS(qbus_new(TYPE_VMBUS, dev, "vmbus"));
 }
 
 static char *vmbus_bridge_ofw_unit_address(const SysBusDevice *dev)
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 416372ad00c..0e7d2763b9e 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -60,7 +60,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
 {
     I2CBus *bus;
 
-    bus = I2C_BUS(qbus_create(TYPE_I2C_BUS, parent, name));
+    bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
     return bus;
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index cffaa35e9cf..6c31398dda6 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -64,7 +64,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     }
 
-    isabus = ISA_BUS(qbus_create(TYPE_ISA_BUS, dev, NULL));
+    isabus = ISA_BUS(qbus_new(TYPE_ISA_BUS, dev, NULL));
     isabus->address_space = address_space;
     isabus->address_space_io = address_space_io;
     return isabus;
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 434ff8d910d..8a8012f5f08 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -65,7 +65,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name)
     AUXBus *bus;
     Object *auxtoi2c;
 
-    bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
+    bus = AUX_BUS(qbus_new(TYPE_AUX_BUS, parent, name));
     auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
                                      &error_abort, NULL);
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 14cb15a0aa1..186758ee11f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -478,7 +478,7 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
 {
     PCIBus *bus;
 
-    bus = PCI_BUS(qbus_create(typename, parent, name));
+    bus = PCI_BUS(qbus_new(typename, parent, name));
     pci_root_bus_internal_init(bus, parent, address_space_mem,
                                address_space_io, devfn_min);
     return bus;
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index b59452bcd62..b975ed29cad 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -577,7 +577,7 @@ SpaprVioBus *spapr_vio_bus_init(void)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
-    qbus = qbus_create(TYPE_SPAPR_VIO_BUS, dev, "spapr-vio");
+    qbus = qbus_new(TYPE_SPAPR_VIO_BUS, dev, "spapr-vio");
     bus = SPAPR_VIO_BUS(qbus);
     bus->next_reg = SPAPR_VIO_REG_BASE;
 
diff --git a/hw/s390x/ap-bridge.c b/hw/s390x/ap-bridge.c
index 8bcf8ece9dd..ef8fa2b15be 100644
--- a/hw/s390x/ap-bridge.c
+++ b/hw/s390x/ap-bridge.c
@@ -55,7 +55,7 @@ void s390_init_ap(void)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
-    bus = qbus_create(TYPE_AP_BUS, dev, TYPE_AP_BUS);
+    bus = qbus_new(TYPE_AP_BUS, dev, TYPE_AP_BUS);
 
     /* Enable hotplugging */
     qbus_set_hotplug_handler(bus, OBJECT(dev));
diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 191b29f0771..4017081d49c 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -106,7 +106,7 @@ VirtualCssBus *virtual_css_bus_init(void)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
-    bus = qbus_create(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
+    bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
     cbus = VIRTUAL_CSS_BUS(bus);
 
     /* Enable hotplugging */
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 6c0225c3a01..6fafffb029a 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -813,7 +813,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
     qbus_set_hotplug_handler(bus, OBJECT(dev));
     phb->bus = b;
 
-    s->bus = S390_PCI_BUS(qbus_create(TYPE_S390_PCI_BUS, dev, NULL));
+    s->bus = S390_PCI_BUS(qbus_new(TYPE_S390_PCI_BUS, dev, NULL));
     qbus_set_hotplug_handler(BUS(s->bus), OBJECT(dev));
 
     s->iommu_table = g_hash_table_new_full(g_int64_hash, g_int64_equal,
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index e5d7ce95237..003931fb509 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -107,7 +107,7 @@ DeviceState *ssi_create_peripheral(SSIBus *bus, const char *name)
 SSIBus *ssi_create_bus(DeviceState *parent, const char *name)
 {
     BusState *bus;
-    bus = qbus_create(TYPE_SSI_BUS, parent, name);
+    bus = qbus_new(TYPE_SSI_BUS, parent, name);
     return SSI_BUS(bus);
 }
 
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 8c588920d9f..416583f130b 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1398,7 +1398,7 @@ type_init(xen_register_types)
 void xen_bus_init(void)
 {
     DeviceState *dev = qdev_new(TYPE_XEN_BRIDGE);
-    BusState *bus = qbus_create(TYPE_XEN_BUS, dev, NULL);
+    BusState *bus = qbus_new(TYPE_XEN_BUS, dev, NULL);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     qbus_set_bus_hotplug_handler(bus);
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index dd8ae1452d1..be3cf4a195e 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -702,7 +702,7 @@ int xen_be_init(void)
 
     xen_sysdev = qdev_new(TYPE_XENSYSDEV);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
-    xen_sysbus = qbus_create(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
+    xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
     qbus_set_bus_hotplug_handler(xen_sysbus);
 
     return 0;
-- 
2.20.1


