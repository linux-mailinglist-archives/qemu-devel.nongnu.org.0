Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DC330FF5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:51:14 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGHx-0005Ev-Jk
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwO-00044V-6G; Mon, 08 Mar 2021 07:24:52 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:40197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwM-0007GY-FX; Mon, 08 Mar 2021 07:24:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4120736D3;
 Mon,  8 Mar 2021 07:24:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=SMc1oqJahwBRv
 syz2yIoz4T/EyM7grwlY9esFcSyMoo=; b=aDSlLQTe9T1qWXo+Wl3fKGL+xHUtO
 Ia/put1CezakFt/hMI0z0oQnJYtH59851CwzTWa9r+0JOwLSItEnVfXZWqCKYrix
 2XaEx+e4MJAo6VMWy2oWfxXmZqJLWacR/pA4jJIuRn1XUdFrrvdrp7Hfg8/WDVGe
 Cw5Br8kWVSw1/G3iZmAcD3B3BvKUrYQplSJONbfcTVAqhAYKd7vtEs/fBltIrqa1
 NDB4yMBUP2yy6QZnxIy/8WeZH4WPOc5pO8WUukxh0g3BrHVr73Gmpk71YmKz13UU
 0sag+mCf18ClZ9CC7qBh8RkXKwfalnC2Y+QmzL+gdfyOzCYrJdl7to1wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=SMc1oqJahwBRvsyz2yIoz4T/EyM7grwlY9esFcSyMoo=; b=b1J/1LBc
 +IrT4I6dFAznK18PoMnwngJ6mEgFntEmBcAev05ZOWG1h0VEuMI0G0qlUPtzZIxL
 UPIGbY8DWgNT7RbcmJRVnRv7uci+K/MClZDShXY/X0ZfG/sDkD2cIILIQWHrfFn3
 6WSBE/eMv+jOOYAV+S8LsJ9KqEwiOUCUYAIG0leAaZkie2tWxQp6hq8AdHEHN954
 Ek3P3Lml+MaXylknUf3zTGwQFMwgdyVAkaGcwlNdBqSeIIjVwzj8wSrF9lJkf9+B
 6FJYq1vbYEIqsOEb6R2LgrXld/5He+cxFW9PYIJ3hBstpf5NumT+nu+RWkoAU/61
 qB3D8CQtWKSV4g==
X-ME-Sender: <xms:bxdGYI4lHOsuxoiMW-JaxNOQr6fxR6LjW1fWfSB0kF1D_SE_uoPmiA>
 <xme:bxdGYJ6tl2_2lflVeg91eh1GhWIMqQQCug_gisQH1Tyt3FC432V3bYG1PnBEQYoGF
 zH8W2jYC8g2EifoDLU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bxdGYHc4mdIG2qt89ExBHFD9j5UKoxiNECD-Vp-rwkVM-xnRzhrM3Q>
 <xmx:bxdGYNJgj9jgIIGKbsd7ZFuB9YNrR0rK2ZVF_1DP7wGnNPPncRuIPA>
 <xmx:bxdGYMKp5J8D0bJHfsop5qGHkC-mraK0GjsMDx0X3DrIkr4t1OyZCg>
 <xmx:bxdGYL8s8xhfDl8rZvz01QcGLtG3bZ0h7k_Sku98T88hhJowOk2MDhaFlqg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 688EC1080067;
 Mon,  8 Mar 2021 07:24:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 38/38] hw/block/nvme: support Identify NS Attached Controller
 List
Date: Mon,  8 Mar 2021 13:23:13 +0100
Message-Id: <20210308122313.286938-39-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
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
index 159cd0ca867b..3e4401128ad8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3329,6 +3329,45 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
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
@@ -3531,6 +3570,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
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


