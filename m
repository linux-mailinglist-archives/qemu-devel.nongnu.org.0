Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5733E0E0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:54:21 +0100 (CET)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHds-0003L0-QP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXy-00075L-M2; Tue, 16 Mar 2021 17:48:14 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXw-0000z5-SQ; Tue, 16 Mar 2021 17:48:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E4C64580A7B;
 Tue, 16 Mar 2021 17:48:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8F3ZKsYMEXHk+
 5AdV0um3WvGB+j6ek/Kt6khc+0in98=; b=qMvTCH4vL1oVOtuRtwolzhZm+vfD+
 oJh1kZqKVTJwmrhBuehxu+4xwbRu6RKPuyH+RQgNIOLOYhSy9n5b4WtWnrUTph0/
 hPgIWpt8ciqzpV37PWAnQJxmnAdgCn4cGpRjsVa97lD3k0FTJsP5vhpBBZpTaE/d
 VGAe/YcRc4nUwRDaMcSBfQ9ZzZOFittVEAhnsee0bgUrB4LCLKcQSFgu4wb3hJPA
 8PXM7fCIGMaVGr/wvUqLSaNT3Fo8OvNOda8Si151La/JgOGeNkNPFgKZl51YMx35
 9qND+bwyHqvdPVIiFG899+ZVgPsUeo/xERStwx3WD/aYrm0y/mzmijNow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8F3ZKsYMEXHk+5AdV0um3WvGB+j6ek/Kt6khc+0in98=; b=KYnEbb4L
 OuPi9fxrVYZEdKqqcu0RtENL6vQhKWeQ17hKYnbgPsuasrz9QsCAZJKXAtQojBkR
 18OjVijL4tmJv8UaY4lAavc8oPnNDxUJ0K0ixORYGRAKH9ewzUgBy8fcdboBYkKE
 gi6FsF0YITgBrCJ2vrp0mBlUtDsQEsO+rwQS/T2EnmAOWB5VZ9cJAXA29yxcYjHi
 cveZLlJGIHl5e4lfPkDBbyYTrFktvl+ZUT4EUkmLFO+Lwt+ybuK71sJZ0lBnbC2B
 fXqKi7W1CBB+OWZRKbuVavqX8+CUkw1+hhIQkP3hrEMvRS4uJU0zoIoDmK7KJgNC
 qm6soF6g5cV7/w==
X-ME-Sender: <xms:mSdRYObDHXCi5xsjusB1XT3lI3Vt-rCmMKqTFyFOR7ZAS7qiX3qr6w>
 <xme:mSdRYBYpq87HTSaf8ZLYF4d2PvYp3Ficl71fYUi_CH5aso7eXt8aMojXr6cfNzJBq
 rViiOJGCNZY-d0n-QY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mSdRYI-acrHMRRbxbp-W2tGbX5eXpBwVsqzJNrddXREew7PiwoT1cQ>
 <xmx:mSdRYAq1X0e-UA3F7soD-WdX3n0Z5SvdVCIwaB_D-ExzsahUWrtZfA>
 <xmx:mSdRYJrV4i0YP0W5Lym1pKa6I3Y9Gfjo-2rqY9khull_STd8tUbk_Q>
 <xmx:mSdRYNdEydPO71tHWwxK3dXtyilQMSEg5nXysuYcovqt7l0QzZYPqw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6954B108005C;
 Tue, 16 Mar 2021 17:48:08 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 08/11] hw/block/nvme: support multiple lba formats
Date: Tue, 16 Mar 2021 22:47:50 +0100
Message-Id: <20210316214753.399389-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
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
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im@samsung.com>

This patch introduces multiple LBA formats supported with the typical
logical block sizes of 512 bytes and 4096 bytes as well as metadata
sizes of 0, 8, 16 and 64 bytes. The format will be chosed based on the
lbads and ms parameters of the nvme-ns device.

Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
[k.jensen: resurrected and rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.c | 60 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index a082a7004d8e..00e8f6af2162 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -36,13 +36,15 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
     NvmeIdNs *id_ns = &ns->id_ns;
-    int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     int npdg, nlbas;
+    uint8_t ds;
+    uint16_t ms;
+    int i;
 
     ns->id_ns.dlfeat = 0x1;
 
-    id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
-    id_ns->lbaf[lba_index].ms = ns->params.ms;
+    ds = 31 - clz32(ns->blkconf.logical_block_size);
+    ms = ns->params.ms;
 
     if (ns->params.ms) {
         id_ns->mc = 0x3;
@@ -53,8 +55,47 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
         id_ns->dpc = 0x1f;
         id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
+
+        NvmeLBAF lbaf[16] = {
+            [0] = { .ds =  9           },
+            [1] = { .ds =  9, .ms =  8 },
+            [2] = { .ds =  9, .ms = 16 },
+            [3] = { .ds =  9, .ms = 64 },
+            [4] = { .ds = 12           },
+            [5] = { .ds = 12, .ms =  8 },
+            [6] = { .ds = 12, .ms = 16 },
+            [7] = { .ds = 12, .ms = 64 },
+        };
+
+        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+        id_ns->nlbaf = 7;
+    } else {
+        NvmeLBAF lbaf[16] = {
+            [0] = { .ds =  9 },
+            [1] = { .ds = 12 },
+        };
+
+        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+        id_ns->nlbaf = 1;
     }
 
+    for (i = 0; i <= id_ns->nlbaf; i++) {
+        NvmeLBAF *lbaf = &id_ns->lbaf[i];
+        if (lbaf->ds == ds) {
+            if (lbaf->ms == ms) {
+                id_ns->flbas |= i;
+                goto lbaf_found;
+            }
+        }
+    }
+
+    /* add non-standard lba format */
+    id_ns->nlbaf++;
+    id_ns->lbaf[id_ns->nlbaf].ds = ds;
+    id_ns->lbaf[id_ns->nlbaf].ms = ms;
+    id_ns->flbas |= id_ns->nlbaf;
+
+lbaf_found:
     nlbas = nvme_ns_nlbas(ns);
 
     id_ns->nsze = cpu_to_le64(nlbas);
@@ -244,9 +285,10 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_init_zoned(NvmeNamespace *ns, int lba_index)
+static void nvme_ns_init_zoned(NvmeNamespace *ns)
 {
     NvmeIdNsZoned *id_ns_z;
+    int i;
 
     nvme_ns_zoned_init_state(ns);
 
@@ -258,9 +300,11 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns, int lba_index)
     id_ns_z->zoc = 0;
     id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
 
-    id_ns_z->lbafe[lba_index].zsze = cpu_to_le64(ns->zone_size);
-    id_ns_z->lbafe[lba_index].zdes =
-        ns->params.zd_extension_size >> 6; /* Units of 64B */
+    for (i = 0; i <= ns->id_ns.nlbaf; i++) {
+        id_ns_z->lbafe[i].zsze = cpu_to_le64(ns->zone_size);
+        id_ns_z->lbafe[i].zdes =
+            ns->params.zd_extension_size >> 6; /* Units of 64B */
+    }
 
     ns->csi = NVME_CSI_ZONED;
     ns->id_ns.nsze = cpu_to_le64(ns->num_zones * ns->zone_size);
@@ -367,7 +411,7 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
             return -1;
         }
-        nvme_ns_init_zoned(ns, 0);
+        nvme_ns_init_zoned(ns);
     }
 
     return 0;
-- 
2.30.1


