Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E52AD037
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 08:04:48 +0100 (CET)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNhv-0003Rx-PY
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 02:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNgc-0002X4-Qo
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:03:26 -0500
Received: from mail-bn7nam10on2047.outbound.protection.outlook.com
 ([40.107.92.47]:61664 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNga-0002L1-NW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:03:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmTjwddP+iv7v7RQ7MNz6B4O3ulVL/Tgdd1ZdEgSmYyg8GuoGQ6zKWARO/6LAu1UoRxLBXuCDUQTdhDIPlcOCwGdnyRXdBLB1ppKHvnga5RZ/DWYf/W//Nr/1IcTe0SAo1lKIh3gOzVveqCBpyM6QhzNyPmderBNA6c22rf9i/bUrxKDVg0t6I4ochJBqgiXVuVoIvoAcxeJNX+XixwQl/Zcmg97C+5ST+0ffoy4VyzkObMXyhO7J4yyhIlkME/K3ImoDNPlK6d9pd2s6/uEfkGVNi/hmGOjG+MrDVQ8T6oXlWKflvz5sARqI+UKypmrkSwARxTYuZq2F1VvXPPbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcFd3c1cxvwcGg9DlG/yuYAwKWO1vwg5OcdMwFn/vc0=;
 b=PqOGFWQR4/gRE/P6ltqgumKY7La/zpD5MBuJa3cyc3crOQ4l20LKd9aQo7HjzMEbyV8d5ectT1u1muO3kbfCBTYscdM4B7hIIa/6k6lnBl5r3L0lLtwgIt2kKfJe2hxq7qP10u1MaUMwe0llZGAvg9UlK51GuHw8TO5nMfDGqCFu05/VJ5gtieUpNwylLFE/vdN3beHY/cobriC8eocrKtLUMh4/Ixd0cHcN/J9CpYCCjCwHvGP0S+dgriDj1m1Hvuy3tJDpAVKLG/iFGa1oVaGvIKfHXb7CPWkEvL/jGB0lBiosw81F1QBbCNG/BMzPRSixxZ7MIcD3H9a3aNp4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcFd3c1cxvwcGg9DlG/yuYAwKWO1vwg5OcdMwFn/vc0=;
 b=VcuNt4MmCYRs9Wez1fGCTI8kI6o9LnUAz7bvpkpT9piKV1e7Nmq6StcS9rCtxlo1q1sA8JWo2gAo/k6QDCIt+7Fzw/UacjQDYGSpUyE/e2Kov/1KbhxjfxjD66gX1uefdVJt7ZubQUzoH7xCTJ5uYUDy07hI+NMej+baXqPE3MU=
Received: from MN2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:208:134::30)
 by BY5PR02MB7090.namprd02.prod.outlook.com (2603:10b6:a03:21e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Tue, 10 Nov
 2020 06:48:21 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::a6) by MN2PR16CA0017.outlook.office365.com
 (2603:10b6:208:134::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 06:48:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.22 via Frontend Transport; Tue, 10 Nov 2020 06:48:21 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 9 Nov 2020 22:48:12 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 9 Nov 2020 22:48:12 -0800
Received: from [10.140.6.35] (port=34658 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kcNRs-0005OM-BE; Mon, 09 Nov 2020 22:48:12 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id D5ACF13C0B22; Tue, 10 Nov 2020 12:23:37 +0530 (IST)
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
Subject: [PATCH v13 4/4] arm: xlnx-versal: Connect usb to virt-versal
Date: Tue, 10 Nov 2020 12:22:10 +0530
Message-ID: <1604991130-12965-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05c4b87d-40ed-411e-37df-08d885449d28
X-MS-TrafficTypeDiagnostic: BY5PR02MB7090:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7090F8B73D3980B5E1C140ECCAE90@BY5PR02MB7090.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1zPkRye/Rab0ZfwZssKRkhkKFtbOyCcrmw85NAVieNAfTsICF65OaSJozIgucX2FfQDQynbIrymM9pSY/a7K9WmPOEeSAElhnixjigsVxuFe30nBRrLIyCK3p40vS6gN6LPe//aoAXy7/Wl+82Tca/YlTpds42L4TDBJQDPZgA2iUnUwFDX+J5ezRcI6Q5oFtSUuMYjdTFHstkTCjyj2hbPfwcQ0+V3V3/kcMSmeyKdcQLpMIYKDD7/q/pYDDSKAcggwt/8uKsI+1VqGd+2dD6GLikE22tkzqT46Xlb0Zl4qAWYDZlinJeiNQPntlZZl7KBSdNPGRH+txg9wXFFcMehBY5IRXYfK/dj8ImBxGG7nZi332LxqNn7QjO81nGJWtg5asYs8mFogf3V09j+6oGqoGFrqVFxx6qcSc0AOcd/YFZkGyxYLma2iUUuQNVj
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(186003)(316002)(356005)(4326008)(6666004)(7416002)(6266002)(478600001)(70586007)(70206006)(42186006)(2616005)(5660300002)(110136005)(2906002)(6636002)(82740400003)(8936002)(83380400001)(47076004)(336012)(7636003)(82310400003)(26005)(8676002)(36756003)(36906005)(426003)(102446001)(921003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:48:21.2444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c4b87d-40ed-411e-37df-08d885449d28
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7090
Received-SPF: pass client-ip=40.107.92.47; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:03:23
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

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Connect VersalUbs2 subsystem to xlnx-versal SOC, its placed
in iou of lpd domain and configure it as dual port host controller.
Add the respective guest dts nodes for "xlnx-versal-virt" machine.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 58 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 26 ++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  9 +++++++
 3 files changed, 93 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ee12822..84b450e 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -39,6 +39,8 @@ struct VersalVirt {
         uint32_t ethernet_phy[2];
         uint32_t clk_125Mhz;
         uint32_t clk_25Mhz;
+        uint32_t usb;
+        uint32_t dwc;
     } phandle;
     struct arm_boot_info binfo;
 
@@ -66,6 +68,8 @@ static void fdt_create(VersalVirt *s)
     s->phandle.clk_25Mhz = qemu_fdt_alloc_phandle(s->fdt);
     s->phandle.clk_125Mhz = qemu_fdt_alloc_phandle(s->fdt);
 
+    s->phandle.usb = qemu_fdt_alloc_phandle(s->fdt);
+    s->phandle.dwc = qemu_fdt_alloc_phandle(s->fdt);
     /* Create /chosen node for load_dtb.  */
     qemu_fdt_add_subnode(s->fdt, "/chosen");
 
@@ -148,6 +152,59 @@ static void fdt_add_timer_nodes(VersalVirt *s)
                      compat, sizeof(compat));
 }
 
+static void fdt_add_usb_xhci_nodes(VersalVirt *s)
+{
+    const char clocknames[] = "bus_clk\0ref_clk";
+    char *name = g_strdup_printf("/usb@%" PRIx32, MM_USB2_CTRL_REGS);
+    const char compat[] = "xlnx,versal-dwc3";
+
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_USB2_CTRL_REGS,
+                                 2, MM_USB2_CTRL_REGS_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+    qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_25Mhz, s->phandle.clk_125Mhz);
+    qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
+    qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 2);
+    qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 2);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.usb);
+    g_free(name);
+
+    {
+        const char irq_name[] = "dwc_usb3";
+        const char compat[] = "snps,dwc3";
+
+        name = g_strdup_printf("/usb@%" PRIx32 "/dwc3@%" PRIx32,
+                               MM_USB2_CTRL_REGS, MM_USB_0);
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat, sizeof(compat));
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, MM_USB_0, 2, MM_USB_0_SIZE);
+        qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                         irq_name, sizeof(irq_name));
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                                   GIC_FDT_IRQ_TYPE_SPI, VERSAL_USB0_IRQ_0,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_cell(s->fdt, name,
+                              "snps,quirk-frame-length-adjustment", 0x20);
+        qemu_fdt_setprop_cells(s->fdt, name, "#stream-id-cells", 1);
+        qemu_fdt_setprop_string(s->fdt, name, "dr_mode", "host");
+        qemu_fdt_setprop_string(s->fdt, name, "phy-names", "usb3-phy");
+        qemu_fdt_setprop(s->fdt, name, "snps,dis_u2_susphy_quirk", NULL, 0);
+        qemu_fdt_setprop(s->fdt, name, "snps,dis_u3_susphy_quirk", NULL, 0);
+        qemu_fdt_setprop(s->fdt, name, "snps,refclk_fladj", NULL, 0);
+        qemu_fdt_setprop(s->fdt, name, "snps,mask_phy_reset", NULL, 0);
+        qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.dwc);
+        qemu_fdt_setprop_string(s->fdt, name, "maximum-speed", "high-speed");
+        g_free(name);
+    }
+}
+
 static void fdt_add_uart_nodes(VersalVirt *s)
 {
     uint64_t addrs[] = { MM_UART1, MM_UART0 };
@@ -515,6 +572,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_gic_nodes(s);
     fdt_add_timer_nodes(s);
     fdt_add_zdma_nodes(s);
+    fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 12ba6c4..b077716 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -145,6 +145,31 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_usbs(Versal *s, qemu_irq *pic)
+{
+    DeviceState *dev;
+    MemoryRegion *mr;
+
+    object_initialize_child(OBJECT(s), "usb2", &s->lpd.iou.usb,
+                            TYPE_XILINX_VERSAL_USB2);
+    dev = DEVICE(&s->lpd.iou.usb);
+
+    object_property_set_link(OBJECT(dev), "dma", OBJECT(&s->mr_ps),
+                             &error_abort);
+    qdev_prop_set_uint32(dev, "intrs", 1);
+    qdev_prop_set_uint32(dev, "slots", 2);
+
+    sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_add_subregion(&s->mr_ps, MM_USB_0, mr);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[VERSAL_USB0_IRQ_0]);
+
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_add_subregion(&s->mr_ps, MM_USB2_CTRL_REGS, mr);
+}
+
 static void versal_create_gems(Versal *s, qemu_irq *pic)
 {
     int i;
@@ -333,6 +358,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_apu_cpus(s);
     versal_create_apu_gic(s, pic);
     versal_create_uarts(s, pic);
+    versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 8ce8e63..2b76885 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -21,6 +21,7 @@
 #include "hw/net/cadence_gem.h"
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
 #include "qom/object.h"
+#include "hw/usb/xlnx-usb-subsystem.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -59,6 +60,7 @@ struct Versal {
             PL011State uart[XLNX_VERSAL_NR_UARTS];
             CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
             XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
+            VersalUsb2 usb;
         } iou;
     } lpd;
 
@@ -88,6 +90,7 @@ struct Versal {
 
 #define VERSAL_UART0_IRQ_0         18
 #define VERSAL_UART1_IRQ_0         19
+#define VERSAL_USB0_IRQ_0          22
 #define VERSAL_GEM0_IRQ_0          56
 #define VERSAL_GEM0_WAKE_IRQ_0     57
 #define VERSAL_GEM1_IRQ_0          58
@@ -125,6 +128,12 @@ struct Versal {
 #define MM_OCM                      0xfffc0000U
 #define MM_OCM_SIZE                 0x40000
 
+#define MM_USB2_CTRL_REGS           0xFF9D0000
+#define MM_USB2_CTRL_REGS_SIZE      0x10000
+
+#define MM_USB_0                    0xFE200000
+#define MM_USB_0_SIZE               0x10000
+
 #define MM_TOP_DDR                  0x0
 #define MM_TOP_DDR_SIZE             0x80000000U
 #define MM_TOP_DDR_2                0x800000000ULL
-- 
2.7.4


