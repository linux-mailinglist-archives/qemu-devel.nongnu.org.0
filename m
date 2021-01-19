Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948F2FB557
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:27:58 +0100 (CET)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oEu-00083g-TD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2i-000244-57; Tue, 19 Jan 2021 05:15:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2f-0004Hd-DC; Tue, 19 Jan 2021 05:15:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6CE35F52;
 Tue, 19 Jan 2021 05:15:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fOfhpOWK82RFU
 pD3zrzcNzDbzvNFbRcsvEiSRn5LJ/A=; b=h7sjUQS95mLWuHKFDmMgFuiwJQOUg
 mNZy8Bsk7ZgSaSyMamTELQMppcNT+gzsgqVcfABSDUJJe1+GbklvOw/lVK13BSHA
 A1EECbCYR2abiNuZVcdamHT3gcn0YRniIbJxTMkmLFOcCl4MAhRbhrImqlWckxNM
 GrWABrEIEWzT7HB7O3PUltD1z8z/JZLdI+9ofaYrW6A5vJsLAuqSzfQHUPtSuLfj
 R8AeRe1yVmeW5lDXjSz/9dtZuXP6736e0lMeksgF12N52yJHG1rLNklApgyHWWZu
 5YcMGbWtLw57yYzkwXO5Lrq1mb4JxrmKQN9/fR6PYuUmVRnUCOY8SCnyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fOfhpOWK82RFUpD3zrzcNzDbzvNFbRcsvEiSRn5LJ/A=; b=EmposOyR
 EeoIJdXxR6SrtRBw274RrdGGnChjx9KQcCbTLd9mJHl+npTY9pc/tZict6hGv71Q
 UmcLFXdAQurZOHXALhW7oVRpvOnKnqR0FwGhd9Gqf3UaoAAkx8WtO7jAaVKIJVS1
 wiG5sTefa8LKWt1B9Hv9lfx1vug1LyTpLnw5AYqdMFusOEy6E0aObM/KW9Yb2uFX
 hkMmKocI0adqDAVmh3r4UDId1CqaF65WrJ7UidZ2lx4sUjCt3RwMOVMCOhidxbZ2
 QqNXzXRWksPIHKM+4A9g6eRQV69Yt7fTejxJW8yC6lFSj0N3gZH7G+Vbo/h9eW8S
 WD5MX3TZJ1t0HQ==
X-ME-Sender: <xms:MrEGYPjOnisBTsS7yfCu5Wc05viOMX2MLdu-ptdqT0ty9TQFmWjVhw>
 <xme:MrEGYMALJ2XpUF91rpkQqrsdu1dkSJnZspOqHE9Sl2uSoSPlTleRkHNCluuz7L8ud
 47ieNXJrsc6LakX3oU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MrEGYPHYjnIfXrW857qi8s3KCBp4D9Hma63fwYV64xlvkL7kDAp9Qg>
 <xmx:MrEGYMRQyl761NNrbIjwrOo1gUvzQyL6faxwdcCnuwMJl_kFkfeSHg>
 <xmx:MrEGYMw_qMmJ9YdSpoLlRaKmQnsuSGC1TakhT9Gap7oViLsHuViKsQ>
 <xmx:M7EGYPwFa0Igg9r-9hq2Lk80YzFHhackHIbMdCZoQ3cRvecvotUrlg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AAFB240066;
 Tue, 19 Jan 2021 05:15:13 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] hw/block/nvme: allow cmb and pmr to coexist
Date: Tue, 19 Jan 2021 11:14:57 +0100
Message-Id: <20210119101504.231259-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With BAR 4 now free to use, allow PMR and CMB to be enabled
simultaneously.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 65813f6461cf..e4fb89c88e23 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -29,14 +29,13 @@
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
  *
- * cmb_size_mb= and pmrdev= options are mutually exclusive due to limitation
- * in available BAR's. cmb_size_mb= will take precedence over pmrdev= when
- * both provided.
  * Enabling pmr emulation can be achieved by pointing to memory-backend-file.
  * For example:
  * -object memory-backend-file,id=<mem_id>,share=on,mem-path=<file_path>, \
  *  size=<size> .... -device nvme,...,pmrdev=<mem_id>
  *
+ * The PMR will use BAR 4/5 exclusively.
+ *
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
@@ -109,7 +108,7 @@
 #define NVME_DB_SIZE  4
 #define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
-#define NVME_PMR_BIR 2
+#define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
@@ -4092,7 +4091,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (!n->params.cmb_size_mb && n->pmrdev) {
+    if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmrdev)));
@@ -4189,9 +4188,6 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* Controller Capabilities register */
-    NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
     /* PMR Capabities register */
     n->bar.pmrcap = 0;
     NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
@@ -4292,7 +4288,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
+    }
+
+    if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
 
@@ -4365,6 +4363,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


