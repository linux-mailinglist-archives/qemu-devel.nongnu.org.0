Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E9364AD1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:54:23 +0200 (CEST)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZyQ-0006rP-Aw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZP-0000Oe-RC; Mon, 19 Apr 2021 15:28:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZG-0005J1-Q6; Mon, 19 Apr 2021 15:28:26 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2138D21DF;
 Mon, 19 Apr 2021 15:28:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nKelGXvLkR1fr
 inNRpAcfkrpNoeaRcVZ8PuyHNZZYlU=; b=BiJ5rDoxnTbx3E2ngwhD64/Jn/8sC
 uTvlSBLDCJpc2bREuoUlh30eM1fzeqlCdpJT4bCHUQ9pbIfFtuUr7pxYHejtC2m4
 psqgjmxhNHLy3EvgP7+F6OaEfPXWhlIFDVkwTD83/wYuw+aIJHkbJHATO/bjn/M9
 mL0KAucoYsGXlDzMw8XpLu1OwkktWkhBEbi3efpply67CWB4t7dmGK4UuNJR9BZ6
 4u/gqJ5+fy7KbRCt82CAXaee0BlrADpGJctdd7nuYOKqkJDjlUyco8MIrTPPyBl/
 DAJp1d74VPiihKPrUgBOEqRysRUy7Wpc0x4Tk9GIPh1DsbvnzAtiDSPOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nKelGXvLkR1frinNRpAcfkrpNoeaRcVZ8PuyHNZZYlU=; b=jvB7wSOn
 oBdPOMHZI9aDxIYPPdSh/NyD3BxAgDOjZnPMLmwxEso/2/gMb2dQx5Di2FUgDNBH
 vBDmJ6BZ0sDdSOtSeS8Ne5or1YzQZTRwI9mhiyQEyE0JcQyfAAjQoLt9Fiqyc2yq
 bTXkVHjS72HjovQvAJHj381X88ETGml7l8PA9iqUVHI9vFiR0MwC7qz0GbXt7ozq
 SVe27xvFov1bh9B+7AQA0RHMJwU4hJYgJEBLxijMvTKaNuEOsK7KV6WU1zvjDkmn
 IL3PNgK+SNrnfe7D+agOT54wPkytEtqtvx/AIOijBmoNpzFxeF3aAdkL+GUHzQT2
 UepwGVXqjQfzpg==
X-ME-Sender: <xms:0Nl9YNLTIvVkH8qQr3YL25UtaTUUq9H0PdQxcsI6wDW4nvNk3l-e8w>
 <xme:0Nl9YEkqUVop-W_2Numal6j7r3uo9rp5cmOacyXPmZCtifvEEEx1DXf40miyNGTeQ
 QDioxaB9TfmkDhjNcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepge
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0Nl9YJOqwzHjLFlK2INwHHIVz4CzZwTbO0e911oXU6gkZYUwqC_Pxg>
 <xmx:0Nl9YC2ZQNBFXkNU-Dzt2c-DQipG2c2Yg8ap0EdhDTAWHukVx8VQ2g>
 <xmx:0Nl9YAk5rpNyaSW14hX38Air06eUdhNG2yVvg8TtX63nX1q8cIV5cA>
 <xmx:0Nl9YAHfIlpgXQia7_QeOWCoAbZPkJSUA75FxfUvkbpfZTUna_OCrQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C4E9E1080069;
 Mon, 19 Apr 2021 15:28:15 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] hw/block/nvme: streamline namespace array indexing
Date: Mon, 19 Apr 2021 21:27:57 +0200
Message-Id: <20210419192801.62255-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Streamline namespace array indexing such that both the subsystem and
controller namespaces arrays are 1-indexed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h | 4 ++--
 hw/block/nvme.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 9349d1c33ad7..ac3f0a886735 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -438,7 +438,7 @@ typedef struct NvmeCtrl {
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
-    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
+    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
@@ -460,7 +460,7 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
         return NULL;
     }
 
-    return n->namespaces[nsid - 1];
+    return n->namespaces[nsid];
 }
 
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b0a6c1457a88..0b96936129d6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4978,7 +4978,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
-            ctrl->namespaces[nsid - 1] = NULL;
+            ctrl->namespaces[nsid] = NULL;
             ns->attached--;
 
             nvme_update_dmrsl(ctrl);
@@ -6151,7 +6151,7 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
     uint32_t nsid = ns->params.nsid;
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
-    n->namespaces[nsid - 1] = ns;
+    n->namespaces[nsid] = ns;
     ns->attached++;
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
-- 
2.31.1


