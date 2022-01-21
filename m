Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC7495C92
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:14:12 +0100 (CET)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApzm-0008H1-9X
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nAnTQ-0007hD-DC; Fri, 21 Jan 2022 01:32:36 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nAnTK-0001Tb-LM; Fri, 21 Jan 2022 01:32:35 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7254D5C00A2;
 Fri, 21 Jan 2022 01:32:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 21 Jan 2022 01:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=ZtxJdkTPYVR4wsDP2enc0ACEPiBROQO8tatFvc
 EbkW0=; b=YWyMjX/ZROTAddFutUgMC+wW4zw3Gm2a7bh8C+HxEi7bP3WqmHBEZf
 39+aKmxoDJErvV3hJpbUPy/GKBwRwmWFEM3RkQ0+xSPr7psEiSTguEK54oNsBr0Q
 4carqo4ldoR9thvEvmvSlA7ID9XamKuusEZ8R1Qf7yJKcEB/i6K6TVgQbgVN1kyR
 q7kvErAuOh3PUg/fsolQLf9anHnSL+R1VG2XxCqxhERiIBD7MRamamtgYxQvogeV
 Ep4iH+0qGPJHmQ1j5GJuusozOzEC7OxQLa9pI+0uqIXSUmmcBmGt1o3PNSS/VYvK
 /6eIBeh0lfxF1W/4OiPFXhuOgrk7dUsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=ZtxJdkTPYVR4wsDP2enc0ACEPiBRO
 QO8tatFvcEbkW0=; b=lJRVuAVF+2VYDs1yDgvYmeRfAjRt/WyRvgdjIL/aOi4aC
 x02Z4ISSK10GMrizjZ3uNHF6jbXVJIrv6IOriYoO/oEvZpazCdt6nj9LaXer3qlK
 4MDg9EOYS+7BHlZHwlW2cpReFdww8o0ZKnLZMh63E42K9v4o0DN3Ad1/Sfo+5OMf
 oLHH7Yu/Px6MxQXggbQDT5E+0fSIfLnyKxW6NJhV0GsNYJMX83Ce2n/gQIv9ZYYM
 u63DXItLnDzVv59dxYzxKtxbj1yzMRxhjYHBRRFAHLGpCI6Y9SRCHP3+gCeu9Svg
 gyTtGxupAKihFBI/wM5Xfr6w1L0dKU6Nx7HlPemfQ==
X-ME-Sender: <xms:e1PqYYusqAB7cVXK3csuZtnGlHr4mfVCzTrMnBk4ypjQD8mjmkqz4A>
 <xme:e1PqYVd18LRvqHwqWmXbQfn5OKRvbLYRUr9B0xDsCtA12hGGYXyYGYlPothciy8Hj
 8bgcV3JEvydyxnu2WM>
X-ME-Received: <xmr:e1PqYTx4Yqm4zbRNAn4haLEAJ-gN17B-9sR2YJGEO-SCY0wEvTdmSJomH7uPoRhV-IClWRjqNgjfPc8ZeobFRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesih
 hrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:e1PqYbOFJru1B6s9979Dgo5IjXcgoTc5c78cLpLR0HUmKuSBzzCbCg>
 <xmx:e1PqYY-DzQJItQJQ8b28rwSRd8nc6jzy8vFB9Q8be-RVCmqTO2Kcxw>
 <xmx:e1PqYTUabqBpXifuTVUDiMb34piFWis8cKUXzwu2zY18d9evaJF6vQ>
 <xmx:fFPqYXl4wH_fdQj0uV8X3ybtVSTL05yc-854hG6tFDyLvYuz_zIU_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jan 2022 01:32:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/nvme: fix CVE-2021-3929
Date: Fri, 21 Jan 2022 07:32:25 +0100
Message-Id: <20220121063225.312603-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
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
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3d..eda52c6ac74b 100644
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
2.34.1


