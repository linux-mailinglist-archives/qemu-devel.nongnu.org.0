Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7B62CDEB5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:24:05 +0100 (CET)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuCy-0001Sc-4l
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7b-0006Dd-Eq
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:31 -0500
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com
 ([40.107.94.79]:19169 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7Z-0008Hu-MW
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5FT/BlqVxOc1ucC1x/fqruV/RQfb6PBzcs/adhl4yiLWYJZEtUY+darwzVg+yca8wsB2hU8khIeB/DgHyLFTZSETEawSmH4cOZsp+0I1fwmPhP31SlcbQd5tcIyfEISLPCixD15b3cp9Hoi4C6fgy9Saz7Ruavcf4JD17EtUhGvpg3EEY4UUJmO2VKK9gPRMgGDpB+FTvcblaWvi0WxdyvuJqdtT6emGPYtGen2uZXTRPnIVp7gCcWyQ5Zy36JojDAlSQeb6wlv7QQvbllAt3vzeQAbvPbE+SIWcw+6++WJq4kUk08cRtv5mfcAD7GlBe/AlinjvwkT0nzxyQcFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id5tUQ2ofzA7sX6uxyfw3MYMGVzyfOOETyQ4UdzwtE0=;
 b=HkvF5+9YgRDvwk7D/YWLS+Pl38lTDdhPpMdPrerkpYGSFhtHI1s3EMdOQYzO71/7vUj4o1g9mPlAV+7AYuTmQRX7c5fcuELd6lr/+a+eSBjWU9B+KdKz6iFtlTPF8T0uFzgZKzrDLL/o6hjf5MbrxVV2O8H7d8DvzrEBvjIbnk6Jz4/P3T/EHVMsZ8C+20nTwCr3lduMeVVbEQE4K+Q/D1YlOuQhfHDSDNOJd87NnNGTEZEkP5lhyXlZYV43+oX7eGTlFyZoRYxVoSbttlxt3OE+hoPPxwIzIq3QBLIvOIKR1bWFNZntVbpdT3XcVn0oYtyy+hoXP5SekS0mnBEDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id5tUQ2ofzA7sX6uxyfw3MYMGVzyfOOETyQ4UdzwtE0=;
 b=T68Du9oW+GHk64ZJHm8FvYSLQ/1vHeV7pcvQoIrVYHmBx3o4mqiFczxKQFuRT1My52VcI/2cIYZYjcNuRLnobvtAvfWHzWPUBYacT1oOKz8A9q09p9qElQhuR9Kp8pGFbeiQny6WfMQMKSv1z4Z/ZavTVJHQEL4Pno44bfeV1DQ=
Received: from CY4PR22CA0073.namprd22.prod.outlook.com (2603:10b6:903:ad::11)
 by CY4PR02MB3221.namprd02.prod.outlook.com (2603:10b6:910:7d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 19:18:24 +0000
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ad:cafe::33) by CY4PR22CA0073.outlook.office365.com
 (2603:10b6:903:ad::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 19:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Thu, 3 Dec 2020 19:18:24 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 11:18:23 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 11:18:23 -0800
Received: from [10.140.6.35] (port=54960 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kku7S-0006gu-Rt; Thu, 03 Dec 2020 11:18:23 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 9F3FE13C0138; Fri,  4 Dec 2020 00:52:51 +0530 (IST)
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
Subject: [PATCH v15 0/4] Add Versal usb model
Date: Fri, 4 Dec 2020 00:52:33 +0530
Message-ID: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efb5ca8-031b-498a-5a18-08d897c03492
X-MS-TrafficTypeDiagnostic: CY4PR02MB3221:
X-Microsoft-Antispam-PRVS: <CY4PR02MB322151E5D80C4287CAD01839CAF20@CY4PR02MB3221.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVKYWwizt4VAedSrpKc0I3RLkAnvN7Ic/WZ+fIMXGBwZETGJtbLq1xPWU5+iHxByPHMp9hfEw/Eq2UC+S+t8sf2WukfIs0fDFjYWfZ9MUtETJFM+sbGSkkowF5hFzBLgiJ1XDyvQ0jemk+HAU414nz5uSlKbSCpNh+z0xi6s2HhrvcOrTBYAwu168zkN1cyWmtjRzyZyxP94cdf+YJb/PpwULmsnJ3eOFn/exyjZc7KxD3ifKl9UYSxE6EqePBNN4KKpdrf8TD4rJGsA+0vjgDHWXBdSZRHrKHwEUDOlug84Blqk59802FaOfjBImecAevVzOsfKeMVYqNUE/DJXSUUOLKYpz2wgI0ss4e4xq6bAdAdFgqdxAaqoIexhICjbJOYhFVrqsUT6+OFd6b42tMXVPHIg1rY3/Q8LtY98KQzue7B8es6O6YzVrJrE1kGe
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(6266002)(36906005)(82310400003)(36756003)(7416002)(83380400001)(42186006)(70586007)(70206006)(478600001)(8676002)(8936002)(110136005)(5660300002)(356005)(26005)(7636003)(4326008)(316002)(2906002)(186003)(6636002)(426003)(47076004)(6666004)(2616005)(336012)(82740400003)(921005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 19:18:24.3107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efb5ca8-031b-498a-5a18-08d897c03492
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3221
Received-SPF: pass client-ip=40.107.94.79; envelope-from=saipava@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) AC_FROM_MANY_DOTS=2.999, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds dwc3 usb controller to versal SOC.

Changes for V2:
    Make XHCIState non-qom
    Use container_of functions for retriving pci device instance
    Initialize the AddressSpace pointer in PATCH 1/3 itself Changes for V3:
    Convert XHCIState to TYPE_DEVICE and register as a child of XHCIPciState.
Changes for V4:
    Add DWC3 usb controller
    Add versal, usb2-reg module
    Connect sysbus xhci to versal virt board Changes for V5:
    Add extra info about dwc3 and usb2_regs devices in commit messages
    Use only one irq for versal usb controller
    Mark the unimplemented registers in dwc3 controller
    Rebase the patches over master.
    Move few mispalced contents from patch 2/7 to 3/7.
    Fix the author names in the header.
    Move the inclusion of "sysemu/dma.h" from patch 1/7 to 3/7 Changes for V6:
    Fixed style issue in patch 7/7
    Renamed usb2_reg model to VersalUsb2CtrlReg
    Fixed author in headers
Changes for V7:
    Create a usb structure to keep things clean
    Remove the repeated patch in the series i.e 5/7 Changes for V8:
    Fix vmstate sturcts to support cross version migration.
Changes for V9:
    Added recommended changes to fix vmstate migration.
    Fixed commit message on 3/7.
Changes for V10:
    use vmstate_post_load avaialble in VMStateDescription
    tested vmstate cross migration.
Changes for V11:
    Removed the patches which got accepted
    Changed object name "USB2Reg" -> "ctrl"
    Updated Subject line on cover letter.
Changes for V12:
    Use reset class for usb2-ctrl-regs module
    Move the few register update to realize
    Marked registers which are unimplemented in regapi model
Changs for V13:
    Add usb subsystem for xilinx devices,
    Memory Map xhci internally to dwc3 device,
    Add respective changes to connect VersalUsb2 subsystem to xilinx-versal.
Changes for V14:
    Fix "make check" failures, by specifing right dependencies in Kconfig for
    usb_dwc3 device.
Changes for V15:
    Fixed commit message in Patch 4/4, and addressed code style issues.
    In VersalDWC3 model added vmstate struct.

Sai Pavan Boddu (2):
  usb: Add versal-usb2-ctrl-regs module
  usb: xlnx-usb-subsystem: Add xilinx usb subsystem

Vikram Garhwal (2):
  usb: Add DWC3 model
  arm: xlnx-versal: Connect usb to virt-versal

 hw/arm/xlnx-versal-virt.c                   |  55 +++
 hw/arm/xlnx-versal.c                        |  26 ++
 hw/usb/Kconfig                              |  10 +
 hw/usb/hcd-dwc3.c                           | 689 ++++++++++++++++++++++++++++
 hw/usb/meson.build                          |   3 +
 hw/usb/xlnx-usb-subsystem.c                 |  94 ++++
 hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 +++++++++
 include/hw/arm/xlnx-versal.h                |   9 +
 include/hw/usb/hcd-dwc3.h                   |  55 +++
 include/hw/usb/xlnx-usb-subsystem.h         |  45 ++
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++
 11 files changed, 1260 insertions(+)
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c
 create mode 100644 include/hw/usb/hcd-dwc3.h
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h
 create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h

-- 
2.7.4


