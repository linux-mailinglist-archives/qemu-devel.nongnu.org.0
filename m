Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6C418EA6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:26:42 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjA0-0008T6-PE
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1p-0002Yl-3b; Mon, 27 Sep 2021 01:18:13 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:51561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1n-0008Iv-JP; Mon, 27 Sep 2021 01:18:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 2DDF32B011FE;
 Mon, 27 Sep 2021 01:18:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 01:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5yt5X09LNjNuE
 xr0Bi0xN0yrJWRZcc+WYIN5acFZcVY=; b=aj45o4ZR3yL0ROLWWhyeKV3DWQWyZ
 2Mp1iKNQUuQUYrkY2IJP/NoqNDEt9nzGJVcvOCc2fooMuw7Y85dwSOkhnwp0/VDO
 X2n07WETGAIKS0cp4WLqdGRjSkZRePWGv7zt/DFrMsxkTrF/zvaXOBZuexGLMkye
 phSo1S0xzigCZ4o9dFJ2zVZNezgA4nljc8hU779eQkXmWxhq8mMzkDiam5eYWEvQ
 xDxLsbPXyfGcg2yWR4bTEcF31lvTRdCEcUGuXUDUA+p+B0jUo90CskFg2oDkjvp/
 EYh/Y/e21vHZUCDue1jyHaprp+n6IUp80C4zqSH6zgJfuX2unoOgXIL3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5yt5X09LNjNuExr0Bi0xN0yrJWRZcc+WYIN5acFZcVY=; b=D9QNLQIP
 He2k3A2upN5XhiGdqui+1Hm4LyDLPWrBGNOi3ZIp4xYHi7/NTFEhs24xSQgf7U98
 RvPCSHmoVIY/LvehBhG8WO7Y8G5GylJefnmP2TT0jcF/V2Pg4Wji+C7U5uDUU/Bf
 6b3XKfSX8tOoDdqlhLP0JVphLP8ljDQYGHdkXZQ1Pfh8z910F07+4DXxWG6Q889N
 HovDJNhoeopxWuKPhctZqXvUx2L+aeVrc9eBzvOPoL6tLtD2rrUrh+ymLfzj3PdS
 s71cZiDRLYQNzYPtWO+x7iRWBepF5qg2lhSZWOSuZlCuOKIB4/ZOEXChjK7L6c2H
 7ppR1U/i+OrBZw==
X-ME-Sender: <xms:EFRRYV4MTa12GiAOJPOzP6QInuU7YwMeMToGLkCKFIGggEeAmxhB1w>
 <xme:EFRRYS7UiDVwzgdEPxxGpa14kUsi7JBN6SeY-5nyGRsI7W7pp3DCSoYTv45SotTde
 Misg2AcU32mn0tUI7M>
X-ME-Received: <xmr:EFRRYccDrC-w8k6kK0WtcOgvZNu52NNq1Xs2xbfuGos-kYI5FN3SpqBDpEY75jipyoavLc3wFhK0Ya41WBfX8LUCy6m_WYf-lRqRruUN7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:EFRRYeLR-SkqYJCXfDe9FT7x97-NFx1lBhKAnOG-HgpGlk4Ur5b5RQ>
 <xmx:EFRRYZItiwajWr9nRub-VQGRikh8tI651t-RHfuexrnjtUyLf3ulsQ>
 <xmx:EFRRYXwvsvPDd_L-Sr-MaFFwjw9LxQJ7QH6aQ8SaBX9LRTObe6lvcw>
 <xmx:EFRRYS7lPEINrtOKqCCEv58JSrei9cK345YiP7nZpUZCxrVgKJumkk_YjDo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 01/16] hw/nvme: reattach subsystem namespaces on hotplug
Date: Mon, 27 Sep 2021 07:17:44 +0200
Message-Id: <20210927051759.447305-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
namespaces get moved from the controller to the subsystem if one
is specified.
That keeps the namespaces alive after a controller hot-unplug, but
after a controller hotplug we have to reconnect the namespaces
from the subsystem to the controller.

Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
Cc: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Hannes Reinecke <hare@suse.de>
[k.jensen: only attach to shared and non-detached namespaces]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/subsys.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 93c35950d69d..6b2e4c975f5b 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -14,7 +14,7 @@
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 {
     NvmeSubsystem *subsys = n->subsys;
-    int cntlid;
+    int cntlid, nsid;
 
     for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
         if (!subsys->ctrls[cntlid]) {
@@ -29,12 +29,20 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 
     subsys->ctrls[cntlid] = n;
 
+    for (nsid = 1; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
+        NvmeNamespace *ns = subsys->namespaces[nsid];
+        if (ns && ns->params.shared && !ns->params.detached) {
+            nvme_attach_ns(n, ns);
+        }
+    }
+
     return cntlid;
 }
 
 void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
 {
     subsys->ctrls[n->cntlid] = NULL;
+    n->cntlid = -1;
 }
 
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
-- 
2.33.0


