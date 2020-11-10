Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282432AD036
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 08:04:44 +0100 (CET)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcNhr-0003M6-6p
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 02:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNgZ-0002Vn-Lr
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:03:23 -0500
Received: from mail-bn8nam08on2074.outbound.protection.outlook.com
 ([40.107.100.74]:6497 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kcNgX-0002J9-BK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:03:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq0J73dwQK3HJVGolaNSS/PbhVcqr6StQjbS+huezt/TaJYL6uEa2K2QdUtVjytMXt32eI8cMGYTg+yLZ7vp1zv8uCSNhpSb9ygA2ohtQy4QExT+N4wi6Kzo10EoK141GbDyBH32q4Bf4njHr/3OLns0cCUgdjZFjRFHY2zxgpVLP+29iX0z3/61rlvnyEGqZ7cFJ49DSuprQ3GiVmcvSyHIW7t+6ZV+ooOfq2rKVn7tNylQLLjgvZ/xXGEYWjnS30TCkV0nEBhz5Wb9CnPlHXNYQyl5zQrNtm0vh3zpZ50sMrqdoGn/xOIJWBZtVEqCb54bqt+TMu1J/9n8OJ2Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi1ELPH8IoJD1KhV/SkjiWDL00AeFRiw+RZWPB13MDE=;
 b=SVYB9pnQHOAY4Im9lUpdN7TK8oq0ylOFgwk+hyuS8TkEyWyVnvr3ZZ5VCmuRiFU/MDVMY+cF1nHvVFxKgnVRWSpfdJvOcMvrjHbm7L33JF1ZGcgbQLkXNyhqUQSr103GcZoksAMDEKyu1jna6EiqfMn4go0Zjqwx9Jl/u4rnXK38zy1N/+9DqI8IAH7nwiMzHaKfM6BlOcMZb4E4NR4JD3QkXRFWMfsSSO1wE0TuM+P3NDxzxyEQyMZecVew34fVmTK26wF6abUJUBs6as78sHryCPepfsrnZ/PaU6QSRkzqTKuLPUWF/Js9G0GWYxiKqaCm0aMh3I/5ZvSB9DySpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vi1ELPH8IoJD1KhV/SkjiWDL00AeFRiw+RZWPB13MDE=;
 b=s3p6LPAfsXSXpblJPOK/6cb6tZJ3COHBKfM6XMVOmo2TckO+Wz09xtlqzrNz/Jn9FBD+gXm5Z5tZYyWR5NQ7sE7lmEu/P2DcbP/SlXPOeXa/gN/fD1/SHGyjz2wEmNeiXl7J+WlJqPchtAOy0Mu517GZS2u45JGP1hRPbKXA6tA=
Received: from MN2PR08CA0001.namprd08.prod.outlook.com (2603:10b6:208:239::6)
 by CY4PR02MB2536.namprd02.prod.outlook.com (2603:10b6:903:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 06:48:17 +0000
Received: from BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:239:cafe::e8) by MN2PR08CA0001.outlook.office365.com
 (2603:10b6:208:239::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 06:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT047.mail.protection.outlook.com (10.152.77.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 06:48:15 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 9 Nov 2020 22:48:12 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 9 Nov 2020 22:48:12 -0800
Received: from [10.140.6.35] (port=34650 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kcNRs-0005OK-8d; Mon, 09 Nov 2020 22:48:12 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id BEFFD13C0A18; Tue, 10 Nov 2020 12:23:37 +0530 (IST)
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
Subject: [PATCH v13 0/4] Add Versal usb model
Date: Tue, 10 Nov 2020 12:22:06 +0530
Message-ID: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed2e54a-dccf-4047-c8f3-08d8854499fe
X-MS-TrafficTypeDiagnostic: CY4PR02MB2536:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2536642E2C90D069518DE054CAE90@CY4PR02MB2536.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGzp5XIl6wzLjH9r8lHGy1UYANh9EJB/YM5nfTdOa6vFL4zDGvaywNAnjJw+Q3NaCGAGRnrhjTAd9QwSoXv5GR6qcekQFe+n/WgS2q5OJ0eOYl7sS2X9hp5OAlEVCY+Eh4W1swMelWnXs/fEqGPwOFo5QnS2XmH5/tQ1QZUtDh0YMOl8L6awFkzko+VCCSdvk3gH6RDjKsaFad8R16UpVYuiYBEZ04deAv/ng6H9gnp2IMngVmiQqYy8ssPzOU/WrmEcElHlt7/xJFHdblX/ozJ/OVZK/rsdA+SNiffBgFjPqHLybzWCcwhaqzdzr/ucwJ+UU30TXVKaM4xwAFX2G3n+ZqYYVUqqR7coM/bcPbeqt4NNSMyWuLQKllHq/VM9U1spneDYvJBheDMIOQ1wiuAJg2Xl1kqboS9WIBxuFH7FVm3e2TaKI9xq4Hn3oz6q
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(42186006)(316002)(5660300002)(8936002)(6636002)(4326008)(36756003)(7416002)(8676002)(2906002)(70206006)(82740400003)(6266002)(83380400001)(478600001)(2616005)(110136005)(336012)(26005)(47076004)(7636003)(356005)(426003)(82310400003)(6666004)(70586007)(186003)(102446001)(921003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:48:15.0102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed2e54a-dccf-4047-c8f3-08d8854499fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2536
Received-SPF: pass client-ip=40.107.100.74; envelope-from=saipava@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:03:19
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.249, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This patch series attempts to make 'hcd-xhci' an independent model so it can be used by both pci and system-bus interface.

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



Sai Pavan Boddu (2):
  usb: Add versal-usb2-ctrl-regs module
  usb: xlnx-usb-subsystem: Add xilinx usb subsystem

Vikram Garhwal (2):
  usb: Add DWC3 model
  arm: xlnx-versal: Connect usb to virt-versal

 hw/arm/xlnx-versal-virt.c                   |  58 +++
 hw/arm/xlnx-versal.c                        |  26 ++
 hw/usb/Kconfig                              |   6 +
 hw/usb/hcd-dwc3.c                           | 677 ++++++++++++++++++++++++++++
 hw/usb/meson.build                          |   3 +
 hw/usb/xlnx-usb-subsystem.c                 |  94 ++++
 hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 ++++++++++
 include/hw/arm/xlnx-versal.h                |   9 +
 include/hw/usb/hcd-dwc3.h                   |  56 +++
 include/hw/usb/xlnx-usb-subsystem.h         |  45 ++
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++
 11 files changed, 1248 insertions(+)
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c
 create mode 100644 include/hw/usb/hcd-dwc3.h
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h
 create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h

-- 
2.7.4


