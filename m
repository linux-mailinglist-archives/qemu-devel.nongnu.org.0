Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2086CAB95
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqMK-0004pK-Pw; Mon, 27 Mar 2023 13:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM9-0004KF-Hw; Mon, 27 Mar 2023 13:10:05 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pgqM7-00069n-1q; Mon, 27 Mar 2023 13:10:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 273503200956;
 Mon, 27 Mar 2023 13:09:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 27 Mar 2023 13:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679936988; x=
 1680023388; bh=ygnjjQASmQdZIZ8rTICWV2SKul3527md7ZeMrE61DR4=; b=1
 eMKHjbBNSuD5Z8xtU5IXfBR6QJBJVga+romIQyroZcJyDJUxwR0kHSPQQJTMXqzS
 8R4sskJsr1lo8HHuH35beks/iOX3HAcNVCTTLhdvAsp+Pm6yaL/u0bLI1f5YamXY
 l9wMyQDoeFmZ1dHryBhBZ7vX+4o9IflrxfYcGDb/RwBiZn2w5FZhNcawOUSzEAsi
 n/MHTBY+R6KzZbi6qEjHwRjuzpdrFkr5frGSq0dX4jiN9IgldW7IMlgsxb19rFfX
 qih/AclEixA+0haMDlYp7p8wG/ydd+fslK2EeFSbAhXsBNPOQHNjAE2YwnNx+XjY
 FLTnmNedj/mF1Yh77drfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1679936988; x=1680023388; bh=y
 gnjjQASmQdZIZ8rTICWV2SKul3527md7ZeMrE61DR4=; b=g8/hnXHVs70f59zCX
 y7hp3q+hCMOHc91nZ7A49wEtr3o2bKIg77lVO9WIrRnutPYiq/W09P9M4bpxGGh7
 NAsbt1qM3MUuz/+CBObbeFEAGUs3yGfCXmNdKkgol0jiuC74ydouGSvwvyF6gFr3
 6DlZlfYEQlAY8Cyhg4rlks/cJKd9DN2ex4+NLoA8AX6OFBH9Giso1BnCa68LI/N6
 yPhNiLoaf6pCEeegUrHpDV1EseH0Yk32CDenQkZW1a1RZYfMu9K3iw+POlHW+o//
 hdjXX722+ck8uaH+KFno1gyBLmtTR5X7+eZv/Gmpcl60H3mux0diPQOfl0RTdwI2
 9C8ug==
X-ME-Sender: <xms:280hZA6NY0uNGWJyuMSvLwSJ4odgqhJpuECTQv0gx1kUiFaF8aSRwg>
 <xme:280hZB6_-_5jaSCw9BWNtbm4RzyXohGFUypQGuVvFGOicGoRFp-zZQW5ZbLdnTG3v
 Ln75BCafkyhgiWZ7k0>
X-ME-Received: <xmr:280hZPer7enKsw5ZfSNVYD5xPrHmeEqMAvA3SDEp85cyj2OsXmiWAh-4RoOZi4aeDf8OM6-IH04xuLGFlsV6uAUHfKIcXJMHLOpm6aE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephfegteffffetgeefveeuieeiueejhfdvkeeljeevhfffudegtdevjeeijedt
 tdegnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:280hZFKOSSFNlO4Iq0ptAk8uHHuuKE0nqwl36QjXe1XCsVso_wd01A>
 <xmx:280hZEIJC84YXBGubsk9aGNR2TnUPjq6AOlD38zAOimypdRQiQHZRQ>
 <xmx:280hZGzZwuqJm_NNBKC-YMovfJ6VlYqP6xDKc9w-b4Y3PL7B4-51PQ>
 <xmx:3M0hZJXnBmEeWwaMqHXu9jdHNOukIc10josYo-_oZMiN-kKDvhsCTA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 13:09:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/2] hw/nvme fixes
Date: Mon, 27 Mar 2023 19:09:42 +0200
Message-Id: <20230327170944.57033-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=k.jensen@samsung.com;
 h=from:subject; bh=5J4m0Zi2w959pPuXvvhdZ6wz0C8gTypSIe2LlXcvq4M=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQhzde23ElDo56X+p5kJ27mDRZocua36wQBZ
 zvW4G7PDYfMP4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkIc3XAAoJEE3hrzFt
 Tw3pBjUIAIorAT5qkneApHiIrRHLfWHcS1pX1oh4pSf09PTasRWwkMSKYqLbRCmI6d1wRoekjMl
 KNYU84f15uqq0PMoGCmGfEbgpQ+VQnQoxtOwexcbWr/SzTas/OT/ATs6XWYvbkCHWEZMOWttEB1
 rmXTdFeraTlBn3kZI/URZgC0SOM/jEdTmtFOpKn2pHRd6FOnT/ITmEHygFjFuuTZzrrL+OnxNic
 7/zqWmCDQ4zRfKcY5ZvTPqsGqGp7PtgwVBblJ7rytO9pi9HxmSLvfmuQ0G9gGcWYl5755hakoel
 OR+HzJUywuljSRiGczOKExXy/ayaTn8vrIvp1MOWejQS5qwWg5V6wqpK
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Hi Peter,

The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:

  Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)

are available in the Git repository at:

  https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request

for you to fetch changes up to ca2a091802872b265bc6007a2d36276d51d8e4b3:

  hw/nvme: fix missing DNR on compare failure (2023-03-27 19:05:23 +0200)

----------------------------------------------------------------
hw/nvme fixes

----------------------------------------------------------------

Klaus Jensen (1):
  hw/nvme: fix missing DNR on compare failure

Mateusz Kozlowski (1):
  hw/nvme: Change alignment in dma functions for nvme_blk_*

 hw/nvme/ctrl.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
2.39.2


