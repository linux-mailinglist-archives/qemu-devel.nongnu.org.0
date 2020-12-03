Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369292CDEBE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:24:51 +0100 (CET)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuDi-0002bK-9b
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7z-0006Os-2n
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:55 -0500
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com
 ([40.107.93.66]:47296 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7r-0008MW-3M
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcgrIoNiqphfcdLIg3fxHj5tGhTpYVatcUeFWk7eYG13w3fhf98kWzK64/bFbSAc8vd/WHe+qIQrO26fCrPdPokHdHyMzjSmD2oMAq9t2neremNK8o5iyUlNqetuRF5tN6116i1SQJ0aarIY8kppsAhvXAzt2q+v7hvBVC1WOPT6rOvo/T5iFGPt5v8sNyQsveyaVNe+mKtp73zLO8X8xFqNnlaQWQzT1zsESI+wZkcYRn+GFvfc+RIb9p/lxJwvGUn7UePPJlrwpmuYFI32r+DmOyPO8m7x+aRBV/OGSOROLALh0SuTEh8dan56p05nV+uFLpbOS00k44EkUrTNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0411OZstH/faHzTmp+2tQoLK9KfKuqqFqi6AQ+RUgs=;
 b=SBxeWjwMYtLSi8ZzGwnpDA8hVeWdbImK0LWiUpffzvC+85CXIviFBCWFMMgW813KwkynqILxxmGwz/YgEcyWAGMmZfeZd/jva8Un1go9KM5dQdwBnxT9kv/vvDzte16xSu573Us0n0mK7qoMMWSByBrSTc7KJEG0141fbeOd7bK1kFdBo7H5ThHk1+n5GxRJ9xWB2yBf4WfmoSqWA1iYVVbxSS/oX8c2+eD/mixVg1uX/wsePTKNrZKg5PhfVRcYGafbFehaPs2GvGnAxl3m4+jdISDd62UqlfDRBKfG3X96Lf9a+2DzkwGqolNZIr4+QsO2sUCvy6dFWaQo6t+wEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0411OZstH/faHzTmp+2tQoLK9KfKuqqFqi6AQ+RUgs=;
 b=ADWSWz+nfnLYD0ZRUlzIhNVwhBfR9ubfNcby0I5bLAQip85LGwNfjBpTNghLuQZ165si17ZndpYsooSP+f5rQvdsfz3yAXgqVHNr0/C/2ZkUa/5rKvMWprm2NA2YRozbMrIL6uGJOHV6AuVk8CJeEBmQLjsxNvpWxuzilZKXaGo=
Received: from DM6PR02CA0107.namprd02.prod.outlook.com (2603:10b6:5:1f4::48)
 by PH0PR02MB7175.namprd02.prod.outlook.com (2603:10b6:510:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 19:18:43 +0000
Received: from CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::66) by DM6PR02CA0107.outlook.office365.com
 (2603:10b6:5:1f4::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 19:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT044.mail.protection.outlook.com (10.152.75.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3632.21 via Frontend Transport; Thu, 3 Dec 2020 19:18:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 11:18:26 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 11:18:26 -0800
Received: from [10.140.6.35] (port=54964 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kku7W-0006hC-D9; Thu, 03 Dec 2020 11:18:26 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A0A7913C0138; Fri,  4 Dec 2020 00:52:55 +0530 (IST)
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
Subject: [PATCH v15 4/4] arm: xlnx-versal: Connect usb to virt-versal
Date: Fri, 4 Dec 2020 00:52:37 +0530
Message-ID: <1607023357-5096-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96a9b8b9-2550-415f-1080-08d897c03fbe
X-MS-TrafficTypeDiagnostic: PH0PR02MB7175:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7175B650B280A29CF1FE8915CAF20@PH0PR02MB7175.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtUFh8EE3gf9OGTrQfna9wQ0rIl24lyczY5eUPfqEAYMJLE8LOqyckVuV4fpg6Y9dfXVti2PlKA+ltjmQBcNi+AqTrHyhiFzy3Fm+F05WDtrVGKPr/sATp1tPQK9s4P9NlTk4vGoiJpY/UqLV1lnw5Ri6i0E1dk74ga6R5DiJ9Y/hcnmfeTQ8IhuUlzuVNcDIOStEajSRouAMzzKA3j50djC5WrXGwZDe/sW27i9pWqVJP0UUM2w+eyANh3em2FyCglykgPrgBsuHDQd5RrD9NuyAt2B3p5TFrNW31l4Rc3MPV7WC4XF5NzNpngyktQqjbv348Zw0zAy+V7quRDU9fQsBr463akohUxLn1tvXnzfeLTGc/rVnW00TdOmh//P0SP2zqrCzuaRC1NqlBxIJZaGhs02/wcHKWgN45IYS8mSekDkRSug2NsCOo3IPPF/
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966005)(6266002)(7416002)(36756003)(36906005)(83380400001)(4326008)(42186006)(70586007)(82310400003)(478600001)(110136005)(8936002)(316002)(8676002)(70206006)(5660300002)(2906002)(7636003)(26005)(356005)(921005)(47076004)(6666004)(6636002)(186003)(426003)(82740400003)(2616005)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 19:18:43.0931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9b8b9-2550-415f-1080-08d897c03fbe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7175
Received-SPF: pass client-ip=40.107.93.66; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

Connect VersalUsb2 subsystem to xlnx-versal SOC, its placed
in iou of lpd domain and configure it as dual port host controller.
Add the respective guest dts nodes for "xlnx-versal-virt" machine.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 55 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 26 +++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  9 ++++++++
 3 files changed, 90 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ee12822..8482cd6 100644
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
 
@@ -148,6 +152,56 @@ static void fdt_add_timer_nodes(VersalVirt *s)
                      compat, sizeof(compat));
 }
 
+static void fdt_add_usb_xhci_nodes(VersalVirt *s)
+{
+    const char clocknames[] = "bus_clk\0ref_clk";
+    const char irq_name[] = "dwc_usb3";
+    const char compatVersalDWC3[] = "xlnx,versal-dwc3";
+    const char compatDWC3[] = "snps,dwc3";
+    char *name = g_strdup_printf("/usb@%" PRIx32, MM_USB2_CTRL_REGS);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compatVersalDWC3, sizeof(compatVersalDWC3));
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
+    name = g_strdup_printf("/usb@%" PRIx32 "/dwc3@%" PRIx32,
+                           MM_USB2_CTRL_REGS, MM_USB_0);
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop(s->fdt, name, "compatible",
+                     compatDWC3, sizeof(compatDWC3));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_USB_0, 2, MM_USB_0_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     irq_name, sizeof(irq_name));
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_USB0_IRQ_0,
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(s->fdt, name,
+                          "snps,quirk-frame-length-adjustment", 0x20);
+    qemu_fdt_setprop_cells(s->fdt, name, "#stream-id-cells", 1);
+    qemu_fdt_setprop_string(s->fdt, name, "dr_mode", "host");
+    qemu_fdt_setprop_string(s->fdt, name, "phy-names", "usb3-phy");
+    qemu_fdt_setprop(s->fdt, name, "snps,dis_u2_susphy_quirk", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,dis_u3_susphy_quirk", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,refclk_fladj", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,mask_phy_reset", NULL, 0);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.dwc);
+    qemu_fdt_setprop_string(s->fdt, name, "maximum-speed", "high-speed");
+    g_free(name);
+}
+
 static void fdt_add_uart_nodes(VersalVirt *s)
 {
     uint64_t addrs[] = { MM_UART1, MM_UART0 };
@@ -515,6 +569,7 @@ static void versal_virt_init(MachineState *machine)
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


