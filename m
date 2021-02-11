Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20577318B40
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:58:22 +0100 (CET)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABY5-00052h-1T
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSK-0001nw-Jo; Thu, 11 Feb 2021 07:52:24 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSI-0005Kl-NW; Thu, 11 Feb 2021 07:52:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B9CFD5C015C;
 Thu, 11 Feb 2021 07:52:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 07:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 AZ7m8wOpSo79naj7Q1m+2fHutdfJi2R+FT/lvqMztRY=; b=Td8wk9nZx4kTSPDe
 wrOY/cJxIbnnTkXsZqNJCISpQ8bf9asBVWvHocl0xhF00c2wdFOKsJ0BHqO04jau
 SSr20i5htZy24F8E3Ia2kOZZO5awaSl6+DMqR8FzN3t3++nZXqnOvW4ViTealWX5
 jZXRNmBecf+1/kzvFo0BwjbraF2Ug4t7QdqZqHqMPc05EBkNe/CMqs5cPRdOLPME
 DZmOlSrI6BkNK2mzKT72eyxg61cyXdm8JcWdzpTTvRPRrBRbRDP5hlFCxMh5hZLc
 xbIl2AiWyM4Zae+TnNAZglYRqmQLI15hWRZrSIVXS+RkVC+VZBfQWs2I9adff6s1
 8nioDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=AZ7m8wOpSo79naj7Q1m+2fHutdfJi2R+FT/lvqMzt
 RY=; b=XiqZxbTiKwsIcHcMCbE8HbRFgiQj0X6vjc7qczR/GEtyldluoULrYA53G
 j9w2ayXoQhQDf+H13Qua6RPL5OUhIRvK1GvdeNeVHGp7ac3mAyeakDVQbg4xhuWM
 tHZrT0X0H3GVleNiXP4vA4ITDTFW3u5qADOc2iPgFHTlnyoU++bKoldfyD84c2cu
 VZYyL/X15lxYtQx/FxvMwbwVwacnrRzaT+ZC56uLjRRugFuj0ZnNOabUrsCvTEnc
 agrZxLIX70GhCZerhOw+GILXAXX133mFfCeWgnHbPNip29etD1KD72PdWUDWsOLJ
 F2m3VJ0nkR/Pj5jynrGJ8H/wbsJ+A==
X-ME-Sender: <xms:hSglYF7_PcT9vWuHtxRBzVzLEDQGE_VJFdL90ai56SA7vqWIf135nw>
 <xme:hSglYC5Lcnj5j9CcUfnv-zt4RoSWU2BSqljA1gosnT3dqKxSgilQutOpknzn5_knu
 ioVVV4bOOIyMU1wxis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfhffdt
 geenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:hSglYMeu_SHPpV1f6-sbXYvA38sQY2PFLpJTq7qAnBKztnuywmp22A>
 <xmx:hSglYOKgYVr7ypED7t2A0DP7pDmAX1FfnN9oMtYGHx6bO8OjibH4dg>
 <xmx:hSglYJJQuLr5gP5PkRYYfG1pY0F967V0ODcgUxxVWWKI9RxjeOdi-w>
 <xmx:hSglYB_4wfEMJEV5QR3pW21oPIOl_YFxCJ2rPjhv7ab4Vv3mUfXwpw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2581D1080063;
 Thu, 11 Feb 2021 07:52:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/2] hw/block/nvme: Fix a build error in nvme_get_feature()
Date: Thu, 11 Feb 2021 13:52:15 +0100
Message-Id: <20210211125215.985593-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211125215.985593-1-its@irrelevant.dk>
References: <20210211125215.985593-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Bin Meng <bin.meng@windriver.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current QEMU HEAD nvme.c does not compile with the default GCC 5.4
on a Ubuntu 16.04 host:

  hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         ^
  hw/block/nvme.c:3150:14: note: ‘result’ was declared here
     uint32_t result;
              ^

Explicitly initialize the result to fix it.

Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d36e14fe13e2..31295e5eeb84 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
+        result = 0;
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.30.0


