Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D03B78B7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:33:24 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJU3-0005q7-T8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInM-00021D-Vt; Tue, 29 Jun 2021 14:49:17 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInL-0005ig-2F; Tue, 29 Jun 2021 14:49:16 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 743FC2B00ABA;
 Tue, 29 Jun 2021 14:48:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 14:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=30X0CChJBg/L0
 ALQpDBGEB/9qT5H4XVa9GL2we+/oYQ=; b=id96I5Mx0Yoc+dLvmwdS6Yuf6rh5e
 DwmNiSZWUuRRiGmgyGm1YYGm+XTiaRw/4WVnzAPH2vMxLXjc4iYjhjdvjg8sPari
 QSi1sp/U9OQGl+R+uD07NgokP8KBD2FAIeJHZmaRIw0DW/rrOjfL2INQEawZktyz
 Y1mzjHg8+quCbTYKq33r6SHl2nfshVWVMxVdjGY89lQAndI5KW6KNpvaVBBWWP1g
 aUNG39hk82kP5H/L8wHoq9g/kg9Y4mDUqajzRa38VxLRek8GyRLA7JtGLsj8YNVn
 bHFrbBzATzg8HrBIw6xcfLnDvAQkauMRhhbxIskUImY9n+/nVtUrJHOJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=30X0CChJBg/L0ALQpDBGEB/9qT5H4XVa9GL2we+/oYQ=; b=NBVI3+XX
 k/+Fa+Y50VqGeEZlgcttHg2DPnFgGAGVRPyveB8BaKXMoMz4Sm80PrQENQ6u6oJa
 KARJmQdkA40RG5Ectj6KycMAc8J+5BGhYq9vdjr9ue8niRNStO1AvEGFIKL2Qlxp
 4DlVUftEfminHaoWGg+4Vg5Te1WW7M9taDteHjNAUHNovaavhuMidb6WqtMrHdLL
 1T+5RD+ie4IbOZy2HKsxlQnNL/mmOxDB7guXXwP7L5/3DoqtIZ5UdTZjaQmoqg/2
 I+GPEqcd3J/C14eXgq9r/ThAvBI5Mvqn4vnus8fnVpybnuT3Qc7jUO0JO7227Fn3
 7bWCVO21+7fwCA==
X-ME-Sender: <xms:FGvbYO5PEYjX8gOSrKDkFd7DBYSlLPYccd6YsuPQsb_XzRvX7nuXWA>
 <xme:FGvbYH74jNhmAYSNFCPYenrL-SXPSAqEfm0OPOMuQUhzZXpCUiw0mIrBJHFEnQpup
 AhHO44gEP00rwv5AP8>
X-ME-Received: <xmr:FGvbYNdZzypEnKe-P8igzaWos0MOvAK2pdIYDtRUhDiXI1C-0yAG0Q70ZkogDb8FKZpY8wXGsEL4jam2vIA8oTHXndA9HiMve5zmru1LMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FGvbYLLWFw4vfuEjROIU0Le2EEVPXbMRxSEXCzabiix-bF_elnKMDg>
 <xmx:FGvbYCIaZu-_yDMECMQOxwaVXwjVzA0C4XMR2hb2dla7L5LhC9NgAA>
 <xmx:FGvbYMxIMr4bZAwi-GuKwG3SMDt6Nba_rtDDdX-UjJrWxgwAK6OQ3g>
 <xmx:FGvbYPB477yfOFwtQ4RBwlTiX4eQEXpSSRiS6MGYCzI8y9hqpzkRFC1XQqY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 18/23] Partially revert "hw/block/nvme: drain namespaces on sq
 deletion"
Date: Tue, 29 Jun 2021 20:47:38 +0200
Message-Id: <20210629184743.230173-19-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This partially reverts commit 98f84f5a4eca5c03e32fff20f246d9b4b96d6422.

Since all "multi aio" commands are now reimplemented to properly track
the nested aiocbs, we can revert the "hack" that was introduced to make
sure all requests we're properly drained upon sq deletion.

The revert is partial since we keep the assert that no outstanding
requests remain on the submission queue after the explicit cancellation.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 3b8c542db6e7..6a0c2cc48422 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3918,7 +3918,6 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     uint16_t qid = le16_to_cpu(c->qid);
-    uint32_t nsid;
 
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
         trace_pci_nvme_err_invalid_del_sq(qid);
@@ -3930,22 +3929,8 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     sq = n->sq[qid];
     while (!QTAILQ_EMPTY(&sq->out_req_list)) {
         r = QTAILQ_FIRST(&sq->out_req_list);
-        if (r->aiocb) {
-            blk_aio_cancel(r->aiocb);
-        }
-    }
-
-    /*
-     * Drain all namespaces if there are still outstanding requests that we
-     * could not cancel explicitly.
-     */
-    if (!QTAILQ_EMPTY(&sq->out_req_list)) {
-        for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
-            NvmeNamespace *ns = nvme_ns(n, nsid);
-            if (ns) {
-                nvme_ns_drain(ns);
-            }
-        }
+        assert(r->aiocb);
+        blk_aio_cancel(r->aiocb);
     }
 
     assert(QTAILQ_EMPTY(&sq->out_req_list));
-- 
2.32.0


