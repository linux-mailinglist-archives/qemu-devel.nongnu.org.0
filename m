Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E422D3138B9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:01:11 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98yM-0003FJ-KF
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l91rq-0000wz-JJ; Mon, 08 Feb 2021 03:26:04 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l91rd-0001HN-8n; Mon, 08 Feb 2021 03:25:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 05EC99F6;
 Mon,  8 Feb 2021 03:25:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 03:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=L/Hb545wrRmskIS+8OZdnN4QnY
 QO7QrLI20/mnkwjwg=; b=CZQsIeenZeANcKub9dJkPHJjBPHrZL3dffDJTJIYz/
 vnpfO86dZNRmMDY44cxn/X2AzdLjtmZF/s+j4AZzfGyyahtUkycHneeHf0owwtyW
 0DWbFMUM0ugtXXlyMgEy9+n9Q0/ufD70nS1nz1HaXfJt6dkPzXohxbE+pzTJgegS
 tUPbZZVaVg6DuB0D/yEfWRaakZRgYCceEypAozPmo8wu4ziMtu3FZ0TkDDTQGlFE
 qf69by4rRFtJ3nwH1yin6akFuoT3ypaauG6W64TygBfzLUGs0JFbAnjqSnW443yb
 /vapA3ftWoXGKSWn4Nx9BVo+bVOggAZciJxHC5qfO1iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=L/Hb545wrRmskIS+8
 OZdnN4QnYQO7QrLI20/mnkwjwg=; b=R++prfAWbr63sRTz+aKG+2lFEXXFEly+J
 JGrt8mxsV2kzeSZopYmjqQnYumxw0VseAuVupZ82IWf87vTEjaEOOH242oaIzEMe
 Nh5bZ1iCIgvE40Hi/K/1+2/pgMugL3fAtCAoHVYthEMDjOPOF7HXpZfdbivXk9zC
 PAZSIuH8hXB8cI733dQhtokjZUtWUcX9Jao9iA4ECdw7zLQxhtqONjzyvTtVgrwX
 y5clvJ3vyn8tIu0BeOVl75B+Gero4RTbHTGGm2zJ8rm3YTPo/uD3AHY/WH6eKVpB
 UybY5wxjJUYgFuwG9nDpz84bvuJcttiayyZKqiHB7TUefK3BZINbg==
X-ME-Sender: <xms:f_UgYFXFwSCs50WJKm4OzDy8AzzuI8uqtAO8a3Kms3JlS16ry8Yvhw>
 <xme:f_UgYFl_HfKH6QGx8xzeMRW8zYgKZA_F1Bu-ULS1JfkSq_BhSb2e4EGpU3RgwyKQC
 K9Dv2oQAxoyyr2CSEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:f_UgYBaHZSLqgQiQFV9A-xXZCha7zg2gYkRB3k-FxSdUpox1BvgP0w>
 <xmx:f_UgYIW0w70nbJGfDG5F0vAPoSDSbrxS61zr2yOwykVRatAhKGL68A>
 <xmx:f_UgYPkeY51nEx_XNMZllXzVuLTc1xV0PXT6iWtXARgvK9s0rbveSg>
 <xmx:gPUgYNYpr8qgjmOvg-SleKImKJ9GD4q-gFVjzK4TPXvoCcwDDJeQFQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FBBD24005B;
 Mon,  8 Feb 2021 03:25:34 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: improve invalid zasl value reporting
Date: Mon,  8 Feb 2021 09:25:32 +0100
Message-Id: <20210208082532.308435-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, "info@dantalion.nl" <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
improve the user experience by adding an early parameter check in
nvme_check_constraints.

When ZASL is still too small due to the host configuring the device for
an even larger page size, convert the trace point in nvme_start_ctrl to
an NVME_GUEST_ERR such that this is logged by QEMU instead of only
traced.

Reported-by: "info@dantalion.nl" <info@dantalion.nl>
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c2f0c88fbf39..d96888cd2333 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3983,8 +3983,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         n->zasl = n->params.mdts;
     } else {
         if (n->params.zasl_bs < n->page_size) {
-            trace_pci_nvme_err_startfail_zasl_too_small(n->params.zasl_bs,
-                                                        n->page_size);
+            NVME_GUEST_ERR(pci_nvme_err_startfail_zasl_too_small,
+                           "Zone Append Size Limit (ZASL) of %d bytes is too "
+                           "small; must be at least %d bytes",
+                           n->params.zasl_bs, n->page_size);
             return -1;
         }
         n->zasl = 31 - clz32(n->params.zasl_bs / n->page_size);
@@ -4503,6 +4505,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             error_setg(errp, "zone append size limit has to be a power of 2");
             return;
         }
+
+        if (n->params.zasl_bs < 4096) {
+            error_setg(errp, "zone append size limit must be at least "
+                       "4096 bytes");
+            return;
+        }
     }
 }
 
-- 
2.30.0


