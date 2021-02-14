Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC631B338
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:15:08 +0100 (CET)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQbb-0002cb-85
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPn-0004LY-9p; Sun, 14 Feb 2021 18:02:55 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:50557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPk-0001n9-6H; Sun, 14 Feb 2021 18:02:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 546315800D6;
 Sun, 14 Feb 2021 18:02:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aH9xi7VWrrqs4
 GLJIUI4fj5rxkAt521ZFPcd45pMQyY=; b=eWsMx4/iYTtiZEe8ytFYXixo+iURy
 Qr6/j0jq5pbfCl56+wdDcmm1yy3m7Szv5KAFkfZYwWjUjLlct+4v5v1jiksPcIlL
 NwMZQr/LCXurt1GCau6Gh0alvkMjzT5x9/fEk3G6RC7gYEYbZw6yvca+Kz0ao1aS
 6cpQykmFYr+QwFF8BexP2nJqnWD+amJXX+w0QEmuqyNIJFKVW6zeA0lxT+dzUVvc
 /rOBnP6JJOTJK7t9SYNaMTTE07WaH1Ex67U4qRPr7z+tc5QG1wh9vrg6Zmf7ecmr
 yC64t+Gx/EazJGs8aoxFSbp2brmXbMlQVNAcuFmcmZVylWbNmPGFvMioA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aH9xi7VWrrqs4GLJIUI4fj5rxkAt521ZFPcd45pMQyY=; b=GbF9h08r
 D/SB8iunLVbq2GLG+wmxy2eegLCKKZa4hDk8TkHBpZ4Bw8XvSqN2WmkyenwFvcsP
 JDzEuYGpt1J+aeS1q6Io2g2OshBpsYe5LNV0ACGEaxsnRZ/Y9nvMQAqCu3U6z6/E
 hCKczWwAFxljHl384Jl6jWIVf2RQBj0eKv2axft0fE+qVI0vHulbARatHsMkz8wJ
 5QdmFHgsVIbDsAwwzA+hDY4Jnrn2QKr6F3P3Q+EkaIaceKo73orizbXJ2pA8haWt
 y7Nxz0ubFzNaxygLh5auaCcURFVNGJ5LHnPujIhe8w6SlIOKccJbGAz4b2Q1bGJe
 pHd9KWyxUU+hEg==
X-ME-Sender: <xms:GawpYGfklqFlwBPOsXtFVcm9KOZZLUxBaC7tXEpZc4TVoISTR7t6TQ>
 <xme:GawpYAPmXYfcTEaeTyCo7DcS26jKwFNoulzoepEiQj5cJpL8BRjiPs1ZB309eSKgD
 M3qfcrI7zxQxK-sur4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GawpYHj5xZtbij8f4zMrze0WRDgawNAhJwATQBeTycWoiepVTq4qCw>
 <xmx:GawpYD908IBtp48RusIOMF-UZ7Xv1r42Nq639ikBHI5v1LBsFaSs0g>
 <xmx:GawpYCvdKfdSfBjzuAG-EwnSPtuNokUwVTRGBW9DmR2ygvpvsgf1yg>
 <xmx:GawpYAAwRlt2QPDzgYLlNmopxi-pHpkGaVbmcJT23CfmGBGMgZymQA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD89524005A;
 Sun, 14 Feb 2021 18:02:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 03/12] hw/block/nvme: fix strerror printing
Date: Mon, 15 Feb 2021 00:02:31 +0100
Message-Id: <20210214230240.301275-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing sign inversion.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6ed5fbf5426d..d73dac413d4e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1150,7 +1150,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
-- 
2.30.0


