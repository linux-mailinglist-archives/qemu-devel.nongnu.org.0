Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A387A26C242
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:47:44 +0200 (CEST)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIVuZ-0005Z0-LC
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmG-0006OR-Lv
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:09 -0400
Received: from mail-eopbgr680055.outbound.protection.outlook.com
 ([40.107.68.55]:46657 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmC-0006pF-HD
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlfAGAUzQJTVW/IPQAZy7Ll+Wmm5KzRS+wuq5d74o4AojI1+Ac6z5PPRB4WFy2n3+fgeDP5ujthaIQ0CxhHr1NhsINbh1/n4ObMqdNjYTE0TPWVqQtWBPitEM21RrPHc0cP5HQ+zsajoRloJvt8fbTHkyr1PHcnwCweOdeh93REgqwLo5P42iIEj7N+OQMBil1MMiTkAyfZMAsUFRjL5PjC8y41DFKLNhnnkLySA97cUta1pTvF3X7r7yVxHkkBjVLW5SANDWxT/idMPLweUZBcmzIkaI7IPU8SgGKl66oCrwcB6LEEbY2PHaf7TcKUnylAmjwUFCOhi6ZEfeEOpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OabyTJfZNT7yw+eAWBRwavkvMnq3lyEJeAN0FPisZKQ=;
 b=S6EDyOh1Z5OLQ7sRFm83uc78D9LIt68SePn+BuWjdLzYmWe7+9r6hpDQTRecpzhBK5qUMyOwo2W2HNJsVFO9pg6KIbfE1AyP8lT37GFMkmrEi5Ll/ZDli6E/5hpJYRmk0uJq3kWQ2C59QKSOaOztOct0zeHZWTu4rE+ytTFBFTD8O8BXtN4ZFSOJDnQAeP2Dreqv7XGhZ3krkTRwCMs4CfGljIP/VGJ1czDT/Z7Qhuax0w4V7r5UqGBW0jXd35AS/jxSZIiqlyLMkVIj3RhYpV1LMMxM2y6rFAnstsH5r8eVohi8PSHcv9ORJGEj1LFJuROZCy+8dcDAoz7QB/uxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OabyTJfZNT7yw+eAWBRwavkvMnq3lyEJeAN0FPisZKQ=;
 b=I928BJGHk9nnroQ0CbFrNUeY9eJOxTciYfD6Gmz7Yn/30kEmGnReWgXaNkP63iHqs4PmCIlPcwBJ7z1aiTQT95lN0xMaMP3OZB607emLTpIDJZi3Tg0/KJ2LR8kSHfh1DT9o9gHteo1QCasszDtL7K/5lm+CicVwZDRwt7bKCfQ=
Received: from MN2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:208:236::22)
 by BY5PR02MB6660.namprd02.prod.outlook.com (2603:10b6:a03:212::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 11:39:01 +0000
Received: from BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:236:cafe::62) by MN2PR05CA0053.outlook.office365.com
 (2603:10b6:208:236::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Wed, 16 Sep 2020 11:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT022.mail.protection.outlook.com (10.152.77.153) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 11:39:01
 +0000
Received: from [149.199.38.66] (port=45693 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm2-0001bm-6H; Wed, 16 Sep 2020 04:38:54 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm8-0007O2-NN; Wed, 16 Sep 2020 04:39:00 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08GBcxeZ002837; 
 Wed, 16 Sep 2020 04:38:59 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1kIVm7-0007NS-3L; Wed, 16 Sep 2020 04:38:59 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 932E713C0235; Wed, 16 Sep 2020 17:12:42 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?=27Marc-Andr=C3=A9=20Lureau=27?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>
Subject: [PATCH v6 3/7] usb/hcd-xhci: Split pci wrapper for xhci base model
Date: Wed, 16 Sep 2020 17:11:04 +0530
Message-Id: <1600256469-13130-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c98ae7a-09ec-402d-d1b7-08d85a351b6c
X-MS-TrafficTypeDiagnostic: BY5PR02MB6660:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6660544435A53B9FFE91D4F6CA210@BY5PR02MB6660.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9vTW+cPdr85UP9F0RlhGeSOv2SBpwlgTbQ4MfxPR8MUMV2RXOFv6fnek3TY9Dv6RiMqMbMkv2isgWlDMhw5UJNMp8JWPRfTEIybxIt+1mtFtFVg0JEMEoFMVOGGMiBqXOy6gD42fTTHj9PxEcM64jsZxAoWSNQgZMOWyKu3eNLpQYi3PTldmXKE/Qv6nOU9BUg21d45TVM8IyhKdTIl6YmVTJkL/ie91YG2uBcjuOgpGBBTS/qhDvXhet+BCvnhUQYX59CURkGq+GLARphSt6V/6Nse58apq2eVn+SBgmijhp3oRMKeQ02YNH5wuQGkcteAN1PFYlQ51OCPBrD4IKFIW+TI9Nys1T+byGqn/xXaGPVgE7B3/NMxDrneHOadvL+4FZlyyu+fl8JjIxO7GgpqB77ZkjZ893nTUykC5qtYEjk2STSHp2qPjBO8cPDvcKDoi8fcASrsr9hLxWU7epJknDmhjc8tWVQQNDSiPSsVgXq7T3OSSFX5kfrNL1xwmzMT3ztAyd32hzVH8bRWmw==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(346002)(46966005)(316002)(6666004)(478600001)(4326008)(2616005)(8936002)(83380400001)(356005)(54906003)(110136005)(30864003)(70586007)(70206006)(107886003)(6636002)(82310400003)(6266002)(8676002)(47076004)(426003)(26005)(186003)(42186006)(81166007)(36756003)(7416002)(2906002)(5660300002)(82740400003)(336012)(2004002)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 11:39:01.2668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c98ae7a-09ec-402d-d1b7-08d85a351b6c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6660
Received-SPF: pass client-ip=40.107.68.55; envelope-from=saipava@xilinx.com;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 07:39:03
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 qemu-devel@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?=27Philippe=20Mathieu-Daud=C3=A9=27?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch sets the base to use xhci as sysbus model, for which pci
specific hooks are moved to hcd-xhci-pci.c. As a part of this requirment
msi/msix interrupts handling is moved under XHCIPCIState. Made required
changes for qemu-xhci-nec.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

fixup

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/usb/hcd-xhci-nec.c |  18 ++---
 hw/usb/hcd-xhci-pci.c | 188 +++++++++++++++++++++++++++++++++++++++++++--
 hw/usb/hcd-xhci-pci.h |  45 +++++++++++
 hw/usb/hcd-xhci.c     | 205 ++++++++++----------------------------------------
 hw/usb/hcd-xhci.h     |  16 ++--
 5 files changed, 285 insertions(+), 187 deletions(-)
 create mode 100644 hw/usb/hcd-xhci-pci.h

diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index e6a5a22..2efa6fa 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -25,17 +25,17 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 
-#include "hcd-xhci.h"
+#include "hcd-xhci-pci.h"
 
 static Property nec_xhci_properties[] = {
-    DEFINE_PROP_ON_OFF_AUTO("msi", XHCIState, msi, ON_OFF_AUTO_AUTO),
-    DEFINE_PROP_ON_OFF_AUTO("msix", XHCIState, msix, ON_OFF_AUTO_AUTO),
-    DEFINE_PROP_BIT("superspeed-ports-first",
-                    XHCIState, flags, XHCI_FLAG_SS_FIRST, true),
-    DEFINE_PROP_BIT("force-pcie-endcap", XHCIState, flags,
+    DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_ON_OFF_AUTO("msix", XHCIPciState, msix, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_BIT("superspeed-ports-first", XHCIPciState,
+                    xhci.flags, XHCI_FLAG_SS_FIRST, true),
+    DEFINE_PROP_BIT("force-pcie-endcap", XHCIPciState, xhci.flags,
                     XHCI_FLAG_FORCE_PCIE_ENDCAP, false),
-    DEFINE_PROP_UINT32("intrs", XHCIState, numintrs, MAXINTRS),
-    DEFINE_PROP_UINT32("slots", XHCIState, numslots, MAXSLOTS),
+    DEFINE_PROP_UINT32("intrs", XHCIPciState, xhci.numintrs, MAXINTRS),
+    DEFINE_PROP_UINT32("slots", XHCIPciState, xhci.numslots, MAXSLOTS),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -52,7 +52,7 @@ static void nec_xhci_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo nec_xhci_info = {
     .name          = TYPE_NEC_XHCI,
-    .parent        = TYPE_XHCI,
+    .parent        = TYPE_XHCI_PCI,
     .class_init    = nec_xhci_class_init,
 };
 
diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 1562757..15d288c 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -25,12 +25,188 @@
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
-#include "hcd-xhci.h"
+#include "hcd-xhci-pci.h"
 #include "trace.h"
 #include "qapi/error.h"
 
+#define OFF_MSIX_TABLE  0x3000
+#define OFF_MSIX_PBA    0x3800
+
+static void xhci_pci_intr_update(XHCIState *xhci, int n, bool enable)
+{
+    XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
+    PCIDevice *pci_dev = PCI_DEVICE(s);
+
+    if (!msix_enabled(pci_dev)) {
+        return;
+    }
+    if (enable == !!s->msix_used[n]) {
+        return;
+    }
+    if (enable) {
+        trace_usb_xhci_irq_msix_use(n);
+        msix_vector_use(pci_dev, n);
+        s->msix_used[n] = 1;
+    } else {
+        trace_usb_xhci_irq_msix_unuse(n);
+        msix_vector_unuse(pci_dev, n);
+        s->msix_used[n] = 0;
+    }
+}
+
+static void xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
+{
+    XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
+    PCIDevice *pci_dev = PCI_DEVICE(s);
+
+    if (n == 0 &&
+        !(msix_enabled(pci_dev) ||
+         msi_enabled(pci_dev))) {
+        pci_set_irq(pci_dev, level);
+    }
+    if (msix_enabled(pci_dev)) {
+        msix_notify(pci_dev, n);
+        return;
+    }
+
+    if (msi_enabled(pci_dev)) {
+        msi_notify(pci_dev, n);
+        return;
+    }
+}
+
+static void xhci_pci_reset(DeviceState *dev)
+{
+    XHCIPciState *s = XHCI_PCI(dev);
+
+    device_legacy_reset(DEVICE(&s->xhci));
+}
+
+static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
+{
+    int ret;
+    Error *err = NULL;
+    XHCIPciState *s = XHCI_PCI(dev);
+
+    dev->config[PCI_CLASS_PROG] = 0x30;    /* xHCI */
+    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin 1 */
+    dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
+    dev->config[0x60] = 0x30; /* release number */
+
+    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    s->xhci.intr_update = xhci_pci_intr_update;
+    s->xhci.intr_raise = xhci_pci_intr_raise;
+    object_property_set_bool(OBJECT(&s->xhci), "realized", true, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    if (strcmp(object_get_typename(OBJECT(dev)), TYPE_NEC_XHCI) == 0) {
+        s->xhci.nec_quirks = true;
+    }
+
+    if (s->msi != ON_OFF_AUTO_OFF) {
+        ret = msi_init(dev, 0x70, s->xhci.numintrs, true, false, &err);
+        /*
+         * Any error other than -ENOTSUP(board's MSI support is broken)
+         * is a programming error
+         */
+        assert(!ret || ret == -ENOTSUP);
+        if (ret && s->msi == ON_OFF_AUTO_ON) {
+            /* Can't satisfy user's explicit msi=on request, fail */
+            error_append_hint(&err, "You have to use msi=auto (default) or "
+                    "msi=off with this machine type.\n");
+            error_propagate(errp, err);
+            return;
+        }
+        assert(!err || s->msi == ON_OFF_AUTO_AUTO);
+        /* With msi=auto, we fall back to MSI off silently */
+        error_free(err);
+    }
+    pci_register_bar(dev, 0,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     &s->xhci.mem);
+
+    if (pci_bus_is_express(pci_get_bus(dev)) ||
+        xhci_get_flag(&s->xhci, XHCI_FLAG_FORCE_PCIE_ENDCAP)) {
+        ret = pcie_endpoint_cap_init(dev, 0xa0);
+        assert(ret > 0);
+    }
+
+    if (s->msix != ON_OFF_AUTO_OFF) {
+        /* TODO check for errors, and should fail when msix=on */
+        msix_init(dev, s->xhci.numintrs,
+                  &s->xhci.mem, 0, OFF_MSIX_TABLE,
+                  &s->xhci.mem, 0, OFF_MSIX_PBA,
+                  0x90, NULL);
+    }
+    s->xhci.as = pci_get_address_space(dev);
+}
+
+static void usb_xhci_pci_exit(PCIDevice *dev)
+{
+    XHCIPciState *s = XHCI_PCI(dev);
+    /* destroy msix memory region */
+    if (dev->msix_table && dev->msix_pba
+        && dev->msix_entry_used) {
+        msix_uninit(dev, &s->xhci.mem, &s->xhci.mem);
+    }
+}
+
+static const VMStateDescription vmstate_xhci_pci = {
+    .name = "xhci-pci",
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, XHCIPciState),
+        VMSTATE_MSIX(parent_obj, XHCIPciState),
+        VMSTATE_UINT8_ARRAY(msix_used, XHCIPciState, MAXINTRS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xhci_instance_init(Object *obj)
+{
+    XHCIPciState *s = XHCI_PCI(obj);
+    /*
+     * QEMU_PCI_CAP_EXPRESS initialization does not depend on QEMU command
+     * line, therefore, no need to wait to realize like other devices
+     */
+    PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
+    object_initialize_child(obj, "xhci-core", &s->xhci, TYPE_XHCI);
+    qdev_alias_all_properties(DEVICE(&s->xhci), obj);
+}
+
+static void xhci_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset   = xhci_pci_reset;
+    dc->vmsd    = &vmstate_xhci_pci;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+    k->realize      = usb_xhci_pci_realize;
+    k->exit         = usb_xhci_pci_exit;
+    k->class_id     = PCI_CLASS_SERIAL_USB;
+}
+
+static const TypeInfo xhci_pci_info = {
+    .name          = TYPE_XHCI_PCI,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(XHCIPciState),
+    .class_init    = xhci_class_init,
+    .instance_init = xhci_instance_init,
+    .abstract      = true,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    },
+};
+
 static void qemu_xhci_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
@@ -42,10 +218,11 @@ static void qemu_xhci_class_init(ObjectClass *klass, void *data)
 
 static void qemu_xhci_instance_init(Object *obj)
 {
-    XHCIState *xhci = XHCI(obj);
+    XHCIPciState *s = XHCI_PCI(obj);
+    XHCIState *xhci = &s->xhci;
 
-    xhci->msi      = ON_OFF_AUTO_OFF;
-    xhci->msix     = ON_OFF_AUTO_AUTO;
+    s->msi      = ON_OFF_AUTO_OFF;
+    s->msix     = ON_OFF_AUTO_AUTO;
     xhci->numintrs = MAXINTRS;
     xhci->numslots = MAXSLOTS;
     xhci_set_flag(xhci, XHCI_FLAG_SS_FIRST);
@@ -53,13 +230,14 @@ static void qemu_xhci_instance_init(Object *obj)
 
 static const TypeInfo qemu_xhci_info = {
     .name          = TYPE_QEMU_XHCI,
-    .parent        = TYPE_XHCI,
+    .parent        = TYPE_XHCI_PCI,
     .class_init    = qemu_xhci_class_init,
     .instance_init = qemu_xhci_instance_init,
 };
 
 static void xhci_register_types(void)
 {
+    type_register_static(&xhci_pci_info);
     type_register_static(&qemu_xhci_info);
 }
 
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
new file mode 100644
index 0000000..e7c005e
--- /dev/null
+++ b/hw/usb/hcd-xhci-pci.h
@@ -0,0 +1,45 @@
+/*
+ * USB xHCI controller emulation
+ *
+ * Copyright (c) 2011 Securiforest
+ * Date: 2011-05-11 ;  Author: Hector Martin <hector@marcansoft.com>
+ * Based on usb-ohci.c, emulates Renesas NEC USB 3.0
+ * Date: 2020-01-1; Author: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
+ * PCI hooks are moved from XHCIState to XHCIPciState
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_USB_HCD_XHCI_PCI_H
+#define HW_USB_HCD_XHCI_PCI_H
+
+#include "hw/usb.h"
+#include "hcd-xhci.h"
+
+#define TYPE_XHCI_PCI "pci-xhci"
+#define XHCI_PCI(obj) \
+    OBJECT_CHECK(XHCIPciState, (obj), TYPE_XHCI_PCI)
+
+
+typedef struct XHCIPciState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+    XHCIState xhci;
+    OnOffAuto msi;
+    OnOffAuto msix;
+    uint8_t msix_used[MAXINTRS];
+} XHCIPciState;
+
+#endif
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index f927567..6a03edd 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -24,10 +24,7 @@
 #include "qemu/module.h"
 #include "qemu/queue.h"
 #include "migration/vmstate.h"
-#include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
-#include "hw/pci/msi.h"
-#include "hw/pci/msix.h"
 #include "trace.h"
 #include "qapi/error.h"
 
@@ -56,8 +53,6 @@
 #define OFF_OPER        LEN_CAP
 #define OFF_RUNTIME     0x1000
 #define OFF_DOORBELL    0x2000
-#define OFF_MSIX_TABLE  0x3000
-#define OFF_MSIX_PBA    0x3800
 /* must be power of 2 */
 #define LEN_REGS        0x4000
 
@@ -547,54 +542,28 @@ static XHCIPort *xhci_lookup_port(XHCIState *xhci, struct USBPort *uport)
     return &xhci->ports[index];
 }
 
-static void xhci_intx_update(XHCIState *xhci)
+static void xhci_intr_update(XHCIState *xhci, int v)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     int level = 0;
 
-    if (msix_enabled(pci_dev) ||
-        msi_enabled(pci_dev)) {
-        return;
-    }
-
-    if (xhci->intr[0].iman & IMAN_IP &&
-        xhci->intr[0].iman & IMAN_IE &&
-        xhci->usbcmd & USBCMD_INTE) {
-        level = 1;
-    }
-
-    trace_usb_xhci_irq_intx(level);
-    pci_set_irq(pci_dev, level);
-}
-
-static void xhci_msix_update(XHCIState *xhci, int v)
-{
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
-    bool enabled;
-
-    if (!msix_enabled(pci_dev)) {
-        return;
-    }
-
-    enabled = xhci->intr[v].iman & IMAN_IE;
-    if (enabled == xhci->intr[v].msix_used) {
-        return;
+    if (v == 0) {
+        if (xhci->intr[0].iman & IMAN_IP &&
+            xhci->intr[0].iman & IMAN_IE &&
+            xhci->usbcmd & USBCMD_INTE) {
+            level = 1;
+        }
+        if (xhci->intr_raise) {
+            xhci->intr_raise(xhci, 0, level);
+        }
     }
-
-    if (enabled) {
-        trace_usb_xhci_irq_msix_use(v);
-        msix_vector_use(pci_dev, v);
-        xhci->intr[v].msix_used = true;
-    } else {
-        trace_usb_xhci_irq_msix_unuse(v);
-        msix_vector_unuse(pci_dev, v);
-        xhci->intr[v].msix_used = false;
+    if (xhci->intr_update) {
+        xhci->intr_update(xhci, v,
+                     xhci->intr[v].iman & IMAN_IE);
     }
 }
 
 static void xhci_intr_raise(XHCIState *xhci, int v)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     bool pending = (xhci->intr[v].erdp_low & ERDP_EHB);
 
     xhci->intr[v].erdp_low |= ERDP_EHB;
@@ -611,22 +580,8 @@ static void xhci_intr_raise(XHCIState *xhci, int v)
     if (!(xhci->usbcmd & USBCMD_INTE)) {
         return;
     }
-
-    if (msix_enabled(pci_dev)) {
-        trace_usb_xhci_irq_msix(v);
-        msix_notify(pci_dev, v);
-        return;
-    }
-
-    if (msi_enabled(pci_dev)) {
-        trace_usb_xhci_irq_msi(v);
-        msi_notify(pci_dev, v);
-        return;
-    }
-
-    if (v == 0) {
-        trace_usb_xhci_irq_intx(1);
-        pci_irq_assert(pci_dev);
+    if (xhci->intr_raise) {
+        xhci->intr_raise(xhci, v, true);
     }
 }
 
@@ -2717,7 +2672,6 @@ static void xhci_reset(DeviceState *dev)
         xhci->intr[i].erstba_high = 0;
         xhci->intr[i].erdp_low = 0;
         xhci->intr[i].erdp_high = 0;
-        xhci->intr[i].msix_used = 0;
 
         xhci->intr[i].er_ep_idx = 0;
         xhci->intr[i].er_pcs = 1;
@@ -2939,8 +2893,7 @@ static uint64_t xhci_oper_read(void *ptr, hwaddr reg, unsigned size)
 static void xhci_oper_write(void *ptr, hwaddr reg,
                             uint64_t val, unsigned size)
 {
-    XHCIState *xhci = ptr;
-    DeviceState *d = DEVICE(ptr);
+    XHCIState *xhci = XHCI(ptr);
 
     trace_usb_xhci_oper_write(reg, val);
 
@@ -2962,15 +2915,15 @@ static void xhci_oper_write(void *ptr, hwaddr reg,
         xhci->usbcmd = val & 0xc0f;
         xhci_mfwrap_update(xhci);
         if (val & USBCMD_HCRST) {
-            xhci_reset(d);
+            xhci_reset(DEVICE(xhci));
         }
-        xhci_intx_update(xhci);
+        xhci_intr_update(xhci, 0);
         break;
 
     case 0x04: /* USBSTS */
         /* these bits are write-1-to-clear */
         xhci->usbsts &= ~(val & (USBSTS_HSE|USBSTS_EINT|USBSTS_PCD|USBSTS_SRE));
-        xhci_intx_update(xhci);
+        xhci_intr_update(xhci, 0);
         break;
 
     case 0x14: /* DNCTRL */
@@ -3073,10 +3026,7 @@ static void xhci_runtime_write(void *ptr, hwaddr reg,
         }
         intr->iman &= ~IMAN_IE;
         intr->iman |= val & IMAN_IE;
-        if (v == 0) {
-            xhci_intx_update(xhci);
-        }
-        xhci_msix_update(xhci, v);
+        xhci_intr_update(xhci, v);
         break;
     case 0x04: /* IMOD */
         intr->imod = val;
@@ -3321,7 +3271,6 @@ static USBBusOps xhci_bus_ops = {
 
 static void usb_xhci_init(XHCIState *xhci)
 {
-    DeviceState *dev = DEVICE(xhci);
     XHCIPort *port;
     unsigned int i, usbports, speedmask;
 
@@ -3336,7 +3285,7 @@ static void usb_xhci_init(XHCIState *xhci)
     usbports = MAX(xhci->numports_2, xhci->numports_3);
     xhci->numports = xhci->numports_2 + xhci->numports_3;
 
-    usb_bus_new(&xhci->bus, sizeof(xhci->bus), &xhci_bus_ops, dev);
+    usb_bus_new(&xhci->bus, sizeof(xhci->bus), &xhci_bus_ops, xhci->hostOpaque);
 
     for (i = 0; i < usbports; i++) {
         speedmask = 0;
@@ -3376,21 +3325,12 @@ static void usb_xhci_init(XHCIState *xhci)
     }
 }
 
-static void usb_xhci_realize(struct PCIDevice *dev, Error **errp)
+static void usb_xhci_realize(DeviceState *dev, Error **errp)
 {
-    int i, ret;
-    Error *err = NULL;
+    int i;
 
     XHCIState *xhci = XHCI(dev);
 
-    dev->config[PCI_CLASS_PROG] = 0x30;    /* xHCI */
-    dev->config[PCI_INTERRUPT_PIN] = 0x01; /* interrupt pin 1 */
-    dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
-    dev->config[0x60] = 0x30; /* release number */
-
-    if (strcmp(object_get_typename(OBJECT(dev)), TYPE_NEC_XHCI) == 0) {
-        xhci->nec_quirks = true;
-    }
     if (xhci->numintrs > MAXINTRS) {
         xhci->numintrs = MAXINTRS;
     }
@@ -3412,36 +3352,18 @@ static void usb_xhci_realize(struct PCIDevice *dev, Error **errp)
         xhci->max_pstreams_mask = 0;
     }
 
-    if (xhci->msi != ON_OFF_AUTO_OFF) {
-        ret = msi_init(dev, 0x70, xhci->numintrs, true, false, &err);
-        /* Any error other than -ENOTSUP(board's MSI support is broken)
-         * is a programming error */
-        assert(!ret || ret == -ENOTSUP);
-        if (ret && xhci->msi == ON_OFF_AUTO_ON) {
-            /* Can't satisfy user's explicit msi=on request, fail */
-            error_append_hint(&err, "You have to use msi=auto (default) or "
-                    "msi=off with this machine type.\n");
-            error_propagate(errp, err);
-            return;
-        }
-        assert(!err || xhci->msi == ON_OFF_AUTO_AUTO);
-        /* With msi=auto, we fall back to MSI off silently */
-        error_free(err);
-    }
-
     usb_xhci_init(xhci);
-    xhci->as = pci_get_address_space(dev);
     xhci->mfwrap_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, xhci_mfwrap_timer, xhci);
 
-    memory_region_init(&xhci->mem, OBJECT(xhci), "xhci", LEN_REGS);
-    memory_region_init_io(&xhci->mem_cap, OBJECT(xhci), &xhci_cap_ops, xhci,
+    memory_region_init(&xhci->mem, OBJECT(dev), "xhci", LEN_REGS);
+    memory_region_init_io(&xhci->mem_cap, OBJECT(dev), &xhci_cap_ops, xhci,
                           "capabilities", LEN_CAP);
-    memory_region_init_io(&xhci->mem_oper, OBJECT(xhci), &xhci_oper_ops, xhci,
+    memory_region_init_io(&xhci->mem_oper, OBJECT(dev), &xhci_oper_ops, xhci,
                           "operational", 0x400);
-    memory_region_init_io(&xhci->mem_runtime, OBJECT(xhci), &xhci_runtime_ops, xhci,
-                          "runtime", LEN_RUNTIME);
-    memory_region_init_io(&xhci->mem_doorbell, OBJECT(xhci), &xhci_doorbell_ops, xhci,
-                          "doorbell", LEN_DOORBELL);
+    memory_region_init_io(&xhci->mem_runtime, OBJECT(dev), &xhci_runtime_ops,
+                           xhci, "runtime", LEN_RUNTIME);
+    memory_region_init_io(&xhci->mem_doorbell, OBJECT(dev), &xhci_doorbell_ops,
+                           xhci, "doorbell", LEN_DOORBELL);
 
     memory_region_add_subregion(&xhci->mem, 0,            &xhci->mem_cap);
     memory_region_add_subregion(&xhci->mem, OFF_OPER,     &xhci->mem_oper);
@@ -3452,31 +3374,13 @@ static void usb_xhci_realize(struct PCIDevice *dev, Error **errp)
         XHCIPort *port = &xhci->ports[i];
         uint32_t offset = OFF_OPER + 0x400 + 0x10 * i;
         port->xhci = xhci;
-        memory_region_init_io(&port->mem, OBJECT(xhci), &xhci_port_ops, port,
+        memory_region_init_io(&port->mem, OBJECT(dev), &xhci_port_ops, port,
                               port->name, 0x10);
         memory_region_add_subregion(&xhci->mem, offset, &port->mem);
     }
-
-    pci_register_bar(dev, 0,
-                     PCI_BASE_ADDRESS_SPACE_MEMORY|PCI_BASE_ADDRESS_MEM_TYPE_64,
-                     &xhci->mem);
-
-    if (pci_bus_is_express(pci_get_bus(dev)) ||
-        xhci_get_flag(xhci, XHCI_FLAG_FORCE_PCIE_ENDCAP)) {
-        ret = pcie_endpoint_cap_init(dev, 0xa0);
-        assert(ret > 0);
-    }
-
-    if (xhci->msix != ON_OFF_AUTO_OFF) {
-        /* TODO check for errors, and should fail when msix=on */
-        msix_init(dev, xhci->numintrs,
-                  &xhci->mem, 0, OFF_MSIX_TABLE,
-                  &xhci->mem, 0, OFF_MSIX_PBA,
-                  0x90, NULL);
-    }
 }
 
-static void usb_xhci_exit(PCIDevice *dev)
+static void usb_xhci_unrealize(DeviceState *dev)
 {
     int i;
     XHCIState *xhci = XHCI(dev);
@@ -3503,19 +3407,12 @@ static void usb_xhci_exit(PCIDevice *dev)
         memory_region_del_subregion(&xhci->mem, &port->mem);
     }
 
-    /* destroy msix memory region */
-    if (dev->msix_table && dev->msix_pba
-        && dev->msix_entry_used) {
-        msix_uninit(dev, &xhci->mem, &xhci->mem);
-    }
-
     usb_bus_release(&xhci->bus);
 }
 
 static int usb_xhci_post_load(void *opaque, int version_id)
 {
     XHCIState *xhci = opaque;
-    PCIDevice *pci_dev = PCI_DEVICE(xhci);
     XHCISlot *slot;
     XHCIEPContext *epctx;
     dma_addr_t dcbaap, pctx;
@@ -3561,11 +3458,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
     }
 
     for (intr = 0; intr < xhci->numintrs; intr++) {
-        if (xhci->intr[intr].msix_used) {
-            msix_vector_use(pci_dev, intr);
-        } else {
-            msix_vector_unuse(pci_dev, intr);
-        }
+        xhci_intr_update(xhci, intr);
     }
 
     return 0;
@@ -3634,7 +3527,6 @@ static const VMStateDescription vmstate_xhci_intr = {
         VMSTATE_UINT32(erdp_high,     XHCIInterrupter),
 
         /* state */
-        VMSTATE_BOOL(msix_used,       XHCIInterrupter),
         VMSTATE_BOOL(er_pcs,          XHCIInterrupter),
         VMSTATE_UINT64(er_start,      XHCIInterrupter),
         VMSTATE_UINT32(er_size,       XHCIInterrupter),
@@ -3657,9 +3549,6 @@ static const VMStateDescription vmstate_xhci = {
     .version_id = 1,
     .post_load = usb_xhci_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(parent_obj, XHCIState),
-        VMSTATE_MSIX(parent_obj, XHCIState),
-
         VMSTATE_STRUCT_VARRAY_UINT32(ports, XHCIState, numports, 1,
                                      vmstate_xhci_port, XHCIPort),
         VMSTATE_STRUCT_VARRAY_UINT32(slots, XHCIState, numslots, 1,
@@ -3691,42 +3580,28 @@ static Property xhci_properties[] = {
                     XHCI_FLAG_ENABLE_STREAMS, true),
     DEFINE_PROP_UINT32("p2",    XHCIState, numports_2, 4),
     DEFINE_PROP_UINT32("p3",    XHCIState, numports_3, 4),
+    DEFINE_PROP_LINK("host",    XHCIState, hostOpaque, TYPE_DEVICE,
+                     DeviceState *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void xhci_instance_init(Object *obj)
-{
-    /* QEMU_PCI_CAP_EXPRESS initialization does not depend on QEMU command
-     * line, therefore, no need to wait to realize like other devices */
-    PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
-}
-
 static void xhci_class_init(ObjectClass *klass, void *data)
 {
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = usb_xhci_realize;
+    dc->unrealize = usb_xhci_unrealize;
+    dc->reset   = xhci_reset;
     dc->vmsd    = &vmstate_xhci;
     device_class_set_props(dc, xhci_properties);
-    dc->reset   = xhci_reset;
-    set_bit(DEVICE_CATEGORY_USB, dc->categories);
-    k->realize      = usb_xhci_realize;
-    k->exit         = usb_xhci_exit;
-    k->class_id     = PCI_CLASS_SERIAL_USB;
+    dc->user_creatable = false;
 }
 
 static const TypeInfo xhci_info = {
     .name          = TYPE_XHCI,
-    .parent        = TYPE_PCI_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(XHCIState),
     .class_init    = xhci_class_init,
-    .instance_init = xhci_instance_init,
-    .abstract      = true,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_PCIE_DEVICE },
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { }
-    },
 };
 
 static void xhci_register_types(void)
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index dab3424..525291b 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -24,6 +24,7 @@
 #include "qom/object.h"
 
 #include "hw/usb.h"
+#include "sysemu/dma.h"
 
 #define TYPE_XHCI "base-xhci"
 #define TYPE_NEC_XHCI "nec-usb-xhci"
@@ -171,7 +172,7 @@ typedef struct XHCIInterrupter {
     uint32_t erdp_low;
     uint32_t erdp_high;
 
-    bool msix_used, er_pcs;
+    bool er_pcs;
 
     dma_addr_t er_start;
     uint32_t er_size;
@@ -185,10 +186,8 @@ typedef struct XHCIInterrupter {
 
 } XHCIInterrupter;
 
-struct XHCIState {
-    /*< private >*/
-    PCIDevice parent_obj;
-    /*< public >*/
+typedef struct XHCIState {
+    DeviceState parent;
 
     USBBus bus;
     MemoryRegion mem;
@@ -205,8 +204,9 @@ struct XHCIState {
     uint32_t numslots;
     uint32_t flags;
     uint32_t max_pstreams_mask;
-    OnOffAuto msi;
-    OnOffAuto msix;
+    void (*intr_update)(XHCIState *s, int n, bool enable);
+    void (*intr_raise)(XHCIState *s, int n, bool level);
+    DeviceState *hostOpaque;
 
     /* Operational Registers */
     uint32_t usbcmd;
@@ -231,7 +231,7 @@ struct XHCIState {
     XHCIRing cmd_ring;
 
     bool nec_quirks;
-};
+} XHCIState;
 
 bool xhci_get_flag(XHCIState *xhci, enum xhci_flags bit);
 void xhci_set_flag(XHCIState *xhci, enum xhci_flags bit);
-- 
2.7.4


