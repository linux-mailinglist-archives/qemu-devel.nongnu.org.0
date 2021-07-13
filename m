Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26623C69E8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:48:53 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3BHo-0001hZ-OU
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3BDF-00009C-5n; Tue, 13 Jul 2021 01:44:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3BDC-0002lD-Qy; Tue, 13 Jul 2021 01:44:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C0F955C008E;
 Tue, 13 Jul 2021 01:44:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Jul 2021 01:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=rEjNvyRaEr7PJcFfbAVRq/JGo/
 Fns0xXcb5py0LYvt8=; b=iH25ZieYfDCtR1TEq1J6YaUrcczYXAFDrUmBc4VXq+
 dyt+C/8EmTFbR/NLbAZZX5+URBJpPgSXigRd3yxfm94ArsaRgDiMZm0UySQ3t7GQ
 ZMYPU9U8/vRxiwdiBYgrTo1PPGQpISXfnxXisps0RYzH7d+K60oZn77eDCcc+fei
 FTsGLNQZR0xVwqnQMk0w/EN0nORWSJN251P95OQVw8em9xfZw9v0l/a9HxUCsDkm
 uILgs+1GVPKUneacFAzXWNSHyb7xUiTzVDPekv07AVs53X4qAnZg3vPBGQ/EWdpb
 uQmILCberwLkBJbQM1cXK0nSVJGD1cRcI/sU/ZAteFMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rEjNvyRaEr7PJcFfb
 AVRq/JGo/Fns0xXcb5py0LYvt8=; b=iZL7vr8phZy8ljSj1Y2Sr0PN110wnentn
 aTWmfNH5mPrgJ2cMnDcFlbcaSKFeOtTo5z0EkYn1KhKvlFJnQ/JuV/4BkmQwxghz
 FijXiUG3A2R4XidAvOBnCSvFMKm8XWLcYhMsnmj4vKNNN+UK2FBZNeERM0j5aYmo
 oSCEeVZ1Onca+drRQ+PlKkMx6aZ3jbPSKvt1fILsHtmsHQEvWGKmgoJqnSazVjCd
 KR99dph8+Zc9C25HilVFmZmmx1nMmkVt3JE4xYovVuuwuMnnDDhkWj07de+YZh7I
 ejTf6cGwYUgLL7s4tbZsucBXXnrq0D5w05rKL9gPf/RUNmSe4NDuw==
X-ME-Sender: <xms:IijtYAiyXPAHOXMXtLBCdezaWIArQ0kk1egHs-Jzfz428kaUSWHC0A>
 <xme:IijtYJAZwfYxZryyB9rTqK7mEQXnBZyaHm65xaA5MrcFxvNG8CtpwJpFwIubXpuCO
 BAJynGWafpl3IivvtE>
X-ME-Received: <xmr:IijtYIGaT_Wi8VWOpIpOMuRQQFkm77iPYXwin6PfETM5Wf4EmuVOFnImsnoy_MJ8lr1GDd1GWjr2SO5Oav3oeyMN_DBF0ZwUBA3WAmWcxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesih
 hrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IijtYBQbhImUb89VrU5fjhrXZelyJpG-vxt4IF8qKAOOaAf3uHk_Uw>
 <xmx:IijtYNxDR8j88UYJQC_TsazShUGuhmAScTq01CkfiblSxlswmAmEbQ>
 <xmx:IijtYP4oBiXGsYaS4TtZznKbOCQeyRfH1ZIiKzgpfqjiOYY40a6v8A>
 <xmx:IyjtYArgQO5DN9KzwXxPwL_G4bk_6QlXcvvX5SuaEyys6tOK4bcPxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 01:44:01 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix mmio read
Date: Tue, 13 Jul 2021 07:43:59 +0200
Message-Id: <20210713054359.831878-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The new PMR test unearthed a long-standing issue with MMIO reads on
big-endian hosts.

Fix by using the ldn_he_p helper instead of memcpy.

Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2f0524e12a36..dd81c3b19c7e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5951,7 +5951,6 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
     uint8_t *ptr = (uint8_t *)&n->bar;
-    uint64_t val = 0;
 
     trace_pci_nvme_mmio_read(addr, size);
 
@@ -5977,14 +5976,15 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
-        memcpy(&val, ptr + addr, size);
-    } else {
-        NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
-                       "MMIO read beyond last register,"
-                       " offset=0x%"PRIx64", returning 0", addr);
+
+        return ldn_he_p(ptr + addr, size);
     }
 
-    return val;
+    NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
+                   "MMIO read beyond last register,"
+                   " offset=0x%"PRIx64", returning 0", addr);
+
+    return 0;
 }
 
 static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
-- 
2.32.0


