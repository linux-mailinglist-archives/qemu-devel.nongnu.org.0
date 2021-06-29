Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2CC3B7820
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:59:24 +0200 (CEST)
Received: from localhost ([::1]:51760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIx9-0002hS-Ai
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImF-0001Ap-Hg; Tue, 29 Jun 2021 14:48:07 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIm9-0005FV-6D; Tue, 29 Jun 2021 14:48:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 97EF22B00A63;
 Tue, 29 Jun 2021 14:47:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 29 Jun 2021 14:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NFiMHu6F+iavT
 Y9L7GefmmlLAaekOIMYpmWgzf86Uek=; b=cjFcOV5u57YJuuPHy+LcAhFCjPsSF
 bKs3etXLlTOTO0Yi1oWe0NHNdvmEDV8E1El6C/sC+ZgYJjF03YoX9nwSGzZ1d/8+
 hYhuqxNySUtc+Atb+A9NBh8TOEzAGCp2z0Mb54J2cDKboJdsPfWqEqGbzBKeK2cS
 txDhElx0AV9OdJWSGFbwOrnthrxg0ouicm6nz0DBkUinV6mSmMYKMUrxjHN8Xglf
 cqEbS12MC1SK7nsHr3CGB6xNLSEmSqVvgtx3e0jhpeO+b7AUSbTLb5vmmHq3JaHY
 pLBQXQiD9K0Bxs8UF6OefTVhjwynvSJd9ovZFX4RdCXC+ZUYElUbXV1Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NFiMHu6F+iavTY9L7GefmmlLAaekOIMYpmWgzf86Uek=; b=ntccBRE/
 L+jP9wP9pd85Ys9bkCkockBS3760b50VY6E+ZPKdIJVlKfuQ6zdzA5cZJ37vTT9z
 GTbn7dRvSuQoK3+1DwMLaueTE43FWKOs6GQMCmTCxQr9UWQPmi3FHkcXaKuln/Wh
 RlyIR/bcfkoLDspBUmuk3eyQASXHRukUlg/T1fvkRDSEx1y1dg5mDGX8VOvN7MmZ
 xhUdmcbTDudvxTyzJ8irGEZ4v6uQ04ZT9BLsIRP3dJ3zC1LwxaAJP3iIE56yKJxG
 2eusWid7Q2mqaz4KF9osj1BRyqz264+3LKZQqeu38geltZ3pGDi3zO6kiOrcFE6E
 kKbTNOvdi6VxNQ==
X-ME-Sender: <xms:3mrbYFoZiiuHDv9M05AH4xhqj8ezEy405OxPqQYS0o5uAd42PHE_iw>
 <xme:3mrbYHrDgU-ZJug0KpRPFqHxQQN1Ih0Mtdb_ttAIjqhfreEpk8XqHR7t8pIOQfzK0
 FRyiUfpMh6GiP1WceQ>
X-ME-Received: <xmr:3mrbYCMvuGcW4rI7htwnCTPohVacMl3FhBp9bvd5bpTId9hnY6P3bygIYlK9vrUHEBtwExgMnlLsnKEcidcf866lLiBsJurOiDz0GSiYzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3mrbYA7w7LbuqpG9wftES0qZoCI8MaIBOi_dgCPUEVLZ_ViU58Fyrg>
 <xmx:3mrbYE6Oum9BYplNzcgLgRH8lIEySJbsS25ViYEU2vZof6HqGy59qA>
 <xmx:3mrbYIhHF4PoRIHDqltLVLv02-KWZEdFuLs7AiuIZDShb-zJI7lzJw>
 <xmx:3mrbYEhMrh8KcWeGC5yQyqq9J6xbyeypUj8JuiFgBrElKft9QSUHMOuPHS4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:47:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/23] hw/nvme: fix lbaf formats initialization
Date: Tue, 29 Jun 2021 20:47:23 +0200
Message-Id: <20210629184743.230173-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Currently LBAF formats are being intialized based on metadata
size if and only if nvme-ns "ms" parameter is non-zero value.
Since FormatNVM command being supported device parameter "ms"
may not be the criteria to initialize the supported LBAFs.

And make LBAF array as read-only.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 53 +++++++++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8066e311d1a2..3fec9c627321 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -81,39 +81,32 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    if (ns->params.ms) {
-        id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
+    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
-        if (ns->params.mset) {
-            id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
-        }
-
-        id_ns->dpc = 0x1f;
-        id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
-
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9           },
-            [1] = { .ds =  9, .ms =  8 },
-            [2] = { .ds =  9, .ms = 16 },
-            [3] = { .ds =  9, .ms = 64 },
-            [4] = { .ds = 12           },
-            [5] = { .ds = 12, .ms =  8 },
-            [6] = { .ds = 12, .ms = 16 },
-            [7] = { .ds = 12, .ms = 64 },
-        };
-
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 7;
-    } else {
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9 },
-            [1] = { .ds = 12 },
-        };
-
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 1;
+    if (ms && ns->params.mset) {
+        id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
     }
 
+    id_ns->dpc = 0x1f;
+    id_ns->dps = ns->params.pi;
+    if (ns->params.pi && ns->params.pil) {
+        id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
+    }
+
+    static const NvmeLBAF lbaf[16] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+    id_ns->nlbaf = 7;
+
     for (i = 0; i <= id_ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
         if (lbaf->ds == ds) {
-- 
2.32.0


