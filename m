Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E243339DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:24:14 +0100 (CET)
Received: from localhost ([::1]:37236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw0j-0001D7-5y
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXc-0007du-VE; Wed, 10 Mar 2021 04:54:10 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXZ-0005BV-HV; Wed, 10 Mar 2021 04:54:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A42FC5C015E;
 Wed, 10 Mar 2021 04:54:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iiQ3j5MVSR5dy
 QoDIgkU+ZqGjuZ/Ry0mGvlFqMZammw=; b=PqwBmHJf679Rov7xq8CDj2aSyfTgK
 N6Ge5mn+HdV8xFm/1kB/fS+YBd6SP9CdfuR3mGoXAIlmfCUZha+OZhZAkdBcx8xh
 9juSlvZey2Linm/tcOg44WhpN3hlK+lGnRa2E49hCj1YE/iu9hKgtAHhvnKyY4TV
 1gyo0Q3ZsW8o2E/Y//hzaYCdkJ61fQA/FVKsS9TrrNSvjCKTFeMwM59W67C/n5ey
 L54dXIO2oPSUslvwAqSdMpIwjgiVFKQYb8FBDHutdANGLCpnqK0pNz0R2TVadJ7e
 Ln/GOP8cpeSMoLOPM1cCnHM1spmP2UAcS4Km39UKzPp7DpR67qIGhRdFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iiQ3j5MVSR5dyQoDIgkU+ZqGjuZ/Ry0mGvlFqMZammw=; b=NVxLGrQO
 Ux7SFp/NHHXCi9EjEoJnpzOySbhr5dJPHyFm/QbAeXZhjDtxUVrncgnCMM+X//CH
 ybLPb0YkFh9haYefE51suVjdNCQWUqxXPpHidaX3pbhuLgaixCSK2xNCO4yK38WY
 lWoCthpw7b/i5QU7vvOcVU4bObftLwtuRLLxQ8B4ZwS3cUkyEVq2v7M+WvygLdYd
 HlSx/HYcKNn1Hmxq4gwSLkU+ZrEXB6YVlO54XIUqN0p4k3MUpuF9HA3HTvlhxQv/
 3ZvHvHsh5p3wzWw/wcW0FiBs1c47R4WWH+71zCDDt10cv6goq4u3lu3o9+WVdcUB
 yP3L9afCw+CvMQ==
X-ME-Sender: <xms:PJdIYDx9lVgIDGzyKsdFCJ5nGzD4A4XL6UrA5tagoFulNWBhHBWikQ>
 <xme:PJdIYLRWcMnrgW7TBEgPB7sikDvBvA9cjLpq4gJ7LCJtw-Nj2VBuZwDRNBpVpTqOH
 b5tPDKTyVlgCb6EPgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PJdIYNX6CrB6kMJ5y_vkYnSnDmiBpvDPsxW2xYQaiZtm5SwPrdnWaA>
 <xmx:PJdIYNiWRwl1ECp0Wy_S1T605WaT8v2EPEYJAXQ9V1nB50QsgpLMjw>
 <xmx:PJdIYFAOZeA43T7CCKJXendX36BI5qth0pTotPMe8ioAj68NnjsCSA>
 <xmx:PJdIYPD1LMKgFFu7wQYIBUMpZV381cyaZxCLaHpFWu7bB2H8kKWDSg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4204F24005A;
 Wed, 10 Mar 2021 04:54:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/13] hw/block/nvme: parameterize nvme_ns_nlbas
Date: Wed, 10 Mar 2021 10:53:43 +0100
Message-Id: <20210310095347.682395-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Provide a more flexible nlbas helper.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 07e16880801d..34f9474a1cd1 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -136,12 +136,18 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
 }
 
 /* calculate the number of LBAs that the namespace can accomodate */
+static inline uint64_t __nvme_nlbas(size_t size, uint8_t lbads, uint16_t ms)
+{
+    if (ms) {
+        return size / ((1 << lbads) + ms);
+    }
+
+    return size >> lbads;
+}
+
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
-    if (nvme_msize(ns)) {
-        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
-    }
-    return ns->size >> nvme_ns_lbads(ns);
+    return __nvme_nlbas(ns->size, nvme_ns_lbads(ns), nvme_msize(ns));
 }
 
 typedef struct NvmeCtrl NvmeCtrl;
-- 
2.30.1


