Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB1368CB2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 07:37:07 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZoV0-0001a2-0n
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 01:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG4-0006X7-4Q; Fri, 23 Apr 2021 01:21:40 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG0-0001Nj-Az; Fri, 23 Apr 2021 01:21:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F2F4E146A;
 Fri, 23 Apr 2021 01:21:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 01:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=rju6qta6bH78X
 Od8iphwu+FuWYddXyQN+ol4wb7fl7Q=; b=XqfplN4BEgnzgM/rUyorOj9OQw6Em
 R1KAaAQ48IXq/9jaxwBNXsXLCRqetKzSNpxovPhagARfnwYa0s/RViQVZqTHAAnB
 fa4/gI8+sbH1RidFcsKWxVJGJEt08qOKZ/FjwLGmskfJPCGI/SoW4TG3vkLE7Cte
 ra6UCQcU3HHHfG8Ak7dmfsdAGPVlXDEFfbWMvwr7c0HgD/jfsWNdPLPn4ib34GeH
 VU5g87L3Zjem4R+Dj7WqJN6RGgTjVCHZqsKfEbq4DzgGBce4PQVNc2zt+JMjx673
 /rrX50KumvDWxV2LiQIIvqY8ffuNRy+bMg5GIk1nnN3XsDKC2hD6M/rIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=rju6qta6bH78XOd8iphwu+FuWYddXyQN+ol4wb7fl7Q=; b=fyhbrKrw
 b+y/loECBrJ7x+u4SWzPJ+2rPx/zmTxEU/ulk/TtGg9kYjVsGqGR4xx0hU+B8Vk1
 tkK8ON1t0pmDvbCClqKv0IUlN0RC3w5+dP3k1WjQtvcnm8tUXAhwno7uRdLs7drG
 EglglsLHx0n8O9XhWqFQZPT6qXbCuXj1uIKJtmepigKU0E1pVxOPtACAcadeaeh8
 GuWS5JnulH0VKgddDBXT0gA+qj6ywd85Uv6jAfXxdTDG+MogbXAUncn3CtctHhrV
 bRzeKQQKKC9r5tAzB5kdeSXlrtlyn72cw/Fz6EUNQ3jb3pbBmcMTteuhDEW4NyIp
 Ki8u5704GfJt6g==
X-ME-Sender: <xms:XFmCYCppsth4INQAt7iYZUJ751MD5pQH5AeI6JJ0wQ28c-iajgt7yA>
 <xme:XFmCYAqfIDW1ESiDBrdGrjcWz6lZ8pyy9vZB5YRN9Qxeil_3xrYCW3C76byfDBGqs
 artUpsLgorhwXoCJh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XFmCYHMLXy7KupeojIXAy4xQh-HhnlSSgG5hNSeHgImyZfcbWbqKEg>
 <xmx:XFmCYB6eqK8ltDAWEICC5OP6B557A6wpmtlSc2u0RYrzw_baiPPALA>
 <xmx:XFmCYB4LxkyDMmFJ-GZG9Y5ggD4B-GYDlCWXAyJ1xfO0fUCz8lePvQ>
 <xmx:XFmCYPQU5r9mZLZi_YbqvNwLOjaOSs06p4ydYN25PvrBlK_MS2dXzg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70BDF108005F;
 Fri, 23 Apr 2021 01:21:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
Date: Fri, 23 Apr 2021 07:21:26 +0200
Message-Id: <20210423052127.512489-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052127.512489-1-its@irrelevant.dk>
References: <20210423052127.512489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Commit 1901b4967c3f changed the nvme device from using a bar exclusive
for MSI-x to sharing it on bar0.

Unfortunately, the msix_uninit_exclusive_bar() call remains in
nvme_exit() which causes havoc when the device is removed with, say,
device_del. Fix this.

Additionally, a subregion is added but it is not removed on exit which
causes a reference to linger and the drive to never be unlocked.

Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d072..5fe082ec34c5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
     if (n->pmr.dev) {
         host_memory_backend_set_mapped(n->pmr.dev, false);
     }
-    msix_uninit_exclusive_bar(pci_dev);
+    msix_uninit(pci_dev, &n->bar0, &n->bar0);
+    memory_region_del_subregion(&n->bar0, &n->iomem);
 }
 
 static Property nvme_props[] = {
-- 
2.31.1


