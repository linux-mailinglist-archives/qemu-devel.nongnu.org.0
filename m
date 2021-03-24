Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C543482CB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:23:00 +0100 (CET)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA1r-0006ac-GC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9or-0007vN-Lm; Wed, 24 Mar 2021 16:09:33 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9og-0008PX-77; Wed, 24 Mar 2021 16:09:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 81E6A1401;
 Wed, 24 Mar 2021 16:09:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 24 Mar 2021 16:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fVTX6CUmqYCuX
 CPyvquTvZr3MbP4Kb0leRFhY6fwrYE=; b=MXpH41s31VePoPnhX2ZpKmS/HFB0+
 5XnjRTRqoJCBC1o+A7axKlABjfenN0UVWvQ0ygWXdkaXmlGA/P4atmfoURrYgWBu
 StMxT3s82rVDMzD+82HKfRjrTg6ek54shibYVJnCw6Af8S36V0CAgBKi77GS84yD
 0SOEqqSSQUjm8jhoR9Z+RZMnum3q4+1PikW59eVJxFmRuNm9LgDKWwbHQqCLLEXD
 ecRtJtcUnC3QrvyKboeSqV7YMx1VfFI6ICC+4F5HDLADH9VX4tX/yqa/ZDl8vu5k
 2z8pPu6ChJ2xRHE9pQPTI2Wnb7r2EMbeTTakEzEHF5fG0keyoVCOyRi0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fVTX6CUmqYCuXCPyvquTvZr3MbP4Kb0leRFhY6fwrYE=; b=p8V0ufBd
 bVKObbZomwC9JHMBx812oQIWEHtYCKBIznrg5P6B+J3P59JUFQ0J61Ogk451ooWe
 vjzxcQCTb/wh7ihfkH6YKW9qNnGDscr/vOC0R84wnUxfYxnAtNK7rxOFyibIxqAA
 PBSlj8KcF0LeOd8c1uPXgR07lEd7+XOnBykjDj6mGbcuxD5ykJVIhYKIn8L9mm8Q
 ypNWKLTtWgYD/Q5JLm5PrPjfglFh2D0don4SC2VRRCWQzSQOuTRfaEcp/35pOunx
 76+SzB+POPjW6BXQ8a1fC9jC4cVIxAZMc+q9FvsQIEjSKjM3ZdNcK4fjRftfk3OQ
 pq0mV0jCeFgg0w==
X-ME-Sender: <xms:bpxbYEND9PDxWOv-bhM7qw9tSyQo6xCg2JU5TbozTQ01ts_bZMlQHg>
 <xme:bpxbYHTC3emVvexLO18qYji6IyMYZsqaahMbO5XR5Do7Jwnpl-Mq6o4E_2G6vVLih
 j2s40PNNnFlT8oBolc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bpxbYOAMD7qNLCTTn79K3LMkXpyjvSyTJo6uZcrAMNsmWGvZQmPCag>
 <xmx:bpxbYOhaDbXl_QZfd5krywyKcnpBombQ45wBCrI8Zx36azber3FPGw>
 <xmx:bpxbYPMahUhQCs1CXSFsedr5IYUCAsuKl7UIBxPbov3o7hgprlWy2Q>
 <xmx:b5xbYPK-EoOlEuKamf6FuAo19oJGHN3o0HyfaO8ms65RkjmTZBklXA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 449781080057;
 Wed, 24 Mar 2021 16:09:17 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 5/7] hw/block/nvme: fix warning about legacy namespace
 configuration
Date: Wed, 24 Mar 2021 21:09:05 +0100
Message-Id: <20210324200907.408996-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused BlockConf from the controller structure and fix the
constraint checking to actually check the right BlockConf and issue the
warning.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index c610ab30dc5c..1570f65989a7 100644
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
index 7a7e793c6c26..403c8381a498 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5807,7 +5807,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->conf.blk) {
+    if (n->namespace.blkconf.blk) {
         warn_report("drive property is deprecated; "
                     "please use an nvme-ns device instead");
     }
-- 
2.31.0


