Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A353D6782
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:32:03 +0200 (CEST)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86KY-0005TM-8t
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868M-0004aZ-9j; Mon, 26 Jul 2021 15:19:26 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868K-0007jU-L7; Mon, 26 Jul 2021 15:19:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE162580411;
 Mon, 26 Jul 2021 15:19:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Jul 2021 15:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kUje2Vxop9TRc
 4Lak53EzA8xgsjr/JN1irVkKwHRT88=; b=brCXLSl6/u0enYPCEoHcXebZvDiwR
 E6horI252NUa1bNZ3naIjuSmk9x4d2UTJXUmTHFdtVNmQrho/ibUJH7CbTVh3wzm
 j1kcR1OYmicxnaFfTAhgWJwQl3/WmbkvCYPDi8HiZK85KBOF5RmuGN6qwIFTsdv+
 lOkgwnr671eD840FY2oxdRxlrPhUf3xOW02zfeLjD/Sba5CH+JtAQFZ6wrDU5zSg
 b8hQm1U3mcbUkZOD0ENCaIjFMKWR9jw7TUrLFwoZtqAOjUPtFy4ynpDpPQyX6WBF
 NfjlpF5jMLRqq5V0IaSL/1EDBlWc/tzVXk5QEgP/L1qi81T0qsup79QPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kUje2Vxop9TRc4Lak53EzA8xgsjr/JN1irVkKwHRT88=; b=MkPpr0wn
 0v8M8LCtQSgQqaRFmJGor/RsLqu6agj6XkYHyrzSi0G+sPQXqe8tP5c21ODU4jkn
 0zeRTHby2sHXWmrkUkA04Stju+kL3653ST9w2BTdKjLXy9jP/OM2L9QaYL3mDPog
 +GUnvh2742EDQewNIKbZ17C/sOhZ2rSlQS3zsuCWiVB+iWVqeAgz8U+43UKxRhsU
 D5LicAT4CAVWe5yHBs25YdOsDnHc+bAUikaFurPgMsEbbbU1Vlz+rtneY874w+bj
 q1LOnU9ZVpGkS2pjKIhGTqV2na2zerHhRn1bIam30a31PMX0WrDlMgLO/h3B8qh+
 aZ4S2DN3TYTfLw==
X-ME-Sender: <xms:uwr_YDHJzolIMm4cX-z1EtNa7hb9_1NGNORq8qTmOZLK_iibXCUvuw>
 <xme:uwr_YAXM77SbvyfPu8G17JlKDFlo9OTuYr-xCXssBsPNh5Bsoz494zlH5868-M3o_
 wwEtdAJNUsdIx3P4SU>
X-ME-Received: <xmr:uwr_YFK0Yt2aK01XOEcagdVU8iCW-WYqDsCMiWVkyaWZBuP877i_srH1QCLWJnYUBw6YWCAX1kMX6-3DV1edKFtncbejMwjG76rRiJ65Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uwr_YBHfg435YYHH1c84MG2cSqTdgT47SWlbsWLLV-x0qE_fd3JbvQ>
 <xmx:uwr_YJUEf1kgmLn36zUwC1EWlg680NYeye4fBXTgSGE4mvRsMcosFA>
 <xmx:uwr_YMNtdSmXNIXm4SH9pBYh7tLJcXbcwOcvZIqV-dAZYsP592u10w>
 <xmx:uwr_YCt9LTMmvxCgvQFsQsDIuwYLHVvPOnMu2HeyMyUEsVl3jg0Yog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:21 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 04/11] hw/nvme: error handling for too many mappings
Date: Mon, 26 Jul 2021 21:18:54 +0200
Message-Id: <20210726191901.4680-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

If the number of PRP/SGL mappings exceed 1024, reads and writes will
fail because of an internal QEMU limitation of max 1024 vectors.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
[k.jensen: changed the error message to be more generic]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 13 +++++++++++++
 hw/nvme/trace-events |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 90e3ee2b70ee..ead7531bde5e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -623,6 +623,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
             return NVME_INVALID_USE_OF_CMB | NVME_DNR;
         }
 
+        if (sg->iov.niov + 1 > IOV_MAX) {
+            goto max_mappings_exceeded;
+        }
+
         if (cmb) {
             return nvme_map_addr_cmb(n, &sg->iov, addr, len);
         } else {
@@ -634,9 +638,18 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
         return NVME_INVALID_USE_OF_CMB | NVME_DNR;
     }
 
+    if (sg->qsg.nsg + 1 > IOV_MAX) {
+        goto max_mappings_exceeded;
+    }
+
     qemu_sglist_add(&sg->qsg, addr, len);
 
     return NVME_SUCCESS;
+
+max_mappings_exceeded:
+    NVME_GUEST_ERR(pci_nvme_ub_too_many_mappings,
+                   "number of mappings exceed 1024");
+    return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
 }
 
 static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index f9a1f14e2638..430eeb395b24 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -199,3 +199,4 @@ pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion qu
 pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
 pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
 pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
+pci_nvme_ub_too_many_mappings(void) "too many prp/sgl mappings"
-- 
2.32.0


