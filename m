Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06942330EB9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:56:14 +0100 (CET)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFQi-0004UW-TJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvI-0003G0-87; Mon, 08 Mar 2021 07:23:44 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvG-0006zh-Gb; Mon, 08 Mar 2021 07:23:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 50A2F32DE;
 Mon,  8 Mar 2021 07:23:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 KWLSWw1unQaLZVfhZTxzwd/gYYIDMnb4qVZCXnzU42c=; b=CKrMOVTlBa19Z5Kw
 hMo5fRXNQcKWjGtmhTIwAXCMG8PXULe/AtGEYJ77AvfsgAN1vGftRRvlibPUv6MW
 Leu6hD2sdlwQCnMKbCemIgxHXzOJVnDF606rnRyFfWQITyjlUoZEU6C817Oeqmw8
 aLayfGqk8jX9Iiq5YBjQdpw4V1ARnXxfx/E0ZpOWPYM6ME9N0ZQ6+yCjygt64Sgl
 VuhWSrcfUVpESUWi7mjSjfNIBruL4VEKxBQNRrQeA5iWoRDbDS2JZpT6bNBMvXop
 FmcbQxLXOIHYY0I8OUgEGRCYoMgsn7znVtBjE4uLID0o+OsltG8z+TO0z1Zp77sK
 v26sHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=KWLSWw1unQaLZVfhZTxzwd/gYYIDMnb4qVZCXnzU4
 2c=; b=ZU+iFSd6A3KH1cEHlf0zMu9wzlNamaSDpMZ8/tv4EHyT3/CL2PJKq83Qv
 gXN+zCtH0gxl2bJ3rbsqVkmaMmZVg0LQYc0JskS7rR6xqJW9q4CVrECyv+OJWa9L
 FKP9detig+j0KRbx33iwnS0XKp967rq5lAZC5WKUhR899c+rKFong5Yw0UT7KlVs
 QGVv6uu7HFp39Fqs01Ze9QZKl2yEc5fvoPK0h7ODY4PG9+7gB6IVUHGvVW8CZ/qJ
 ranOQ9a79QPBpyRU9tkhkUD+dtwbVNwmBbLt+GquH0VagmHvFVLZmyibuhqRIVNd
 Pp+8PFHDwZkCstr5l2A/A/K0Jbj0A==
X-ME-Sender: <xms:SxdGYL7TkcPOf5zf0yi7C0E8rSSoOSpDxawS7t3spAJnjPe8VNn3-w>
 <xme:SxdGYA74cYizhf8AH598Lj2yNT1P0p-60SHeQZO5HVCtbXHPBjga3TlrwAjQ5vpH7
 D5Qkj1z5w5Ls7px9qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SxdGYCeKq0WthyNTPIfq4ygx_x-Q9SM7i7SJx9netCUq1PBavTBZlA>
 <xmx:SxdGYMJIADtKeY1sXs70s1dZvP7yWXahOwf3TyyPay0JwIvnBTaaEg>
 <xmx:SxdGYPIKmesFdFdvii4I21BRckedn7rzx_ZfvufKwlGGh2SMgYD-Tw>
 <xmx:SxdGYAUeodA9NDVpjnrsr_mIUPNlwMHAUFW2xZF3IVi2cOl5tVfGJMMQPTQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A72A1080063;
 Mon,  8 Mar 2021 07:23:38 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 15/38] hw/block/nvme: use locally assigned QEMU IEEE OUI
Date: Mon,  8 Mar 2021 13:22:50 +0100
Message-Id: <20210308122313.286938-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
index ae7ccf643673..68d80a0b4c37 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4698,9 +4698,17 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
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


