Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F26336D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOPv-0002Ql-IQ; Tue, 22 Nov 2022 03:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPq-0002PQ-BU; Tue, 22 Nov 2022 03:14:02 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOPl-00031d-CV; Tue, 22 Nov 2022 03:13:59 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A1E3932002D8;
 Tue, 22 Nov 2022 03:13:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Nov 2022 03:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1669104832; x=1669191232; bh=bm
 H6ZBpik8g+a6Zn5Ijx0xj04vxf9XxEA3n8B7VedM8=; b=W38wyqgEcsurOqHWJB
 WmjpF5Oztqk5wxh0IbKCjtnwqgKBKViK8gU7gR/JNl/+rVfJBuLPpS349tB0n40H
 LH9wD+2I5XxXpZaYZwWLw0p4RsKASHh5B9rkij+/J9Ufx31foSP2AHM3+2DS/9i6
 Gx6k8O95BjhB33a+i/J+KaQyiEXwgwf9Gku7zVvZ16E5LCW0b8+wlwkeai1lo4h0
 wKgtnWD7iwEzZoJMwGhpuAPIqOrPE9NsrfoQtdWHti6rPGBT0OZsHnYbQxVe0dWJ
 LhLA7LJBChNPFvyYDRQVtcfSjWKVMfefTQaq5dcK9Gq05dBxdOGjhaWQwTp+RCjo
 5Ztg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669104832; x=1669191232; bh=bmH6ZBpik8g+a
 6Zn5Ijx0xj04vxf9XxEA3n8B7VedM8=; b=mZH2ot9iDhW/pH9bwvyY46To652tC
 jzI3EZ5ZDeJ8Zhx+6zaxvdE+6+f6rVs3oH+rSyB/BXyRnDvPeOaX1UuDgj5wUYLm
 zw6dYCnFzMecYAAXVU0PX8/v6xckJf05JhWZqb5zYu66tqwtyrfr9H+PcqkCAyvl
 sQ8PxKiETXunT+p2AURHoDzuKR+wsQTL7M1eZScYHW8NixLveujYjiMonvAMewA6
 6qg6mG05VgvIU5TgUchukm6aGWWqU/xE93aEYfa6AztuMhAGp/Fa44ZxAGGSrvOz
 K1aSHLFy2eTbx92rSx28cQhISVCshfqixVBFl7QLgm/WSrdlZpCHgBbXA==
X-ME-Sender: <xms:v4R8Y61UH23zv9m-uLIbRdBqh7RtplP6dNZlxIvO8DWnaADofl4EXw>
 <xme:v4R8Y9GX3Pn2BVcV35Ua8__YeLpGffSJhS9BZpbDV3yCcQaoLd8jvKUX7K8nCJPo8
 DwN6FvF3hGje6U5_LQ>
X-ME-Received: <xmr:v4R8Yy7CXr2k_OYk-9sm8LekYqTlNn2FLhbtaCY21Tbf9YW94_oQuUvsuM3VSNDuPuw5CT5agwe9pehT4OHJIaTu-QkC1xW_3Qg2Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedukedvgfeujedvgfdvfefffffhheeitdeijeekleefvdfhgedvvddtfeeukefg
 ueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:v4R8Y71tGe8-8RmRNwtbTwo_s9YBZx8ECExsyA4zNVri-fXCOu4l9g>
 <xmx:v4R8Y9FL6_KdJhuJF7hih8-pAhCCHMG2d5_Svj2jrzRoY0nYUlGpZA>
 <xmx:v4R8Y0-q33fbwZgy9B6lLzT4iBnJUbknblfGRL7TxhNOQkgj6vfw6g>
 <xmx:wIR8Y9Bqr_Igst5fdWCEy-CD6DYJIkb4Djo_lerw9Km1LR8K_C923Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:13:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 0/5] hw/nvme: aio cancel fixes
Date: Tue, 22 Nov 2022 09:13:43 +0100
Message-Id: <20221122081348.49963-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=628; i=k.jensen@samsung.com;
 h=from:subject; bh=K8WtqnmH5qxwhyjSyqbkW2/L0fmtdQVXsodmChrglXE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN8hLtS0BVN2GaiT5FfA6/NaCNwNltU75fdRPmi
 DmvRqYYtFYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjfIS7AAoJEE3hrzFtTw3pZs
 QH/R2EaSuWgg9FjaJaiptwCDYPa68wtf5oyin5PSPTFpezHDRDtmGDLcYV/wD0FiM20dN9ykTPDTjI
 dB3jV4yLTNTXrfDj/y7GVA0msvTwUbsHH5u7tjgLCW2U+oLO+Gbo454qhMAN1vySSH/uiWw1oBwpy1
 bGbu335FCR7fM1xGhCW1dsB3RKctjFkToIzrTjEvyZkmixvvdpSkK/DQubiHYLxNMVa9gV/hYKTbRv
 w03KwDrG4NMAB9VTBsqfOkz3FQMpwfgUWdvPYqL6e/mh750ArMNmGpq8npNKl9K9m0NTxUdOLsDCqI
 bJ69ehSuPibjmwpuBX6GXkVN/VOg4UdwEcJq1H
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

A new blktests nvme test unearthed some bad bugs in the asynchronous
cancellation handling.

Fix this for all commands that implement async_cancel(). The fix is the
same for all commands: remove the deferred enqueuing (a bottom half
scheduling) of the request completion.

Klaus Jensen (5):
  hw/nvme: fix aio cancel in format
  hw/nvme: fix aio cancel in flush
  hw/nvme: fix aio cancel in zone reset
  hw/nvme: fix aio cancel in dsm
  hw/nvme: remove copy bh scheduling

 hw/nvme/ctrl.c | 181 ++++++++++++++-----------------------------------
 1 file changed, 51 insertions(+), 130 deletions(-)

-- 
2.38.1


