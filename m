Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884083563C2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 08:10:58 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1Oz-0005KX-FT
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 02:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11j-0002EH-6X; Wed, 07 Apr 2021 01:46:55 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11g-00057S-5y; Wed, 07 Apr 2021 01:46:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 022205C0117;
 Wed,  7 Apr 2021 01:46:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Apr 2021 01:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=m4zssAaPDs4gc
 Hy6p0aY+ZOL0+f4nd8B7oTmX+tpuM0=; b=I1QoRYLScsN6uArxZP6k4XXQwWOMU
 zQTWdpwGOg1NjYz13yvRi8PWALxJ/C72H0JYS4rJZyaPIN9U53fMbZ4k5gZbH8ng
 D1I3nKNXJ6HnQQWLqIW3sWil+4rmKMGgLw7uzfggKn0e7vPE02VijIw2qOHUWy7+
 UHu/9/EUDRs33fnBd+jX2CY2E5HbjOe6lgeJ8cuqjUf16tTDevemGZpbUiBy0gMI
 cBOrBaK7fn9hA3oFTk8NAGHHbuZSt4jZDw42KZdtEwb+aYcnDSKJKneDsgpFeGKo
 +ORn09ymIbc7Sv2T2gY7JR6b/cnxMLHbTap4tIfU5oyVgzXIq/pPGc9jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=m4zssAaPDs4gcHy6p0aY+ZOL0+f4nd8B7oTmX+tpuM0=; b=CV2mpk7N
 CPctKjBjQ/dcahiMXbyjbsOPPDIrRU4G1u2p0Ur477Gh3ZbiCJDCEa9MtezkVJfA
 XewNs65tW0goZXh2uJIzsdo+Ax9AQ6hkTSC3BD2X+inQ5Pyw5h99baQCPpfO2YYt
 K/YzMVJodZ+xSyPqgmlQmkDTwSF1D1BLlVqpH6jsR1C9rZ0NFnvYPumzdZz7DjCY
 ImxVZKVqy3EqjT/YfRXhmNOP82fW40CXCSrrGGzUYOMGWJqziqLtrve4Z/AIDtOh
 cuQMauXy2k0POGNwb5rsMLXII2s4kU6inLvg/lK88QFopIrL4Z26uIpkkBgOv0UA
 A1L1X/El2a+o2A==
X-ME-Sender: <xms:SkdtYGlcGpdRVpCBLPh40GWek4kij7owIGbp572mrrBTg5K8VcvprA>
 <xme:SkdtYMOYfpcEOdq3R3tkQuDmGsMyx0RnvOduqzFF_kDhp6HKwgK2rOgA0QnY-PZng
 3p5WyGsD_89c-RVprg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SkdtYAr2VadLCgA-kBtZfRoE7HlJ2_4_sC1b2htT60vbmamAjyY3Gw>
 <xmx:SkdtYNtUOrhDhphIJ1sz_8jgLmK6sRcS7co3J5pfhqNn5EdufsOJng>
 <xmx:SkdtYM4EwQbz9uIrjc8zvyMMakGJMoSSFJOGrBC-ls3sVUD60lZppg>
 <xmx:SkdtYOTyvMmDVDdRahAxmk69quHKbAckptDsdge_O4Bb3c67D_xFyw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A059E1080063;
 Wed,  7 Apr 2021 01:46:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 08/10] hw/block/nvme: fix ns attachment
 out-of-bounds read
Date: Wed,  7 Apr 2021 07:46:33 +0200
Message-Id: <20210407054635.189440-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_ns_attachment() does not verify the contents of the host-supplied
16 bit "Number of Identifiers" field in the command payload.

Make sure the value is capped at 2047 and fix the out-of-bounds read.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d2dd82496790..87891d4d0f3b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4920,6 +4920,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
     }
 
+    *nr_ids = MIN(*nr_ids, NVME_CONTROLLER_LIST_SIZE - 1);
     for (i = 0; i < *nr_ids; i++) {
         ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
         if (!ctrl) {
-- 
2.31.1


