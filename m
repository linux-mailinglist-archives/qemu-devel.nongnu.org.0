Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60771355D8C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:03:33 +0200 (CEST)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsrE-0004UB-9y
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsb4-0002E3-Bi; Tue, 06 Apr 2021 16:46:51 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:55017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsaz-0001aJ-F7; Tue, 06 Apr 2021 16:46:50 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 3208B1429;
 Tue,  6 Apr 2021 16:46:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 06 Apr 2021 16:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=xDUhosuBbLDU0
 K1B3DBX8t/+krTqG5VpGGmDeVQV7Bg=; b=pyj32/Fr26JAMtDLXAqTOjNpqC8g9
 RCrWqaC0KBZ0avUYoEqAwugOe44VZm5v4onEDDf73of+dmSGSCIiB0XUfq49TEf6
 1S4HShCPpXumIfxDf5IUL3RWIoABeDbJsllkbdDcYve4SxdTW6sLkvm+ZtBJCjBh
 nq6RhyOh1WoZtBSBuETNH5ITt0dtu6VReRfH90x7helGXkHdNyTTG3UQ0QMlyt7Y
 WQu4CzNbYfui3dtBsSb6N545kTM9VNBxu6sibDUWi/7aVUP8OHxseZ+MA+Yp4ki2
 fo0mHyhoo7msppFuvu76pM/tfpAH5rkjri0MkC9BOgsRUsaR6X+F4p/Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=xDUhosuBbLDU0K1B3DBX8t/+krTqG5VpGGmDeVQV7Bg=; b=wxzfWl5K
 E/XDJtGwJPowdK5gdZrP/qDnGLeiv4yhsj3vZOIxK3KP7o3nJ/xXjpc6qfw1ISqF
 qzu3pA43k7Qzk6CwJsgZy/R0zP2nZN/E55TyKrzAEXDZ/vStnmpSKZTOtDtZ3FXM
 egwL83KZk2SeBXyFFepZmUdR8exIebFwQMIIeE7tWhx5YRvBSljcvUFPqsCPSyrm
 bsgihv2mUn13ZeTLTDimLIu+tqqpRCBihe7P3l1tL0AbHrDL+Bwuuym4WirN4o5b
 E3kcmVF36rmSZ3oHVQNuy22wC5p7IORz54fZKmXO+iL73BfnRdRb/w4EyYUajnqn
 nSTDGGTCS/T9jg==
X-ME-Sender: <xms:r8hsYB7aEjCF_rzkTUboIzI8gF2DIs2elwJt-FP0XwXJ1_4c1Zdp6g>
 <xme:r8hsYO1TG-i6MToWa6k0Hg2tVnIWRaBDQdHsUNCLx0nHPVwzAMAEHYNR0G48DOw5h
 rKmdSbHtzI3UrrGkJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:r8hsYFWfquZ10oB6ajHg2lr5R6NXs9y2KJopcaUhCKr_J8OUHwqcLw>
 <xmx:r8hsYB4i09u02mPrmWet5q_OcdOhQ6AI8T8Ps-DbskFtoP-R1s8zfA>
 <xmx:r8hsYEKEM9D3viKrNBh0q53Fa04biICFIVZSVXnggVAYhjqWQc9eVQ>
 <xmx:r8hsYIRDQMv4iB7Q1HjyCsD2esk3Zy16E6J8FzbiKXsHq-3LMDo7pfwCXYI>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CDA5D240057;
 Tue,  6 Apr 2021 16:46:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 5/7] hw/block/nvme: update dmsrl limit on namespace
 detachment
Date: Tue,  6 Apr 2021 22:46:25 +0200
Message-Id: <20210406204627.140812-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406204627.140812-1-its@irrelevant.dk>
References: <20210406204627.140812-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Non-MDTS DMSRL limit must be recomputed when namespaces are
detached.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 09c38fb35e0d..0898ece2af31 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4868,6 +4868,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static void nvme_update_dmrsl(NvmeCtrl *n)
+{
+    int nsid;
+
+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+        NvmeNamespace *ns = nvme_ns(n, nsid);
+        if (!ns) {
+            continue;
+        }
+
+        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+    }
+}
+
 static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
@@ -4917,6 +4932,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_ns_detach(ctrl, ns);
+
+            nvme_update_dmrsl(ctrl);
         }
 
         /*
-- 
2.31.1


