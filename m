Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B839416CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:35:57 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfkS-0005hD-9d
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcb-000392-FB; Fri, 24 Sep 2021 03:27:49 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcZ-0002pH-LQ; Fri, 24 Sep 2021 03:27:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E4A265C020E;
 Fri, 24 Sep 2021 03:27:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 03:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5yt5X09LNjNuE
 xr0Bi0xN0yrJWRZcc+WYIN5acFZcVY=; b=hsyOXxFybqwTCRSUELpmusmL7IgUO
 3TfdBgoMwwzoX0bIUXjNcBfia5RrzNM6KUnwNaupPfrd4SKfu17q3mYosUWjUr8U
 iXvFVVDDHBrdqXcAFUGJZagi7OrYDaKrE/GAZFic1v1xWzw3IH/E3KU1Qo9UyK5p
 EkGNPLWNS5uhdhjFiIqWIy8P/9XTEpqO2UA3dl12Ek6Nyje9x9Cux7bU7VajlxfO
 oQcn+rnd/e+/izn2zQsW3GGrIDZxySMLkyjnjIhyr8MQf05Se5M0Y4aEIO3bTZZS
 D58XQuugkskTXpI7u2QEFXYt4j4Y2nBu9WHnho4gY+bEkqjW2vJlZFU8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5yt5X09LNjNuExr0Bi0xN0yrJWRZcc+WYIN5acFZcVY=; b=IjbUGsNH
 gAzXNk+PKFM/QPrCKIl6BRVnzBx1neWLUyokulIsZHxVaAkn8d99ICPzm43M1mY4
 mqrO0HJTMox5F6DrOPExa38jAEkrGTpU06fxtcv00PAJEX/DoDJLwLHmQgyWdmWQ
 OJW3h4s/q2h3V/GIYpfJjYyzTa2fxw4jhg4WLFSg/IWeQvTHwJbFOmMi1BRX2hWN
 X5dnlxrc41sliWUmxjfOFbtR2f4fxO+Pb7CJfj1FHaHHpE592cSdnxpAL6jrvWAD
 RbubVtUfSWOJpMOG6yctEdieMrlL0Ndb7XNyGmRmzwYnodA5N+IJko7cU0fT7WVN
 kfcAYlUQbSDC6w==
X-ME-Sender: <xms:8n1NYVgEv-Z7FpIn5Rtx3Hgxxa92n6uN8YXMe-m2AkDQ4LMCzjDOUQ>
 <xme:8n1NYaAFUnaQTj_j-HjjJi4prHRVfQnaRh8NrytcGNrG0frbba_Z8EzBXKYG60U3l
 MJgajzF6C7_FyFjtZ8>
X-ME-Received: <xmr:8n1NYVF92vhrkSdrxmTIobsKl27RXeGLb-JSUmO4oBkin8Md3P6utO4qGi07fMX124Fh5TW24H7UrObVLJKb6j3ql-0o6DvvnHYi8fvk8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:8n1NYaSNLUukquAv38WG8USqOV2TImTCPQKfBvR8zjxM3QDRgCvNXw>
 <xmx:8n1NYSxrGvdDMSpgkRCD3AcmTg-fl1ul7_LaD4qTWRXXnXk8QC7k2A>
 <xmx:8n1NYQ7G_2f925U4hgTOjxE1c--BgT78YoPT4a0YJpMusDig-SVS_g>
 <xmx:8n1NYZkv1rcJnqQqea6xUFwGERcMBxBYMLixoKHwS8MAXNMfXCIzBA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:27:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/nvme: reattach subsystem namespaces on hotplug
Date: Fri, 24 Sep 2021 09:27:41 +0200
Message-Id: <20210924072742.306473-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924072742.306473-1-its@irrelevant.dk>
References: <20210924072742.306473-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Klaus Jensen <its@irrelevant.dk>
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


