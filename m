Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28A368218
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:04:38 +0200 (CEST)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZZwb-0006f1-H6
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZqv-0004mV-02; Thu, 22 Apr 2021 09:58:45 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:47213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZqs-0007Wy-Jj; Thu, 22 Apr 2021 09:58:44 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B04D135F;
 Thu, 22 Apr 2021 09:58:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 09:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=4dJXjhp3TsgwSUQDlmLqT9g8z6
 iZYZqG3l0s2JmLyeg=; b=cl6XhA7bzdVprcDR4xt4zqs3MoKB1dnIkkS09l0nGK
 B5kVK4z03Vu7hr9kShcr5i1+LKJVw40aGHa8a8h6/pN/YOSgtzC2xQYhcTeqPVkQ
 qlZRqi8FwbamVrqdFwD4J5X5ORIgTKt63HEdxd3e1PGpIiF96beJdcOYisIyELHr
 PbtR/jcMlD+3pSOxIHu6l9qCcpS1xt1aJyvkGtRqzSpvAKBiZNadANMlfybPUYOf
 MjW3YK7V8xnMSQIrRCkrHvwrzvQUsTrKR2tlKf0E6gOJex5VYKfktZpFwLg2iHgM
 dgGUTLHPMe3/HbF4BgnuBp44qJvF0gxLDhInHXY6RlRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4dJXjh
 p3TsgwSUQDlmLqT9g8z6iZYZqG3l0s2JmLyeg=; b=JUaVP9gBnURDGoE/HEe9Z2
 k7pPh4MyVvHdo4BB9umAAArnEJGsUDrLUf4DPxQ2dqziKbkyzvr209Zuan7C/dPA
 fmZ7NmvHA1aCpf0rCHDyj6tVskmNB1ABY0YEW6BZUsaAaYPHYKM/LHOFbEbkH84S
 kyIB44mvnP5FmseLtngE3/CkQLXLWoMmtesbdnzUHtDthDRu287BRopSHCyH5Rhq
 sxx2f+aHzesggneMqVs3pnkKl46Nbdw8aOduj5lpis7LaiB3nvQtGVYmhxQ0n+Aj
 YvO7gda/zcPP4siTvhHN6hPk69ILAi3i9SjjStxXtOyUz9Dhz2ihZ2wvMQsm9CmQ
 ==
X-ME-Sender: <xms:DYGBYE_MwNql351lLoPJaDSSC91j5n82OtkYrW6lbUzrDsWW-8b5iA>
 <xme:DYGBYMsTcH5vqnJdrE10aDnfvu3dpJFUCdxWS80NFsRukKV7E2pXlHj96wzjJh9tH
 g2aBdHdkZrHauPMRHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:DYGBYKAnBcivMFUMQ1CSTMY9SKNGCaKCtTVxjTJL8uB_MZf2XIbUBw>
 <xmx:DYGBYEcLL1ia1EX2oq-BVuMOZEUaQIR8mrNPY0b8DF9X3h4MKnAKlw>
 <xmx:DYGBYJNb4QP31ak2vV9lYw1Zz37lkOwqKB2WB3krdRrkTDk-Lq7tWw>
 <xmx:D4GBYM1JShM9TVRwz6YDWQeMJhoEU8L8VSQ82Dllqmiv5GepcO22qg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A649A108005F;
 Thu, 22 Apr 2021 09:58:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-6.0? 0/1] hw/block/nvme: fix msix uninit
Date: Thu, 22 Apr 2021 15:58:33 +0200
Message-Id: <20210422135834.406688-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The commit message on the patch describes the issue. This is a QEMU=0D
crashing bug in -rc4 that I introduced early in the cycle and never=0D
found in time. Lack of testing device hotplugging is the cause for that.=0D
=0D
I'm not sure what to say other than I'm terribly sorry for introducing=0D
this and if this means an -rc5 needs to be rolled, then I'm even more=0D
sorry.=0D
=0D
I think an acceptance test could have caught this, and I am already=0D
working on an acceptance test suite for the nvme device, so I'll add=0D
something that test this as well. But, well, it doesn't help now.=0D
=0D
Klaus Jensen (1):=0D
  hw/block/nvme: fix invalid msix exclusive uninit=0D
=0D
 hw/block/nvme.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

