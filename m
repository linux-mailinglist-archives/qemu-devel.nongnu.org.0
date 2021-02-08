Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BC313E32
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:56:54 +0100 (CET)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BiN-0004p0-9K
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97Fd-0007Gw-UG; Mon, 08 Feb 2021 09:10:55 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97FG-0004Mu-Th; Mon, 08 Feb 2021 09:10:43 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6FAE077A;
 Mon,  8 Feb 2021 09:10:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 08 Feb 2021 09:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=W954tiRCw9pM1
 PT1Dy+UJjO/MbMtxPrIqixuCSP63EU=; b=pC+af+COyROlG6wC/IVEjdC8Vlxx0
 6GLbX/ciDati5XGSHbsT+F5mU7gJOGjGDjAh9dgRZcaKHr8KrC5ofCtzhuGzPZiS
 KIUtdjPJRSTp/cVzhnGZ5vRElVroo1ncalskSYrPmDZJf4va7ITB0FxuRsOkC60Q
 e/zgZckhpkZ/HCmty4d3Nn/raHXJCIXs5zXNuqnHUKyl8CcWiTM+/DdGJ1EwMyY8
 5XZEC9WprpUFxWNamwCDwShWS/kOmiA8axlwdCk2MvPFTWu1V8rACU5isToKg2vm
 unUTfBSPd2WSrpa8ay/mMxAiGFsNjj1H481HqRkaVj8w0EtiHMAuBmZUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=W954tiRCw9pM1PT1Dy+UJjO/MbMtxPrIqixuCSP63EU=; b=GkDroK0L
 MTQ/2uQe/kpUvklDey2PKEGePmjmxhe+0iZjtBdAUOihfq5ckNm8aW1PrsCKdkrF
 P2BfKq0V/QgO0NUCEUsvY2X2ZQ5XW4Bq9hsdc3HiGWRwBrKMwFViEsKVC9aqy69c
 lC8uXcxna/nXTb3O7Bd1thk/qNsxSlqQkH/rUKNCx/Mqq4WbzoNd9VNksjpzE/T1
 XnBo9ZjIrD5O/xn8nKn7hDYsU497vNaMw+GdRtSzL6tnmdRvoiRXFzavsU2jKVPz
 BOJS0gGUU5ly/d4RKEU34ytvKYVBwBsmydCcHQhtIJx3kn8P8rnKM7UOYc+4Pe2O
 Nzb3Tk3T4I+jOQ==
X-ME-Sender: <xms:SkYhYJQWdvIgC45weW6hbHKXTUutoc03uQTsqSg11bIgABDa4QiW9w>
 <xme:SkYhYCsWduWfiGs-GHeH991U76G4gwxI3ltqLek4uSGzuCLOOPblXEXlryiCGmmq1
 wQZUcLg6ERKYNpidlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SkYhYLsH-yX_nRrkCl-rwomEZmeGq1qvoZ3UtXesN_7GG9JxN9xPeA>
 <xmx:SkYhYIw548DwzzSlwt_gJUnDIeb_AC9Qa16rdbTN1gsi_HyvPX7A7w>
 <xmx:SkYhYBhSgsoOSn3EfX2HXh4F7xAS9Rl6SfOvH7MI16fwx6xqviFr5Q>
 <xmx:S0YhYF1GmLxqaBV-mNB10JJTnQL1x8QThlUjbP1MGad1PuhWt4NVqA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D04B1240057;
 Mon,  8 Feb 2021 09:10:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: use locally assigned QEMU IEEE OUI
Date: Mon,  8 Feb 2021 15:10:11 +0100
Message-Id: <20210208141012.377500-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208141012.377500-1-its@irrelevant.dk>
References: <20210208141012.377500-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Commit 6eb7a071292a ("hw/block/nvme: change controller pci id") changed
the controller to use a Red Hat assigned PCI Device and Vendor ID, but
did not change the IEEE OUI away from the Intel IEEE OUI.

Fix that and use the locally assigned QEMU IEEE OUI instead.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c2f0c88fbf39..547a3073ef1b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4686,8 +4686,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->rab = 6;
     id->ieee[0] = 0x00;
-    id->ieee[1] = 0x02;
-    id->ieee[2] = 0xb3;
+    id->ieee[1] = 0x54;
+    id->ieee[2] = 0x52;
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
-- 
2.30.0


