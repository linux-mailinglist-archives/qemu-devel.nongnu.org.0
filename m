Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135025610B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 21:17:08 +0200 (CEST)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBjs2-0000bs-UX
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 15:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kBjqM-00086P-Tw
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 15:15:22 -0400
Received: from mail-eopbgr760055.outbound.protection.outlook.com
 ([40.107.76.55]:46446 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kBjqK-00033B-1J
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 15:15:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deuC2XtET5yarPr+oyaom6lTVQzlXV/sCcD8RBjAYpondFuPrwnWU7GCWfSWM9mGwKPRdq1mD+Z1RPzJKAlrQmSrgirnbxgVK/OP1LMqX6a0JV/dA0ObmYiJMN/T7Dxzp4bmcjmqwlx2fZ/oKOo0C9eCN+6fR1nZ9bO4Fte2aJlJF6D5TOkXkaOp3ZkSJAneoSeP0eLd9a58J1gMOORtqFSXbY13v0v5dabnSLmP5CNpwLEx2tgRswMbteWwLjybhYwg+eqcHEDxmk9HGHVqXnz+fxSj06rCmLQvr7MFb+/Tyyhj1c+HoUxBvhufAgpWI0nJWg2MWSc0l+VXKyJdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5fdztXqiWn4wTuqRd92QgQ6zfsbsfCt0vtOK4o72t8=;
 b=cv1l983cp5/6q0jF+/K2lMEhOrhWwRo18SIl7sAeAFL3vwhav7AGD8Kx6ERpTR12wHinNKS8HZyoLBJd4aNzBnoBmWwgjqKgHFjbpSacEKUliJLs/323cmma/u2P3I6131UHPUEClc3fsLwWR3GY7D0/UV/qV5hWLLd0A121WN22/tNaRTh5K9fnVHy5DW2OxX0+uWxM+Ep8Tbjidp9IEW2OIWJb5FTCCIbMf3a8DtpkfZAkPPYD3kXjSlD/52hOjijRE5yctEx7KuQFS4wePP21CiH2qr78dNfVfQa8ANAcBQXo2g3oOmUDHqRTSz1/8ZEdP0BuKlU/mQ8quWCYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5fdztXqiWn4wTuqRd92QgQ6zfsbsfCt0vtOK4o72t8=;
 b=SJF3cLP+algjAX1HJ5WY8sxDPecU3Zkl9Q2QQdmVcYo4xpHSV9FlV1yrH8sTrpho7kmbUxDIXKu2eBuRbvuTnlJlRzHDqYlozAu4Fwakr/wqY28s6WwYiECnl7ElE3vnWCUSwIbSM4KRrdiKTf0uK6mMMB2JDSLBoqD0+hzvv1s=
Received: from SN6PR04CA0085.namprd04.prod.outlook.com (2603:10b6:805:f2::26)
 by SN6PR02MB5423.namprd02.prod.outlook.com (2603:10b6:805:e1::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 19:15:16 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::ca) by SN6PR04CA0085.outlook.office365.com
 (2603:10b6:805:f2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend
 Transport; Fri, 28 Aug 2020 19:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with Microsoft SMTP
 Server id 15.20.3326.21 via Frontend Transport; Fri, 28 Aug 2020 19:15:16
 +0000
Received: from [149.199.38.66] (port=48220 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kBjph-0007Jg-G1; Fri, 28 Aug 2020 12:14:41 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kBjqF-0002DL-Sg; Fri, 28 Aug 2020 12:15:15 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07SJFES6013661; 
 Fri, 28 Aug 2020 12:15:14 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1kBjqE-0002By-7z; Fri, 28 Aug 2020 12:15:14 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A391A13C0725; Sat, 29 Aug 2020 00:49:47 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?=27Marc-Andr=C3=A9=20Lureau=27?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: [PATCH v4 6/7] usb: Add DWC3 model
Date: Sat, 29 Aug 2020 00:49:39 +0530
Message-Id: <1598642380-27817-7-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598642380-27817-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1598642380-27817-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a9f4462c-108c-4059-d1d6-08d84b86b24c
X-MS-TrafficTypeDiagnostic: SN6PR02MB5423:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5423DBA2E343CE2F90767C4DCA520@SN6PR02MB5423.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +GUxeyQA+v7d3xtqpp2h1ezS+KUdeT23bXSzxJtijZ2qJ1FTMcQqb1ibi7d/IcuAtFhzQI4UDT48zRPUy7dECz50EA4X6Vs5fAooC8fNOvyFhqtZqAmn9ryPatOSUR2yewbSn8RqQQ/1BPZV/nTaoxPY9JlzYui2SjsYJ0NuRkFvkcOHMjD/BToWdHQ2dUqphLD8ZSOBLBat4+a8LnBEnb+xYKXVPAxeG5BW0h5AJ4HH0oZzHCdqTNKJc6Do65qXVovlWOunemYjlrSqV68LurixuTRk6tmUWvxvF5SetYmuwNnwf2pCCA2G8xDzpsz/Uje8b+Z1r9SvhKue6q40nSySAyfU/ZfQoti2+JkHl9mGzmeznx09p6cLoY4AIW/5NjC7UPGlcytbOaocVwJz+w==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(136003)(376002)(46966005)(6266002)(82740400003)(2906002)(81166007)(7416002)(426003)(26005)(82310400002)(356005)(478600001)(70206006)(70586007)(36756003)(8676002)(8936002)(6636002)(83380400001)(6666004)(5660300002)(30864003)(316002)(47076004)(4326008)(110136005)(54906003)(2616005)(42186006)(336012)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 19:15:16.1865 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f4462c-108c-4059-d1d6-08d84b86b24c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5423
Received-SPF: pass client-ip=40.107.76.55; envelope-from=saipava@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 15:15:18
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 sai.pavan.boddu@xilinx.com, qemu-devel@nongnu.org,
 Paul Zimmerman <pauldzim@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?=27Philippe=20Mathieu-Daud=C3=A9=27?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vikram Garhwal <fnu.vikram@xilinx.com>

This patch adds skeleton model of dwc3 usb controller attached to
xhci-sysbus device.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/usb/Makefile.objs      |   1 +
 hw/usb/hcd-dwc3.c         | 606 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/usb/hcd-dwc3.h |  58 +++++
 3 files changed, 665 insertions(+)
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 include/hw/usb/hcd-dwc3.h

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index f16a3c3..af0487b 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -15,6 +15,7 @@ common-obj-$(CONFIG_USB_XHCI_PCI) += hcd-xhci-pci.o
 common-obj-$(CONFIG_USB_XHCI_SYSBUS) += hcd-xhci-sysbus.o
 common-obj-$(CONFIG_USB_MUSB) += hcd-musb.o
 common-obj-$(CONFIG_USB_DWC2) += hcd-dwc2.o
+common-obj-$(CONFIG_XLNX_VERSAL) += hcd-dwc3.o
 
 common-obj-$(CONFIG_TUSB6010) += tusb6010.o
 common-obj-$(CONFIG_IMX)      += chipidea.o
diff --git a/hw/usb/hcd-dwc3.c b/hw/usb/hcd-dwc3.c
new file mode 100644
index 0000000..1c2a927
--- /dev/null
+++ b/hw/usb/hcd-dwc3.c
@@ -0,0 +1,606 @@
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
+static void reset_csr(USBDWC3 * s)
+{
+    int i = 0;
+    /*
+     * We reset all CSR regs except GCTL, GUCTL, GSTS, GSNPSID, GGPIO, GUID,
+     * GUSB2PHYCFGn registers and GUSB3PIPECTLn registers. We will skip PHY
+     * register as we don't implement them.
+     */
+    for (i = 0; i < R_GCTL; i++) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    for (i = R_GCTL; i < R_GBUSERRADDRLO; i++) {
+        if (i == R_GUCTL1 || i == R_GPMSTS) {
+            register_reset(&s->regs_info[i]);
+        } else {
+            continue;
+        }
+    }
+
+    for (i = R_GBUSERRADDRLO; i < USB_DWC3_R_MAX; i++) {
+        register_reset(&s->regs_info[i]);
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
+    },{ .name = "GSBUSCFG1",  .addr = A_GSBUSCFG1,
+        .reset = 0x300,
+        .ro = 0xffffe0ff,
+    },{ .name = "GTXTHRCFG",  .addr = A_GTXTHRCFG,
+        .ro = 0xd000ffff,
+    },{ .name = "GRXTHRCFG",  .addr = A_GRXTHRCFG,
+        .ro = 0xd007e000,
+    },{ .name = "GCTL",  .addr = A_GCTL,
+        .reset = 0x30c13004, .post_write = usb_dwc3_gctl_postw,
+    },{ .name = "GPMSTS",  .addr = A_GPMSTS,
+        .ro = 0xfffffff,
+    },{ .name = "GSTS",  .addr = A_GSTS,
+        .reset = 0x7e800000,
+        .ro = 0xffffffcf,
+        .w1c = 0x30,
+    },{ .name = "GUCTL1",  .addr = A_GUCTL1,
+        .reset = 0x198a,
+        .ro = 0x7800,
+    },{ .name = "GSNPSID",  .addr = A_GSNPSID,
+        .reset = 0x5533330a,
+        .ro = 0xffffffff,
+    },{ .name = "GGPIO",  .addr = A_GGPIO,
+        .ro = 0xffff,
+    },{ .name = "GUID",  .addr = A_GUID,
+        .reset = 0x12345678, .post_write = usb_dwc3_guid_postw,
+    },{ .name = "GUCTL",  .addr = A_GUCTL,
+        .reset = 0x0c808010,
+        .ro = 0x1c8000,
+    },{ .name = "GBUSERRADDRLO",  .addr = A_GBUSERRADDRLO,
+        .ro = 0xffffffff,
+    },{ .name = "GBUSERRADDRHI",  .addr = A_GBUSERRADDRHI,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS0",  .addr = A_GHWPARAMS0,
+        .reset = 0x4020404a,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS1",  .addr = A_GHWPARAMS1,
+        .reset = 0x222493b,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS2",  .addr = A_GHWPARAMS2,
+        .reset = 0x12345678,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS3",  .addr = A_GHWPARAMS3,
+        .reset = 0x618c088,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS4",  .addr = A_GHWPARAMS4,
+        .reset = 0x47822004,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS5",  .addr = A_GHWPARAMS5,
+        .reset = 0x4202088,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS6",  .addr = A_GHWPARAMS6,
+        .reset = 0x7850c20,
+        .ro = 0xffffffff,
+    },{ .name = "GHWPARAMS7",  .addr = A_GHWPARAMS7,
+        .ro = 0xffffffff,
+    },{ .name = "GDBGFIFOSPACE",  .addr = A_GDBGFIFOSPACE,
+        .reset = 0xa0000,
+        .ro = 0xfffffe00,
+    },{ .name = "GUCTL2",  .addr = A_GUCTL2,
+        .reset = 0x40d,
+        .ro = 0x2000,
+    },{ .name = "GUSB2PHYCFG",  .addr = A_GUSB2PHYCFG,
+        .reset = 0x40102410,
+        .ro = 0x1e014030,
+    },{ .name = "GUSB2I2CCTL",  .addr = A_GUSB2I2CCTL,
+        .ro = 0xffffffff,
+    },{ .name = "GUSB2PHYACC_ULPI",  .addr = A_GUSB2PHYACC_ULPI,
+        .ro = 0xfd000000,
+    },{ .name = "GTXFIFOSIZ0",  .addr = A_GTXFIFOSIZ0,
+        .reset = 0x2c7000a,
+    },{ .name = "GTXFIFOSIZ1",  .addr = A_GTXFIFOSIZ1,
+        .reset = 0x2d10103,
+    },{ .name = "GTXFIFOSIZ2",  .addr = A_GTXFIFOSIZ2,
+        .reset = 0x3d40103,
+    },{ .name = "GTXFIFOSIZ3",  .addr = A_GTXFIFOSIZ3,
+        .reset = 0x4d70083,
+    },{ .name = "GTXFIFOSIZ4",  .addr = A_GTXFIFOSIZ4,
+        .reset = 0x55a0083,
+    },{ .name = "GTXFIFOSIZ5",  .addr = A_GTXFIFOSIZ5,
+        .reset = 0x5dd0083,
+    },{ .name = "GRXFIFOSIZ0",  .addr = A_GRXFIFOSIZ0,
+        .reset = 0x1c20105,
+    },{ .name = "GRXFIFOSIZ1",  .addr = A_GRXFIFOSIZ1,
+        .reset = 0x2c70000,
+    },{ .name = "GRXFIFOSIZ2",  .addr = A_GRXFIFOSIZ2,
+        .reset = 0x2c70000,
+    },{ .name = "GEVNTADRLO_0",  .addr = A_GEVNTADRLO_0,
+    },{ .name = "GEVNTADRHI_0",  .addr = A_GEVNTADRHI_0,
+    },{ .name = "GEVNTSIZ_0",  .addr = A_GEVNTSIZ_0,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTCOUNT_0",  .addr = A_GEVNTCOUNT_0,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTADRLO_1",  .addr = A_GEVNTADRLO_1,
+    },{ .name = "GEVNTADRHI_1",  .addr = A_GEVNTADRHI_1,
+    },{ .name = "GEVNTSIZ_1",  .addr = A_GEVNTSIZ_1,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTCOUNT_1",  .addr = A_GEVNTCOUNT_1,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTADRLO_2",  .addr = A_GEVNTADRLO_2,
+    },{ .name = "GEVNTADRHI_2",  .addr = A_GEVNTADRHI_2,
+    },{ .name = "GEVNTSIZ_2",  .addr = A_GEVNTSIZ_2,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTCOUNT_2",  .addr = A_GEVNTCOUNT_2,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTADRLO_3",  .addr = A_GEVNTADRLO_3,
+    },{ .name = "GEVNTADRHI_3",  .addr = A_GEVNTADRHI_3,
+    },{ .name = "GEVNTSIZ_3",  .addr = A_GEVNTSIZ_3,
+        .ro = 0x7fff0000,
+    },{ .name = "GEVNTCOUNT_3",  .addr = A_GEVNTCOUNT_3,
+        .ro = 0x7fff0000,
+    },{ .name = "GHWPARAMS8",  .addr = A_GHWPARAMS8,
+        .reset = 0x478,
+        .ro = 0xffffffff,
+    },{ .name = "GTXFIFOPRIDEV",  .addr = A_GTXFIFOPRIDEV,
+        .ro = 0xffffffc0,
+    },{ .name = "GTXFIFOPRIHST",  .addr = A_GTXFIFOPRIHST,
+        .ro = 0xfffffff8,
+    },{ .name = "GRXFIFOPRIHST",  .addr = A_GRXFIFOPRIHST,
+        .ro = 0xfffffff8,
+    },{ .name = "GDMAHLRATIO",  .addr = A_GDMAHLRATIO,
+        .ro = 0xffffe0e0,
+    },{ .name = "GFLADJ",  .addr = A_GFLADJ,
+        .reset = 0xc83f020,
+        .rsvd = 0x40,
+        .ro = 0x400040,
+    }
+};
+
+static void usb_dwc3_reset(DeviceState *dev)
+{
+    USBDWC3 *s = USB_DWC3(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
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
+    Error *err = NULL;
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->sysbus_xhci), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+}
+
+static void usb_dwc3_init(Object *obj)
+{
+    USBDWC3 *s = USB_DWC3(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_USB_DWC3, USB_DWC3_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), usb_dwc3_regs_info,
+                              ARRAY_SIZE(usb_dwc3_regs_info),
+                              s->regs_info, s->regs,
+                              &usb_dwc3_ops,
+                              USB_DWC3_ERR_DEBUG,
+                              USB_DWC3_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    object_initialize_child(obj, "dwc3-xhci", &s->sysbus_xhci,
+                            TYPE_XHCI_SYSBUS);
+    qdev_alias_all_properties(DEVICE(&s->sysbus_xhci), obj);
+
+    s->cfg.mode = HOST_MODE;
+}
+
+static Property usb_dwc3_properties[] = {
+    DEFINE_PROP_BOOL("usb2-mode", USBDWC3, cfg.usb2_mode, false),
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
diff --git a/include/hw/usb/hcd-dwc3.h b/include/hw/usb/hcd-dwc3.h
new file mode 100644
index 0000000..09708d0
--- /dev/null
+++ b/include/hw/usb/hcd-dwc3.h
@@ -0,0 +1,58 @@
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
+        bool        usb2_mode;
+        uint32_t    dwc_usb3_user;
+        uint8_t     caplen;
+        uint16_t    hciver;
+    } cfg;
+
+} USBDWC3;
+
+#endif
-- 
2.7.4


