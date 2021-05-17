Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36F382833
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:23:15 +0200 (CEST)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZT0-00067w-Af
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNp-00038C-MU; Mon, 17 May 2021 05:17:53 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:53661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNk-0005d4-9m; Mon, 17 May 2021 05:17:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CB08D31C;
 Mon, 17 May 2021 05:17:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 17 May 2021 05:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 k7rZyY/ehsm76dqiclnUuMNxHOPubh0CKjvZwwDEuRk=; b=BEvU5V3nUfDaoIRS
 FQCq8i6LGcatzqdD9foq2lXRF0LMAmmyfgwqZvNkaO2+sVIWP5LL1okawkPRX24o
 2bvT5slzQ5GBksqQVDHtOs30LicdIdXYDCXa51KEA3c0Q7r0DqOuPUnEov4eiHt3
 hFz2/5AUywvi9l4KBLkS36+hsYAXSyfOgJPYoIOVX3NVmUgJtptCaHLlRTCv8tuy
 N6KqNHj/OFnFC2vxzkVbE+qmcY+g9j08di6LlgcDRdOVrICv8iZdDcsVHZ5l/MMW
 KAEm8zW64Q3F2G70rl74EEr483tG+iynCp03myBh1SWZrrt8jKW2gGBmex/Ncfp+
 sGt8sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=k7rZyY/ehsm76dqiclnUuMNxHOPubh0CKjvZwwDEu
 Rk=; b=T/lDltB/ArSs1rjduyZos9/mTtadFMi4pSTqUxiKAoKpRx167knM0gbrB
 w8oWUbcYOjaCUnlXuheH9m8PvlGBNODzwV2TmfGCEmCNZdWJoEwm5k/sjOsvcRA+
 olCxzz42MHlXZVUQIejS6Div0qJUeU2KC0Py/z4nFFN24FmptUiYsbvB5HX642HX
 7opCAoJKLfoRzz/r8d/ytFu+Pn4dCALZC1OJIykEHsNSrorBOAczXt2bNNWLf7qF
 kYMFTvekj1Y+l3EIe0KTnvLfJu3MhZWzWj4cB4Ke96zg82Pj7zSvQoOZN1Rkw+nG
 SFYiiSQ6rsLLpgu594opNRG8ehGkQ==
X-ME-Sender: <xms:uTSiYDjNomFy17WU_3u6APtnJVBAo-Yy_ih2AKxE7jB_FPv1GTgApA>
 <xme:uTSiYADNR97df0N70BjUdu5vVMdknHTiSDYEJZmw-trjAKiw0rYvLPjDiEgiMW7_2
 T8gwLQ3hKIjAITBxjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uTSiYDGhIBoQFxLUIKOltmu_xbZVhhpqUaT9sWfPL1i0WBXjyfhdjw>
 <xmx:uTSiYAQUxswdZprEXqwSv4KiFSQeumTLDpEVtUKQECVl9JmMWDcKRw>
 <xmx:uTSiYAziRU7aGBT8HK4k3zkgNIV2mLYUMo8Xz6Q66Si2g5z8wLimTA>
 <xmx:uTSiYMc9WDnAE98gMkF8Kw9oXF9N3WapF21e4fLP6gITE5idoiMoPnjtVNI>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/20] hw/block/nvme: remove redundant invalid_lba_range trace
Date: Mon, 17 May 2021 11:17:18 +0200
Message-Id: <20210517091737.841787-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Currently pci_nvme_err_invalid_lba_range trace is called individually at
each nvme_check_bounds() call site.

Move the trace event to nvme_check_bounds() and remove the redundant
events.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[k.jensen: commit message fixup]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34c5..cd594280a7f9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1426,6 +1426,7 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, nsze);
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
@@ -2268,7 +2269,6 @@ static void nvme_copy_in_complete(NvmeRequest *req)
 
     status = nvme_check_bounds(ns, sdlba, ctx->nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
@@ -2530,8 +2530,6 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             uint32_t nlb = le32_to_cpu(range[i].nlb);
 
             if (nvme_check_bounds(ns, slba, nlb)) {
-                trace_pci_nvme_err_invalid_lba_range(slba, nlb,
-                                                     ns->id_ns.nsze);
                 continue;
             }
 
@@ -2604,7 +2602,6 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
     }
 
@@ -2689,7 +2686,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         status = nvme_check_bounds(ns, slba, _nlb);
         if (status) {
-            trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
             goto out;
         }
 
@@ -2818,7 +2814,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
     }
 
@@ -2938,7 +2933,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
@@ -3018,7 +3012,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
-- 
2.31.1


