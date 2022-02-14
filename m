Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D24B4433
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:34:34 +0100 (CET)
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWob-0001Sl-Mj
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:34:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPD-000373-Az; Mon, 14 Feb 2022 03:08:19 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:48021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPA-0007WF-LU; Mon, 14 Feb 2022 03:08:19 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 02610580299;
 Mon, 14 Feb 2022 03:08:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 14 Feb 2022 03:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=cOflEPnncivYUW
 RGbT02cDFj2BD4jaUZvoqM6s7ofIo=; b=IoSD7MAnSTCmh38l7AjVQjC6DXsUNL
 uWzixa0k/DKqtCs1F1PsebjIHz/+kOGpJDinf7PXE37rMmN09dIv9TlhCIlrvSBh
 jNHoTt854G9D7lrAvLq8C6ZDOututQ7wgWHVgaNGzR8Dfa0A9TTKUP17DA+gZAJJ
 40hiHPTZVIMIsWp+C5mQz/ivqtKHsPtp06V9pbeW5AingBi7GuP3kLd5JhaEm3eu
 +MY8s06aJlMIqtvfwwkNEtz8lSirrpgsMJGhGdI+HUvJRe8uvOCo44ZYxQwl6ET6
 2BQttF082yc0FKBBRCbyTdpR6RtOfg0jl5jREH/QB04HV2gjjLCkgFng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=cOflEPnncivYUWRGbT02cDFj2BD4jaUZvoqM6s7of
 Io=; b=aAf50NGSP7voveQo9EkV6VCUaQc+MpI3huLLmLNzuk3NFPwyU26Q/W+Gc
 SA6aYgfTC3vAovMgaE6zSYNYkWj0nTHWH3JeDNvlePp25VYEDGsUoAq3dwnXSc8S
 TZtvxfB0pRJ8LV7rALjczgS8CQMnm/OlAHuZq6HiQPb7A/b5Wp1MxuSF1Fle25fd
 G55eHBfSjxTeNDuyT1KvqmltCSwZljvYS1GHSrhI36sjsRTpWRZkoNCyeUUpZ1rV
 4uybIm+uyf5XYoAe9o5cX3KxQH0fNSLpXgdzhljVKlKYLiHzKiJU2xR2BU38qSr9
 lDoPZiLUMiOC2GNU6YqliwVcjpeHQ==
X-ME-Sender: <xms:6Q0KYijR9q1uDIkkZ-fEcrOoAj3JXdVewnnC-rs3RhDKPyfbkpN18w>
 <xme:6Q0KYjAa15pFt9dAYsWCnaG0_0I9X9WN9hSb9cPsUsIpNkVyRzH7aQUK7cQ2U7AXh
 IxBh_kVyVE9mpKvcw8>
X-ME-Received: <xmr:6Q0KYqGeverFz1FA2Zdgx4Ofv3IVqCJv9fI6_Nuol43RD-lRZxjjzrWDZq_04BH_Dn4Sull0iIIkjjwSUM6xXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteevuedugeevieehgeeileeufeetvddtkeetfeelgeehudfhjeeuledvhfff
 tdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6Q0KYrSckG57jgykPsThAO03a4MkTgc5ngTZZu27zzn3o2_L-P5FXA>
 <xmx:6Q0KYvw0kMpT3mgvYtID-XCIHh6ogseNxK5ION3Sxexixkw4HuFDVg>
 <xmx:6Q0KYp6TN7A92-Io1UlQlqzyvoS-U241TeQPIcJBgmtBFoJgh0fz0g>
 <xmx:6Q0KYkr-naGpNdP1nq8qjCyBbNNJTeLH4YymqVRonCaR1rTOQb-SOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/6] hw/nvme: fix CVE-2021-3929
Date: Mon, 14 Feb 2022 09:07:56 +0100
Message-Id: <20220214080801.13627-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
References: <20220214080801.13627-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
device itself. This still allows DMA to MMIO regions of other devices
(e.g. doing P2P DMA to the controller memory buffer of another NVMe
device).

Fixes: CVE-2021-3929
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1f62116af985..37681a975986 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -357,6 +357,24 @@ static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba);
 }
 
+static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi, lo;
+
+    /*
+     * The purpose of this check is to guard against invalid "local" access to
+     * the iomem (i.e. controller registers). Thus, we check against the range
+     * covered by the 'bar0' MemoryRegion since that is currently composed of
+     * two subregions (the NVMe "MBAR" and the MSI-X table/pba). Note, however,
+     * that if the device model is ever changed to allow the CMB to be located
+     * in BAR0 as well, then this must be changed.
+     */
+    lo = n->bar0.addr;
+    hi = lo + int128_get64(n->bar0.size);
+
+    return addr >= lo && addr < hi;
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
@@ -614,6 +632,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
 
     trace_pci_nvme_map_addr(addr, len);
 
+    if (nvme_addr_is_iomem(n, addr)) {
+        return NVME_DATA_TRAS_ERROR;
+    }
+
     if (nvme_addr_is_cmb(n, addr)) {
         cmb = true;
     } else if (nvme_addr_is_pmr(n, addr)) {
-- 
2.35.1


