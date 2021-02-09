Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9C314A6C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:37:20 +0100 (CET)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OWN-0007Le-17
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW0-0005Vm-8P; Tue, 09 Feb 2021 02:32:52 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVu-0005q6-Sf; Tue, 09 Feb 2021 02:32:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5E108C70;
 Tue,  9 Feb 2021 02:32:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1VkdxomJdJSKG
 CyFYeWPb35Qo5v9C6WZSGh8yxACdSg=; b=MvlDZz1dd85cjAJRS5lKfEv8NyBnY
 1AikZfKAZpmlUNGdbGluc3zcGaXEL9B9ulMPEiiZ9uhcuQYTahs2b2yfIF/aa9oT
 BOKR7Hj4vCCYqTuoSp/ILG0Cd7shnTgjsUfoIWvg0QxHQvGX/wEvT8/CTjki1Jld
 GXh68G6gNCA4JGGvS3Hs0m5MI5odLklzJXlN5A906ertST2x5jJgY3vKw4WIouCb
 sNgB7U4l/wwH3xQeram8zIc9eMTF2QsZJ4mAw7THvAhEccAA1XrRWUwL9vgJBTtT
 t4xhPH+s5bVE1OOgE/sIL4Y5PXNHqIjnOUGW+JPNBu9bxVIj+8xvSx0Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1VkdxomJdJSKGCyFYeWPb35Qo5v9C6WZSGh8yxACdSg=; b=CKuvfe+x
 oBgSvsFc/UASzKJeCVoco/+cLcP1ku20yP9xlRP0ncLoA72Lnq3Zt0TCaN6rsdbB
 J3zaJh3dI9NIYmDLfG5codbasK+1NLOuZDS9cap/zGq2PkwOLRJNl2WX9sX9CUil
 1BfZGzKhBB1HFkdohuTGfGqJUIkD2ltXbqEh+KcPFIQuUDww7GTiEgFQ3aK8nxxG
 dwA0U8jrVWOQ/UCI++jqRb8JwFNkfXQMQkFSvbZJ7dZ5duHVbokIydMIuatI5ii4
 DyJoDmXmsoNO+24T8bUwdEUL5Ymm6nCYFqVwFVWyTq0xDus/V+pOvUPKeu6aq6Gu
 yWtN9ZxSq+2/4Q==
X-ME-Sender: <xms:fToiYIsFBn8OowBlo22_sPialKB_-Xit_AIlXdRqMopRuTHwWpruSg>
 <xme:fToiYFdapWza8SrwFSK5RNKpswzunHe9vGRJLSONWZpm1Z920Mzx2sELzTkP-o7dm
 e-AGn3DZVRPssNe140>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fToiYDz5JYMlWaBJptz-Td-xdbP6UrSAqyumIB0zM6pC5ZvEXW_fcw>
 <xmx:fToiYLNySgVEvEqdWkb4nCO7IFtQjOvRlBhnhO39vLwaLV7iO9g9IQ>
 <xmx:fToiYI9sB1cya0GFfp5W2kztyvoYoK3SDdCEoC8fkLW8FJljDQ26qg>
 <xmx:fjoiYMSodT_rMnXzaUp6OQkVOAh0RLJ5iJE3mzjZ8h7pXfuhPPoT0cJdc94>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 988DF1080057;
 Tue,  9 Feb 2021 02:32:12 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 33/56] hw/block/nvme: remove unused argument in nvme_ns_setup
Date: Tue,  9 Feb 2021 08:30:38 +0100
Message-Id: <20210209073101.548811-34-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

nvme_ns_setup() finally does not have nothing to do with NvmeCtrl
instance.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 2 +-
 hw/block/nvme-ns.c | 4 ++--
 hw/block/nvme.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index a0baa5f6d44c..293ac990e3f6 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -174,7 +174,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index ce79ad4a5319..3f52acb89c95 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -301,7 +301,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
@@ -353,7 +353,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     NvmeCtrl *n = NVME(s->parent);
     Error *local_err = NULL;
 
-    if (nvme_ns_setup(n, ns, &local_err)) {
+    if (nvme_ns_setup(ns, &local_err)) {
         error_propagate_prepend(errp, local_err,
                                 "could not setup namespace: ");
         return;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0b002cb2beab..30bd70fd5b07 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4377,7 +4377,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(n, ns, errp)) {
+        if (nvme_ns_setup(ns, errp)) {
             return;
         }
     }
-- 
2.30.0


