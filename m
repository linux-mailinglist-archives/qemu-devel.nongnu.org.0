Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005033253E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:17:06 +0100 (CET)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbIO-00023K-Un
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao4-0008Vd-87; Tue, 09 Mar 2021 06:45:44 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:54973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao2-0000RX-FW; Tue, 09 Mar 2021 06:45:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1F00C271E;
 Tue,  9 Mar 2021 06:45:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 8kLCTHp85eguY/HHYXJKS5iwHeLIpO34j+MzMyA8bXk=; b=Iao/aCa+rqVpaHX1
 O+X4SaqCCQdUcQVAPwE4oR4HHtySDtxoUkasv6N1ByaUbMXleNuypY2tlaVgbI5S
 sXujf2q/Cs77mOxrcfx/9MqlncBGElSOkMsprjLQMU8qbqCV1dbpW0e/v+5nPHn9
 p+BPwwDG8rqrYTf0IbFARAL9PY7y3XkOsmMH/Ka6rsBVVVxBaT4LX+WgPkHg+yXW
 TMQjeOOzIZ5BP8VNsVJYiKdIoLWhru0zRl7fBo+HjZ2rHNUuNxLvHKLEVBcA/Q22
 6vefI7ZbQoUyddD11l8p5sNVtE1QtoEZSdTAMFMMnSEz2OBuuutKZcDeuUzezGq4
 QAwJDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=8kLCTHp85eguY/HHYXJKS5iwHeLIpO34j+MzMyA8b
 Xk=; b=pQ9S1rlIxMR6jOgbq+ms1YhkgtM4nV/Tph/CHu9lzMO5ZKx7AhDetsdVI
 dRhhJ9E1sPtGKcXr/+7OB7Vmg1YMgpJkKiqnVitrl46YbSmt1s4kIaKOYUMemP4n
 gmfEM7IVNgRiHLY80OcDQrBuvyKjmpAmyaJMKdBd6O5d+25AX/lj5bEIQ/Aye55T
 abDesfD3P4SVehsgq7QIlfqSolT7bXeXMV5RtXi05NtyLZcKVsAO6PBSG21S950A
 IkP9Zi1ZzQiFnXe+nqUoLoop0QmVGAAkRHwPCpwDLqweKiZStL/w9Xdel+orFftC
 rJHaExpeuWgqdWXuK5mLvXNJnOfhQ==
X-ME-Sender: <xms:419HYO3LjubWWRu5FKLQUZ7Ya2kEYigclwCvrGTg9CfYMujblQ2vnA>
 <xme:419HYL_de3D-LzP9ybJw524P5Ic0SCHaSJZYa2sU9ZHxW8lorqExlBrCp-lEKTOzV
 t6zARp-wjKxdxW3iJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:419HYBFQcQ2QQRjNDuSQ737QZVbq6i1-2lLGEZD1A0t4ayN4iRaqKA>
 <xmx:419HYBib2eSaRvQJA4w36qD-M-wdPXgewnvqJV8xBvOE0m3BPVY5Lg>
 <xmx:419HYG8XV_jWX4sMFyBzByaFFQBp5AuPK0Po16xUYkFHyvPxUv5-iA>
 <xmx:419HYLYrHyHcZJtl6BfUX7tPGwIAdJcP3LGA-865Is0LzC4DgHbVL74etxg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3622E24005C;
 Tue,  9 Mar 2021 06:45:38 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 15/38] hw/block/nvme: use locally assigned QEMU IEEE OUI
Date: Tue,  9 Mar 2021 12:44:49 +0100
Message-Id: <20210309114512.536489-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2addaf7c4f70..a54ef34ce5e7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4707,9 +4707,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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
2.30.1


