Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EA2C99B0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:40:38 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1DB-0002kn-N9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk17O-0005qg-Bh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:38 -0500
Received: from mail-co1nam11on2058.outbound.protection.outlook.com
 ([40.107.220.58]:39808 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk17M-00033f-66
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw6Kqqc9YQull3De1gHa1dbHhFKdmJ4kCV2bzc4tqK47OSYMigAD4qzJqndgkaXt2v2Rge4vcrMuVqKtytO2XlPs/NzMbLJCHziG1hnqfnXpXbNusYr+lwik+Zx/uxBTURDOWw3Xgi9pkYnDS71juLzHhfMBt0TlKbaRcGpxLg0TqqAUOCAxPu9tS4jfwtD30979M766/b8MOm822LVnbVljEu/gh2I5grzF9TjNLOocJA1jHEOmo/TrIvKninNuQ9zHVI6wKhh7Ej1hJVPyAFO14+iqcUFXfgyiv9Ji3KAVywEKj1wsDNnKlLLFdR51mbE0fhNGGZdACqby7j1EPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWu8oaaQLkanZvSPmemhH6Bgs1py2VQfkZpxfuL82us=;
 b=U08PBFKDbCyeTK4rJq3f2T1SOw9jdjFId4KSHW6/fZDE0Kw83wMai0KPFLHhRbO93h10O4ryekqq95UbmJMgPuFfEAbfqzPySTlZFv2vZOdGvojAGy+jjmr0MMCIQFnJrfEFssxUgx4E8puezeHUen2nHL8L8MkKUrtpahsts2hN7Zofn+3+eynalpl21luFymiwGfFuxVkWqDMsexvbuCA9tsT1sZUt8FENQa7y2NVXZ1jOufuZeyQRw94h3oNZVzXDqrxwJPMg1IpUhok+/B+YCQveRGbW04Xp55U4k8lS51HPDUNzT1F8iN+Ol5bh4Epwf2Ecd4dUl+6T2ZGydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWu8oaaQLkanZvSPmemhH6Bgs1py2VQfkZpxfuL82us=;
 b=aYw2O3Yj6/21M5I33+HS7F0kAI2nyH597p7u0aTVPNaLrLMEGKffltKQ3NsguOEkvhLfkIfLi+mEaGzTwSqrl+A/71avt1OqMgXbSGalD11KNyAmLsdIypiHnac1ih/UxqtE3UcriayV7a7VWFbbdbFGR8Hi0Uncrs/U5SjSY/k=
Received: from CY1PR07CA0039.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::49) by BY5PR02MB6594.namprd02.prod.outlook.com
 (2603:10b6:a03:20b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 08:34:33 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:e400:c60a:cafe::7d) by CY1PR07CA0039.outlook.office365.com
 (2a01:111:e400:c60a::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 08:34:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Tue, 1 Dec 2020 08:34:33 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 1 Dec 2020 00:34:10 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 1 Dec 2020 00:34:10 -0800
Received: from [10.140.6.35] (port=34288 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kk16r-0001JF-9h; Tue, 01 Dec 2020 00:34:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id D271213C08A3; Tue,  1 Dec 2020 14:08:39 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Edgar Iglesias <edgari@xilinx.com>, "Francisco
 Eduardo Iglesias" <figlesia@xilinx.com>, Alistair Francis
 <alistair.francis@wdc.com>, Eduardo Habkost <ehabkost@redhat.com>, Ying Fang
 <fangying1@huawei.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>, Paul Zimmerman
 <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>
Subject: [PATCH v14 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Date: Tue, 1 Dec 2020 14:08:34 +0530
Message-ID: <1606811915-8492-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e309c200-cc47-4e2b-a107-08d895d3edee
X-MS-TrafficTypeDiagnostic: BY5PR02MB6594:
X-Microsoft-Antispam-PRVS: <BY5PR02MB65944C444EAA148A4D20421ACAF40@BY5PR02MB6594.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTKndWvtZ8MF/TRbHKuBPzrkEo2BIx127PAXGu2X+a3HGSbF2vcA6QxqnPrVFTK2pvGhgHYexdF8a85JhvrEXKVUhYR9eHzqEUyj2nJ6OKZdXEzBArhRAUftKwhkokZqGsgzF+YhzI5ncVwts2VousdIgwDlWF3L2C91Q3zO6L6UwN5oY4sRX469zZema6BBGRngFsgvYZAvKrWL/QZnbYZPC8thTzGHeuaYqFkt8AbDZArmaIofmlK/28oZqRPhQjnA2jesnxP3E2dDuEy2/HXBi42LaZc6wFyFjuhtiYvVwVbVSajwg8lUk2z24C7omKjjzf+lEKzJ5E2CxeJATTjeQhVuroxmDcrjKLkpr850tK/Pk9Ze3Jh0UU9wKCPDDS4kjx0Y/SNbR/cJu8cBltvqwnlvdAgztvha+6v72RLklkLCRaDZnAV9SzCnh49J
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(70586007)(83380400001)(36756003)(6636002)(19627235002)(6666004)(921005)(47076004)(5660300002)(82740400003)(356005)(7636003)(82310400003)(42186006)(8676002)(4326008)(2616005)(336012)(426003)(110136005)(2906002)(70206006)(26005)(478600001)(316002)(7416002)(186003)(36906005)(8936002)(6266002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 08:34:33.4782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e309c200-cc47-4e2b-a107-08d895d3edee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6594
Received-SPF: pass client-ip=40.107.220.58; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This model is a top level integration wrapper for hcd-dwc3 and
versal-usb2-ctrl-regs modules, this is used by xilinx versal soc's and
future xilinx usb subsystems would also be part of it.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/usb/Kconfig                      |  5 ++
 hw/usb/meson.build                  |  1 +
 hw/usb/xlnx-usb-subsystem.c         | 94 +++++++++++++++++++++++++++++++++++++
 include/hw/usb/xlnx-usb-subsystem.h | 45 ++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 56da78a..40093d7 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -117,3 +117,8 @@ config USB_DWC3
     bool
     select USB_XHCI_SYSBUS
     select REGISTER
+
+config XLNX_USB_SUBSYS
+    bool
+    default y if XLNX_VERSAL
+    select USB_DWC3
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 433c27e..f46c6b6 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
 # emulated usb devices
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
new file mode 100644
index 0000000..5682573
--- /dev/null
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pava.boddu@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb/xlnx-usb-subsystem.h"
+
+static void versal_usb2_realize(DeviceState *dev, Error **errp)
+{
+    VersalUsb2 *s = VERSAL_USB2(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Error *err = NULL;
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->dwc3), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_realize(SYS_BUS_DEVICE(&s->usb2Ctrl), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_init_mmio(sbd, &s->dwc3_mr);
+    sysbus_init_mmio(sbd, &s->usb2Ctrl_mr);
+    qdev_pass_gpios(DEVICE(&s->dwc3.sysbus_xhci), dev, SYSBUS_DEVICE_GPIO_IRQ);
+}
+
+static void versal_usb2_init(Object *obj)
+{
+    VersalUsb2 *s = VERSAL_USB2(obj);
+
+    object_initialize_child(obj, "versal.dwc3", &s->dwc3,
+                            TYPE_USB_DWC3);
+    object_initialize_child(obj, "versal.usb2-ctrl", &s->usb2Ctrl,
+                            TYPE_XILINX_VERSAL_USB2_CTRL_REGS);
+    memory_region_init_alias(&s->dwc3_mr, obj, "versal.dwc3_alias",
+                             &s->dwc3.iomem, 0, DWC3_SIZE);
+    memory_region_init_alias(&s->usb2Ctrl_mr, obj, "versal.usb2Ctrl_alias",
+                             &s->usb2Ctrl.iomem, 0, USB2_REGS_R_MAX * 4);
+    qdev_alias_all_properties(DEVICE(&s->dwc3), obj);
+    qdev_alias_all_properties(DEVICE(&s->dwc3.sysbus_xhci), obj);
+    object_property_add_alias(obj, "dma", OBJECT(&s->dwc3.sysbus_xhci), "dma");
+}
+
+static void versal_usb2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = versal_usb2_realize;
+}
+
+static const TypeInfo versal_usb2_info = {
+    .name          = TYPE_XILINX_VERSAL_USB2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VersalUsb2),
+    .class_init    = versal_usb2_class_init,
+    .instance_init = versal_usb2_init,
+};
+
+static void versal_usb_types(void)
+{
+    type_register_static(&versal_usb2_info);
+}
+
+type_init(versal_usb_types)
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
new file mode 100644
index 0000000..739bef7
--- /dev/null
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -0,0 +1,45 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef _XLNX_VERSAL_USB_SUBSYSTEM_H_
+#define _XLNX_VERSAL_USB_SUBSYSTEM_H_
+
+#include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
+#include "hw/usb/hcd-dwc3.h"
+
+#define TYPE_XILINX_VERSAL_USB2 "xlnx.versal-usb2"
+
+#define VERSAL_USB2(obj) \
+     OBJECT_CHECK(VersalUsb2, (obj), TYPE_XILINX_VERSAL_USB2)
+
+typedef struct VersalUsb2 {
+    SysBusDevice parent_obj;
+    MemoryRegion dwc3_mr;
+    MemoryRegion usb2Ctrl_mr;
+
+    VersalUsb2CtrlRegs usb2Ctrl;
+    USBDWC3 dwc3;
+} VersalUsb2;
+
+#endif
-- 
2.7.4


