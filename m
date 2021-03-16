Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977E33E0DE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:53:50 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHdN-0002gB-IA
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXm-0006qo-RZ; Tue, 16 Mar 2021 17:48:02 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXl-0000tf-0s; Tue, 16 Mar 2021 17:48:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3303D580A4C;
 Tue, 16 Mar 2021 17:48:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Mar 2021 17:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 UWWgnQyChWBaw1mvtIyB0g1GBGLDjeCNtfB6wtj9s7Y=; b=3DDHjzc9rYZmxemg
 VUUCA11YJW81DFmuWqvs01JUtjpKglEyfUIWkR0oaiO2tOPHvmleFd2/8JhLnPsh
 DxxURVRpX44gF3alsOyL8hSGf2YljqXBdyzHues4o7J2xVvSWuWtlxQK2KWToot7
 F7MnChHo9gaqG7i9sggAetfgr95Z1jVFxxZwh9IYZ27zeAr9sDtBTZJ4X01wt788
 A1NnXMds/Vt/SHtw1xYCGQ4qDaDw8EskNYL39Wn4TA+WdgR6ZJ7O4ckUZVN5Ua1L
 f/C9jTgOAmoDwjPu7SXifL/rqoFcq005TbbPLTJSQWRhzcpaVq/6tHhNUJULYW8L
 uLZEXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UWWgnQyChWBaw1mvtIyB0g1GBGLDjeCNtfB6wtj9s
 7Y=; b=YYkMEPBzp3RVTOJam9RZA9HszD/y1dDG2hwUjS+qXVm/trmF3eFpvx0/X
 sYyJPchE+s8vBmLSBKmKD/jKcgZmW6pIL97/1RtY00RlJKzwsorBpG0uY1W2ykqx
 efQW7wruH2/qha7e+O4yZxIStTh6KDZq7pRs/haQ5HFL0dPdpmzONNXh+ezYyOps
 gvbLvF00XXM50CX4q1o68ijiRnt0gdOjKa5zjsqPyxxScso9s6GMVJlLLfJVpiL4
 0lwUJMU2R+BVayVx6PLGlC5L4oi3fxtxx0GAajpVKMKVy4R1encTHtRFqL8QzKuy
 qqowAqCDfOS3kqrPzQMUipcld4Buw==
X-ME-Sender: <xms:kCdRYH70u__XfRBbHfCXYrA2A6P18Km55ZLkPGG8R_mcx9eV2Wf63A>
 <xme:kCdRYNm7h_eS7sskjBdZtT0J8Jm8B-7yt2XnwzzB20Ah36vP_V9QDBcmsTzX0aOM9
 lUsM-isp_5T2qrdBSo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfh
 ffdtgeenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kCdRYMrFUPn0Ma-u8H02bGVClzZ-w1T24DMIbNYYf4tkj1xd7auoAg>
 <xmx:kCdRYMsSnY0kzKue3MOXYlfQ6P5IKvjM7AZIzURHxtIaGf9t0PaDIw>
 <xmx:kCdRYBG-wTvrskmO4FJAY6Ndw_6dbwv1UQRH8cvfZyDhQJE14pCasg>
 <xmx:kCdRYGGpfVPXLjHAWZY7-XqL-ZiW28oYAk5nnHhKMnYwtAlDRO7Zlg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94BEE108005C;
 Tue, 16 Mar 2021 17:47:58 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/11] hw/block/nvme: assert namespaces array indices
Date: Tue, 16 Mar 2021 22:47:44 +0100
Message-Id: <20210316214753.399389-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Coverity complains about a possible memory corruption in the
nvme_ns_attach and _detach functions. While we should not (famous last
words) be able to reach this function without nsid having previously
been validated, this is still an open door for future misuse.

Make Coverity and maintainers happy by asserting that the index into the
array is valid. Also, while not detected by Coverity (yet), add an
assert in nvme_subsys_ns and nvme_subsys_register_ns as well since a
similar issue is exists there.

Fixes: 037953b5b299 ("hw/block/nvme: support namespace detach")
Fixes: CID 1450757
Fixes: CID 1450758
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme-subsys.h |  2 ++
 hw/block/nvme.h        | 10 ++++++++--
 hw/block/nvme-subsys.c |  7 +++++--
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index fb66ae752ad5..aafa04b84829 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -54,6 +54,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
         return NULL;
     }
 
+    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
+
     return subsys->namespaces[nsid];
 }
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 4955d649c7d4..5ba2efaedfd2 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -236,12 +236,18 @@ static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
 
 static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
 {
-    n->namespaces[nvme_nsid(ns) - 1] = ns;
+    uint32_t nsid = nvme_nsid(ns);
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
+
+    n->namespaces[nsid - 1] = ns;
 }
 
 static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
 {
-    n->namespaces[nvme_nsid(ns) - 1] = NULL;
+    uint32_t nsid = nvme_nsid(ns);
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
+
+    n->namespaces[nsid - 1] = NULL;
 }
 
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index af4804a819ee..9fadef8cec99 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -47,15 +47,18 @@ int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
 {
     NvmeSubsystem *subsys = ns->subsys;
     NvmeCtrl *n;
+    uint32_t nsid = nvme_nsid(ns);
     int i;
 
-    if (subsys->namespaces[nvme_nsid(ns)]) {
+    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
+
+    if (subsys->namespaces[nsid]) {
         error_setg(errp, "namespace %d already registerd to subsy %s",
                    nvme_nsid(ns), subsys->parent_obj.id);
         return -1;
     }
 
-    subsys->namespaces[nvme_nsid(ns)] = ns;
+    subsys->namespaces[nsid] = ns;
 
     for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
         n = subsys->ctrls[i];
-- 
2.30.1


