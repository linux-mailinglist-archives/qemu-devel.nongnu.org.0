Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC1382839
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:23:52 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZTV-0006ca-Vq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNs-00039S-AE; Mon, 17 May 2021 05:17:56 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:42367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNq-0005fD-N1; Mon, 17 May 2021 05:17:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 82639A09;
 Mon, 17 May 2021 05:17:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=7yxlIrK8WMG/W
 p4gnG69hXRFctTV+BzKgdSeTaWQJ38=; b=UeSRrCtKHyWqEidTA17xUStj6KWCE
 hNQ5Q9g9uv0/xBzLUqcm4qzyymbLdxEUJXf613QI1NU/KD7AQ7hmnulavbOhk/ce
 E9e4jDuIvXRzCi0dqy4WaUut6ABx6hkEhQyOCOARl8vvuIgnHWLPIRG4naKM1kvw
 prcdRBm4P7MTNFFheDMXM8KIkmls/4ZV1ScSAfW8vqbbBR7/QDSYyVgpwWcaR0CJ
 9+UED0f0BlTiCMbA3RZM4pIBkGBG0BXiv8SgYUUPDEi9k2AwdJsNPob56HUqYt8D
 GZ7zj7GR5YVqDM66c3M7mWND+XS2UBiJ46PR3qqJ3TMSlt5P0JPCl6h1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7yxlIrK8WMG/Wp4gnG69hXRFctTV+BzKgdSeTaWQJ38=; b=N+RF4w0C
 4RcwIgSMuC/gg8g8/64oYT5ohBzVG8bxDsIhiMium8NTi62MPTtg+HbmodCxgYGL
 w1t449R5IT0NuEbn8qYZMKHnXzwMcTsPBad1hPZqpD8E2K5kMDkPJNXqQD0Zm2Ff
 ftc9j2Ac2DnBI1cwi18KJQE2kpwmUB6jF6vIHrTFYY67/4LP4RHNfIAkarmPImDH
 oCS9rNXibp0R578ZqwazdklpAY385s818byGSOBeqJOQHVRwoey+uWT5w34xQdYY
 MyQmPwq5GEn2uNuNnMeze9FkrfH6uZIdd72dx9XZk2Vllki18NrMeX/DuxZsws9N
 ArrOjEtIDp4kmw==
X-ME-Sender: <xms:vzSiYN0GFpo3T3r_9WtHF91Sd-xJk8j3X5WJaRAILpGJKKZv4y6oJA>
 <xme:vzSiYEGWPafQtOYTs_eondLLS36AcgsYIPMjc0m6tk_bAfxJGNpfk_m-bnM57Q2Tl
 0OZu5larVrnB1US7U8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vzSiYN63g2MRwz6duLiFpnOFsG8Hzz15mKS2LUfHgeYaDqc-n0d6Ow>
 <xmx:vzSiYK0p0v-sznuc5_oMNWD1ZrKyKcJkqN4qGAOHxIAYS9ulvg-_-g>
 <xmx:vzSiYAHxrGusN1DDRjADdLOE4-HmwbqxkdTtsobEHyC2JRHUVCJSUg>
 <xmx:vzSiYOZTKBTZuNsrbdEhJobbBIuT4e9fbMcMGgazm-DMX-TgYOIr5GtYcQg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/20] hw/block/nvme: consider metadata read aio return value
 in compare
Date: Mon, 17 May 2021 11:17:20 +0200
Message-Id: <20210517091737.841787-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Currently in compare command metadata aio read blk_aio_preadv return
value ignored. Consider it and complete the block accounting.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cd594280a7f9..67abc9eb2c24 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2369,10 +2369,19 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     uint32_t reftag = le32_to_cpu(rw->reftag);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockAcctCookie *acct = &req->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
     uint16_t status = NVME_SUCCESS;
 
     trace_pci_nvme_compare_mdata_cb(nvme_cid(req));
 
+    if (ret) {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
     buf = g_malloc(ctx->mdata.iov.size);
 
     status = nvme_bounce_mdata(n, buf, ctx->mdata.iov.size,
@@ -2421,6 +2430,8 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         goto out;
     }
 
+    block_acct_done(stats, acct);
+
 out:
     qemu_iovec_destroy(&ctx->data.iov);
     g_free(ctx->data.bounce);
-- 
2.31.1


