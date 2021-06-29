Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623803B7810
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:55:49 +0200 (CEST)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyItg-0006Rv-B8
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImC-000176-Lx; Tue, 29 Jun 2021 14:48:04 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIm5-0005Ct-Gg; Tue, 29 Jun 2021 14:48:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 486452B00A65;
 Tue, 29 Jun 2021 14:47:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 29 Jun 2021 14:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NrI9HCzCHT1E/
 h1uY47WLOmuo0/VzwOrQ1dvfN/aQA0=; b=X9nXKPtQed4wfzpH2YdZW63IIKO+e
 VMyaJnCtPtIziiEpfY062HYQkBrNRPkzE5k+w6s8Nu+rVKD4FCPzZeSBmNuJe1gV
 7cyK+BB8pEQAJZ2k92r1cQzOIfc4HVtLRzGyzrwwK4gvz8ZMLQjv/HMZVEFS7TTZ
 Ju0jDE598yP/pStZc/F3+WblHQzO4ITumbQhpc7WQCcL12H/UtfuazsMI8nEOrZC
 GzaEEcG+boHMbbEtQCaoDIa6fuF8juAasEjfxkmQuCpzCtuwVWoJ1dXUmp8NHz5L
 vxlXGsUG+2ZlPaV7QoNJ7WLDJDFtEBEIexGMFt/tCm3CImclmZIebfpTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NrI9HCzCHT1E/h1uY47WLOmuo0/VzwOrQ1dvfN/aQA0=; b=vXCm5R+s
 2k0pJp93w7xpE/eLoR8rXmV2n6q9Wue0iTSQ9Bs/VXmUlEvCefV6Fo2r2ew+jo2T
 beKQCoaj4Nyquq+SovtwIxnb5VmtmObiKy0dA+tk3UVLjVGD5fdd1Me0w7MWJfQj
 XO73UbB+LZVK7hL0mKQj8exL2aoAhGyoguWhd0XhtpW5Cx8jDJ1Ax5FiDqVvDkDb
 UhcDNpb9pH0E5YBKxoUry/Dvbxf0f5oDbOA8YwLDrerhSWl3amh+tvmDWiaGjr7x
 YFyhzsbbThLaouJYFbScdTC4K5WVPdSm/ktYBGpvJ6JT2TlIEAhnu0Ye9/RsXXji
 aNqPZsB4oZPzEg==
X-ME-Sender: <xms:2mrbYCrOUr4JOzW4QEovXTFf8DCUozmebvElyurOW4VGISPSssrWbA>
 <xme:2mrbYAqgKTHUBsc9SCWZ_skIVDV4hPudLmlJ_Rn4OESxUMdZ9fnY1hjdEQVUYBSUr
 vpGtjy4xeP14-DNwJY>
X-ME-Received: <xmr:2mrbYHN4GoF6q3aEa2BSwxQrI-2h9Sl1FxXH6KC0sjEjznVzWbP1MZNc0WX5e7OE0SEiahs0EUoPXnfq90TAdfy6EZd8VWOhuhGE-LovRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2mrbYB4HZMnwuYUY0meO1HbRE8tjIwvDvF-zbet_JYZXR_qoqiHfqQ>
 <xmx:2mrbYB7A521PvRD1-slIV7ceNV9OY4QysCMMeQTmraYGj-GQu5wghw>
 <xmx:2mrbYBhd1qKvr9Y1ysSHSL_VH2kwHGi4Efxn_Q4bVQwF83ryuLAj_w>
 <xmx:2mrbYNjlnXJcV-IpZufX6oeZOLmgHJ-n_WEz2h6k4wiHNAQHzOvWiiWnnA8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:47:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/23] hw/nvme: add identify namespace flbas/mc enums
Date: Tue, 29 Jun 2021 20:47:22 +0200
Message-Id: <20210629184743.230173-3-its@irrelevant.dk>
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add enums for the Identify Namespace FLBAS and MC fields.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: squashed separate flbas/mc commits into one]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 9 +++++++++
 hw/nvme/ns.c         | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 0ff9ce17a99e..333affdb8534 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1341,6 +1341,15 @@ enum NvmeIdNsDps {
     NVME_ID_NS_DPS_FIRST_EIGHT = 8,
 };
 
+enum NvmeIdNsFlbas {
+    NVME_ID_NS_FLBAS_EXTENDED = 1 << 4,
+};
+
+enum NvmeIdNsMc {
+    NVME_ID_NS_MC_EXTENDED = 1 << 0,
+    NVME_ID_NS_MC_SEPARATE = 1 << 1,
+};
+
 #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
 
 typedef struct NvmeDifTuple {
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 992e5a13f538..8066e311d1a2 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -82,10 +82,10 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ms = ns->params.ms;
 
     if (ns->params.ms) {
-        id_ns->mc = 0x3;
+        id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
         if (ns->params.mset) {
-            id_ns->flbas |= 0x10;
+            id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
         }
 
         id_ns->dpc = 0x1f;
-- 
2.32.0


