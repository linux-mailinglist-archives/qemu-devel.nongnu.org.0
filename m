Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29273546B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:16:26 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTlv-0001zD-Mu
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRO-00016G-NH; Mon, 05 Apr 2021 13:55:12 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRM-0000Ke-9N; Mon, 05 Apr 2021 13:55:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 835545C00D6;
 Mon,  5 Apr 2021 13:55:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TjYrfGJVnklax
 fLT/vxlQ8DbvgPTmO3EXEX1fIFsPzs=; b=RVkO+4I2s8Yq9XS1U1NAVEngsCHOf
 NslRvm9hgxLaELx2qrv8jWoX1QhPNmtFmT+Ox9ns5pnh1NqWV/5oKLKH8EpQ8fk6
 hzRzCGUXLgGdwHZ27MIyIyD+PpYZvhkIR+yIa+7aKwZLo9fFHqWZaqeBqTUDHzQT
 WpNEOUwh/eEM40nk5R3gJCy1IEbYMrdkaEv20C2m+jyr7SiWlYSCQ71oQO3DRy2e
 4ImequQrTjNz/AaNmmzIzgu4ed04RkEnrEQdi/cwglow4vZsGDgwUTF0hPP2DFVu
 5EKuIXEtmqWxI1m1grDacHKJFa7C21Lwcr9ekOaxKdoiDZ+pNqZSLmBDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TjYrfGJVnklaxfLT/vxlQ8DbvgPTmO3EXEX1fIFsPzs=; b=J0cndNJl
 Co8/0X5hN3XNRo0GZhSjd81Kj8y1NFKAS/OuF/HV2PKwFmp/SutVaSxU5az9vxk1
 0YvuO7MiPVtVifWUEIfv3yfG3jl5SY2aTCJdtFXyASxw9PhjwMrQPM7uXv+gw/Q7
 jGK3a4hrQlds58LKW2tC5UR/uFekcCvZK69BFV0m99QIlWkUUjrbQYGMeeekDXki
 7yoDJxQfs6MUPoL6pJMld71HxzBmjInmW1AVM2tSjxl70fMdBJSfTQCW46+YHXdX
 Zgc2Nc/pZXH/JGlAgG2OBbvv1tCTu1dm0ogDUpzZ1HXIwTo566fJ8RaTY9M7DggP
 XHSqKo9PNysL5A==
X-ME-Sender: <xms:-05rYP923s3xx3JLs3ebw0hgkya9EBLUI7sYv2anOZCVL6_BShaknA>
 <xme:-05rYJSg-Uax_TBzN9sgXirwnEzwvaiBPbG0cc0-9sHStomIUmzww0FMEDkLkzxO7
 z4a3uiOdx1j0pDhcHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-05rYDfFrW2R9a5oIYN-lvxHwYIaEbE_NOkQUK27cFj6pwAZvojpdQ>
 <xmx:-05rYNA2lZpg-RZEqwoiRbUB7URLnFKj0PlmaXW-QU9sL3eDBdVQfw>
 <xmx:-05rYFmW1Bp0TLGqruz1GUXso5kMd_wtEeYHR3RpR5bSABMyD-Vm4g>
 <xmx:-05rYP4qpkOuFL_IZ2u8Be_7jSnmRgK-kPAdPPONb-Txbqa8QspabQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0778F240054;
 Mon,  5 Apr 2021 13:55:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 4/8] hw/block/nvme: fix controller namespaces array
 indexing
Date: Mon,  5 Apr 2021 19:54:48 +0200
Message-Id: <20210405175452.37578-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller namespaces array being 0-indexed requires 'nsid - 1'
everywhere. Something that is easy to miss. Align the controller
namespaces array with the subsystem namespaces array such that both are
1-indexed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.h | 8 ++++----
 hw/block/nvme.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 9edc86d79e98..c610ab30dc5c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -217,7 +217,7 @@ typedef struct NvmeCtrl {
      * Attached namespaces to this controller.  If subsys is not given, all
      * namespaces in this list will always be attached.
      */
-    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
+    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
@@ -232,7 +232,7 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
         return NULL;
     }
 
-    return n->namespaces[nsid - 1];
+    return n->namespaces[nsid];
 }
 
 static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
@@ -253,7 +253,7 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
     uint32_t nsid = nvme_nsid(ns);
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
-    n->namespaces[nsid - 1] = ns;
+    n->namespaces[nsid] = ns;
 }
 
 static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
@@ -261,7 +261,7 @@ static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
     uint32_t nsid = nvme_nsid(ns);
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
-    n->namespaces[nsid - 1] = NULL;
+    n->namespaces[nsid] = NULL;
 }
 
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c54ec3c9523c..6d31d5b17a0b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5915,7 +5915,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
             return -1;
         }
     } else {
-        if (n->namespaces[nsid - 1]) {
+        if (n->namespaces[nsid]) {
             error_setg(errp, "namespace id '%d' is already in use", nsid);
             return -1;
         }
-- 
2.31.1


