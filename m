Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E1314D75
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:50:12 +0100 (CET)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qax-0001JX-DE
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9QWR-0007T5-Gp; Tue, 09 Feb 2021 05:45:31 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9QWO-0001Wo-91; Tue, 09 Feb 2021 05:45:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 75AB4D5A;
 Tue,  9 Feb 2021 05:45:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 05:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=lxPwnkdET6TIJ4qQ7aDGz/o1tZ
 12544k9/UnW+iviss=; b=drKvXrMpl4qZ9VnujC0VleMBg6q9b7axT7xRO6ZuC+
 gj+cwEdrET8wfrLIwpsRA0i2sEve+aEG+lUggmWo+/ofsPJR5eEQnf8Oy+gVtzqC
 M8d+/uM60cP+GbuZwvY0dRSUjVpY0YKAvnzsAXPbjW1MF3/mR+ECQwVW64pnG+2G
 +QDrJmNrgaho4DW626Lay0ZSRy1ApLWWpBaYnJv/DvWlXRYRKE3oNnC3dlIHmk37
 X52B1Z6VOy5HvCQZO5mtApiUrB6vUjL43uB/xX+MIYRLIZu8Zu8Ixs0aSP4AX5f8
 t4U61UPUc32iq+3PU4GV9dISjENatqJHiy5Oh25cQe0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lxPwnkdET6TIJ4qQ7
 aDGz/o1tZ12544k9/UnW+iviss=; b=Q3jv1Jp7xS3PcfstkgO/zBKT02pYzMdbB
 dg6AVy2T9AtCiRj8KqPQXjFktNf6EPSEGG7GMQCt7mG1hn8oIpHUohBjvPhqPya4
 XpdkFKkZG+fMr+3tIDBFQv1O4dang0pJPmc+AFpDXcvWT+DQgsEPmATp7DDw5869
 GBiOpnoAOrRlt+2xFwKysWdWBrZ5Vl9eKS89LN2X7Y0OslETCaddqKBAGltzNtIe
 hAcIXyi+9BaGA/L5JBZhXXmx8JuliIuNzeNkCH6sklVh3Dyk6N5qMyu9/bj4nfED
 1i/KcZf+8EPIjrU9EC9TQ+NEx1OHzytLkzuCaVPnR/Op/wAqWDJAg==
X-ME-Sender: <xms:xGciYN50RtMR4KppHb5dFVk-qxRYfafIZaZUGl_I2lK37bhRi9nA-A>
 <xme:xGciYK5SncptM8qcfP3AKjSCgYLHBzjPsFFxnF61dqfF4qF2aIH0Qt35m3QiDlYFE
 26ZJcOGEnopClaw4Is>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheehgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xGciYEfgDLHDEz_fPxhyjCymo16WjX7O7058g69jUJWcP1blpBea2Q>
 <xmx:xGciYGK0Uoxh3r7c_s4Xxbmbm7yJ7NLVHnHSqi6ATljHBR98nnASfQ>
 <xmx:xGciYBKe4o_4kHUBEPOaWxew1iVIEjy5GG5hVWUFKw2hONc-oL-0Bg>
 <xmx:xWciYPiXa-0oaQndvatWEEsqLmDUWa0nQvHZ0S7zpr6DV15Cb13Jog>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A6881080057;
 Tue,  9 Feb 2021 05:45:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block/nvme: use locally assigned QEMU IEEE OUI
Date: Tue,  9 Feb 2021 11:45:20 +0100
Message-Id: <20210209104520.579084-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
the controller to use a Red Hat assigned PCI Device and Vendor ID, but
did not change the IEEE OUI away from the Intel IEEE OUI.

Fix that and use the locally assigned QEMU IEEE OUI instead if the
`use-intel-id` parameter is not explicitly set. Also reverse the Intel
IEEE OUI bytes.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---

v2: drop telemetry and add a check on the use_intel_id parameter.

 hw/block/nvme.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c2f0c88fbf39..870e9d8e1c17 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4685,9 +4685,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cntlid = cpu_to_le16(n->cntlid);
 
     id->rab = 6;
-    id->ieee[0] = 0x00;
-    id->ieee[1] = 0x02;
-    id->ieee[2] = 0xb3;
+
+    if (n->params.use_intel_id) {
+        id->ieee[0] = 0xb3;
+        id->ieee[1] = 0x02;
+        id->ieee[2] = 0x00;
+    } else {
+        id->ieee[0] = 0x00;
+        id->ieee[1] = 0x54;
+        id->ieee[2] = 0x52;
+    }
+
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
-- 
2.30.0


