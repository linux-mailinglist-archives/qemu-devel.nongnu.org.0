Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157D2F9C0B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:52:41 +0100 (CET)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RDE-00034z-A0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R80-0000gw-BX; Mon, 18 Jan 2021 04:47:16 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:46517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7y-00011I-LF; Mon, 18 Jan 2021 04:47:16 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B580580573;
 Mon, 18 Jan 2021 04:47:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=v8707hIiWXEDw
 gwpH6+Wb8WUxY1vM+TNephduT/TCsA=; b=YxA5FzWvrJ5ud1v0WEUJaFxFgyiDq
 nvO9ar4cTFnZfx3oSdZLKfWAD6RfcsfNdpf6ay3ug0riZapQr8agT2Nv6DRiDJ5A
 LPqj9lBfWjW4j3sPRJE+bI4q8BnXxFwsucKNtp2NVRkw2BIEpCenR/+OAEdgUPGr
 NhvAu/NM0ZSiF7GXNdLcimv6ZS6TjF58dXP0bY6TAKy2MhN2Fp1QYNczrSxarKW7
 R0rf4A3TaDDQUv8Q/UOBiqvcejLiqzph8YHrmNEP8ea3Oq8BdRI8DoTxiAhNmVo0
 nuwf4K44yY4EW2eBEeDmq5vXfQcLnAx87FLs+Q6HBvGN4Eqnxgl3tgVAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=v8707hIiWXEDwgwpH6+Wb8WUxY1vM+TNephduT/TCsA=; b=UG5rCzp+
 0+npvryaGj6BpLcBuTqhRcZrLoHicC0Jxt4knTBdBHCOHUlVHGVfGJ/7JehVY+xz
 XZIlqjBcJM/jRWap8JDAA/qhAYu6RiiBhQeovTvYC0dSFM0y/crfU2wiFswMpJ5d
 08JkTGD1xDGv1CtDbmhNcDK1K9klYk9XUOYegHc46vaOeBaO1kYqaKDqY1l6xou1
 PLFDoZFHzkDl7JUYCnHjbARWm/BExNcyZkaIFujuCFvmY/nG+oVhDoMWMvztAh+8
 YA2CH8P7Yd2qtiIDJD8JZaE4XEa0yDwgD9c0z3Cb8uNIe3iOnHgOZnxhG+nn52WE
 vMsO4KWRVMlHiQ==
X-ME-Sender: <xms:IVkFYLAlbz49dVvvjq9ByAu3yhcHgOefxICI4jRZ6XLCz0YITWuT7w>
 <xme:IVkFYBhIZReR98XtPHwFkEcoJmEU9qnlbEUUFksifFQ7sOE66LLpwErFNyam4YRCb
 QJ57FPw_eGr7vAX4dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IVkFYGmaZTK-cmeQNE4XdMy0pKr7V6bnxpU997kraH2El2ji5SGG6w>
 <xmx:IVkFYNyArGnTjdsePXAeL9UJq9uSeXNo_-9mQ0g-5dwDdw1hLToLkQ>
 <xmx:IVkFYARKTMmFksyFXPizZV9YGt9mrTZ8lnWYf6kMfoCy-rHtdsQoZg>
 <xmx:IVkFYDHvQybkdlFRSsWgLeEWwsN6ZC4MOfHKLOtuneXNHBmkOn79yg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE6FE24005E;
 Mon, 18 Jan 2021 04:47:11 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] hw/block/nvme: indicate CMB support through
 controller capabilities register
Date: Mon, 18 Jan 2021 10:46:56 +0100
Message-Id: <20210118094705.56772-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly
reported to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Reviewed-by: Maxim Levitsky <mlevitsky@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 10 +++++++---
 hw/block/nvme.c      |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 45b2678db1f0..86d7fc2f905c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -36,6 +36,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -49,6 +50,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -78,9 +80,11 @@ enum NvmeCapMask {
 #define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
-                                                            << CAP_PMR_SHIFT)
+                                                           << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
+                                                           << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
+                                                           << CAP_CMB_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 40b9f8ccfc0e..606006c549bc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4336,6 +4336,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI_SUPP);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


