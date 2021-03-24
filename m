Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383473482D9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:25:05 +0100 (CET)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA3r-0007pD-S5
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9or-0007vO-Ng; Wed, 24 Mar 2021 16:09:33 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9od-0008NM-PR; Wed, 24 Mar 2021 16:09:33 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 89DCC13FC;
 Wed, 24 Mar 2021 16:09:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 24 Mar 2021 16:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=v8RAiOJMlzHyh
 NB2DIrXIr9luT0XBrNgKMjXxo0kGOM=; b=amKa8NaTJ2eO17QdzqKD6TldSCWpm
 4gL1Ts0+SODU507KXC34F1Ae7Mkn+bTzlHxImvLxa/7zQN4mXFW8EcKMlQqRlZks
 2txCnTPqOMUn0WBEhUxxLhPPo9YchZleehGXjEL7zeq9t8SkehN/JkJm+3RttOTZ
 Op+R449M89s3htvEkL2U0SfAOZY+YfphZMMcy/laK7oJaG7ChzogOvVVJhaGoa0G
 NU/mW9nXZr4HMgKeChPVBpCuSr/sQey5sZChsNFfxCNkRk54r22RCfurwIXIGxMG
 Zpl54EmfFt97K5fWibpjcz+wTpjK30vH7ptY7dlhItDscCyzznz7edXCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=v8RAiOJMlzHyhNB2DIrXIr9luT0XBrNgKMjXxo0kGOM=; b=ujsNHZ8Z
 yQMAvlo12oeqjidbXNNnuF66rlODxZhI1IYO8iXOn7x+HVMK48EyT5vEDRG4YwfF
 zt5Ib5UOmJDF6tyc/pAt0NMm9HtLrSkW8JjZlWCQhsiqY3NKJ47cPwwEo+wGvTbC
 f7cYgoXau3Ifr5VMg6zhN6BhXtr7cvosfDqN36gu6sFIIokDwEqtk9KTALcCOn+g
 cZXitpybICN3tBOVDw6QfPyLGOaImUPVxmxGfkgLWqlf3jM0ace++6aAhKv/R5Ij
 DHDgodHRe/tEd0baUphqhs18j1q/+hR+spbFZTPOmwcN5ETWRrf5c4ra1d4EV8Le
 C36cYndkhvZGOw==
X-ME-Sender: <xms:bZxbYGhSnyOHUfAGeUQSEsumLc2jxWJhS0MrL0wEkbK0uehuOW5uzA>
 <xme:bZxbYP_fu3qZxEFvbK23kmAdxIasIfO8jjuPEhUsNVo4b9BC_Bl_zgVfUoc1FTgb3
 V0pHz9gL4e_IaDRcSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bZxbYJrBigTHpx-5_oxUgCPY_M8WuTx827-nbDw_jlS0LpeWCXpKTA>
 <xmx:bZxbYPULbpbXJWUFpDbGWzwNe_-ujEwtsxcg2UJo_IDCAr3UziWFaQ>
 <xmx:bZxbYACQOLCLDekZKxZXPWYO0qBZiWV0lS7Y8-q0hAzLecJpNXJCxg>
 <xmx:bZxbYFoKzc7LJsDBun6DDWQPQCrv_Rxy_SrSoygGBmc4VfSAWxeouQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC671108005C;
 Wed, 24 Mar 2021 16:09:15 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 4/7] hw/block/nvme: fix controller namespaces array
 indexing
Date: Wed, 24 Mar 2021 21:09:04 +0100
Message-Id: <20210324200907.408996-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller namespaces array being 0-indexed requires 'nsid - 1'
everywhere. Something that is easy to miss. Align the controller
namespaces array with the subsystem namespaces array such that both are
1-indexed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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
index 6842b01ab58b..7a7e793c6c26 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5909,7 +5909,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
             return -1;
         }
     } else {
-        if (n->namespaces[nsid - 1]) {
+        if (n->namespaces[nsid]) {
             error_setg(errp, "namespace id '%d' is already in use", nsid);
             return -1;
         }
-- 
2.31.0


