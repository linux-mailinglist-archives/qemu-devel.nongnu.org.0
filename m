Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B42B8546
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 21:06:42 +0100 (CET)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTiy-0000Uw-JD
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 15:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1kfTgO-0007wK-GU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:04:00 -0500
Received: from mail-bn8nam12on2085.outbound.protection.outlook.com
 ([40.107.237.85]:52128 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1kfTgL-0007Ov-KN
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:03:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoaTk9ialOSDrChEi/oBWQG7Uvz0Nw2E/i68BrrYSvy0lAqRrEwu/dVtp/6QvUb0ilolgIcyBajvmvelUKF58EsUZqg7NNV/cdOpYEHfx6bIeNipofzfJFzaFoZiWMmI/5ja4cwUMmiknkpVDZPcWCt7zxP8zo2ZmxT+EpMXMq/WTgXevf65eZxFvgx6cR7lH2kaAlQPMDLvtMdTtIUE/zLzDCBnlyl30Hj92uZnJixxDPfI0UvndoYlfXmg+EApFbH+me/FOhMr3dd8gglLf4q1R3gZLEmvIqjLa6bbfigKdYrkRo+uJ0Ai1v4ByLNS2TB7cg/MhiOJWI3Qa4ifIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c3HSx2wy5dgLnSsQ3GMQedKNeTzEeIhip+W0KfHXsE=;
 b=n10rE7LfOaI/TIyGkcarkE7ZOe+fO129libsZFHoHBvRwNVhRF5Cp4//X7BeZGGDDVxJbwnlRaqi7+uDkzqQol8InJrnhLeb3jfqVqk6Z8x0NxyFgZdWZmGiSJ4fDUyCRlcNsDdAVKLJ+q2h6Xc8vthhU2wArT2WucshgyoSOE1xEeZcO6PiiRdwCJ7IrZ1KKXAiT7BZaUtHY6LKcRzj1LioDrivDGDaAec1kVY4YHk/UZmJsDW26kUc4wwb4zDePvnuzIo2TnIx6WcwUB4uzCVMjBYHyUud/IyBdUCIlBmnk05m+TjDUsjUeL+bw8IHdhH5jk+qbWz7qpwewBZMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c3HSx2wy5dgLnSsQ3GMQedKNeTzEeIhip+W0KfHXsE=;
 b=meKJucr5MT4DfxF9c6LnjjU2G2QsqQfXwcwcel3cQqmqvk8FHulbrj4GX7XfUxfY9Mlf1SONuLFtFQRo3xUEat+O0muBc5BWUhf2rqZJGc5toE50kWyxaRSWNifbkx0+bnExUjcjenriCdAHgOstZBcBwZXR3z068HicyIgsyfU=
Received: from CY4PR13CA0028.namprd13.prod.outlook.com (2603:10b6:903:99::14)
 by SN6PR02MB4702.namprd02.prod.outlook.com (2603:10b6:805:9c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 19:48:51 +0000
Received: from CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:99:cafe::7f) by CY4PR13CA0028.outlook.office365.com
 (2603:10b6:903:99::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend
 Transport; Wed, 18 Nov 2020 19:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT011.mail.protection.outlook.com (10.152.75.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 19:48:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 11:48:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 11:48:50 -0800
Received: from [172.19.2.115] (port=52002 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kfTRi-0003iK-FX; Wed, 18 Nov 2020 11:48:50 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v12 0/4] Introduce Xilinx ZynqMP CAN controller
Date: Wed, 18 Nov 2020 11:48:42 -0800
Message-ID: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63671011-2c2c-4ef0-eb1c-08d88bfaf92b
X-MS-TrafficTypeDiagnostic: SN6PR02MB4702:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4702B7DF8F18298458F906B3BCE10@SN6PR02MB4702.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /LXZSwLQqv+reIfOzUsOyOJJhvMtdT9f7kJfBtPm0OFbFlZ+iy/U//jKfwYMJF/ioICwQeYTJGtD+1m8i7v+m5bMgW6xDwMCebSYGAa5KisOb/yjRs5UwAUzm6RxEC1T//N7fYbovJOZyYGOjYDAKFeeAFS1GcTGtMe7efNx8R6vA4Z/Ydv7mkgjWipPOllmn43jO9VTE37+OHWsrrWMQ8R1FwCd8t2tY9RHzJ68CBZ8UUH1RhOV1CiueDLucvqUIunznSsDut2IaWf6iv3PJQQd1K5MDfIkvA84zJYhyC2PYsUdjt0oLGk5tnpm+JkdJLQ/QYOMk4mvRlr7syxlAMVypmeG03IkDW8rfT/WC75u7rZSr/x4XUoyv4XfwivAbNRXQYslhpnx39x0OQPqQpRbmLeXXrOLMsczsbjpLzM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966005)(356005)(26005)(54906003)(336012)(107886003)(5660300002)(4326008)(83380400001)(9786002)(426003)(316002)(2616005)(7636003)(8676002)(36906005)(36756003)(47076004)(6916009)(6666004)(82740400003)(82310400003)(186003)(7696005)(70586007)(478600001)(8936002)(2906002)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 19:48:51.0776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63671011-2c2c-4ef0-eb1c-08d88bfaf92b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4702
Received-SPF: pass client-ip=40.107.237.85; envelope-from=fnuv@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 15:03:55
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
Cc: francisco.iglesias@xilinx.com, Vikram
 Garhwal <fnu.vikram@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:

v11 -> v12:
    Change/add new trace events with relevant debug info.
    Rename val64 to val wherever appropriate.
    Added new error logs.
    Corrected xlnx_zynqmp_can_receive function checks.

v10 -> v11:
    Resending the series with correct cc.
    Replace DB_PRINTS with trace-events.
    Removed unnecessary local variables.
    Added const with tx/rx buffers in qtest.
    Added reviewed-by tags for qtest.

v9 -> v10:
    Rebase the series with the new meson build system.

v8 -> v9:
    Use g_autofree to do automatic cleanup the object_get_canonical_path() used.

v7 -> v8:
    Change CAN controller to keep one canbus per controller.
    Add canbus connections at machine level.
    Remove ctrl_idx from CAN controller.

v6 -> v7:
    Remove '-m 4G' option from xlnx-can-test. This option causes the fail of
    docker-quick@centos7 build test.

v5 -> v6:
    Add ptimer based counter for time stamping on RX messages.
    Fix reset issues.
    Rebase the patches with master latest changes.
    Added reference clock property for CAN ptimer.

v4 -> v5:
    Add XlnxZynqMPCAN controller id to debug messages.
    Drop parameter errp of object_property_add().
    Add formatting related suggestions.

v3 -> v4:
    Correct formatting issues.

v2 -> v3:
    Rectify the build issue.
    Rearrange the patch order.

v1 -> v2:
    Rename the CAN device state and address code style issues.
    Connect the CAN device to Xlnx-ZCU102 board.
    Add maintainer entry.
    Add QTEST for the CAN device.


Vikram Garhwal (4):
  hw/net/can: Introduce Xilinx ZynqMP CAN controller
  xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
  tests/qtest: Introduce tests for Xilinx ZynqMP CAN controller
  MAINTAINERS: Add maintainer entry for Xilinx ZynqMP CAN controller

 meson.build                      |    1 +
 hw/net/can/trace.h               |    1 +
 include/hw/arm/xlnx-zynqmp.h     |    8 +
 include/hw/net/xlnx-zynqmp-can.h |   78 +++
 hw/arm/xlnx-zcu102.c             |   20 +
 hw/arm/xlnx-zynqmp.c             |   34 ++
 hw/net/can/xlnx-zynqmp-can.c     | 1161 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/xlnx-can-test.c      |  360 ++++++++++++
 MAINTAINERS                      |    8 +
 hw/Kconfig                       |    1 +
 hw/net/can/meson.build           |    1 +
 hw/net/can/trace-events          |    9 +
 tests/qtest/meson.build          |    1 +
 13 files changed, 1683 insertions(+)
 create mode 100644 hw/net/can/trace.h
 create mode 100644 include/hw/net/xlnx-zynqmp-can.h
 create mode 100644 hw/net/can/xlnx-zynqmp-can.c
 create mode 100644 tests/qtest/xlnx-can-test.c
 create mode 100644 hw/net/can/trace-events

--
2.7.4


