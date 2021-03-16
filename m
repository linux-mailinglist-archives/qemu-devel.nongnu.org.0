Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49633E125
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:08:51 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHru-0005AL-BC
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXz-00077x-Pm; Tue, 16 Mar 2021 17:48:15 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXx-000109-9n; Tue, 16 Mar 2021 17:48:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86B05580A4C;
 Tue, 16 Mar 2021 17:48:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/H6HKZa/P0P88
 Yi6XaWz3bOggBIM5Ew5LY537SqxRzQ=; b=xuijtmiGshwUghkx/cCyK+f16RFpt
 FUyTmT6FtQOH5r86oa9PUM87VuW1aFA3HkjoC21F6jR7dor5U76xz0oUFFDcGyta
 UdKoWzeNQSbiFoAkiqfxSIoNk0kV66qMebNm8BlAiXuIQAUj4ZdQRxGLX5ItX53h
 G/hs3/TGZ4lvUAmKojqxPgJwEHsMu7G+bnSVdMzVoR63tiETjYKpZjbJwynWfm0y
 k9hTJ604j+xgFgvxQTYgyPmmFyZwC/3AI5HoQCrfPK8oMf0LJWLRxXfOXIE03qzZ
 /dYimQzhhcEy/hMeGBRCcFEGI53cNJDJLQmIsUI5ZLWU87oKRYdf3aMlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/H6HKZa/P0P88Yi6XaWz3bOggBIM5Ew5LY537SqxRzQ=; b=V6idU0J7
 L8AmUiod9uHkXnOzx98NmYFj4rGlVRQS/iPmlS368Q6K0Zo+HTEuY35iKaP8Oe/8
 vaWGI5OUcbyNTFUKJFtGskWLUQ/1FvW+FOD6ge4uN+8mT/25a+biQnr5AtLpXCr/
 6VKnbPuYB7hH5w0lrshfVQ3OCIWk2WehPxQjU+nHWw7LCOz4LUaegHDgER4CeWA1
 1PK4wcczRuSS5yJZk1UVnXUXwK4CN8eIDobH84/ybvgD5NE+Nu9uz581SmYPwj0K
 NlJL8Kouh6C9aMG9JLAbpl2hR3rHfcw7QR4446GlbJET11btxteAzZQzOYt1UC/F
 y1SwIhTrz4tI4A==
X-ME-Sender: <xms:mydRYGhAdssN-zCifruxkPGnI7shIU2hmaNkqcwxI8bKpQro-eXGIg>
 <xme:mydRYHD4DLf0BbJYQI2r0gGl_sl3AuyMwg0CiYp1ci2VEJGwfS0blkFTwgwsg82KC
 NRCBItzlwvf90Ln_sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mydRYOG_WrZ9AVhoSJzgJ3vr8wrPAA5v2YPV5N2RCWTa6LWmUZwGrQ>
 <xmx:mydRYPREV3PH81h7j-Ys6Pmgc5rYSfxL7ng_ClNoK8i2ymNNcI7CnQ>
 <xmx:mydRYDxYT-mvxQVSia2l29oH7_-4W86Iln6K_enQoqkeViF7JLGFSw>
 <xmx:mydRYKliLYylV0Z55KgD6kmnDMvDlAPYfIf4-Zn8IEHllJz0YGeV1g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0749C108005C;
 Tue, 16 Mar 2021 17:48:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/11] hw/block/nvme: prefer runtime helpers instead of device
 parameters
Date: Tue, 16 Mar 2021 22:47:51 +0100
Message-Id: <20210316214753.399389-10-its@irrelevant.dk>
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
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for Format NVM support, use runtime helpers instead of
the constant device parameters when getting lba size information etc.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.h | 2 +-
 hw/block/nvme-ns.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index e2f53d999699..07e16880801d 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -138,7 +138,7 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
-    if (ns->params.ms) {
+    if (nvme_msize(ns)) {
         return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
     }
     return ns->size >> nvme_ns_lbads(ns);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 00e8f6af2162..7e3cba55e4db 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -110,11 +110,11 @@ lbaf_found:
     /* support DULBE and I/O optimization fields */
     id_ns->nsfeat |= (0x4 | 0x10);
 
-    npdg = ns->blkconf.discard_granularity / ns->blkconf.logical_block_size;
+    npdg = ns->blkconf.discard_granularity / nvme_lsize(ns);
 
     if (bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi) >= 0 &&
         bdi.cluster_size > ns->blkconf.discard_granularity) {
-        npdg = bdi.cluster_size / ns->blkconf.logical_block_size;
+        npdg = bdi.cluster_size / nvme_lsize(ns);
     }
 
     id_ns->npda = id_ns->npdg = npdg - 1;
@@ -161,7 +161,7 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
 {
     uint64_t zone_size, zone_cap;
-    uint32_t lbasz = ns->blkconf.logical_block_size;
+    uint32_t lbasz = nvme_lsize(ns);
 
     /* Make sure that the values of ZNS properties are sane */
     if (ns->params.zone_size_bs) {
-- 
2.30.1


