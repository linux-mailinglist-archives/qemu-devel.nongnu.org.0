Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AE332582
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:31:17 +0100 (CET)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbW8-00027w-Hy
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap8-0000n1-SR; Tue, 09 Mar 2021 06:46:50 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:46163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap6-0000rS-J2; Tue, 09 Mar 2021 06:46:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1138FF20;
 Tue,  9 Mar 2021 06:46:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=as7n27gXEjrTF
 YzAdPMUcfCbdShElZaD7+zwuiXYAhE=; b=p4u/7gtKZ8QUazZhKqGvkSmctyAkq
 TsQJy0gXmsVqx17bsk+hEyM0L+xzYPOeGlBs3XSPzOFpIvhrv19y0dEHSKJ21K4l
 lKoA7s1tiY87/x3TM5cc6aUKuVeMcOzzl0R9PFOnC5yXl7uAaz9hf6Mk0aL2d5Vx
 vJI2Ippnzr5wIeY/8AGVU7+7oXLb/MB04LKd8X5FvlYLuN2sHr/4g32Uc5Y0+USr
 tpbB3hsNL4QY1J6xIQrxqB9NN13ZcSHi8idZmtdX6WWYQczkkpI4vlpDIM+5ibz+
 tLcKZrvmdP1pIvxypmxb338NovL2eeIFMg0x1GfsZyc2c+1fhBi/2D8qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=as7n27gXEjrTFYzAdPMUcfCbdShElZaD7+zwuiXYAhE=; b=GWo51YYf
 +C14oAoT/yJX20PHhxi0b6/hXJKP0ju3bp3ytfk2J03hBU9wTrGIoAenL5cb0jMO
 Cjjrv8rGBmLxg2BcV7ws29363FnkIXBZQJ/6LfzgZ5qAjXuu1xMs8jOQhrF3NNl5
 U9Uiit6M6/ValCtdGBAakrEzVUNC4MIdkgiiqkOU13FUWXpTAMKtIsACZk7yKfPP
 vfxi9na++TGrU8NNGSj50ROVQ59/FwkXs9uHDPqRK8fRc7mPJz9UcELi1d+ePGJv
 U7bhMSWhpb3cFw3KsHJYekjQ1KuWN/KMOm2up7uEpeNz4t35gFEIGyYhsgnzPUYY
 NHRZ7qjSAvtQnQ==
X-ME-Sender: <xms:B2BHYC1BBQObDR8Flb_K_s1O7undTDzh5xYyO-4L9vScCbQe1ntERw>
 <xme:B2BHYFFKPWWUbd4Nf87mqw_4katWMf9pJ4-1hkWz9h34flX2YG3jFi8n55wQlXL4G
 dH-YWcDKjyrmCiHIJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:B2BHYK7C6eMt7FKK_485j-kXGhQopuuTWW5HKnvbnzPBXtm5y8sE6g>
 <xmx:B2BHYD2ku7A5lMaefA_sw3x4rDbV3Aamf8yPg5_SEFuJfX4UK0ILWQ>
 <xmx:B2BHYFGA81_ynaLK7e-LyT1NosX0twySPK-1SSOkikXH6f_t9c7KNQ>
 <xmx:B2BHYLayZmD7cQy0BtOIWxCJaWk_vfW0_3oE93IbO6azvZOXHBc0BErQroQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B6E824005D;
 Tue,  9 Mar 2021 06:46:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 38/38] hw/block/nvme: support Identify NS Attached
 Controller List
Date: Tue,  9 Mar 2021 12:45:12 +0100
Message-Id: <20210309114512.536489-39-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Support Identify command for Namespace attached controller list.  This
command handler will traverse the controller instances in the given
subsystem to figure out whether the specified nsid is attached to the
controllers or not.

The 4096bytes Identify data will return with the first entry (16bits)
indicating the number of the controller id entries.  So, the data can
hold up to 2047 entries for the controller ids.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
[k.jensen: rebased for dma refactor]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h  |  1 +
 hw/block/nvme.c       | 41 +++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  1 +
 3 files changed, 43 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 7ee887022aef..372d0f2799fb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -971,6 +971,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
+    NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cf0bb508aa80..d439e44db839 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3338,6 +3338,45 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
+static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint16_t min_id = le16_to_cpu(c->ctrlid);
+    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
+    uint16_t *ids = &list[1];
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    int cntlid, nr_ids = 0;
+
+    trace_pci_nvme_identify_ns_attached_list(min_id);
+
+    if (c->nsid == NVME_NSID_BROADCAST) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ns = nvme_subsys_ns(n->subsys, c->nsid);
+    if (!ns) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (!ctrl) {
+            continue;
+        }
+
+        if (!nvme_ns_is_attached(ctrl, ns)) {
+            continue;
+        }
+
+        ids[nr_ids++] = cntlid;
+    }
+
+    list[0] = nr_ids;
+
+    return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
         bool active)
 {
@@ -3540,6 +3579,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
+    case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
+        return nvme_identify_ns_attached_list(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c5dba935a0c1..ef06d2ea7470 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -66,6 +66,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
-- 
2.30.1


