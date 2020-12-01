Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D62C9998
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:36:39 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk19K-0006ig-63
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk179-0005ZI-0P
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:23 -0500
Received: from mail-eopbgr770044.outbound.protection.outlook.com
 ([40.107.77.44]:45283 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kk177-0002zW-7f
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:34:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH4ccY7DvDzWGpUfqrT979MGIggsL55KXTG9vmMVn3L4afBG5bXWF3dGVGgBpDgN8+9X/Q+9EjmyJzVD0E+0GNiZjkv/XczpZKDeKMBhm2FJLQa3x2jfkCP1HcSKYduc82FrQQ2e3EamhPGGOlwOGDg8FCofLf7ZOJMs5X1b3oar3HGHifvk8fSadui5mtMJ/+2reMjmfsyo7iD0Bebn9bmvzLfLRuonFnoI/CYKI2LYhCgu2PW8T3yUOmclGOLGD6Osv9s8uiLRHbUT+gggHGt6ayszPhKQrjDfV1W7ktewOrkG5io+KZKRwRWa14Q2Qg5+ytNz3peAOcCFIIOT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gt50wfwphVBOgdv/f06I+Yxx33K1VlZRwvrt+1F6eE=;
 b=eMVZAg4QEqRWOGuv/mMWNM6qKtcMoFG38XuEWz9oY21kL5XBFKoUYsIxjzt59Wz8FZaIdZEk0BlmiAiiYCOMMl0wwAB8rDy4nfuvZmZl8EBUGv8Da6Ohc3qJlLrEjXaB4NK/UsQcPSCyTUY2pWr/++xP5ukhy6J4sOEAEAUpmNShAjA/tz4n76TGChgDjrFXYCzAeC7ebbKx2ZV4QKII4tkAtAz9ituJf9QMTMd1YqiOQ44ZX96ycH+nmpkG15It3OoZAOHQl+YM2zjLvFF5qvKTufmwdAuysaiu7MDyRAhmGgnMp2E8UyRqb62y/zjlXfaqlkAbCRwSKj6tfgoLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gt50wfwphVBOgdv/f06I+Yxx33K1VlZRwvrt+1F6eE=;
 b=Qwz06Ah7dxrKDKg2+xojmFymgYICkh7ZE1PlaRXmBBI6hresddJq14ndGHNIRk7BVduyaHC5kWlohEXjFWnRhBr/82HpXwwbjIlDoj0fXXnHqhP7N/4z4/Uf+8nKoKoTjl2CFzZdksxKODApnEFUScJ65Gf6iF8ncrH1TV6dJuU=
Received: from DM3PR12CA0102.namprd12.prod.outlook.com (2603:10b6:0:55::22) by
 DM6PR02MB5100.namprd02.prod.outlook.com (2603:10b6:5:47::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Tue, 1 Dec 2020 08:34:15 +0000
Received: from CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::32) by DM3PR12CA0102.outlook.office365.com
 (2603:10b6:0:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 1 Dec 2020 08:34:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT013.mail.protection.outlook.com (10.152.75.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Tue, 1 Dec 2020 08:34:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 1 Dec 2020 00:34:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 1 Dec 2020 00:34:05 -0800
Received: from [10.140.6.35] (port=34282 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kk16r-0000KA-7v; Tue, 01 Dec 2020 00:34:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C24F013C06CA; Tue,  1 Dec 2020 14:08:39 +0530 (IST)
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
Subject: [PATCH v14 0/4] Add Versal usb model
Date: Tue, 1 Dec 2020 14:08:31 +0530
Message-ID: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fcd1193-23b7-4ba2-971f-08d895d3e322
X-MS-TrafficTypeDiagnostic: DM6PR02MB5100:
X-Microsoft-Antispam-PRVS: <DM6PR02MB51004F0928CB1A44C8927366CAF40@DM6PR02MB5100.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rl4MpKHr/qogrZZn8WZsKgGhiAF3jNYjbfcR8k8/wI2kFSaCDWpbmeRualKVtaMu3qLdRrKgX9JBMXVoHuiPY9+Yl7lzUxrqlXYRiKEqRTDdR1J+1LKBtJrwVw/AsJ9cAtjJ6dSd3pM62H4X65fgefP4T50pBo/R2wOw6o6drebi0wj/Awlgh9BYIXWuupeA2gXJvrqD4Kvb9CepOHB0hwvcTT1Viq5CwzZITS4bKVp6b0ev8f/R1Xdd1lnAkhcIQODg1zGMmT2ZFldUHU4U2/aVy18Y71L94uS8JEPNOdNhWnuE1B2veUYVNSlrsPNK1x1Ue0ILt3rpmf0BaewU/qf9RfLl7Zr801QwR4DHFW0YfuRKC+KzOJSTfCJJsM2sruC7WcCrPaVxN6rvUxYfBnf2YfWRmFCgOyCEQTt5KJTb9aEoGsx/bg+FnmHMeJE9
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(186003)(316002)(36906005)(6666004)(26005)(83380400001)(42186006)(2906002)(478600001)(4326008)(6636002)(7636003)(47076004)(110136005)(7416002)(336012)(82740400003)(426003)(2616005)(6266002)(921005)(70206006)(8676002)(356005)(70586007)(36756003)(82310400003)(5660300002)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 08:34:15.3638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcd1193-23b7-4ba2-971f-08d895d3e322
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5100
Received-SPF: pass client-ip=40.107.77.44; envelope-from=saipava@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
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

Sai Pavan Boddu (2):
  usb: Add versal-usb2-ctrl-regs module
  usb: xlnx-usb-subsystem: Add xilinx usb subsystem

Vikram Garhwal (2):
  usb: Add DWC3 model
  arm: xlnx-versal: Connect usb to virt-versal

 hw/arm/xlnx-versal-virt.c                   |  58 +++
 hw/arm/xlnx-versal.c                        |  26 ++
 hw/usb/Kconfig                              |  10 +
 hw/usb/hcd-dwc3.c                           | 677 ++++++++++++++++++++++++++++
 hw/usb/meson.build                          |   3 +
 hw/usb/xlnx-usb-subsystem.c                 |  94 ++++
 hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 ++++++++++
 include/hw/arm/xlnx-versal.h                |   9 +
 include/hw/usb/hcd-dwc3.h                   |  56 +++
 include/hw/usb/xlnx-usb-subsystem.h         |  45 ++
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++
 11 files changed, 1252 insertions(+)
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c
 create mode 100644 include/hw/usb/hcd-dwc3.h
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h
 create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h

-- 
2.7.4


