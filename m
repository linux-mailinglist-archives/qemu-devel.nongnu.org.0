Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F82B851E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:54:26 +0100 (CET)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTX7-0000B4-6Q
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kfTS5-0004U0-VG; Wed, 18 Nov 2020 14:49:17 -0500
Received: from mail-eopbgr750075.outbound.protection.outlook.com
 ([40.107.75.75]:61410 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kfTRy-0005YY-Vk; Wed, 18 Nov 2020 14:49:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWtJjO/Ucv/gDGdaLVxNlSi4bnJsvumHbzmW6CMeNoM99aO2v2UHw3Qz3cClDR3HEsjuJCIyqGEoeXw4Kc/j1pDSPCBVliL0EOy0rR5Mxcwp/G4jhwKbY0w5Q4gXSGfziVgQC2nuNrS+Ywivc4Mx1+KoOY2F+rRSQizg5S+7WJbyngUVKSXzYgr88lM5oNxcxFTDxR7mzuZ6qXgXB0rHXkY2oun0c06GyAiiG+SocqLmvXdsq6EhDb8XnJXYzqSfSzbXhqpiMRpkSo0/5hc3X4B38N93JX+rioxFjurh5c+0TGitodtP7Vvpc+kdBk+nXC/r/FqlhAZZWXc3gPhI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq9Y/6GYSHRGXA6S/QSGpoPssE3coaxwHZTp8TA5eXw=;
 b=lNs50Hmp68u12EpOUuTIpQdx8ORyvE2BijjvcbhRGqkq8q9GOus1KEYitFZnavRmO7D70/5Wd4hV1pmb28iXkJjzvfIxozUkXqniqttFNl6NpgxuSITgz4+M4OUTVK8/WxFaWxJ9Ti27PCx7JQJ7vgHsPm3vXZnK78rnX8iX+pFwXs497TLpgwA5MNbn01ZF/t+ceMpQ8gIsyXxIR0OtJndo3cdmlwRPYaVax0FqJuKYLYctxIScNRmRqqLYjugzQK665aGkmeHL/ytppqaE9IoctVdjyn/Zb0YzrMoIS4Y5zKQy0brk1bg36/j7MKZz1C8FYOaY6ksGZU5pYQIjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq9Y/6GYSHRGXA6S/QSGpoPssE3coaxwHZTp8TA5eXw=;
 b=XUC5BV2oWxtzVk3TtlaibYWvXIg2fqjmsd+IRP0uEFkGB6muKnMOyizlkT5Z/+sF3HC2i1aJnB8FGk8c5/aaXVgf3T9rZ7DrL/R2BJKgv32Em0KLcDNFKjsiq1+shJvZVjuMFPvuwoBszgyMZgLhIFBo8TdS+iUw2nAK8LBfIEE=
Received: from BL1PR13CA0205.namprd13.prod.outlook.com (2603:10b6:208:2be::30)
 by MW4PR02MB7105.namprd02.prod.outlook.com (2603:10b6:303:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 19:49:02 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2be:cafe::72) by BL1PR13CA0205.outlook.office365.com
 (2603:10b6:208:2be::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Wed, 18 Nov 2020 19:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 19:49:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 11:48:59 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 11:48:59 -0800
Received: from [172.19.2.115] (port=52002 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kfTRr-0003iK-Tb; Wed, 18 Nov 2020 11:48:59 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v12 1/4] hw/net/can: Introduce Xilinx ZynqMP CAN controller
Date: Wed, 18 Nov 2020 11:48:43 -0800
Message-ID: <1605728926-352690-2-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
References: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 163d9875-a724-456f-a12a-08d88bfaff82
X-MS-TrafficTypeDiagnostic: MW4PR02MB7105:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7105605758DCDC3108D49087BCE10@MW4PR02MB7105.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SOnKDyYnlVJOVrzI9PCkRkOTkTyEU5RGODv1W6i5/PstsqwOTnZ8zYbdWS2cYavxk58G6O+dWtfI4pwEm8qnFuY9jcxVWXrglDVzJagTzpgMbjlQhT0B/DzaCHS9M9yLJ3baxGwLC6oWNuV0p5z9smhdH35qJZLJDJ7eCiSB86nSSp6vBgrzly/vFG/gwy5jPF5/idd6Do1d0SjjCZAUh5l7/XZtVo2/Rb1wFl4HOEEYo0RlhS5pT7SKkwzLAglXUaoG9ey9WD8f5Edsu4JfkbC/XnGhdzN5YnXBxFnBkG2Apd1e47NP0Nac7WVPokLAUMEfaGWVbv6wfd7M1WSGDR9r0BpJas9q4qK22Of57Q0IwTNwkvw8I/dPnteGpvyu0CNxqgHPZJQwReFWQ82qiFX7azjDQk5JJHzG9SepDWruwmU4GpPQg96bt+nCmfyNiRQ0LFEOsWL8lpSw75phcAEfTsrQ6J03DTKZLZJ5jnP9WTEO40Zoo4ybc4B6dNBx+A7E8G0Iqk5fpjETvqETeg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(26005)(356005)(47076004)(186003)(36906005)(70206006)(7636003)(83380400001)(426003)(336012)(2616005)(9786002)(4326008)(54906003)(30864003)(316002)(82310400003)(6666004)(6916009)(966005)(5660300002)(8676002)(478600001)(82740400003)(7696005)(70586007)(36756003)(8936002)(2906002)(102446001)(559001)(579004)(6606295002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 19:49:01.6081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163d9875-a724-456f-a12a-08d88bfaff82
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7105
Received-SPF: pass client-ip=40.107.75.75; envelope-from=fnuv@xilinx.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 14:49:04
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
Cc: peter.maydell@linaro.org, Vikram Garhwal <fnu.vikram@xilinx.com>, Jason
 Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 francisco.iglesias@xilinx.com, "open list:Xilinx ZynqMP
 and..." <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Xilinx ZynqMP CAN controller is developed based on SocketCAN, QEMU CAN bus
implementation. Bus connection and socketCAN connection for each CAN module
can be set through command lines.

Example for using single CAN:
    -object can-bus,id=canbus0 \
    -machine xlnx-zcu102.canbus0=canbus0 \
    -object can-host-socketcan,id=socketcan0,if=vcan0,canbus=canbus0

Example for connecting both CAN to same virtual CAN on host machine:
    -object can-bus,id=canbus0 -object can-bus,id=canbus1 \
    -machine xlnx-zcu102.canbus0=canbus0 \
    -machine xlnx-zcu102.canbus1=canbus1 \
    -object can-host-socketcan,id=socketcan0,if=vcan0,canbus=canbus0 \
    -object can-host-socketcan,id=socketcan1,if=vcan0,canbus=canbus1

To create virtual CAN on the host machine, please check the QEMU CAN docs:
https://github.com/qemu/qemu/blob/master/docs/can.txt

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 meson.build                      |    1 +
 hw/net/can/trace.h               |    1 +
 include/hw/net/xlnx-zynqmp-can.h |   78 +++
 hw/net/can/xlnx-zynqmp-can.c     | 1161 ++++++++++++++++++++++++++++++++++++++
 hw/Kconfig                       |    1 +
 hw/net/can/meson.build           |    1 +
 hw/net/can/trace-events          |    9 +
 7 files changed, 1252 insertions(+)
 create mode 100644 hw/net/can/trace.h
 create mode 100644 include/hw/net/xlnx-zynqmp-can.h
 create mode 100644 hw/net/can/xlnx-zynqmp-can.c
 create mode 100644 hw/net/can/trace-events

diff --git a/meson.build b/meson.build
index 39ac5cf..7eefedc 100644
--- a/meson.build
+++ b/meson.build
@@ -1408,6 +1408,7 @@ if have_system
     'hw/misc',
     'hw/misc/macio',
     'hw/net',
+    'hw/net/can',
     'hw/nvram',
     'hw/pci',
     'hw/pci-host',
diff --git a/hw/net/can/trace.h b/hw/net/can/trace.h
new file mode 100644
index 0000000..d391c64
--- /dev/null
+++ b/hw/net/can/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_net_can.h"
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
new file mode 100644
index 0000000..eb15587
--- /dev/null
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -0,0 +1,78 @@
+/*
+ * QEMU model of the Xilinx ZynqMP CAN controller.
+ *
+ * Copyright (c) 2020 Xilinx Inc.
+ *
+ * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
+ *
+ * Based on QEMU CAN Device emulation implemented by Jin Yang, Deniz Eren and
+ * Pavel Pisa.
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
+#ifndef XLNX_ZYNQMP_CAN_H
+#define XLNX_ZYNQMP_CAN_H
+
+#include "hw/register.h"
+#include "net/can_emu.h"
+#include "net/can_host.h"
+#include "qemu/fifo32.h"
+#include "hw/ptimer.h"
+#include "hw/qdev-clock.h"
+
+#define TYPE_XLNX_ZYNQMP_CAN "xlnx.zynqmp-can"
+
+#define XLNX_ZYNQMP_CAN(obj) \
+     OBJECT_CHECK(XlnxZynqMPCANState, (obj), TYPE_XLNX_ZYNQMP_CAN)
+
+#define MAX_CAN_CTRLS      2
+#define XLNX_ZYNQMP_CAN_R_MAX     (0x84 / 4)
+#define MAILBOX_CAPACITY   64
+#define CAN_TIMER_MAX  0XFFFFUL
+#define CAN_DEFAULT_CLOCK (24 * 1000 * 1000)
+
+/* Each CAN_FRAME will have 4 * 32bit size. */
+#define CAN_FRAME_SIZE     4
+#define RXFIFO_SIZE        (MAILBOX_CAPACITY * CAN_FRAME_SIZE)
+
+typedef struct XlnxZynqMPCANState {
+    SysBusDevice        parent_obj;
+    MemoryRegion        iomem;
+
+    qemu_irq            irq;
+
+    CanBusClientState   bus_client;
+    CanBusState         *canbus;
+
+    struct {
+        uint32_t        ext_clk_freq;
+    } cfg;
+
+    RegisterInfo        reg_info[XLNX_ZYNQMP_CAN_R_MAX];
+    uint32_t            regs[XLNX_ZYNQMP_CAN_R_MAX];
+
+    Fifo32              rx_fifo;
+    Fifo32              tx_fifo;
+    Fifo32              txhpb_fifo;
+
+    ptimer_state        *can_timer;
+} XlnxZynqMPCANState;
+
+#endif
diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
new file mode 100644
index 0000000..affa21a
--- /dev/null
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -0,0 +1,1161 @@
+/*
+ * QEMU model of the Xilinx ZynqMP CAN controller.
+ * This implementation is based on the following datasheet:
+ * https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
+ *
+ * Copyright (c) 2020 Xilinx Inc.
+ *
+ * Written-by: Vikram Garhwal<fnu.vikram@xilinx.com>
+ *
+ * Based on QEMU CAN Device emulation implemented by Jin Yang, Deniz Eren and
+ * Pavel Pisa
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
+#include "hw/irq.h"
+#include "qapi/error.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qemu/cutils.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "net/can_emu.h"
+#include "net/can_host.h"
+#include "qemu/event_notifier.h"
+#include "qom/object_interfaces.h"
+#include "hw/net/xlnx-zynqmp-can.h"
+#include "trace.h"
+
+#ifndef XLNX_ZYNQMP_CAN_ERR_DEBUG
+#define XLNX_ZYNQMP_CAN_ERR_DEBUG 0
+#endif
+
+#define MAX_DLC            8
+#undef ERROR
+
+REG32(SOFTWARE_RESET_REGISTER, 0x0)
+    FIELD(SOFTWARE_RESET_REGISTER, CEN, 1, 1)
+    FIELD(SOFTWARE_RESET_REGISTER, SRST, 0, 1)
+REG32(MODE_SELECT_REGISTER, 0x4)
+    FIELD(MODE_SELECT_REGISTER, SNOOP, 2, 1)
+    FIELD(MODE_SELECT_REGISTER, LBACK, 1, 1)
+    FIELD(MODE_SELECT_REGISTER, SLEEP, 0, 1)
+REG32(ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER, 0x8)
+    FIELD(ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER, BRP, 0, 8)
+REG32(ARBITRATION_PHASE_BIT_TIMING_REGISTER, 0xc)
+    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, SJW, 7, 2)
+    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, TS2, 4, 3)
+    FIELD(ARBITRATION_PHASE_BIT_TIMING_REGISTER, TS1, 0, 4)
+REG32(ERROR_COUNTER_REGISTER, 0x10)
+    FIELD(ERROR_COUNTER_REGISTER, REC, 8, 8)
+    FIELD(ERROR_COUNTER_REGISTER, TEC, 0, 8)
+REG32(ERROR_STATUS_REGISTER, 0x14)
+    FIELD(ERROR_STATUS_REGISTER, ACKER, 4, 1)
+    FIELD(ERROR_STATUS_REGISTER, BERR, 3, 1)
+    FIELD(ERROR_STATUS_REGISTER, STER, 2, 1)
+    FIELD(ERROR_STATUS_REGISTER, FMER, 1, 1)
+    FIELD(ERROR_STATUS_REGISTER, CRCER, 0, 1)
+REG32(STATUS_REGISTER, 0x18)
+    FIELD(STATUS_REGISTER, SNOOP, 12, 1)
+    FIELD(STATUS_REGISTER, ACFBSY, 11, 1)
+    FIELD(STATUS_REGISTER, TXFLL, 10, 1)
+    FIELD(STATUS_REGISTER, TXBFLL, 9, 1)
+    FIELD(STATUS_REGISTER, ESTAT, 7, 2)
+    FIELD(STATUS_REGISTER, ERRWRN, 6, 1)
+    FIELD(STATUS_REGISTER, BBSY, 5, 1)
+    FIELD(STATUS_REGISTER, BIDLE, 4, 1)
+    FIELD(STATUS_REGISTER, NORMAL, 3, 1)
+    FIELD(STATUS_REGISTER, SLEEP, 2, 1)
+    FIELD(STATUS_REGISTER, LBACK, 1, 1)
+    FIELD(STATUS_REGISTER, CONFIG, 0, 1)
+REG32(INTERRUPT_STATUS_REGISTER, 0x1c)
+    FIELD(INTERRUPT_STATUS_REGISTER, TXFEMP, 14, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, TXFWMEMP, 13, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, RXFWMFLL, 12, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, WKUP, 11, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, SLP, 10, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, BSOFF, 9, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, ERROR, 8, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, RXNEMP, 7, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, RXOFLW, 6, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, RXUFLW, 5, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, RXOK, 4, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, TXBFLL, 3, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, TXFLL, 2, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, TXOK, 1, 1)
+    FIELD(INTERRUPT_STATUS_REGISTER, ARBLST, 0, 1)
+REG32(INTERRUPT_ENABLE_REGISTER, 0x20)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFEMP, 14, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFWMEMP, 13, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ERXFWMFLL, 12, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, EWKUP, 11, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ESLP, 10, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, EBSOFF, 9, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, EERROR, 8, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ERXNEMP, 7, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ERXOFLW, 6, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ERXUFLW, 5, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ERXOK, 4, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ETXBFLL, 3, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ETXFLL, 2, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, ETXOK, 1, 1)
+    FIELD(INTERRUPT_ENABLE_REGISTER, EARBLST, 0, 1)
+REG32(INTERRUPT_CLEAR_REGISTER, 0x24)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFEMP, 14, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFWMEMP, 13, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CRXFWMFLL, 12, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CWKUP, 11, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CSLP, 10, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CBSOFF, 9, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CERROR, 8, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CRXNEMP, 7, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CRXOFLW, 6, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CRXUFLW, 5, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CRXOK, 4, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CTXBFLL, 3, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CTXFLL, 2, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CTXOK, 1, 1)
+    FIELD(INTERRUPT_CLEAR_REGISTER, CARBLST, 0, 1)
+REG32(TIMESTAMP_REGISTER, 0x28)
+    FIELD(TIMESTAMP_REGISTER, CTS, 0, 1)
+REG32(WIR, 0x2c)
+    FIELD(WIR, EW, 8, 8)
+    FIELD(WIR, FW, 0, 8)
+REG32(TXFIFO_ID, 0x30)
+    FIELD(TXFIFO_ID, IDH, 21, 11)
+    FIELD(TXFIFO_ID, SRRRTR, 20, 1)
+    FIELD(TXFIFO_ID, IDE, 19, 1)
+    FIELD(TXFIFO_ID, IDL, 1, 18)
+    FIELD(TXFIFO_ID, RTR, 0, 1)
+REG32(TXFIFO_DLC, 0x34)
+    FIELD(TXFIFO_DLC, DLC, 28, 4)
+REG32(TXFIFO_DATA1, 0x38)
+    FIELD(TXFIFO_DATA1, DB0, 24, 8)
+    FIELD(TXFIFO_DATA1, DB1, 16, 8)
+    FIELD(TXFIFO_DATA1, DB2, 8, 8)
+    FIELD(TXFIFO_DATA1, DB3, 0, 8)
+REG32(TXFIFO_DATA2, 0x3c)
+    FIELD(TXFIFO_DATA2, DB4, 24, 8)
+    FIELD(TXFIFO_DATA2, DB5, 16, 8)
+    FIELD(TXFIFO_DATA2, DB6, 8, 8)
+    FIELD(TXFIFO_DATA2, DB7, 0, 8)
+REG32(TXHPB_ID, 0x40)
+    FIELD(TXHPB_ID, IDH, 21, 11)
+    FIELD(TXHPB_ID, SRRRTR, 20, 1)
+    FIELD(TXHPB_ID, IDE, 19, 1)
+    FIELD(TXHPB_ID, IDL, 1, 18)
+    FIELD(TXHPB_ID, RTR, 0, 1)
+REG32(TXHPB_DLC, 0x44)
+    FIELD(TXHPB_DLC, DLC, 28, 4)
+REG32(TXHPB_DATA1, 0x48)
+    FIELD(TXHPB_DATA1, DB0, 24, 8)
+    FIELD(TXHPB_DATA1, DB1, 16, 8)
+    FIELD(TXHPB_DATA1, DB2, 8, 8)
+    FIELD(TXHPB_DATA1, DB3, 0, 8)
+REG32(TXHPB_DATA2, 0x4c)
+    FIELD(TXHPB_DATA2, DB4, 24, 8)
+    FIELD(TXHPB_DATA2, DB5, 16, 8)
+    FIELD(TXHPB_DATA2, DB6, 8, 8)
+    FIELD(TXHPB_DATA2, DB7, 0, 8)
+REG32(RXFIFO_ID, 0x50)
+    FIELD(RXFIFO_ID, IDH, 21, 11)
+    FIELD(RXFIFO_ID, SRRRTR, 20, 1)
+    FIELD(RXFIFO_ID, IDE, 19, 1)
+    FIELD(RXFIFO_ID, IDL, 1, 18)
+    FIELD(RXFIFO_ID, RTR, 0, 1)
+REG32(RXFIFO_DLC, 0x54)
+    FIELD(RXFIFO_DLC, DLC, 28, 4)
+    FIELD(RXFIFO_DLC, RXT, 0, 16)
+REG32(RXFIFO_DATA1, 0x58)
+    FIELD(RXFIFO_DATA1, DB0, 24, 8)
+    FIELD(RXFIFO_DATA1, DB1, 16, 8)
+    FIELD(RXFIFO_DATA1, DB2, 8, 8)
+    FIELD(RXFIFO_DATA1, DB3, 0, 8)
+REG32(RXFIFO_DATA2, 0x5c)
+    FIELD(RXFIFO_DATA2, DB4, 24, 8)
+    FIELD(RXFIFO_DATA2, DB5, 16, 8)
+    FIELD(RXFIFO_DATA2, DB6, 8, 8)
+    FIELD(RXFIFO_DATA2, DB7, 0, 8)
+REG32(AFR, 0x60)
+    FIELD(AFR, UAF4, 3, 1)
+    FIELD(AFR, UAF3, 2, 1)
+    FIELD(AFR, UAF2, 1, 1)
+    FIELD(AFR, UAF1, 0, 1)
+REG32(AFMR1, 0x64)
+    FIELD(AFMR1, AMIDH, 21, 11)
+    FIELD(AFMR1, AMSRR, 20, 1)
+    FIELD(AFMR1, AMIDE, 19, 1)
+    FIELD(AFMR1, AMIDL, 1, 18)
+    FIELD(AFMR1, AMRTR, 0, 1)
+REG32(AFIR1, 0x68)
+    FIELD(AFIR1, AIIDH, 21, 11)
+    FIELD(AFIR1, AISRR, 20, 1)
+    FIELD(AFIR1, AIIDE, 19, 1)
+    FIELD(AFIR1, AIIDL, 1, 18)
+    FIELD(AFIR1, AIRTR, 0, 1)
+REG32(AFMR2, 0x6c)
+    FIELD(AFMR2, AMIDH, 21, 11)
+    FIELD(AFMR2, AMSRR, 20, 1)
+    FIELD(AFMR2, AMIDE, 19, 1)
+    FIELD(AFMR2, AMIDL, 1, 18)
+    FIELD(AFMR2, AMRTR, 0, 1)
+REG32(AFIR2, 0x70)
+    FIELD(AFIR2, AIIDH, 21, 11)
+    FIELD(AFIR2, AISRR, 20, 1)
+    FIELD(AFIR2, AIIDE, 19, 1)
+    FIELD(AFIR2, AIIDL, 1, 18)
+    FIELD(AFIR2, AIRTR, 0, 1)
+REG32(AFMR3, 0x74)
+    FIELD(AFMR3, AMIDH, 21, 11)
+    FIELD(AFMR3, AMSRR, 20, 1)
+    FIELD(AFMR3, AMIDE, 19, 1)
+    FIELD(AFMR3, AMIDL, 1, 18)
+    FIELD(AFMR3, AMRTR, 0, 1)
+REG32(AFIR3, 0x78)
+    FIELD(AFIR3, AIIDH, 21, 11)
+    FIELD(AFIR3, AISRR, 20, 1)
+    FIELD(AFIR3, AIIDE, 19, 1)
+    FIELD(AFIR3, AIIDL, 1, 18)
+    FIELD(AFIR3, AIRTR, 0, 1)
+REG32(AFMR4, 0x7c)
+    FIELD(AFMR4, AMIDH, 21, 11)
+    FIELD(AFMR4, AMSRR, 20, 1)
+    FIELD(AFMR4, AMIDE, 19, 1)
+    FIELD(AFMR4, AMIDL, 1, 18)
+    FIELD(AFMR4, AMRTR, 0, 1)
+REG32(AFIR4, 0x80)
+    FIELD(AFIR4, AIIDH, 21, 11)
+    FIELD(AFIR4, AISRR, 20, 1)
+    FIELD(AFIR4, AIIDE, 19, 1)
+    FIELD(AFIR4, AIIDL, 1, 18)
+    FIELD(AFIR4, AIRTR, 0, 1)
+
+static void can_update_irq(XlnxZynqMPCANState *s)
+{
+    uint32_t irq;
+
+    /* Watermark register interrupts. */
+    if ((fifo32_num_free(&s->tx_fifo) / CAN_FRAME_SIZE) >
+            ARRAY_FIELD_EX32(s->regs, WIR, EW)) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFWMEMP, 1);
+    }
+
+    if ((fifo32_num_used(&s->rx_fifo) / CAN_FRAME_SIZE) >
+            ARRAY_FIELD_EX32(s->regs, WIR, FW)) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFWMFLL, 1);
+    }
+
+    /* RX Interrupts. */
+    if (fifo32_num_used(&s->rx_fifo) >= CAN_FRAME_SIZE) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXNEMP, 1);
+    }
+
+    /* TX interrupts. */
+    if (fifo32_is_empty(&s->tx_fifo)) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFEMP, 1);
+    }
+
+    if (fifo32_is_full(&s->tx_fifo)) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXFLL, 1);
+    }
+
+    if (fifo32_is_full(&s->txhpb_fifo)) {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXBFLL, 1);
+    }
+
+    irq = s->regs[R_INTERRUPT_STATUS_REGISTER];
+    irq &= s->regs[R_INTERRUPT_ENABLE_REGISTER];
+
+    trace_xlnx_can_update_irq(s->regs[R_INTERRUPT_STATUS_REGISTER],
+                              s->regs[R_INTERRUPT_ENABLE_REGISTER], irq);
+    qemu_set_irq(s->irq, irq);
+}
+
+static void can_ier_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    can_update_irq(s);
+}
+
+static uint64_t can_icr_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    s->regs[R_INTERRUPT_STATUS_REGISTER] &= ~val;
+    can_update_irq(s);
+
+    return 0;
+}
+
+static void can_config_reset(XlnxZynqMPCANState *s)
+{
+    /* Reset all the configuration registers. */
+    register_reset(&s->reg_info[R_SOFTWARE_RESET_REGISTER]);
+    register_reset(&s->reg_info[R_MODE_SELECT_REGISTER]);
+    register_reset(
+              &s->reg_info[R_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER]);
+    register_reset(&s->reg_info[R_ARBITRATION_PHASE_BIT_TIMING_REGISTER]);
+    register_reset(&s->reg_info[R_STATUS_REGISTER]);
+    register_reset(&s->reg_info[R_INTERRUPT_STATUS_REGISTER]);
+    register_reset(&s->reg_info[R_INTERRUPT_ENABLE_REGISTER]);
+    register_reset(&s->reg_info[R_INTERRUPT_CLEAR_REGISTER]);
+    register_reset(&s->reg_info[R_WIR]);
+}
+
+static void can_config_mode(XlnxZynqMPCANState *s)
+{
+    register_reset(&s->reg_info[R_ERROR_COUNTER_REGISTER]);
+    register_reset(&s->reg_info[R_ERROR_STATUS_REGISTER]);
+
+    /* Put XlnxZynqMPCAN in configuration mode. */
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 1);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, BSOFF, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ERROR, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 0);
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ARBLST, 0);
+
+    can_update_irq(s);
+}
+
+static void update_status_register_mode_bits(XlnxZynqMPCANState *s)
+{
+    bool sleep_status = ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP);
+    bool sleep_mode = ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SLEEP);
+    /* Wake up interrupt bit. */
+    bool wakeup_irq_val = sleep_status && (sleep_mode == 0);
+    /* Sleep interrupt bit. */
+    bool sleep_irq_val = sleep_mode && (sleep_status == 0);
+
+    /* Clear previous core mode status bits. */
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 0);
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 0);
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 0);
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 0);
+
+    /* set current mode bit and generate irqs accordingly. */
+    if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, LBACK)) {
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, LBACK, 1);
+    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SLEEP)) {
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SLEEP, 1);
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP,
+                         sleep_irq_val);
+    } else if (ARRAY_FIELD_EX32(s->regs, MODE_SELECT_REGISTER, SNOOP)) {
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, SNOOP, 1);
+    } else {
+        /*
+         * If all bits are zero then XlnxZynqMPCAN is set in normal mode.
+         */
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, NORMAL, 1);
+        /* Set wakeup interrupt bit. */
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP,
+                         wakeup_irq_val);
+    }
+
+    can_update_irq(s);
+}
+
+static void can_exit_sleep_mode(XlnxZynqMPCANState *s)
+{
+    ARRAY_FIELD_DP32(s->regs, MODE_SELECT_REGISTER, SLEEP, 0);
+    update_status_register_mode_bits(s);
+}
+
+static void generate_frame(qemu_can_frame *frame, uint32_t *data)
+{
+    frame->can_id = data[0];
+    frame->can_dlc = FIELD_EX32(data[1], TXFIFO_DLC, DLC);
+
+    frame->data[0] = FIELD_EX32(data[2], TXFIFO_DATA1, DB3);
+    frame->data[1] = FIELD_EX32(data[2], TXFIFO_DATA1, DB2);
+    frame->data[2] = FIELD_EX32(data[2], TXFIFO_DATA1, DB1);
+    frame->data[3] = FIELD_EX32(data[2], TXFIFO_DATA1, DB0);
+
+    frame->data[4] = FIELD_EX32(data[3], TXFIFO_DATA2, DB7);
+    frame->data[5] = FIELD_EX32(data[3], TXFIFO_DATA2, DB6);
+    frame->data[6] = FIELD_EX32(data[3], TXFIFO_DATA2, DB5);
+    frame->data[7] = FIELD_EX32(data[3], TXFIFO_DATA2, DB4);
+}
+
+static bool tx_ready_check(XlnxZynqMPCANState *s)
+{
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer data while"
+                      " data while controller is in reset mode.\n",
+                      path);
+        return false;
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer"
+                      " data while controller is in configuration mode. Reset"
+                      " the core so operations can start fresh.\n",
+                      path);
+        return false;
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to transfer"
+                      " data while controller is in SNOOP MODE.\n",
+                      path);
+        return false;
+    }
+
+    return true;
+}
+
+static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
+{
+    qemu_can_frame frame;
+    uint32_t data[CAN_FRAME_SIZE];
+    int i;
+    bool can_tx = tx_ready_check(s);
+
+    if (!can_tx) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is not enabled for data"
+                      " transfer.\n", path);
+        can_update_irq(s);
+        return;
+    }
+
+    while (!fifo32_is_empty(fifo)) {
+        for (i = 0; i < CAN_FRAME_SIZE; i++) {
+            data[i] = fifo32_pop(fifo);
+        }
+
+        if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, LBACK)) {
+            /*
+             * Controller is in loopback. In Loopback mode, the CAN core
+             * transmits a recessive bitstream on to the XlnxZynqMPCAN Bus.
+             * Any message transmitted is looped back to the RX line and
+             * acknowledged. The XlnxZynqMPCAN core receives any message
+             * that it transmits.
+             */
+            if (fifo32_is_full(&s->rx_fifo)) {
+                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
+            } else {
+                for (i = 0; i < CAN_FRAME_SIZE; i++) {
+                    fifo32_push(&s->rx_fifo, data[i]);
+                }
+
+                ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
+            }
+        } else {
+            /* Normal mode Tx. */
+            generate_frame(&frame, data);
+
+            trace_xlnx_can_tx_data(frame.can_id, frame.can_dlc,
+                                   frame.data[0], frame.data[1],
+                                   frame.data[2], frame.data[3],
+                                   frame.data[4], frame.data[5],
+                                   frame.data[6], frame.data[7]);
+            can_bus_client_send(&s->bus_client, &frame, 1);
+        }
+    }
+
+    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 1);
+    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, TXBFLL, 0);
+
+    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) {
+        can_exit_sleep_mode(s);
+    }
+
+    can_update_irq(s);
+}
+
+static uint64_t can_srr_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    ARRAY_FIELD_DP32(s->regs, SOFTWARE_RESET_REGISTER, CEN,
+                     FIELD_EX32(val, SOFTWARE_RESET_REGISTER, CEN));
+
+    if (FIELD_EX32(val, SOFTWARE_RESET_REGISTER, SRST)) {
+        trace_xlnx_can_reset(val);
+
+        /* First, core will do software reset then will enter in config mode. */
+        can_config_reset(s);
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
+        can_config_mode(s);
+    } else {
+        /*
+         * Leave config mode. Now XlnxZynqMPCAN core will enter normal,
+         * sleep, snoop or loopback mode depending upon LBACK, SLEEP, SNOOP
+         * register states.
+         */
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 0);
+
+        ptimer_transaction_begin(s->can_timer);
+        ptimer_set_count(s->can_timer, 0);
+        ptimer_transaction_commit(s->can_timer);
+
+        /* XlnxZynqMPCAN is out of config mode. It will send pending data. */
+        transfer_fifo(s, &s->txhpb_fifo);
+        transfer_fifo(s, &s->tx_fifo);
+    }
+
+    update_status_register_mode_bits(s);
+
+    return s->regs[R_SOFTWARE_RESET_REGISTER];
+}
+
+static uint64_t can_msr_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+    uint8_t multi_mode;
+
+    /*
+     * Multiple mode set check. This is done to make sure user doesn't set
+     * multiple modes.
+     */
+    multi_mode = FIELD_EX32(val, MODE_SELECT_REGISTER, LBACK) +
+                 FIELD_EX32(val, MODE_SELECT_REGISTER, SLEEP) +
+                 FIELD_EX32(val, MODE_SELECT_REGISTER, SNOOP);
+
+    if (multi_mode > 1) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to config"
+                      " several modes simultaneously. One mode will be selected"
+                      " according to their priority: LBACK > SLEEP > SNOOP.\n",
+                      path);
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN) == 0) {
+        /* We are in configuration mode, any mode can be selected. */
+        s->regs[R_MODE_SELECT_REGISTER] = val;
+    } else {
+        bool sleep_mode_bit = FIELD_EX32(val, MODE_SELECT_REGISTER, SLEEP);
+
+        ARRAY_FIELD_DP32(s->regs, MODE_SELECT_REGISTER, SLEEP, sleep_mode_bit);
+
+        if (FIELD_EX32(val, MODE_SELECT_REGISTER, LBACK)) {
+            g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to set"
+                          " LBACK mode without setting CEN bit as 0.\n",
+                          path);
+        } else if (FIELD_EX32(val, MODE_SELECT_REGISTER, SNOOP)) {
+            g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Attempting to set"
+                          " SNOOP mode without setting CEN bit as 0.\n",
+                          path);
+        }
+
+        update_status_register_mode_bits(s);
+    }
+
+    return s->regs[R_MODE_SELECT_REGISTER];
+}
+
+static uint64_t can_brpr_pre_write(RegisterInfo  *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    /* Only allow writes when in config mode. */
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
+        return s->regs[R_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER];
+    }
+
+    return val;
+}
+
+static uint64_t can_btr_pre_write(RegisterInfo  *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    /* Only allow writes when in config mode. */
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
+        return s->regs[R_ARBITRATION_PHASE_BIT_TIMING_REGISTER];
+    }
+
+    return val;
+}
+
+static uint64_t can_tcr_pre_write(RegisterInfo  *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    if (FIELD_EX32(val, TIMESTAMP_REGISTER, CTS)) {
+        ptimer_transaction_begin(s->can_timer);
+        ptimer_set_count(s->can_timer, 0);
+        ptimer_transaction_commit(s->can_timer);
+    }
+
+    return 0;
+}
+
+static void update_rx_fifo(XlnxZynqMPCANState *s, const qemu_can_frame *frame)
+{
+    bool filter_pass = false;
+    uint16_t timestamp = 0;
+
+    /* If no filter is enabled. Message will be stored in FIFO. */
+    if (!((ARRAY_FIELD_EX32(s->regs, AFR, UAF1)) |
+       (ARRAY_FIELD_EX32(s->regs, AFR, UAF2)) |
+       (ARRAY_FIELD_EX32(s->regs, AFR, UAF3)) |
+       (ARRAY_FIELD_EX32(s->regs, AFR, UAF4)))) {
+        filter_pass = true;
+    }
+
+    /*
+     * Messages that pass any of the acceptance filters will be stored in
+     * the RX FIFO.
+     */
+    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF1)) {
+        uint32_t id_masked = s->regs[R_AFMR1] & frame->can_id;
+        uint32_t filter_id_masked = s->regs[R_AFMR1] & s->regs[R_AFIR1];
+
+        if (filter_id_masked == id_masked) {
+            filter_pass = true;
+        }
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF2)) {
+        uint32_t id_masked = s->regs[R_AFMR2] & frame->can_id;
+        uint32_t filter_id_masked = s->regs[R_AFMR2] & s->regs[R_AFIR2];
+
+        if (filter_id_masked == id_masked) {
+            filter_pass = true;
+        }
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF3)) {
+        uint32_t id_masked = s->regs[R_AFMR3] & frame->can_id;
+        uint32_t filter_id_masked = s->regs[R_AFMR3] & s->regs[R_AFIR3];
+
+        if (filter_id_masked == id_masked) {
+            filter_pass = true;
+        }
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF4)) {
+        uint32_t id_masked = s->regs[R_AFMR4] & frame->can_id;
+        uint32_t filter_id_masked = s->regs[R_AFMR4] & s->regs[R_AFIR4];
+
+        if (filter_id_masked == id_masked) {
+            filter_pass = true;
+        }
+    }
+
+    if (!filter_pass) {
+        trace_xlnx_can_rx_fifo_filter_reject(frame->can_id, frame->can_dlc);
+        return;
+    }
+
+    /* Store the message in fifo if it passed through any of the filters. */
+    if (filter_pass && frame->can_dlc <= MAX_DLC) {
+
+        if (fifo32_is_full(&s->rx_fifo)) {
+            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
+        } else {
+            timestamp = CAN_TIMER_MAX - ptimer_get_count(s->can_timer);
+
+            fifo32_push(&s->rx_fifo, frame->can_id);
+
+            fifo32_push(&s->rx_fifo, deposit32(0, R_RXFIFO_DLC_DLC_SHIFT,
+                                               R_RXFIFO_DLC_DLC_LENGTH,
+                                               frame->can_dlc) |
+                                     deposit32(0, R_RXFIFO_DLC_RXT_SHIFT,
+                                               R_RXFIFO_DLC_RXT_LENGTH,
+                                               timestamp));
+
+            /* First 32 bit of the data. */
+            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA1_DB3_SHIFT,
+                                               R_TXFIFO_DATA1_DB3_LENGTH,
+                                               frame->data[0]) |
+                                     deposit32(0, R_TXFIFO_DATA1_DB2_SHIFT,
+                                               R_TXFIFO_DATA1_DB2_LENGTH,
+                                               frame->data[1]) |
+                                     deposit32(0, R_TXFIFO_DATA1_DB1_SHIFT,
+                                               R_TXFIFO_DATA1_DB1_LENGTH,
+                                               frame->data[2]) |
+                                     deposit32(0, R_TXFIFO_DATA1_DB0_SHIFT,
+                                               R_TXFIFO_DATA1_DB0_LENGTH,
+                                               frame->data[3]));
+            /* Last 32 bit of the data. */
+            fifo32_push(&s->rx_fifo, deposit32(0, R_TXFIFO_DATA2_DB7_SHIFT,
+                                               R_TXFIFO_DATA2_DB7_LENGTH,
+                                               frame->data[4]) |
+                                     deposit32(0, R_TXFIFO_DATA2_DB6_SHIFT,
+                                               R_TXFIFO_DATA2_DB6_LENGTH,
+                                               frame->data[5]) |
+                                     deposit32(0, R_TXFIFO_DATA2_DB5_SHIFT,
+                                               R_TXFIFO_DATA2_DB5_LENGTH,
+                                               frame->data[6]) |
+                                     deposit32(0, R_TXFIFO_DATA2_DB4_SHIFT,
+                                               R_TXFIFO_DATA2_DB4_LENGTH,
+                                               frame->data[7]));
+
+            ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 1);
+            trace_xlnx_can_rx_data(frame->can_id, frame->can_dlc,
+                                   frame->data[0], frame->data[1],
+                                   frame->data[2], frame->data[3],
+                                   frame->data[4], frame->data[5],
+                                   frame->data[6], frame->data[7]);
+        }
+
+        can_update_irq(s);
+    }
+}
+
+static uint64_t can_rxfifo_pre_read(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    if (!fifo32_is_empty(&s->rx_fifo)) {
+        val = fifo32_pop(&s->rx_fifo);
+    } else {
+        ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXUFLW, 1);
+    }
+
+    can_update_irq(s);
+    return val;
+}
+
+static void can_filter_enable_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    if (ARRAY_FIELD_EX32(s->regs, AFR, UAF1) &&
+        ARRAY_FIELD_EX32(s->regs, AFR, UAF2) &&
+        ARRAY_FIELD_EX32(s->regs, AFR, UAF3) &&
+        ARRAY_FIELD_EX32(s->regs, AFR, UAF4)) {
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, ACFBSY, 1);
+    } else {
+        ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, ACFBSY, 0);
+    }
+}
+
+static uint64_t can_filter_mask_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+    uint32_t reg_idx = (reg->access->addr) / 4;
+    uint32_t filter_number = (reg_idx - R_AFMR1) / 2;
+
+    /* modify an acceptance filter, the corresponding UAF bit should be '0'. */
+    if (!(s->regs[R_AFR] & (1 << filter_number))) {
+        s->regs[reg_idx] = val;
+
+        trace_xlnx_can_filter_mask_pre_write(filter_number, s->regs[reg_idx]);
+    } else {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Acceptance filter %d"
+                      " mask is not set as corresponding UAF bit is not 0.\n",
+                      path, filter_number + 1);
+    }
+
+    return s->regs[reg_idx];
+}
+
+static uint64_t can_filter_id_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+    uint32_t reg_idx = (reg->access->addr) / 4;
+    uint32_t filter_number = (reg_idx - R_AFIR1) / 2;
+
+    if (!(s->regs[R_AFR] & (1 << filter_number))) {
+        s->regs[reg_idx] = val;
+
+        trace_xlnx_can_filter_id_pre_write(filter_number, s->regs[reg_idx]);
+    } else {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Acceptance filter %d"
+                      " id is not set as corresponding UAF bit is not 0.\n",
+                      path, filter_number + 1);
+    }
+
+    return s->regs[reg_idx];
+}
+
+static void can_tx_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(reg->opaque);
+
+    bool is_txhpb = reg->access->addr > A_TXFIFO_DATA2;
+
+    bool initiate_transfer = (reg->access->addr == A_TXFIFO_DATA2) ||
+                             (reg->access->addr == A_TXHPB_DATA2);
+
+    Fifo32 *f = is_txhpb ? &s->txhpb_fifo : &s->tx_fifo;
+
+    if (!fifo32_is_full(f)) {
+        fifo32_push(f, val);
+    } else {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: TX FIFO is full.\n", path);
+    }
+
+    /* Initiate the message send if TX register is written. */
+    if (initiate_transfer &&
+        ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) {
+        transfer_fifo(s, f);
+    }
+
+    can_update_irq(s);
+}
+
+static const RegisterAccessInfo can_regs_info[] = {
+    {   .name = "SOFTWARE_RESET_REGISTER",
+        .addr = A_SOFTWARE_RESET_REGISTER,
+        .rsvd = 0xfffffffc,
+        .pre_write = can_srr_pre_write,
+    },{ .name = "MODE_SELECT_REGISTER",
+        .addr = A_MODE_SELECT_REGISTER,
+        .rsvd = 0xfffffff8,
+        .pre_write = can_msr_pre_write,
+    },{ .name = "ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER",
+        .addr = A_ARBITRATION_PHASE_BAUD_RATE_PRESCALER_REGISTER,
+        .rsvd = 0xffffff00,
+        .pre_write = can_brpr_pre_write,
+    },{ .name = "ARBITRATION_PHASE_BIT_TIMING_REGISTER",
+        .addr = A_ARBITRATION_PHASE_BIT_TIMING_REGISTER,
+        .rsvd = 0xfffffe00,
+        .pre_write = can_btr_pre_write,
+    },{ .name = "ERROR_COUNTER_REGISTER",
+        .addr = A_ERROR_COUNTER_REGISTER,
+        .rsvd = 0xffff0000,
+        .ro = 0xffffffff,
+    },{ .name = "ERROR_STATUS_REGISTER",
+        .addr = A_ERROR_STATUS_REGISTER,
+        .rsvd = 0xffffffe0,
+        .w1c = 0x1f,
+    },{ .name = "STATUS_REGISTER",  .addr = A_STATUS_REGISTER,
+        .reset = 0x1,
+        .rsvd = 0xffffe000,
+        .ro = 0x1fff,
+    },{ .name = "INTERRUPT_STATUS_REGISTER",
+        .addr = A_INTERRUPT_STATUS_REGISTER,
+        .reset = 0x6000,
+        .rsvd = 0xffff8000,
+        .ro = 0x7fff,
+    },{ .name = "INTERRUPT_ENABLE_REGISTER",
+        .addr = A_INTERRUPT_ENABLE_REGISTER,
+        .rsvd = 0xffff8000,
+        .post_write = can_ier_post_write,
+    },{ .name = "INTERRUPT_CLEAR_REGISTER",
+        .addr = A_INTERRUPT_CLEAR_REGISTER,
+        .rsvd = 0xffff8000,
+        .pre_write = can_icr_pre_write,
+    },{ .name = "TIMESTAMP_REGISTER",
+        .addr = A_TIMESTAMP_REGISTER,
+        .rsvd = 0xfffffffe,
+        .pre_write = can_tcr_pre_write,
+    },{ .name = "WIR",  .addr = A_WIR,
+        .reset = 0x3f3f,
+        .rsvd = 0xffff0000,
+    },{ .name = "TXFIFO_ID",  .addr = A_TXFIFO_ID,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXFIFO_DLC",  .addr = A_TXFIFO_DLC,
+        .rsvd = 0xfffffff,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXFIFO_DATA1",  .addr = A_TXFIFO_DATA1,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXFIFO_DATA2",  .addr = A_TXFIFO_DATA2,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXHPB_ID",  .addr = A_TXHPB_ID,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXHPB_DLC",  .addr = A_TXHPB_DLC,
+        .rsvd = 0xfffffff,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXHPB_DATA1",  .addr = A_TXHPB_DATA1,
+        .post_write = can_tx_post_write,
+    },{ .name = "TXHPB_DATA2",  .addr = A_TXHPB_DATA2,
+        .post_write = can_tx_post_write,
+    },{ .name = "RXFIFO_ID",  .addr = A_RXFIFO_ID,
+        .ro = 0xffffffff,
+        .post_read = can_rxfifo_pre_read,
+    },{ .name = "RXFIFO_DLC",  .addr = A_RXFIFO_DLC,
+        .rsvd = 0xfff0000,
+        .post_read = can_rxfifo_pre_read,
+    },{ .name = "RXFIFO_DATA1",  .addr = A_RXFIFO_DATA1,
+        .post_read = can_rxfifo_pre_read,
+    },{ .name = "RXFIFO_DATA2",  .addr = A_RXFIFO_DATA2,
+        .post_read = can_rxfifo_pre_read,
+    },{ .name = "AFR",  .addr = A_AFR,
+        .rsvd = 0xfffffff0,
+        .post_write = can_filter_enable_post_write,
+    },{ .name = "AFMR1",  .addr = A_AFMR1,
+        .pre_write = can_filter_mask_pre_write,
+    },{ .name = "AFIR1",  .addr = A_AFIR1,
+        .pre_write = can_filter_id_pre_write,
+    },{ .name = "AFMR2",  .addr = A_AFMR2,
+        .pre_write = can_filter_mask_pre_write,
+    },{ .name = "AFIR2",  .addr = A_AFIR2,
+        .pre_write = can_filter_id_pre_write,
+    },{ .name = "AFMR3",  .addr = A_AFMR3,
+        .pre_write = can_filter_mask_pre_write,
+    },{ .name = "AFIR3",  .addr = A_AFIR3,
+        .pre_write = can_filter_id_pre_write,
+    },{ .name = "AFMR4",  .addr = A_AFMR4,
+        .pre_write = can_filter_mask_pre_write,
+    },{ .name = "AFIR4",  .addr = A_AFIR4,
+        .pre_write = can_filter_id_pre_write,
+    }
+};
+
+static void xlnx_zynqmp_can_ptimer_cb(void *opaque)
+{
+    /* No action required on the timer rollover. */
+}
+
+static const MemoryRegionOps can_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xlnx_zynqmp_can_reset_init(Object *obj, ResetType type)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(obj);
+    unsigned int i;
+
+    for (i = R_RXFIFO_ID; i < ARRAY_SIZE(s->reg_info); ++i) {
+        register_reset(&s->reg_info[i]);
+    }
+
+    ptimer_transaction_begin(s->can_timer);
+    ptimer_set_count(s->can_timer, 0);
+    ptimer_transaction_commit(s->can_timer);
+}
+
+static void xlnx_zynqmp_can_reset_hold(Object *obj)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(obj);
+    unsigned int i;
+
+    for (i = 0; i < R_RXFIFO_ID; ++i) {
+        register_reset(&s->reg_info[i]);
+    }
+
+    /*
+     * Reset FIFOs when CAN model is reset. This will clear the fifo writes
+     * done by post_write which gets called from register_reset function,
+     * post_write handle will not be able to trigger tx because CAN will be
+     * disabled when software_reset_register is cleared first.
+     */
+    fifo32_reset(&s->rx_fifo);
+    fifo32_reset(&s->tx_fifo);
+    fifo32_reset(&s->txhpb_fifo);
+}
+
+static bool xlnx_zynqmp_can_can_receive(CanBusClientState *client)
+{
+    XlnxZynqMPCANState *s = container_of(client, XlnxZynqMPCANState,
+                                         bus_client);
+
+    if (ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, SRST)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is in reset state.\n",
+                      path);
+        return false;
+    }
+
+    if ((ARRAY_FIELD_EX32(s->regs, SOFTWARE_RESET_REGISTER, CEN)) == 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Controller is disabled. Incoming"
+                      " messages will be discarded.\n", path);
+        return false;
+    }
+
+    return true;
+}
+
+static ssize_t xlnx_zynqmp_can_receive(CanBusClientState *client,
+                               const qemu_can_frame *buf, size_t buf_size) {
+    XlnxZynqMPCANState *s = container_of(client, XlnxZynqMPCANState,
+                                         bus_client);
+    const qemu_can_frame *frame = buf;
+
+    if (buf_size <= 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Error in the data received.\n",
+                      path);
+        return 0;
+    }
+
+    if (ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SNOOP)) {
+        /* Snoop Mode: Just keep the data. no response back. */
+        update_rx_fifo(s, frame);
+    } else if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP))) {
+        /*
+         * XlnxZynqMPCAN is in sleep mode. Any data on bus will bring it to wake
+         * up state.
+         */
+        can_exit_sleep_mode(s);
+        update_rx_fifo(s, frame);
+    } else if ((ARRAY_FIELD_EX32(s->regs, STATUS_REGISTER, SLEEP)) == 0) {
+        update_rx_fifo(s, frame);
+    } else {
+        /*
+         * XlnxZynqMPCAN will not participate in normal bus communication
+         * and will not receive any messages transmitted by other CAN nodes.
+         */
+        trace_xlnx_can_rx_discard(s->regs[R_STATUS_REGISTER]);
+    }
+
+    return 1;
+}
+
+static CanBusClientInfo can_xilinx_bus_client_info = {
+    .can_receive = xlnx_zynqmp_can_can_receive,
+    .receive = xlnx_zynqmp_can_receive,
+};
+
+static int xlnx_zynqmp_can_connect_to_bus(XlnxZynqMPCANState *s,
+                                          CanBusState *bus)
+{
+    s->bus_client.info = &can_xilinx_bus_client_info;
+
+    if (can_bus_insert_client(bus, &s->bus_client) < 0) {
+        return -1;
+    }
+    return 0;
+}
+
+static void xlnx_zynqmp_can_realize(DeviceState *dev, Error **errp)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(dev);
+
+    if (s->canbus) {
+        if (xlnx_zynqmp_can_connect_to_bus(s, s->canbus) < 0) {
+            g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
+            error_setg(errp, "%s: xlnx_zynqmp_can_connect_to_bus"
+                       " failed.", path);
+            return;
+        }
+    }
+
+    /* Create RX FIFO, TXFIFO, TXHPB storage. */
+    fifo32_create(&s->rx_fifo, RXFIFO_SIZE);
+    fifo32_create(&s->tx_fifo, RXFIFO_SIZE);
+    fifo32_create(&s->txhpb_fifo, CAN_FRAME_SIZE);
+
+    /* Allocate a new timer. */
+    s->can_timer = ptimer_init(xlnx_zynqmp_can_ptimer_cb, s,
+                               PTIMER_POLICY_DEFAULT);
+
+    ptimer_transaction_begin(s->can_timer);
+
+    ptimer_set_freq(s->can_timer, s->cfg.ext_clk_freq);
+    ptimer_set_limit(s->can_timer, CAN_TIMER_MAX, 1);
+    ptimer_run(s->can_timer, 0);
+    ptimer_transaction_commit(s->can_timer);
+}
+
+static void xlnx_zynqmp_can_init(Object *obj)
+{
+    XlnxZynqMPCANState *s = XLNX_ZYNQMP_CAN(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XLNX_ZYNQMP_CAN,
+                        XLNX_ZYNQMP_CAN_R_MAX * 4);
+    reg_array = register_init_block32(DEVICE(obj), can_regs_info,
+                               ARRAY_SIZE(can_regs_info),
+                               s->reg_info, s->regs,
+                               &can_ops,
+                               XLNX_ZYNQMP_CAN_ERR_DEBUG,
+                               XLNX_ZYNQMP_CAN_R_MAX * 4);
+
+    memory_region_add_subregion(&s->iomem, 0x00, &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+}
+
+static const VMStateDescription vmstate_can = {
+    .name = TYPE_XLNX_ZYNQMP_CAN,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_FIFO32(rx_fifo, XlnxZynqMPCANState),
+        VMSTATE_FIFO32(tx_fifo, XlnxZynqMPCANState),
+        VMSTATE_FIFO32(txhpb_fifo, XlnxZynqMPCANState),
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPCANState, XLNX_ZYNQMP_CAN_R_MAX),
+        VMSTATE_PTIMER(can_timer, XlnxZynqMPCANState),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property xlnx_zynqmp_can_properties[] = {
+    DEFINE_PROP_UINT32("ext_clk_freq", XlnxZynqMPCANState, cfg.ext_clk_freq,
+                       CAN_DEFAULT_CLOCK),
+    DEFINE_PROP_LINK("canbus", XlnxZynqMPCANState, canbus, TYPE_CAN_BUS,
+                     CanBusState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xlnx_zynqmp_can_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = xlnx_zynqmp_can_reset_init;
+    rc->phases.hold = xlnx_zynqmp_can_reset_hold;
+    dc->realize = xlnx_zynqmp_can_realize;
+    device_class_set_props(dc, xlnx_zynqmp_can_properties);
+    dc->vmsd = &vmstate_can;
+}
+
+static const TypeInfo can_info = {
+    .name          = TYPE_XLNX_ZYNQMP_CAN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPCANState),
+    .class_init    = xlnx_zynqmp_can_class_init,
+    .instance_init = xlnx_zynqmp_can_init,
+};
+
+static void can_register_types(void)
+{
+    type_register_static(&can_info);
+}
+
+type_init(can_register_types)
diff --git a/hw/Kconfig b/hw/Kconfig
index 4de1797..5ad3c6b 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -80,3 +80,4 @@ config XILINX_AXI
 config XLNX_ZYNQMP
     bool
     select REGISTER
+    select CAN_BUS
diff --git a/hw/net/can/meson.build b/hw/net/can/meson.build
index 714951f..8fabbd9 100644
--- a/hw/net/can/meson.build
+++ b/hw/net/can/meson.build
@@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_pcm3680_pci.c'))
 softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_mioe3680_pci.c'))
 softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD', if_true: files('ctucan_core.c'))
 softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD_PCI', if_true: files('ctucan_pci.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-can.c'))
diff --git a/hw/net/can/trace-events b/hw/net/can/trace-events
new file mode 100644
index 0000000..8346a98
--- /dev/null
+++ b/hw/net/can/trace-events
@@ -0,0 +1,9 @@
+# xlnx-zynqmp-can.c
+xlnx_can_update_irq(uint32_t isr, uint32_t ier, uint32_t irq) "ISR: 0x%08x IER: 0x%08x IRQ: 0x%08x"
+xlnx_can_reset(uint32_t val) "Resetting controller with value = 0x%08x"
+xlnx_can_rx_fifo_filter_reject(uint32_t id, uint8_t dlc) "Frame: ID: 0x%08x DLC: 0x%02x"
+xlnx_can_filter_id_pre_write(uint8_t filter_num, uint32_t value) "Filter%d ID: 0x%08x"
+xlnx_can_filter_mask_pre_write(uint8_t filter_num, uint32_t value) "Filter%d MASK: 0x%08x"
+xlnx_can_tx_data(uint32_t id, uint8_t dlc, uint8_t db0, uint8_t db1, uint8_t db2, uint8_t db3, uint8_t db4, uint8_t db5, uint8_t db6, uint8_t db7) "Frame: ID: 0x%08x DLC: 0x%02x DATA: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x"
+xlnx_can_rx_data(uint32_t id, uint32_t dlc, uint8_t db0, uint8_t db1, uint8_t db2, uint8_t db3, uint8_t db4, uint8_t db5, uint8_t db6, uint8_t db7) "Frame: ID: 0x%08x DLC: 0x%02x DATA: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x"
+xlnx_can_rx_discard(uint32_t status) "Controller is not enabled for bus communication. Status Register: 0x%08x"
-- 
2.7.4


