Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53D2AD005
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:52:30 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNW1-0006er-UQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNT1-0004Uv-5j
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:49:23 -0500
Received: from mail-dm6nam11on2056.outbound.protection.outlook.com
 ([40.107.223.56]:40288 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNSz-00061t-2N
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:49:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBh3vimqtOASYYo39g2VtV+hBki82rkVt6TVdqBs7WAdB6aXlZ+Q2X/Rh7KWXd18ed/tW75K4Q/C/6Ox2vwll8LsVNHgCdbYpAaOAL8qBh64QTODPkmZ08ItySYtLe+rIP7fiUy3nNAM10teAJsUjrs5Zl0j+UgAP8skkGpasP7IkGZkB0dy62OVU8VksBUDjrVEkoXOXLd/01p0HjQuinpfzb9ppgvOXPrG4InU8FZnMQE2881WVYwtzj4HUW8popHrdfAqjUahipkTfuB6vNoMFu3pvaB4ozCx+f5887OvDvdQuDMSsibcDOcE4lT3hPqAa8HybSpa80TloIF1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owldZoXKoo7efrmVHvG+1j4kgfNrKUOrrGcrOWIJjX0=;
 b=Cvw4bPi7mRc8Sjel3+4P3UkHo4i1rNc+zdivbV9r3YZ05EDnTsz9XTg/EsIg5Gr9OommOz8MAFvvo9rEOmCJLY4V9X8Z7La+fQoDhZLlIbBkF5dG+C8Yq9VMhZtLaeJoVppPxKbgOayvsxQxuqSUi64xnzYZLAtsvZC208Yei0nlnIOeoHJ9NQNwnr/aymjb4yhGZDPzRw+e7e1Sz2dITyonUucjrXBw/cNxPyb/tHzcCaVrqtjS4Bkb4k3gcsj+dgKGrvwIkdvN1+6296LHJIcFM2K40c7wKUK8j9TrBXKF+Cjkh9CDxl3yh1Ome7uSRaoopzcnX6PxYon1qELhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owldZoXKoo7efrmVHvG+1j4kgfNrKUOrrGcrOWIJjX0=;
 b=FsZouDbyv7zGoHB1dg3P4Mc1iWVO2b5XdC8Cja7LTSQ0fcQQNkB82cStOLXpgQLtgG8+IacLhNDf4sNDMGXKZS+084LVjr8PkpcYJRlhhZsoAEMEdZiE/awJF7LbfY6JygHgaiz4LyzuEh/xmRyVHneN4N5IVqFF0/tMZzYNaVI=
Received: from MN2PR02CA0007.namprd02.prod.outlook.com (2603:10b6:208:fc::20)
 by MWHPR02MB2303.namprd02.prod.outlook.com (2603:10b6:300:5f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 06:49:16 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:fc:cafe::fc) by MN2PR02CA0007.outlook.office365.com
 (2603:10b6:208:fc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 06:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 06:49:16 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 9 Nov 2020 22:48:12 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 9 Nov 2020 22:48:12 -0800
Received: from [10.140.6.35] (port=34656 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kcNRs-0005OL-9r; Mon, 09 Nov 2020 22:48:12 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CB4AB13C0A68; Tue, 10 Nov 2020 12:23:37 +0530 (IST)
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
Subject: [PATCH v13 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Date: Tue, 10 Nov 2020 12:22:09 +0530
Message-ID: <1604991130-12965-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00a5f4c5-6632-4132-c001-08d88544bdde
X-MS-TrafficTypeDiagnostic: MWHPR02MB2303:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2303B6532918F3677A972B58CAE90@MWHPR02MB2303.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTsyFJkscx9Z2I6leJV6b+yQSYd+2gdKIjCpZG93eJZM40tSlB+/5aq9BzRcQNCdmcGSbZPNxdmWv0bLCoasRVvaTsovu5GN0akUFFiWrtrqA+AXn3uluBNslr+zGDcHsIdCIFf+dvNEkWFH9nerc3eK88YLZlQSNt9+qMxR2HJhV4Tp4ytA7+13UYDZCjspelmrZGU+hUUk0cXl8Kg+sTApHPH18G4t/kCjPqDhoZqEwQ/hHg2be9nHkqrEJuLls85xIE6lQu5cp5ecTQX3X9rzZHxrdeg+vhk1Qk8dSwoifhWGuh8rAq2jZ+30LazbmoXjE721Sevszb/72jsfDJInLLrwFjZJBhbeJ5zkjuKZGwxgBvW/Ea9qVf2IYba4N+ipKW7/pJ1Ogt8zBcB1x+o5D9kbLjBHznJ+0JG9zdQmL46A8/I42wElh1DeiOYS
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(356005)(42186006)(6636002)(82310400003)(2616005)(83380400001)(4326008)(8936002)(6666004)(316002)(47076004)(36906005)(7416002)(82740400003)(110136005)(7636003)(26005)(8676002)(336012)(70586007)(70206006)(5660300002)(186003)(19627235002)(2906002)(426003)(6266002)(478600001)(36756003)(102446001)(921003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:49:16.1268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a5f4c5-6632-4132-c001-08d88544bdde
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2303
Received-SPF: pass client-ip=40.107.223.56; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:49:18
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
 hw/usb/meson.build                  |  1 +
 hw/usb/xlnx-usb-subsystem.c         | 94 +++++++++++++++++++++++++++++++++++++
 include/hw/usb/xlnx-usb-subsystem.h | 45 ++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h

diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 433c27e..580d28d 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-usb-subsystem.c'))
 
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


