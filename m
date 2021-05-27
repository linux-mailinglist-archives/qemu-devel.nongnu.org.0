Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F282239348E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:08:13 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJUS-00059R-S8
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haozhong@zhan9.net>)
 id 1lmJTC-0002wh-AV
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:06:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haozhong@zhan9.net>)
 id 1lmJT9-0005X6-8x
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:06:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 409525C00FD;
 Thu, 27 May 2021 13:06:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 May 2021 13:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhan9.net; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=ArafUyBOO0IbbliGHou7RgvFNK
 oK+/JCxXXfof6UKWA=; b=sO8R39X3z2QV3XoODAQlTop9df3au2W4iPWYo/DnNF
 htR9sRM1prsZcOC1+49UKT+M58zUmZn9xhFWaMOLW/tufBKfNuUdSibV259xYXnj
 MW/OXWSG+ysYOWy3kw4prO3V51cUzSmlyATBUpo7wBCcHoXoHIVwuy3e5hd0FYJR
 vm4UeUXFSl5+TG7Lj8ciPyfhgd/4JwQkNU6gMEdxXnJBeo+AJ018aNHRBRRFtZjF
 bEiQCwDeYWKJyGA6fpaAh4KoqiFQ540OgZ3jB6S2tenT3eoHkND6+tIPwsRWqzks
 uH8QUqMTyXzgH1TzjpkFlF9PsblI8nr/dfYGF7vghe+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ArafUyBOO0IbbliGH
 ou7RgvFNKoK+/JCxXXfof6UKWA=; b=myYz1a9yYKd177Rr5qJm48V2GuxfJ6XgQ
 LJ60Irmf0N01PiXoHsT1h4Ake7nrR+JEJMpwPEojh3iKHJ5DrrKUnhJi4DVwC5l+
 uqgjTF9nTdDCUBWUf4QLgJ26SH4pxpWa7pjde02l5pfprcUn8xcQoC5DdI0HpmlR
 PA3Uoj0d5Y5v0rQ4y7j8IDykfLB25p7oQswKxsdpWobxar4ddXc/DaVea0FOAz0B
 1Msp614odCWRCA77f57AAXkRDY7ePeM1Q16BUwF04Npoj/UoWCap01NdmzabWZqv
 mewvB/FFavE3R3wFkOsdWeZ3qlAkCAx6dmO7ZgA4PZ1zdzGaz5wsQ==
X-ME-Sender: <xms:qNGvYIVbK7BJdqxgnYsait91ni4DR7vRdyu7eBuiEc-rDfAN7A3bQQ>
 <xme:qNGvYMmRQfMaMXPxexHQtDHSXhK4JngWlO5IBwSZqLiahzqFn6GRYnoh6ySYzvOS4
 z-Al3vxEf8RynxUeCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefjrghoiihhohhnghcukghhrghnghcuoehhrghoiihhohhnghes
 iihhrghnledrnhgvtheqnecuggftrfgrthhtvghrnheptdejhfejkefhtdegteefleettd
 ekveelfedvteehleeggefhvdefgffhuddttedunecukfhppedutddurddvvdegrdduledv
 rdduudehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 ephhgrohiihhhonhhgseiihhgrnhelrdhnvght
X-ME-Proxy: <xmx:qNGvYMYAkia7FJsUsnfLsSE4vV8Y1t-NEv4I0_iXNS_Pc0Do3LID5Q>
 <xmx:qNGvYHWkR0ixDMjWkGuwAydkgkK0Op6yQcOgZvUd2IE9MGP7cuEnAg>
 <xmx:qNGvYCnoYXIGgwW9PwYMWcMEsonZrIRlB6taX6fBUP8oo3kxoJ1HgQ>
 <xmx:qdGvYHxxiE-hkB6td8uvCINeYbpiwTaHUNB_oPazleCp2YzyK6wzgw>
Received: from localhost (unknown [101.224.192.115])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 13:06:47 -0400 (EDT)
From: Haozhong Zhang <haozhong@zhan9.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] xio3130_downstream: Set the maximum link width and speed
Date: Fri, 28 May 2021 01:06:30 +0800
Message-Id: <20210527170630.43458-1-haozhong@zhan9.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=haozhong@zhan9.net;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Haozhong Zhang <haozhong@zhan9.net>,
 Haozhong Zhang <zhanghaozhong@bytedance.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current implementation leaves 0 in the maximum link width (MLW)
and speed (MLS) fields of the PCI_EXP_LNKCAP register of a xio3130
downstream port device. As a consequence, when that downstream port
negotiates the link width and speed with its downstream device, 0 will
be used and filled in the MLW and MLS fields of the PCI_EXP_LNKSTA
register of that downstream port.

Normally, such 0 MLS and MLW in PCI_EXP_LNKSTA register only make the
guest lspci output looks weird (like "speed unknown" and "x0 width").
However, it also fails the hot-plug of device to the xio3130
downstream port. The guest Linux kernel complains:

    pcieport 0000:01:00.0: pciehp: Slot(0): Cannot train link: status 0x2000

because the pciehp_hpc driver expects a read of valid (non-zero) MLW
from PCI_EXP_LNKSTA register of that downstream port.

This patch addresses the above issue by setting MLW and MLS in
PCI_EXP_LNKCAP of the xio3130 downstream port to values defined in its
data manual, i.e., x1 and 2.5 GT respectively.

Signed-off-by: Haozhong Zhang <zhanghaozhong@bytedance.com>
---
 hw/pci-bridge/xio3130_downstream.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..fbf9868ad7 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -87,6 +87,13 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
         goto err_bridge;
     }
 
+    /*
+     * Following two fields must be set before calling pcie_cap_init() which
+     * will fill them to MLS and MLW of PCI_EXP_LNKCAP register.
+     */
+    s->speed = QEMU_PCI_EXP_LNK_2_5GT;
+    s->width = QEMU_PCI_EXP_LNK_X1;
+
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
                        p->port, errp);
     if (rc < 0) {
-- 
2.31.1


