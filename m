Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0E358D98
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:42:20 +0200 (CEST)
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaXi-0002qx-Hl
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaSu-0001WY-41; Thu, 08 Apr 2021 15:37:20 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUaSr-0004hj-E8; Thu, 08 Apr 2021 15:37:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AC5C05C0069;
 Thu,  8 Apr 2021 15:37:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 08 Apr 2021 15:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=+dJNjl2llgVUS+I1mrTb1Spx6C
 fe8NsqxYmQ243Wchw=; b=0/+/Rp3buM+ihVlJivrzo1hUK+mSKimuS09h/dPGxG
 fEE5bq1yGY7LI4oMkFVJWpChQtg9aa9auc44i67ZwNXmCJvi2AV/QIvsBJfj2oFp
 tZ1gTwsNXucWns9QVY04//BZz53p9hw7IGMMSccsx3tu9j+jhGafFvvJIo7y4tNW
 m8WH+YOkSqE5svZKvV6Vc352OGE7Wv616AQVtF9Z6kK67IroRDmQfRbbSa3Rvlna
 +dNiJA0XbO+LQCWbPnTIyO/J4i4TUB+vOxuaNzzLNFNt2/j6aSCHodtIfUccu46k
 N3ZMQ71CxO7l/fpD3fXtU+8rFpJg07ntkKhIKffFLjug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+dJNjl2llgVUS+I1m
 rTb1Spx6Cfe8NsqxYmQ243Wchw=; b=Q9gnot51igJ3aewW8gaQ7I7M3pRZ8CV0K
 46nDzmvwqwDakMngvNa0IstdfGF0aOOyndPkahwTZe59zBSMXxMYmf6AIUMUgrNk
 mg8GK92RFBKP+U1asHDbfFPmRO+YpzaTwVJEGEVxMrBpJ9ujT8g9BsX3tQxEaa3E
 wzKa5Mpfj5yjPQkws75DRKmpM92WegSuTPxPoBpfdyqU+NSHGTY9ri6GVogqVrvL
 AYmnSUw9Eg1NqIOqftFmF9PcJV709VYG7oPameTPuVUDoISlwV8NNO9QkTZUhnP/
 oG+na6lpqT0ASPycLgGlaygN+Y3bEgRH5GN8qJoK6komoTSF7f9JQ==
X-ME-Sender: <xms:aVtvYJQispAf5gugwRt0PmVi1s8c6Zo_QhQiRbDPA5c0bxfj9xdNQg>
 <xme:aVtvYP5tbxSYK1SSqPZj5lTmfY74GJgmWrXiFg4DRPXVt_mD0pob9zs64WMNX0uet
 nB3toN3z6V7cSvFWno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteeh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aVtvYN1iaH7EtSVNLXhhoPq_RI8d6TrIe_uYFqoolZ0qqjqOpwmFIw>
 <xmx:aVtvYCDuObvdYP49S1t7ssSaFxNy8k8Zq_GbyBraCS6wSQzzzzZU0A>
 <xmx:aVtvYANljABLLc0njKTAtloZu3c18HU1Yg2AkJ2hhzeC_F2jkzFCVA>
 <xmx:altvYLSI4H4WSFoiXZGuzLLGEDdlIZCSbcIoNfQbyMzmzqxm64yG1g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74BAB24005C;
 Thu,  8 Apr 2021 15:37:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: store aiocb in compare
Date: Thu,  8 Apr 2021 21:37:08 +0200
Message-Id: <20210408193709.435939-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_compare() fails to store the aiocb from the blk_aio_preadv() call.
Fix this.

Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6b1f056a0ebc..94bc373260be 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2837,7 +2837,8 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_len,
                      BLOCK_ACCT_READ);
-    blk_aio_preadv(blk, offset, &ctx->data.iov, 0, nvme_compare_data_cb, req);
+    req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
+                                nvme_compare_data_cb, req);
 
     return NVME_NO_COMPLETE;
 }
-- 
2.31.1


