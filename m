Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CA314B08
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:06:15 +0100 (CET)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OyL-00076T-Mm
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWM-0005oR-Uu; Tue, 09 Feb 2021 02:33:15 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWI-00060P-Un; Tue, 09 Feb 2021 02:33:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BAFF5CB5;
 Tue,  9 Feb 2021 02:32:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=MDlLmwqQgXfbB
 6lJjkEn5ID52fqS8kpZUp5qp6uhoG0=; b=rQewXbKj8fwyFqMYHCSrekdG+/wUA
 +08tyLLAFNjj3mdjOvJhNXoqB6m38F0zM08haYaCYVvXjKX4b7ynlVMEUTKWhQDj
 bbbL4fWn2qRNDiNmmsb1xsiEi+sdZ+K6jjYAcyi/vjRgvLx7KzCAb1fGrYLggPp4
 A+PmT8kpzTSCfv1CejWZJCTqeTswW6p61vVF5z7N4W3sxeGuQwNVqyf6kl/12RDp
 Adm33Xig0C+fZGiPJsYYkRDsel57q0Cc4ufe8n44eIGJ1Q3ghDoxIgnBlldRBbL5
 Kske+rbENdSBdAyXs8SG6LMgujyo5IXa1Z8C1IHJNpux7NXaC1A1ezqIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=MDlLmwqQgXfbB6lJjkEn5ID52fqS8kpZUp5qp6uhoG0=; b=IXs0V8vX
 zklqcxkFTHO3xRA0yWW+B07TcF+O6xrsO/CCYgF0V7KGrwyI3MRPbyzAOcgN0Tzx
 VmtYLW9TZD3xZNgXoeR8FnHvsSvkwOiyaX5We5HkFaSIdcQCGZQWeYeoYTUl3NhX
 gUnAsp1QoxDH0eZbkJNx4DMx0cyaxod40/VHY1OdDVWCGe0nYbil73v3/TaOYRKe
 iGMj93hNgn10mMZDJsXSM/Lgqx2AbeaIWV2gE5BpCBXfu4DuzReqWY1dtwmzbQgc
 LzWUra73wpEEnWLMllru/VI9kVy5fPDXfKNtOP2/angD8C/tSJdo4OAiNv06wZXh
 4YjZe9nhe45+yw==
X-ME-Sender: <xms:mjoiYI9B6CndwNcef515VJs9Ndv566rU69_jT56gy0y1CsrVtZMAKw>
 <xme:mjoiYIJbcKYdPukB8kEfv9v85o8sQX_uMLryFbwTOJKB8WqcxEAQO6VQNgmfoZjBF
 jinukVDJGWqyrNFaEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mjoiYLbKYxw6LctVAQueFCMviTprHAP7zI2DkDR-de8BTHfy-CsXhw>
 <xmx:mjoiYCJXL1uPzopkHmH2aCOM0P3ERhkzqoLTPHw3V3c8C1dq9wfcYg>
 <xmx:mjoiYBAhKpXc0gIUfj57WA1-NHmB01EIh8g1-fKRIliM7i9u8MMfUg>
 <xmx:mjoiYDzO5VpGQAzg5tJZY9_Lr3kUrkS-xpVw7R0lxvrsphceDNdG1XUsZmo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 061C8108005F;
 Tue,  9 Feb 2021 02:32:40 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 51/56] hw/block/nvme: fix set feature for error recovery
Date: Tue,  9 Feb 2021 08:30:56 +0100
Message-Id: <20210209073101.548811-52-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Only enable DULBE if the namespace supports it.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 40784bd908fb..b3d072c8b2bb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3396,7 +3396,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         assert(ns);
-        ns->features.err_rec = dw11;
+        if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat))  {
+            ns->features.err_rec = dw11;
+        }
         break;
     case NVME_VOLATILE_WRITE_CACHE:
         for (i = 1; i <= n->num_namespaces; i++) {
-- 
2.30.0


