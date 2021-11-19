Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B8456B82
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:16:57 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnz4q-0001ta-6T
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:16:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyG-0006wC-1u; Fri, 19 Nov 2021 03:10:08 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyB-00058c-CY; Fri, 19 Nov 2021 03:10:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B77E5C0102;
 Fri, 19 Nov 2021 03:10:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 19 Nov 2021 03:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=pA6j83PMhYFTs
 /LxiS8Ys/jrEzDtiicAn9hwxxAn3Ck=; b=kZSRsx32IiVTrJMFL8OtS8DIZkxKL
 ogtW0c0+m0A/Cw/cg09vZF4n9XrphLKGCVI/mayLMbpjRNEVKaGT66SgXrVIpB+v
 /inB1C2WmhIBiDJPXkbszCdjeHu1riOAPv8HvUShV8FsrfNfI6/pa79vQlUjhLYB
 Mf0jSHXaYB+8284S0HGFztJds53RRLaInDOWMJsunPiXVREHoFTPUmLQpPWBDIQf
 GeFPTjqE/tr/UhlNAAur7e7bUUzRNqYs0eZGbu6Ufph0t5LlisvzJ/XVfOjerPiO
 Inflzku7McqaP40TMvaTUAkoDIF/Iw2fT9D8J6nkEdVVzp25ipb+NdRuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pA6j83PMhYFTs/LxiS8Ys/jrEzDtiicAn9hwxxAn3Ck=; b=LcJeZg8C
 XC5Q48VdrZ3U9WjtIarQMyyjsQ3VICaqGJIgjdCJnA5eYFuFprh/BlNPbxTz7rsR
 8RnnS8dVtUIS9EBwnkliY/hL8CzpCV9nZVjXRgUudGZdQ3Xb2tMX27ftOS/ncDUY
 RqlZiLppU3h5pfChhX3CAzBe4hw+Cl8f4tJ92cdkq8qwNezDPzBS0LFHyAZuhgQl
 BkpCTRr7UxiEJTt0bAtZEMmZ4tYlOM/vcG4TePzxzlgeUqA7XbWRSXp0guo6cH8a
 LZ8GqRxmzuFCdkuVS/tXTJXwfmf8NFSUtAnD9/03SqDz4VzOLpKD2TTr/JIrd60H
 oSBZC+htQhndTA==
X-ME-Sender: <xms:2FuXYRoYRnWzWzNvfme3Zcvy9iiWvwKcJbjKJfYX_yf2sGQJnLdqfQ>
 <xme:2FuXYTq7bfRZcOD-z3OSql1_UT0Lg93_EJ7AVSH9SsAY4PfAj84LBNRIQ8pg06nYR
 GhDQhKQb3MnznbDFkI>
X-ME-Received: <xmr:2FuXYeMrx4XOS0sJ33TrhHLyn9H6cX8-SnRcFbVCcPqpHkcK-Soe2LAXmaInsQPpiBRFXwX1-DB1gzxOuunhNFr6h_PEmeI-3X5C41h1Ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2FuXYc4NY3uhrbqXNr7gFWUdBkRUZvZPcacPKGsJ9xFaZ4UqTmOzUg>
 <xmx:2FuXYQ65vyGn1vCgL4UpjSc8hjgBqvU7jWfeUWhPVTyvSsAyLHMWdQ>
 <xmx:2FuXYUj7stzwkivyiqjkrSJHxsc89SJyUTzW5DwYN2X7OxaeQRH2Ow>
 <xmx:2VuXYSvTdMCSoMigoMcCHOOQ6LfsCVBUpU-KT2hgBFCUxWZouBniJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:09:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.2 1/3] hw/nvme: reattach subsystem namespaces on hotplug
Date: Fri, 19 Nov 2021 09:09:52 +0100
Message-Id: <20211119080954.211927-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119080954.211927-1-its@irrelevant.dk>
References: <20211119080954.211927-1-its@irrelevant.dk>
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
X-Mailman-Version: 2.1.29
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
 Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Hannes Reinecke <hare@suse.de>
[k.jensen: only attach to shared and non-detached namespaces]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/subsys.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 495dcff5ebb8..fb58d639504e 100644
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
2.34.0


