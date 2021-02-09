Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D056F314A35
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:26:28 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OLr-00007y-QA
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVa-0005Lm-RY; Tue, 09 Feb 2021 02:32:26 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVV-0005hw-CT; Tue, 09 Feb 2021 02:32:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 466A6A57;
 Tue,  9 Feb 2021 02:31:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WCKYPHBwCRGr3
 WgewdLkq3GNAkL1BuQ2xBRlCJphinE=; b=s7UVOoin9CjUq0vTtg3m4Z64CJiwv
 bTfaj8CUwnZm68N+UMs/dHKtQ55pJUyoGDWT2cv3XWKS0V8CKeG2ryG/q3Unf7Yt
 BUKsTa+OEpmx/Dc5OkHlBIi/TdK0fSprnSx09QdWJez3t5W0CE4AV0cervgwWXMG
 V/Q3+POswKSeyNO/EI4IETn+nxjx9nLB3q/p/dCWWDhGcFZO85Z6sE4B+DnCgMwA
 AGOBQuyUCbuAUgPgvw9WZ2c44vHtdHtDCXjLg+hmvtcPkAUWqlWWOuXmQ0BGKw8J
 91XAyB0HNNFv744GmGnwPkFXzuTOMvjGPS5A9R3+kp0/yE3nEHPm/YOSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WCKYPHBwCRGr3WgewdLkq3GNAkL1BuQ2xBRlCJphinE=; b=vLhdOpRh
 OosZ14yqsKDWeSyAjbzKHsY3uskBUiUy9WBDvDEvT+rhcJU8bvhi5vCkyBMy/St1
 xcYt31FfNTpLEeUbbkFj7KJn+gx2eDtbCysXKMQLnLVZYukghoT5Bx8CRRiBIHzg
 rsPeDs5QP14Sfq8/9om5s7YYqseOTraeGTrig5gMPGlU9uXvI0RoQA0suH+Usg6G
 3CJGTraSV1Bo8usbCGKkvu9aFUV55mimk/FFFgzO3rTHICD1dDym0ktMRh4iGERf
 bWVEL7KDRjSWMa94XD8LkGfDtSFp3x/iKej8GByXayx4CU/EdYa9/dS5DvGoOniQ
 4geDFzti9/ETBA==
X-ME-Sender: <xms:bDoiYHeYpGgJ0QHbitotpjqU2zTsmU3GqRot4aKjNWO2XCFvNBg4Uw>
 <xme:bDoiYMTPLL2WLRqSQiI5d9jJSbAtQtAwbnWdzq1xbX5Kng__zrvbPlxy2oc83lRmg
 PJlAsJO4HFBfKMMnqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bDoiYGtM--JNUjxe2NqtynlEQqpcpLI-UoDEbMwycztTXHFN17wJgA>
 <xmx:bDoiYFfJNB0klx2miAirXff7U-qfU5kNhdC7ikrTOoIYHecSlRNynA>
 <xmx:bDoiYIZy0BJU_IM2GFydF5uhoHBOo6Uvj-G6pIckTF8FvOubKodpWQ>
 <xmx:bDoiYP83n0HzHsSjJPTxPJBftSu3E4YFs6pI0ZQuxOfRFeyftrG3v_WItXo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 868E6108005C;
 Tue,  9 Feb 2021 02:31:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/56] hw/block/nvme: fix shutdown/reset logic
Date: Tue,  9 Feb 2021 08:30:27 +0100
Message-Id: <20210209073101.548811-23-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

A shutdown is only about flushing stuff. It is the host that should
delete any queues, so do not perform a reset here.

Also, on shutdown, make sure that the PMR is flushed if in use.

Fixes: 368f4e752cf9 ("hw/block/nvme: Process controller reset and shutdown differently")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b0b7abf3312e..551878338e5d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3419,7 +3419,7 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
-static void nvme_clear_ctrl(NvmeCtrl *n)
+static void nvme_ctrl_reset(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -3453,11 +3453,7 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
-}
 
-static void nvme_ctrl_reset(NvmeCtrl *n)
-{
-    nvme_clear_ctrl(n);
     n->bar.cc = 0;
 }
 
@@ -3466,7 +3462,9 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    nvme_clear_ctrl(n);
+    if (n->pmrdev) {
+        memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+    }
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
@@ -4318,7 +4316,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     NvmeNamespace *ns;
     int i;
 
-    nvme_ctrl_shutdown(n);
+    nvme_ctrl_reset(n);
 
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
-- 
2.30.0


