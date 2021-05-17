Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6F382894
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZlB-0005hq-9B
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOZ-0003qg-7C; Mon, 17 May 2021 05:18:39 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOV-00062L-4H; Mon, 17 May 2021 05:18:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EC624250;
 Mon, 17 May 2021 05:18:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 May 2021 05:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=V+C+Irr1AuKQr
 MDUB2CMPebw7TPRfqS9QhhcGN1IzzY=; b=f+f41HKg7TMYWhJXOAFdaWJUJ6SOD
 1Ne2X0S9LZ9kKebPoHMamKLKtX3yFSsYY5kVd8Le2ojWmBKBVIT0T06ppG39ulJm
 5rsV+QxN8UzvoNr7gd3U1MDDqpB9uKtV6gBUrZgs8cTr/kIfhY5AGoIyyyWM74Z0
 Z5BbPuSGbPZWxvL5bdVa+aupzN/+AlK4m5BmuoGMm9GULgwwiSM9xXQYd7YZxfFc
 2Wtcc/3LSN4YKFQcwAS3nqQPTdxrFbQPycYVe59NfzA7jdW1Bp5WF6J8aF+J8xPE
 4PDRojbtBUVImwpTV2krZHTNrUCyYbn+EvVsp1kUywyoN9voIld9A2UgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=V+C+Irr1AuKQrMDUB2CMPebw7TPRfqS9QhhcGN1IzzY=; b=jzvXP7Gr
 RQ350VxeCpiUGlLpy02JkEVKpAM4e3vDyq4RRGunzP1hV1KvjcOczSV9IyYLI2qs
 2vZ0V6uKqAtw9cyUi5isOFbzJp1y3gHFEaaAd51L3XoDvUm0KG1X86F87qSp/11x
 bqoq4ip8LkWjapofQsb6p1hETPOJ2KC3ayjwWPqIXIhmULCT0/x6GFwB1n68DF8s
 HHPD7P+7JNElk9aMVnnyScMpOvjYBbrDw82cytiTPO/FaF1ocSMJ0qGOsyzhWsS4
 UfZBshkeZ++NJyA9oY/ee94TgKVsfcWxwje5t18bmCw1imJddXBhKb1MxoEAnQuT
 oIWTN01WdDLjaA==
X-ME-Sender: <xms:6DSiYDFeUT5YJZCXg8r5inAtWq5CVfrxUa8ryqzGA-V_L5dPs6_bug>
 <xme:6DSiYAU9Zz5dd2ydvqlgglpRWDVnoj7q8r9WQxK7OQmC4hKM9WtYhNiLnbdR4lBr_
 35LfWF6zs4pDFAVWjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6DSiYFLRw-DLVJeccfxhQna8LN2cyBGcb1jR1MVXB0Ynnef5Le_Qsg>
 <xmx:6DSiYBE46_nlHsY7msT-FiFFRkx1cGaJxG77Wqn0ocZoUR2CxqB_Rw>
 <xmx:6DSiYJXpdWdV6wqUQ-qeOfX0dRK8oJm2qYQlWSG8rwnveqI64lK2bQ>
 <xmx:6DSiYIESXh-7bMjl2r57VKLjP2lnnyNW6qweNuJzTTIE4dR9_H_JLw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/20] hw/block/nvme: streamline namespace array indexing
Date: Mon, 17 May 2021 11:17:33 +0200
Message-Id: <20210517091737.841787-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Streamline namespace array indexing such that both the subsystem and
controller namespaces arrays are 1-indexed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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
index 1db9a603f5c4..baf7b6714544 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4990,7 +4990,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
-            ctrl->namespaces[nsid - 1] = NULL;
+            ctrl->namespaces[nsid] = NULL;
             ns->attached--;
 
             nvme_update_dmrsl(ctrl);
@@ -6163,7 +6163,7 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
     uint32_t nsid = ns->params.nsid;
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
-    n->namespaces[nsid - 1] = ns;
+    n->namespaces[nsid] = ns;
     ns->attached++;
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
-- 
2.31.1


