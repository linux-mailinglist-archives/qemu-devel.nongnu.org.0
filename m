Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB21416C77
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:03:46 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfFJ-0002jY-6g
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezN-0006Ug-Cg; Fri, 24 Sep 2021 02:47:18 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezH-00019b-OO; Fri, 24 Sep 2021 02:47:17 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id F0C13580E91;
 Fri, 24 Sep 2021 02:47:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 02:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ptJYS5dkz2j5C
 iXNGgqoPvtTe+U/smq025q84NGLicc=; b=JdA2dNHxBHzcKj3eoFo/a94Gu+cCA
 N4BZfHsnUJZO/RrE33AFGLsRyr21JWSQQGAgOD0Oss4Kf/gJTatT5RloFPLUY/qN
 6d3WpC5gMnAkWLqZW5ZX8lFatlKvwAi7nTeLvMEhWjyHXPBI5JF3CRZqL2kGEVcf
 arVRa/Ye3k/TmN4dy/vKIVfUmP7NILaRVc5NnzvMh4akjbBTuhxqKbeAlBlw2ztH
 PUnr3Ea7cORMG93Vtz1fH+cdcsM1nJFCLonvhx2UpVR0c2J724mW/e2/b8c87Ejt
 KxgU5DwohLTHhvbySm4SPoIAi04EkfcrLi70BGsbE2sFtJ4heYY7vw8Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ptJYS5dkz2j5CiXNGgqoPvtTe+U/smq025q84NGLicc=; b=RjEMaPc6
 6VnctlhF7F+/+SNsLFdElPMg4ocSjeWZknT3Ye3ruJk45I3czrhzRHdVu/5IomQK
 N9d8QzTv1UyRBOCURIzEHIEHs9l5ny/qT/yCn/ZHFo+8e1UtnQZYNQ/nqwUDRBrF
 73Kje0NMU4BDWx9CeFVNxJFD2w+Uf8yPHfLkAzXXzTQiCM5I9uYpPUwyLgBFnKiW
 WGvZhKAjh4f5s/EMexQAG8AYutvTKlKEJuJYaJTrjsB+JUvH/8I1i4bne9KJNyg0
 JqUJz0xaRbeelbH0M8ZL5+WcdRIkcKj99aJ5IElD/PARwzt5SMAovP+d3G+Kr5Y4
 sk2a9g1s99Ex+g==
X-ME-Sender: <xms:bnRNYYVBrzRQSnVcfeljphovqtq1mfVH470hnjgCSaxOOlaYtJRE4A>
 <xme:bnRNYcl_DuiiiYIEAb2ErItZCV9wW0c76Q_VugRYLXXSbHYL4NyWxC6OXWQiQ74kx
 k6AvGeyLnNurfK74Qw>
X-ME-Received: <xmr:bnRNYcZWp-cIN69SIiBLMQKyZbqhOEYgyyXpi0yNI8s7xX50rSsoipQC700MDBwMA0P7I2HEd0nXwOd5hicavWcVe6Robyh9Q3ZKSowx7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bnRNYXVCofGByMVr9bzBH_9Rsy9ZRB1TlwrKlIV0y6n_NR-3EwPJbw>
 <xmx:bnRNYSkufrloqNCTSP8myLZxiyvxG84moz83h0XNdAWDBcqG_FSicA>
 <xmx:bnRNYccZ5fRdrcAqY-YGe5UqKVvowHP4AeBfi6vjEMfOoeyjclke-g>
 <xmx:bnRNYbecYPDwyrVAsX32Y30HrgEwxfF-O9re_YfimL-xhJeb-5iuPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:47:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] hw/nvme: Return error for fused operations
Date: Fri, 24 Sep 2021 08:47:01 +0200
Message-Id: <20210924064701.283182-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064701.283182-1-its@irrelevant.dk>
References: <20210924064701.283182-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Pankaj Raghav <p.raghav@samsung.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Raghav <p.raghav@samsung.com>

Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPEC,
controller should abort the command that requested a fused operation with
an INVALID FIELD error code if they are not supported.

Changes from v1:
Added FUSE flag check also to the admin cmd processing as the FUSED
operations are mentioned in the general SQE section in the SPEC.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dc0e7b00308e..2f247a9275ca 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3893,6 +3893,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return ns->status;
     }
 
+    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
+        return NVME_INVALID_FIELD;
+    }
+
     req->ns = ns;
 
     switch (req->cmd.opcode) {
@@ -5475,6 +5479,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
+        return NVME_INVALID_FIELD;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, req);
-- 
2.33.0


