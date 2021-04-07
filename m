Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16D3563A7
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:59:43 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1E6-00013k-6D
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11e-00029c-0N; Wed, 07 Apr 2021 01:46:51 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11a-00052t-OO; Wed, 07 Apr 2021 01:46:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E52E25C00F7;
 Wed,  7 Apr 2021 01:46:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Apr 2021 01:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=weMSRVXTf60n3
 ESV7JtZnQQPeh6az/lUiqnAZxFrNPQ=; b=TiWZJeADYf6s2MBPv2emc7/IG69zV
 +aaAIPX4sTrlyTB5ASuzmz/0LCI8g8ZMu8MEN3YEpmSThILvqqk/lrXfEeEzUpDw
 esolFX8Ja6+/LQS0YcLnlO6uXrq6t7TUJAFdKIUf+m/lC/MW2v3rroI3z3GQvV78
 9OrXHpQ0xhWNbb0ukWWTNCZBNif9lGpEt1WqGjPUYzIYtVjP0zj3uGwjXmOQlvJK
 8OhMOfphMgU0vyMT3/57McjMyDXKGQYxE24px6/ZMC++MOjvjFM5by+mH/jPFIRl
 EcHvlCWSG78gggOxXq1+4TyHuot1h+XZDW3YqAci1Oquaext1bEfXimww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=weMSRVXTf60n3ESV7JtZnQQPeh6az/lUiqnAZxFrNPQ=; b=t1LPPQYQ
 Q87ux1KfkWaUqFHNIiTOvbfwVDmx6tNh9rXsJwJ7hl4us7WPPeDDXyUj1iQmHpXS
 5f6o4oZwgTY2ztD6kKfwKRgAuBcZ9xcdJokV6jwUVuojJL0lk3xFvMmOS591DZIT
 jsxtc4DKZO3SlYkp+XQumtq039mLNeLeOUuaRsvfDAkBtSp3M1BtvwaGeEXVCvh8
 b47tHPXkBqpK5P05+Hc5ZtAn9y+lxqLingZrck6u+nyOLF3ARQuZWrZkLBsqcI86
 1ZNFHqBzMQbulP8pwMWLbhFdcJ4T18yMG8Ee15idXyMKjNJ7+4LI+j+ostG5gd7f
 mLvgisq2GgFicw==
X-ME-Sender: <xms:REdtYJjbFy7TU-VjVVIZeoOKqVqDrZVuCZpigazvAC0C3Zs1-so8Lg>
 <xme:REdtYExgVtKHw-330VvYcD1DWCb-b5zW5CBMB7QrNx-_ELxmie-U9Ajz7BkWpIFgQ
 eAZ9de7ddVaMAq93as>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:REdtYK0oDwq7-1P-Z8UWGQsjC8gSlzld9qySWVKZImZy1vttzJBLVg>
 <xmx:REdtYJ-UmfMKO1TIXhnd9mMYJTthBOXfN3p059bCwjFY6qciACGkaA>
 <xmx:REdtYCrXC6bGD-4XX3QH6OBNYA3lFvlo1yobEdAPc8U6Ya5fJq1X2A>
 <xmx:RUdtYHkssW_c_YjSuqJqm81vGTZ_MpzpIEVy8QW0bxWJxrf_XeCIAw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EEA81080067;
 Wed,  7 Apr 2021 01:46:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 04/10] hw/block/nvme: fix warning about legacy
 namespace configuration
Date: Wed,  7 Apr 2021 07:46:29 +0200
Message-Id: <20210407054635.189440-5-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused BlockConf from the controller structure and fix the
constraint checking to actually check the right BlockConf and issue the
warning.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 9edc86d79e98..8d1806cc942f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -166,7 +166,6 @@ typedef struct NvmeCtrl {
     NvmeBar      bar;
     NvmeParams   params;
     NvmeBus      bus;
-    BlockConf    conf;
 
     uint16_t    cntlid;
     bool        qs_created;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7244534a89e9..09c38fb35e0d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5805,7 +5805,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->conf.blk) {
+    if (n->namespace.blkconf.blk) {
         warn_report("drive property is deprecated; "
                     "please use an nvme-ns device instead");
     }
-- 
2.31.1


