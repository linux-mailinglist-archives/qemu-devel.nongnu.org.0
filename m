Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D32C99AE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:38:53 +0100 (CET)
Received: from localhost ([::1]:44636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1BU-0000oL-CM
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk17D-0005fs-Vj
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:28 -0500
Received: from mail-dm6nam12on2041.outbound.protection.outlook.com
 ([40.107.243.41]:37472 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk17B-00030o-1M
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itpppkkPrHV3jEZRjGA56nnX3CePTR6e9K470hOQgUOpBq0zjbn6BmghfpSk58/wV3x3r2yiChtUhFU0GDGrgARNqCA4NLvrm1nRsuQZ8KKc/xY2zsUScjY8m0Ilj6t8j/txuJQFOnsEsjrwFqSdzNzawm5CaXRbDOJaDcVPCh8WCa4umYAJCTE4HE1pNb7eqqmbc4KhBj//QhM/HNjfSF8HdaPQK55zdy1Wudi34Gfi9BB1c2ZRWGmnkM1kXzXAWct+qMLxmTg1M/1DQCE2L1KuRMGYp582Q/dBVteE3+cNReycO3xQQrALncby2qOQ6h49RDj1FkxUN+PzFhTG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7Qpb1rBjWu5V9nC9IVGq25JvCpAjhfPFW6Pc25REF4=;
 b=NSmeIuLOO16KPWl0bjJTDCveoeJxwmY1JIOT7OKmzkbQ234aMyfa/IAUVgpMBMFyPEv/VmnoDC2aXUIyPNZpZsZbMypeb2+AGREsGbFpRLC/fwlDKLMICmiiZM3zb9UveHcrKNfGlORkKwUJLIxIZJQxs/a/kPhfFSVvAHQTYNZv4jLDNc2nMU8yJRyc4Yw+0K0jM8OIPlZAtdUc4+5sMWbbcldbC55EqdmwjOEzseqHZzTxYql+kyfCgktme+OaURcFR3RCCxx5Ufzy9ThSvUSCv4UPjuZoOkyvL+AMva+aPojK37tY8gF8S4QocRXSE6ckOA7R+cJX3MrksIjj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7Qpb1rBjWu5V9nC9IVGq25JvCpAjhfPFW6Pc25REF4=;
 b=bMog21aeBLyxj080TvQ9vPnicwzCR6EIFXBkAD1rVkFrD1aIanKRWCJyQ8Q0zZEw8wClKMVTmNTURmjFSeqcC2tUvGEH0/ZZ+uDCdRQ4WF2sCMEZsmmF6xokFkWgXlt1cYfssX4HWa9dcOnJiqjMlSySho8PxlrYTo836viSmJ8=
Received: from MN2PR11CA0003.namprd11.prod.outlook.com (2603:10b6:208:23b::8)
 by BN6PR02MB2500.namprd02.prod.outlook.com (2603:10b6:404:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 08:34:20 +0000
Received: from BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23b:cafe::c1) by MN2PR11CA0003.outlook.office365.com
 (2603:10b6:208:23b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 1 Dec 2020 08:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT038.mail.protection.outlook.com (10.152.77.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Tue, 1 Dec 2020 08:34:20 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 1 Dec 2020 00:34:11 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 1 Dec 2020 00:34:11 -0800
Received: from [10.140.6.35] (port=34286 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kk16r-0001JE-8f; Tue, 01 Dec 2020 00:34:06 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CAF4813C089C; Tue,  1 Dec 2020 14:08:39 +0530 (IST)
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
Subject: [PATCH v14 2/4] usb: Add DWC3 model
Date: Tue, 1 Dec 2020 14:08:33 +0530
Message-ID: <1606811915-8492-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4971f3cc-69e9-4b7d-1db5-08d895d3e625
X-MS-TrafficTypeDiagnostic: BN6PR02MB2500:
X-Microsoft-Antispam-PRVS: <BN6PR02MB250064021137ED074C49261ECAF40@BN6PR02MB2500.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvMDKHp8GT6+A0hUbuoFwTvkLgDbkU35P6rfFbMZd/Pq4hJfDfraoURilOovbCHLOxnu/EmMxZTLrKc5pJ0y0FWOgewC+6MzqgeIulmHanI2ips2WE+rXJ16WhJ6znXIq4CtJEU89Og0v95ay8TETpvetiVaifFzNrU2rUtyTZxr2kayBLCIr0V8kAEBrb3b2D6nTzqUHQo6W8kIiUL+YwKTCKvFrWBDlY+HXQkzjk5t6anf+6RVxw9YXwVowzjrDhrOa0CgTM1Ws8uAOrUM/BgsOi9TWj5VqU6esUEDzNN+1S31cCR1ozYFopuXJ5/unHBkjZvVcQG0lvduhq3tNHi0zU/5lqm0f5EdJoTukCKw+DKYY7Rd8yHVQCHTFNgW2p0T7/67r48oGzvpDTH2TA3mGAlGfKp+6O9iiHc1ccbsKtPEAZTGnmtcWBgu6X3Q
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(30864003)(8676002)(6266002)(110136005)(316002)(42186006)(6636002)(921005)(4326008)(7416002)(82310400003)(356005)(36756003)(2906002)(70586007)(478600001)(6666004)(83380400001)(70206006)(47076004)(82740400003)(186003)(5660300002)(8936002)(7636003)(36906005)(336012)(426003)(2616005)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 08:34:20.3266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4971f3cc-69e9-4b7d-1db5-08d895d3e625
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2500
Received-SPF: pass client-ip=40.107.243.41; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

This patch adds skeleton model of dwc3 usb controller attached to
xhci-sysbus device. It defines global register space of DWC3 controller,
global registers control the AXI/AHB interfaces properties, external FIFO
support and event count support. All of which are unimplemented at
present,we are only supporting core reset and read of ID register.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/usb/Kconfig            |   5 +
 hw/usb/hcd-dwc3.c         | 677 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build        |   1 +
 include/hw/usb/hcd-dwc3.h |  56 ++++
 4 files changed, 739 insertions(+)
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 include/hw/usb/hcd-dwc3.h

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 7fbae18..56da78a 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -112,3 +112,8 @@ config IMX_USBPHY
     bool
     default y
     depends on USB
+
+config USB_DWC3
+    bool
+    select USB_XHCI_SYSBUS
+    select REGISTER
diff --git a/hw/usb/hcd-dwc3.c b/hw/usb/hcd-dwc3.c
new file mode 100644
index 0000000..cf71fe4
--- /dev/null
+++ b/hw/usb/hcd-dwc3.c
@@ -0,0 +1,677 @@
+/*
+ * QEMU model of the USB DWC3 host controller emulation.
+ *
+ * This model defines global register space of DWC3 controller. Global
+ * registers control the AXI/AHB interfaces properties, external FIFO support
+ * and event count support. All of which are unimplemented at present. We are
+ * only supporting core reset and read of ID register.
+ *
+ * Copyright (c) 2020 Xilinx Inc. Vikram Garhwal<fnu.vikram@xilinx.com>
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
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb/hcd-dwc3.h"
+#include "qapi/error.h"
+
+#ifndef USB_DWC3_ERR_DEBUG
+#define USB_DWC3_ERR_DEBUG 0
+#endif
+
+#define HOST_MODE           1
+#define FIFO_LEN         0x1000
+
+REG32(GSBUSCFG0, 0x00)
+    FIELD(GSBUSCFG0, DATRDREQINFO, 28, 4)
+    FIELD(GSBUSCFG0, DESRDREQINFO, 24, 4)
+    FIELD(GSBUSCFG0, DATWRREQINFO, 20, 4)
+    FIELD(GSBUSCFG0, DESWRREQINFO, 16, 4)
+    FIELD(GSBUSCFG0, RESERVED_15_12, 12, 4)
+    FIELD(GSBUSCFG0, DATBIGEND, 11, 1)
+    FIELD(GSBUSCFG0, DESBIGEND, 10, 1)
+    FIELD(GSBUSCFG0, RESERVED_9_8, 8, 2)
+    FIELD(GSBUSCFG0, INCR256BRSTENA, 7, 1)
+    FIELD(GSBUSCFG0, INCR128BRSTENA, 6, 1)
+    FIELD(GSBUSCFG0, INCR64BRSTENA, 5, 1)
+    FIELD(GSBUSCFG0, INCR32BRSTENA, 4, 1)
+    FIELD(GSBUSCFG0, INCR16BRSTENA, 3, 1)
+    FIELD(GSBUSCFG0, INCR8BRSTENA, 2, 1)
+    FIELD(GSBUSCFG0, INCR4BRSTENA, 1, 1)
+    FIELD(GSBUSCFG0, INCRBRSTENA, 0, 1)
+REG32(GSBUSCFG1, 0x04)
+    FIELD(GSBUSCFG1, RESERVED_31_13, 13, 19)
+    FIELD(GSBUSCFG1, EN1KPAGE, 12, 1)
+    FIELD(GSBUSCFG1, PIPETRANSLIMIT, 8, 4)
+    FIELD(GSBUSCFG1, RESERVED_7_0, 0, 8)
+REG32(GTXTHRCFG, 0x08)
+    FIELD(GTXTHRCFG, RESERVED_31, 31, 1)
+    FIELD(GTXTHRCFG, RESERVED_30, 30, 1)
+    FIELD(GTXTHRCFG, USBTXPKTCNTSEL, 29, 1)
+    FIELD(GTXTHRCFG, RESERVED_28, 28, 1)
+    FIELD(GTXTHRCFG, USBTXPKTCNT, 24, 4)
+    FIELD(GTXTHRCFG, USBMAXTXBURSTSIZE, 16, 8)
+    FIELD(GTXTHRCFG, RESERVED_15, 15, 1)
+    FIELD(GTXTHRCFG, RESERVED_14, 14, 1)
+    FIELD(GTXTHRCFG, RESERVED_13_11, 11, 3)
+    FIELD(GTXTHRCFG, RESERVED_10_0, 0, 11)
+REG32(GRXTHRCFG, 0x0c)
+    FIELD(GRXTHRCFG, RESERVED_31_30, 30, 2)
+    FIELD(GRXTHRCFG, USBRXPKTCNTSEL, 29, 1)
+    FIELD(GRXTHRCFG, RESERVED_28, 28, 1)
+    FIELD(GRXTHRCFG, USBRXPKTCNT, 24, 4)
+    FIELD(GRXTHRCFG, USBMAXRXBURSTSIZE, 19, 5)
+    FIELD(GRXTHRCFG, RESERVED_18_16, 16, 3)
+    FIELD(GRXTHRCFG, RESERVED_15, 15, 1)
+    FIELD(GRXTHRCFG, RESERVED_14_13, 13, 2)
+    FIELD(GRXTHRCFG, RESVISOCOUTSPC, 0, 13)
+REG32(GCTL, 0x10)
+    FIELD(GCTL, PWRDNSCALE, 19, 13)
+    FIELD(GCTL, MASTERFILTBYPASS, 18, 1)
+    FIELD(GCTL, BYPSSETADDR, 17, 1)
+    FIELD(GCTL, U2RSTECN, 16, 1)
+    FIELD(GCTL, FRMSCLDWN, 14, 2)
+    FIELD(GCTL, PRTCAPDIR, 12, 2)
+    FIELD(GCTL, CORESOFTRESET, 11, 1)
+    FIELD(GCTL, U1U2TIMERSCALE, 9, 1)
+    FIELD(GCTL, DEBUGATTACH, 8, 1)
+    FIELD(GCTL, RAMCLKSEL, 6, 2)
+    FIELD(GCTL, SCALEDOWN, 4, 2)
+    FIELD(GCTL, DISSCRAMBLE, 3, 1)
+    FIELD(GCTL, U2EXIT_LFPS, 2, 1)
+    FIELD(GCTL, GBLHIBERNATIONEN, 1, 1)
+    FIELD(GCTL, DSBLCLKGTNG, 0, 1)
+REG32(GPMSTS, 0x14)
+REG32(GSTS, 0x18)
+    FIELD(GSTS, CBELT, 20, 12)
+    FIELD(GSTS, RESERVED_19_12, 12, 8)
+    FIELD(GSTS, SSIC_IP, 11, 1)
+    FIELD(GSTS, OTG_IP, 10, 1)
+    FIELD(GSTS, BC_IP, 9, 1)
+    FIELD(GSTS, ADP_IP, 8, 1)
+    FIELD(GSTS, HOST_IP, 7, 1)
+    FIELD(GSTS, DEVICE_IP, 6, 1)
+    FIELD(GSTS, CSRTIMEOUT, 5, 1)
+    FIELD(GSTS, BUSERRADDRVLD, 4, 1)
+    FIELD(GSTS, RESERVED_3_2, 2, 2)
+    FIELD(GSTS, CURMOD, 0, 2)
+REG32(GUCTL1, 0x1c)
+    FIELD(GUCTL1, RESUME_OPMODE_HS_HOST, 10, 1)
+REG32(GSNPSID, 0x20)
+REG32(GGPIO, 0x24)
+    FIELD(GGPIO, GPO, 16, 16)
+    FIELD(GGPIO, GPI, 0, 16)
+REG32(GUID, 0x28)
+REG32(GUCTL, 0x2c)
+    FIELD(GUCTL, REFCLKPER, 22, 10)
+    FIELD(GUCTL, NOEXTRDL, 21, 1)
+    FIELD(GUCTL, RESERVED_20_18, 18, 3)
+    FIELD(GUCTL, SPRSCTRLTRANSEN, 17, 1)
+    FIELD(GUCTL, RESBWHSEPS, 16, 1)
+    FIELD(GUCTL, RESERVED_15, 15, 1)
+    FIELD(GUCTL, USBHSTINAUTORETRYEN, 14, 1)
+    FIELD(GUCTL, ENOVERLAPCHK, 13, 1)
+    FIELD(GUCTL, EXTCAPSUPPTEN, 12, 1)
+    FIELD(GUCTL, INSRTEXTRFSBODI, 11, 1)
+    FIELD(GUCTL, DTCT, 9, 2)
+    FIELD(GUCTL, DTFT, 0, 9)
+REG32(GBUSERRADDRLO, 0x30)
+REG32(GBUSERRADDRHI, 0x34)
+REG32(GHWPARAMS0, 0x40)
+    FIELD(GHWPARAMS0, GHWPARAMS0_31_24, 24, 8)
+    FIELD(GHWPARAMS0, GHWPARAMS0_23_16, 16, 8)
+    FIELD(GHWPARAMS0, GHWPARAMS0_15_8, 8, 8)
+    FIELD(GHWPARAMS0, GHWPARAMS0_7_6, 6, 2)
+    FIELD(GHWPARAMS0, GHWPARAMS0_5_3, 3, 3)
+    FIELD(GHWPARAMS0, GHWPARAMS0_2_0, 0, 3)
+REG32(GHWPARAMS1, 0x44)
+    FIELD(GHWPARAMS1, GHWPARAMS1_31, 31, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_30, 30, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_29, 29, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_28, 28, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_27, 27, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_26, 26, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_25_24, 24, 2)
+    FIELD(GHWPARAMS1, GHWPARAMS1_23, 23, 1)
+    FIELD(GHWPARAMS1, GHWPARAMS1_22_21, 21, 2)
+    FIELD(GHWPARAMS1, GHWPARAMS1_20_15, 15, 6)
+    FIELD(GHWPARAMS1, GHWPARAMS1_14_12, 12, 3)
+    FIELD(GHWPARAMS1, GHWPARAMS1_11_9, 9, 3)
+    FIELD(GHWPARAMS1, GHWPARAMS1_8_6, 6, 3)
+    FIELD(GHWPARAMS1, GHWPARAMS1_5_3, 3, 3)
+    FIELD(GHWPARAMS1, GHWPARAMS1_2_0, 0, 3)
+REG32(GHWPARAMS2, 0x48)
+REG32(GHWPARAMS3, 0x4c)
+    FIELD(GHWPARAMS3, GHWPARAMS3_31, 31, 1)
+    FIELD(GHWPARAMS3, GHWPARAMS3_30_23, 23, 8)
+    FIELD(GHWPARAMS3, GHWPARAMS3_22_18, 18, 5)
+    FIELD(GHWPARAMS3, GHWPARAMS3_17_12, 12, 6)
+    FIELD(GHWPARAMS3, GHWPARAMS3_11, 11, 1)
+    FIELD(GHWPARAMS3, GHWPARAMS3_10, 10, 1)
+    FIELD(GHWPARAMS3, GHWPARAMS3_9_8, 8, 2)
+    FIELD(GHWPARAMS3, GHWPARAMS3_7_6, 6, 2)
+    FIELD(GHWPARAMS3, GHWPARAMS3_5_4, 4, 2)
+    FIELD(GHWPARAMS3, GHWPARAMS3_3_2, 2, 2)
+    FIELD(GHWPARAMS3, GHWPARAMS3_1_0, 0, 2)
+REG32(GHWPARAMS4, 0x50)
+    FIELD(GHWPARAMS4, GHWPARAMS4_31_28, 28, 4)
+    FIELD(GHWPARAMS4, GHWPARAMS4_27_24, 24, 4)
+    FIELD(GHWPARAMS4, GHWPARAMS4_23, 23, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_22, 22, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_21, 21, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_20_17, 17, 4)
+    FIELD(GHWPARAMS4, GHWPARAMS4_16_13, 13, 4)
+    FIELD(GHWPARAMS4, GHWPARAMS4_12, 12, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_11, 11, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_10_9, 9, 2)
+    FIELD(GHWPARAMS4, GHWPARAMS4_8_7, 7, 2)
+    FIELD(GHWPARAMS4, GHWPARAMS4_6, 6, 1)
+    FIELD(GHWPARAMS4, GHWPARAMS4_5_0, 0, 6)
+REG32(GHWPARAMS5, 0x54)
+    FIELD(GHWPARAMS5, GHWPARAMS5_31_28, 28, 4)
+    FIELD(GHWPARAMS5, GHWPARAMS5_27_22, 22, 6)
+    FIELD(GHWPARAMS5, GHWPARAMS5_21_16, 16, 6)
+    FIELD(GHWPARAMS5, GHWPARAMS5_15_10, 10, 6)
+    FIELD(GHWPARAMS5, GHWPARAMS5_9_4, 4, 6)
+    FIELD(GHWPARAMS5, GHWPARAMS5_3_0, 0, 4)
+REG32(GHWPARAMS6, 0x58)
+    FIELD(GHWPARAMS6, GHWPARAMS6_31_16, 16, 16)
+    FIELD(GHWPARAMS6, BUSFLTRSSUPPORT, 15, 1)
+    FIELD(GHWPARAMS6, BCSUPPORT, 14, 1)
+    FIELD(GHWPARAMS6, OTG_SS_SUPPORT, 13, 1)
+    FIELD(GHWPARAMS6, ADPSUPPORT, 12, 1)
+    FIELD(GHWPARAMS6, HNPSUPPORT, 11, 1)
+    FIELD(GHWPARAMS6, SRPSUPPORT, 10, 1)
+    FIELD(GHWPARAMS6, GHWPARAMS6_9_8, 8, 2)
+    FIELD(GHWPARAMS6, GHWPARAMS6_7, 7, 1)
+    FIELD(GHWPARAMS6, GHWPARAMS6_6, 6, 1)
+    FIELD(GHWPARAMS6, GHWPARAMS6_5_0, 0, 6)
+REG32(GHWPARAMS7, 0x5c)
+    FIELD(GHWPARAMS7, GHWPARAMS7_31_16, 16, 16)
+    FIELD(GHWPARAMS7, GHWPARAMS7_15_0, 0, 16)
+REG32(GDBGFIFOSPACE, 0x60)
+    FIELD(GDBGFIFOSPACE, SPACE_AVAILABLE, 16, 16)
+    FIELD(GDBGFIFOSPACE, RESERVED_15_9, 9, 7)
+    FIELD(GDBGFIFOSPACE, FIFO_QUEUE_SELECT, 0, 9)
+REG32(GUCTL2, 0x9c)
+    FIELD(GUCTL2, RESERVED_31_26, 26, 6)
+    FIELD(GUCTL2, EN_HP_PM_TIMER, 19, 7)
+    FIELD(GUCTL2, NOLOWPWRDUR, 15, 4)
+    FIELD(GUCTL2, RST_ACTBITLATER, 14, 1)
+    FIELD(GUCTL2, RESERVED_13, 13, 1)
+    FIELD(GUCTL2, DISABLECFC, 11, 1)
+REG32(GUSB2PHYCFG, 0x100)
+    FIELD(GUSB2PHYCFG, U2_FREECLK_EXISTS, 30, 1)
+    FIELD(GUSB2PHYCFG, ULPI_LPM_WITH_OPMODE_CHK, 29, 1)
+    FIELD(GUSB2PHYCFG, RESERVED_25, 25, 1)
+    FIELD(GUSB2PHYCFG, LSTRD, 22, 3)
+    FIELD(GUSB2PHYCFG, LSIPD, 19, 3)
+    FIELD(GUSB2PHYCFG, ULPIEXTVBUSINDIACTOR, 18, 1)
+    FIELD(GUSB2PHYCFG, ULPIEXTVBUSDRV, 17, 1)
+    FIELD(GUSB2PHYCFG, RESERVED_16, 16, 1)
+    FIELD(GUSB2PHYCFG, ULPIAUTORES, 15, 1)
+    FIELD(GUSB2PHYCFG, RESERVED_14, 14, 1)
+    FIELD(GUSB2PHYCFG, USBTRDTIM, 10, 4)
+    FIELD(GUSB2PHYCFG, XCVRDLY, 9, 1)
+    FIELD(GUSB2PHYCFG, ENBLSLPM, 8, 1)
+    FIELD(GUSB2PHYCFG, PHYSEL, 7, 1)
+    FIELD(GUSB2PHYCFG, SUSPENDUSB20, 6, 1)
+    FIELD(GUSB2PHYCFG, FSINTF, 5, 1)
+    FIELD(GUSB2PHYCFG, ULPI_UTMI_SEL, 4, 1)
+    FIELD(GUSB2PHYCFG, PHYIF, 3, 1)
+    FIELD(GUSB2PHYCFG, TOUTCAL, 0, 3)
+REG32(GUSB2I2CCTL, 0x140)
+REG32(GUSB2PHYACC_ULPI, 0x180)
+    FIELD(GUSB2PHYACC_ULPI, RESERVED_31_27, 27, 5)
+    FIELD(GUSB2PHYACC_ULPI, DISUIPIDRVR, 26, 1)
+    FIELD(GUSB2PHYACC_ULPI, NEWREGREQ, 25, 1)
+    FIELD(GUSB2PHYACC_ULPI, VSTSDONE, 24, 1)
+    FIELD(GUSB2PHYACC_ULPI, VSTSBSY, 23, 1)
+    FIELD(GUSB2PHYACC_ULPI, REGWR, 22, 1)
+    FIELD(GUSB2PHYACC_ULPI, REGADDR, 16, 6)
+    FIELD(GUSB2PHYACC_ULPI, EXTREGADDR, 8, 8)
+    FIELD(GUSB2PHYACC_ULPI, REGDATA, 0, 8)
+REG32(GTXFIFOSIZ0, 0x200)
+    FIELD(GTXFIFOSIZ0, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ0, TXFDEP_N, 0, 16)
+REG32(GTXFIFOSIZ1, 0x204)
+    FIELD(GTXFIFOSIZ1, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ1, TXFDEP_N, 0, 16)
+REG32(GTXFIFOSIZ2, 0x208)
+    FIELD(GTXFIFOSIZ2, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ2, TXFDEP_N, 0, 16)
+REG32(GTXFIFOSIZ3, 0x20c)
+    FIELD(GTXFIFOSIZ3, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ3, TXFDEP_N, 0, 16)
+REG32(GTXFIFOSIZ4, 0x210)
+    FIELD(GTXFIFOSIZ4, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ4, TXFDEP_N, 0, 16)
+REG32(GTXFIFOSIZ5, 0x214)
+    FIELD(GTXFIFOSIZ5, TXFSTADDR_N, 16, 16)
+    FIELD(GTXFIFOSIZ5, TXFDEP_N, 0, 16)
+REG32(GRXFIFOSIZ0, 0x280)
+    FIELD(GRXFIFOSIZ0, RXFSTADDR_N, 16, 16)
+    FIELD(GRXFIFOSIZ0, RXFDEP_N, 0, 16)
+REG32(GRXFIFOSIZ1, 0x284)
+    FIELD(GRXFIFOSIZ1, RXFSTADDR_N, 16, 16)
+    FIELD(GRXFIFOSIZ1, RXFDEP_N, 0, 16)
+REG32(GRXFIFOSIZ2, 0x288)
+    FIELD(GRXFIFOSIZ2, RXFSTADDR_N, 16, 16)
+    FIELD(GRXFIFOSIZ2, RXFDEP_N, 0, 16)
+REG32(GEVNTADRLO_0, 0x300)
+REG32(GEVNTADRHI_0, 0x304)
+REG32(GEVNTSIZ_0, 0x308)
+    FIELD(GEVNTSIZ_0, EVNTINTRPTMASK, 31, 1)
+    FIELD(GEVNTSIZ_0, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTSIZ_0, EVENTSIZ, 0, 16)
+REG32(GEVNTCOUNT_0, 0x30c)
+    FIELD(GEVNTCOUNT_0, EVNT_HANDLER_BUSY, 31, 1)
+    FIELD(GEVNTCOUNT_0, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTCOUNT_0, EVNTCOUNT, 0, 16)
+REG32(GEVNTADRLO_1, 0x310)
+REG32(GEVNTADRHI_1, 0x314)
+REG32(GEVNTSIZ_1, 0x318)
+    FIELD(GEVNTSIZ_1, EVNTINTRPTMASK, 31, 1)
+    FIELD(GEVNTSIZ_1, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTSIZ_1, EVENTSIZ, 0, 16)
+REG32(GEVNTCOUNT_1, 0x31c)
+    FIELD(GEVNTCOUNT_1, EVNT_HANDLER_BUSY, 31, 1)
+    FIELD(GEVNTCOUNT_1, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTCOUNT_1, EVNTCOUNT, 0, 16)
+REG32(GEVNTADRLO_2, 0x320)
+REG32(GEVNTADRHI_2, 0x324)
+REG32(GEVNTSIZ_2, 0x328)
+    FIELD(GEVNTSIZ_2, EVNTINTRPTMASK, 31, 1)
+    FIELD(GEVNTSIZ_2, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTSIZ_2, EVENTSIZ, 0, 16)
+REG32(GEVNTCOUNT_2, 0x32c)
+    FIELD(GEVNTCOUNT_2, EVNT_HANDLER_BUSY, 31, 1)
+    FIELD(GEVNTCOUNT_2, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTCOUNT_2, EVNTCOUNT, 0, 16)
+REG32(GEVNTADRLO_3, 0x330)
+REG32(GEVNTADRHI_3, 0x334)
+REG32(GEVNTSIZ_3, 0x338)
+    FIELD(GEVNTSIZ_3, EVNTINTRPTMASK, 31, 1)
+    FIELD(GEVNTSIZ_3, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTSIZ_3, EVENTSIZ, 0, 16)
+REG32(GEVNTCOUNT_3, 0x33c)
+    FIELD(GEVNTCOUNT_3, EVNT_HANDLER_BUSY, 31, 1)
+    FIELD(GEVNTCOUNT_3, RESERVED_30_16, 16, 15)
+    FIELD(GEVNTCOUNT_3, EVNTCOUNT, 0, 16)
+REG32(GHWPARAMS8, 0x500)
+REG32(GTXFIFOPRIDEV, 0x510)
+    FIELD(GTXFIFOPRIDEV, RESERVED_31_N, 6, 26)
+    FIELD(GTXFIFOPRIDEV, GTXFIFOPRIDEV, 0, 6)
+REG32(GTXFIFOPRIHST, 0x518)
+    FIELD(GTXFIFOPRIHST, RESERVED_31_16, 3, 29)
+    FIELD(GTXFIFOPRIHST, GTXFIFOPRIHST, 0, 3)
+REG32(GRXFIFOPRIHST, 0x51c)
+    FIELD(GRXFIFOPRIHST, RESERVED_31_16, 3, 29)
+    FIELD(GRXFIFOPRIHST, GRXFIFOPRIHST, 0, 3)
+REG32(GDMAHLRATIO, 0x524)
+    FIELD(GDMAHLRATIO, RESERVED_31_13, 13, 19)
+    FIELD(GDMAHLRATIO, HSTRXFIFO, 8, 5)
+    FIELD(GDMAHLRATIO, RESERVED_7_5, 5, 3)
+    FIELD(GDMAHLRATIO, HSTTXFIFO, 0, 5)
+REG32(GFLADJ, 0x530)
+    FIELD(GFLADJ, GFLADJ_REFCLK_240MHZDECR_PLS1, 31, 1)
+    FIELD(GFLADJ, GFLADJ_REFCLK_240MHZ_DECR, 24, 7)
+    FIELD(GFLADJ, GFLADJ_REFCLK_LPM_SEL, 23, 1)
+    FIELD(GFLADJ, RESERVED_22, 22, 1)
+    FIELD(GFLADJ, GFLADJ_REFCLK_FLADJ, 8, 14)
+    FIELD(GFLADJ, GFLADJ_30MHZ_SDBND_SEL, 7, 1)
+    FIELD(GFLADJ, GFLADJ_30MHZ, 0, 6)
+
+#define DWC3_GLOBAL_OFFSET 0xC100
+static void reset_csr(USBDWC3 * s)
+{
+    int i = 0;
+    /*
+     * We reset all CSR regs except GCTL, GUCTL, GSTS, GSNPSID, GGPIO, GUID,
+     * GUSB2PHYCFGn registers and GUSB3PIPECTLn registers. We will skip PHY
+     * register as we don't implement them.
+     */
+    for (i = 0; i < USB_DWC3_R_MAX; i++) {
+        switch (i) {
+        case R_GCTL:
+            break;
+        case R_GSTS:
+            break;
+        case R_GSNPSID:
+            break;
+        case R_GGPIO:
+            break;
+        case R_GUID:
+            break;
+        case R_GUCTL:
+            break;
+        case R_GHWPARAMS0...R_GHWPARAMS7:
+            break;
+        case R_GHWPARAMS8:
+            break;
+        default:
+            register_reset(&s->regs_info[i]);
+            break;
+        }
+    }
+
+    xhci_sysbus_reset(DEVICE(&s->sysbus_xhci));
+}
+
+static void usb_dwc3_gctl_postw(RegisterInfo *reg, uint64_t val64)
+{
+    USBDWC3 *s = USB_DWC3(reg->opaque);
+
+    if (ARRAY_FIELD_EX32(s->regs, GCTL, CORESOFTRESET)) {
+        reset_csr(s);
+    }
+}
+
+static void usb_dwc3_guid_postw(RegisterInfo *reg, uint64_t val64)
+{
+    USBDWC3 *s = USB_DWC3(reg->opaque);
+
+    s->regs[R_GUID] = s->cfg.dwc_usb3_user;
+}
+
+static const RegisterAccessInfo usb_dwc3_regs_info[] = {
+    {   .name = "GSBUSCFG0",  .addr = A_GSBUSCFG0,
+        .ro = 0xf300,
+        .unimp = 0xffffffff,
+    },{ .name = "GSBUSCFG1",  .addr = A_GSBUSCFG1,
+        .reset = 0x300,
+        .ro = 0xffffe0ff,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXTHRCFG",  .addr = A_GTXTHRCFG,
+        .ro = 0xd000ffff,
+        .unimp = 0xffffffff,
+    },{ .name = "GRXTHRCFG",  .addr = A_GRXTHRCFG,
+        .ro = 0xd007e000,
+        .unimp = 0xffffffff,
+    },{ .name = "GCTL",  .addr = A_GCTL,
+        .reset = 0x30c13004, .post_write = usb_dwc3_gctl_postw,
+    },{ .name = "GPMSTS",  .addr = A_GPMSTS,
+        .ro = 0xfffffff,
+        .unimp = 0xffffffff,
+    },{ .name = "GSTS",  .addr = A_GSTS,
+        .reset = 0x7e800000,
+        .ro = 0xffffffcf,
+        .w1c = 0x30,
+        .unimp = 0xffffffff,
+    },{ .name = "GUCTL1",  .addr = A_GUCTL1,
+        .reset = 0x198a,
+        .ro = 0x7800,
+        .unimp = 0xffffffff,
+    },{ .name = "GSNPSID",  .addr = A_GSNPSID,
+        .reset = 0x5533330a,
+        .ro = 0xffffffff,
+    },{ .name = "GGPIO",  .addr = A_GGPIO,
+        .ro = 0xffff,
+        .unimp = 0xffffffff,
+    },{ .name = "GUID",  .addr = A_GUID,
+        .reset = 0x12345678, .post_write = usb_dwc3_guid_postw,
+    },{ .name = "GUCTL",  .addr = A_GUCTL,
+        .reset = 0x0c808010,
+        .ro = 0x1c8000,
+        .unimp = 0xffffffff,
+    },{ .name = "GBUSERRADDRLO",  .addr = A_GBUSERRADDRLO,
+        .ro = 0xffffffff,
+    },{ .name = "GBUSERRADDRHI",  .addr = A_GBUSERRADDRHI,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS0",  .addr = A_GHWPARAMS0,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS1",  .addr = A_GHWPARAMS1,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS2",  .addr = A_GHWPARAMS2,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS3",  .addr = A_GHWPARAMS3,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS4",  .addr = A_GHWPARAMS4,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS5",  .addr = A_GHWPARAMS5,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS6",  .addr = A_GHWPARAMS6,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS7",  .addr = A_GHWPARAMS7,
+        .ro = 0xffffffff,
+    },{ .name = "GDBGFIFOSPACE",  .addr = A_GDBGFIFOSPACE,
+        .reset = 0xa0000,
+        .ro = 0xfffffe00,
+        .unimp = 0xffffffff,
+    },{ .name = "GUCTL2",  .addr = A_GUCTL2,
+        .reset = 0x40d,
+        .ro = 0x2000,
+        .unimp = 0xffffffff,
+    },{ .name = "GUSB2PHYCFG",  .addr = A_GUSB2PHYCFG,
+        .reset = 0x40102410,
+        .ro = 0x1e014030,
+        .unimp = 0xffffffff,
+    },{ .name = "GUSB2I2CCTL",  .addr = A_GUSB2I2CCTL,
+        .ro = 0xffffffff,
+        .unimp = 0xffffffff,
+    },{ .name = "GUSB2PHYACC_ULPI",  .addr = A_GUSB2PHYACC_ULPI,
+        .ro = 0xfd000000,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ0",  .addr = A_GTXFIFOSIZ0,
+        .reset = 0x2c7000a,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ1",  .addr = A_GTXFIFOSIZ1,
+        .reset = 0x2d10103,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ2",  .addr = A_GTXFIFOSIZ2,
+        .reset = 0x3d40103,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ3",  .addr = A_GTXFIFOSIZ3,
+        .reset = 0x4d70083,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ4",  .addr = A_GTXFIFOSIZ4,
+        .reset = 0x55a0083,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOSIZ5",  .addr = A_GTXFIFOSIZ5,
+        .reset = 0x5dd0083,
+        .unimp = 0xffffffff,
+    },{ .name = "GRXFIFOSIZ0",  .addr = A_GRXFIFOSIZ0,
+        .reset = 0x1c20105,
+        .unimp = 0xffffffff,
+    },{ .name = "GRXFIFOSIZ1",  .addr = A_GRXFIFOSIZ1,
+        .reset = 0x2c70000,
+        .unimp = 0xffffffff,
+    },{ .name = "GRXFIFOSIZ2",  .addr = A_GRXFIFOSIZ2,
+        .reset = 0x2c70000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRLO_0",  .addr = A_GEVNTADRLO_0,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRHI_0",  .addr = A_GEVNTADRHI_0,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTSIZ_0",  .addr = A_GEVNTSIZ_0,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTCOUNT_0",  .addr = A_GEVNTCOUNT_0,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRLO_1",  .addr = A_GEVNTADRLO_1,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRHI_1",  .addr = A_GEVNTADRHI_1,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTSIZ_1",  .addr = A_GEVNTSIZ_1,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTCOUNT_1",  .addr = A_GEVNTCOUNT_1,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRLO_2",  .addr = A_GEVNTADRLO_2,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRHI_2",  .addr = A_GEVNTADRHI_2,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTSIZ_2",  .addr = A_GEVNTSIZ_2,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTCOUNT_2",  .addr = A_GEVNTCOUNT_2,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRLO_3",  .addr = A_GEVNTADRLO_3,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTADRHI_3",  .addr = A_GEVNTADRHI_3,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTSIZ_3",  .addr = A_GEVNTSIZ_3,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GEVNTCOUNT_3",  .addr = A_GEVNTCOUNT_3,
+        .ro = 0x7fff0000,
+        .unimp = 0xffffffff,
+    },{ .name = "GHWPARAMS8",  .addr = A_GHWPARAMS8,
+        .ro = 0xffffffff,
+    },{ .name = "GTXFIFOPRIDEV",  .addr = A_GTXFIFOPRIDEV,
+        .ro = 0xffffffc0,
+        .unimp = 0xffffffff,
+    },{ .name = "GTXFIFOPRIHST",  .addr = A_GTXFIFOPRIHST,
+        .ro = 0xfffffff8,
+        .unimp = 0xffffffff,
+    },{ .name = "GRXFIFOPRIHST",  .addr = A_GRXFIFOPRIHST,
+        .ro = 0xfffffff8,
+        .unimp = 0xffffffff,
+    },{ .name = "GDMAHLRATIO",  .addr = A_GDMAHLRATIO,
+        .ro = 0xffffe0e0,
+        .unimp = 0xffffffff,
+    },{ .name = "GFLADJ",  .addr = A_GFLADJ,
+        .reset = 0xc83f020,
+        .rsvd = 0x40,
+        .ro = 0x400040,
+        .unimp = 0xffffffff,
+    }
+};
+
+static void usb_dwc3_reset(DeviceState *dev)
+{
+    USBDWC3 *s = USB_DWC3(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        switch (i) {
+        case R_GHWPARAMS0...R_GHWPARAMS7:
+            break;
+        case R_GHWPARAMS8:
+            break;
+        default:
+            register_reset(&s->regs_info[i]);
+        };
+    }
+
+    xhci_sysbus_reset(DEVICE(&s->sysbus_xhci));
+}
+
+static const MemoryRegionOps usb_dwc3_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void usb_dwc3_realize(DeviceState *dev, Error **errp)
+{
+    USBDWC3 *s = USB_DWC3(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Error *err = NULL;
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->sysbus_xhci), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->iomem, 0,
+         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sysbus_xhci), 0));
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    /*
+     * Device Configuration
+     */
+    s->regs[R_GHWPARAMS0] = 0x40204048 | s->cfg.mode;
+    s->regs[R_GHWPARAMS1] = 0x222493b;
+    s->regs[R_GHWPARAMS2] = 0x12345678;
+    s->regs[R_GHWPARAMS3] = 0x618c088;
+    s->regs[R_GHWPARAMS4] = 0x47822004;
+    s->regs[R_GHWPARAMS5] = 0x4202088;
+    s->regs[R_GHWPARAMS6] = 0x7850c20;
+    s->regs[R_GHWPARAMS7] = 0x0;
+    s->regs[R_GHWPARAMS8] = 0x478;
+}
+
+static void usb_dwc3_init(Object *obj)
+{
+    USBDWC3 *s = USB_DWC3(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_USB_DWC3, DWC3_SIZE);
+    reg_array =
+        register_init_block32(DEVICE(obj), usb_dwc3_regs_info,
+                              ARRAY_SIZE(usb_dwc3_regs_info),
+                              s->regs_info, s->regs,
+                              &usb_dwc3_ops,
+                              USB_DWC3_ERR_DEBUG,
+                              USB_DWC3_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                DWC3_GLOBAL_OFFSET,
+                                &reg_array->mem);
+    object_initialize_child(obj, "dwc3-xhci", &s->sysbus_xhci,
+                            TYPE_XHCI_SYSBUS);
+    qdev_alias_all_properties(DEVICE(&s->sysbus_xhci), obj);
+
+    s->cfg.mode = HOST_MODE;
+}
+
+static Property usb_dwc3_properties[] = {
+    DEFINE_PROP_UINT32("DWC_USB3_USERID", USBDWC3, cfg.dwc_usb3_user,
+                       0x12345678),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void usb_dwc3_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = usb_dwc3_reset;
+    dc->realize = usb_dwc3_realize;
+    device_class_set_props(dc, usb_dwc3_properties);
+}
+
+static const TypeInfo usb_dwc3_info = {
+    .name          = TYPE_USB_DWC3,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(USBDWC3),
+    .class_init    = usb_dwc3_class_init,
+    .instance_init = usb_dwc3_init,
+};
+
+static void usb_dwc3_register_types(void)
+{
+    type_register_static(&usb_dwc3_info);
+}
+
+type_init(usb_dwc3_register_types)
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index ecfec0a..433c27e 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -26,6 +26,7 @@ softmmu_ss.add(when: 'CONFIG_USB_XHCI_SYSBUS', if_true: files('hcd-xhci-sysbus.c
 softmmu_ss.add(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-nec.c'))
 softmmu_ss.add(when: 'CONFIG_USB_MUSB', if_true: files('hcd-musb.c'))
 softmmu_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
+softmmu_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))
 
 softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
new file mode 100644
index 0000000..791776a
--- /dev/null
+++ b/include/hw/usb/hcd-dwc3.h
@@ -0,0 +1,56 @@
+/*
+ * QEMU model of the USB DWC3 host controller emulation.
+ *
+ * Copyright (c) 2020 Xilinx Inc.
+ *
+ * Written by Vikram Garhwal<fnu.vikram@xilinx.com>
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
+#ifndef HCD_DWC3_H
+#define HCD_DWC3_H
+
+#include "hw/usb/hcd-xhci.h"
+#include "hw/usb/hcd-xhci-sysbus.h"
+
+#define TYPE_USB_DWC3 "usb_dwc3"
+
+#define USB_DWC3(obj) \
+     OBJECT_CHECK(USBDWC3, (obj), TYPE_USB_DWC3)
+
+#define USB_DWC3_R_MAX ((0x530 / 4) + 1)
+#define DWC3_SIZE 0x10000
+
+typedef struct USBDWC3 {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    MemoryRegion fifos;
+    XHCISysbusState sysbus_xhci;
+
+    uint32_t regs[USB_DWC3_R_MAX];
+    RegisterInfo regs_info[USB_DWC3_R_MAX];
+
+    struct {
+        uint8_t     mode;
+        uint32_t    dwc_usb3_user;
+    } cfg;
+
+} USBDWC3;
+
+#endif
-- 
2.7.4


