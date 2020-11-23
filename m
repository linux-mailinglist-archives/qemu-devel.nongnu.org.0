Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D39F2C0072
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 08:04:58 +0100 (CET)
Received: from localhost ([::1]:40800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5uC-0007M9-Ng
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 02:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p3-0005JP-8Z; Mon, 23 Nov 2020 01:59:37 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kh5p0-00072m-8q; Mon, 23 Nov 2020 01:59:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 08AC35C00E4;
 Mon, 23 Nov 2020 01:59:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Nov 2020 01:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=ZUgSVPSEd0z/S/wWgNvnXe7xw1
 fAhtdtCISV/MSawpU=; b=Tn9yM92fsKlu/JWDEHTrMmy8jSJUvQsrHihWb6tMzG
 7Ha2AgUiZSkeVxst4+5tp2b0Lt1do3+1hadTCm8yqxrp6vn2TF9aSVRty8K7YQPa
 y5KFgB1547H1ZPyaES5M0oToBtwtjiLN7Sz0gT54yiZqpXcqkDVEzmrbS0ORrdlw
 FzX4fNrX3u5YadUbu+GzHqur2iLfZARyTuh6IaZXkYTGeytYSnGu3ehqzcKHWMb4
 GRCgpN5xPURrJoL8K01JK9AKxz4A/phpvcQw6QnGTMgGMEtvACiP0+FYKt4lHcSx
 BwgF/SkK54pTDVDnFS+f4hGW5Acfpn9mcZXMk1nY9PRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZUgSVP
 SEd0z/S/wWgNvnXe7xw1fAhtdtCISV/MSawpU=; b=i/fRNhRVVNPIJV81s85Jdd
 1KkZOGMGDLMkIUMtruxRbQ52q1GW69VEbeLAff8giO1NwhfjSEojkYI2+XGhcXcF
 IL+gujyrOIuSgcDxBWkSHaFh6+7EwU4sSr+vIkmZ+0uDwdEyK988lqWrt8x9Gazk
 iJEJ8XPobBO0kD+uWZMDm/mPOeyhj2LdxYkUkOAGybKqRTC8qrZQKEn6sE1EWn9f
 dvgnHaAvaaf7PPijSaKSklVbO90dccaqdneXMzpcIn80ZMFtLHu8PYju49H7Jr74
 N6EjSW/D4iHCjJujxY0qep1HpQ8jn1BeJ2X1o/B2xnbbc5bjt7Mxf3RqhgsUknDw
 ==
X-ME-Sender: <xms:0l27X3HdaBs6I4P3s8Q2KmUcLmpzLURGKR72PBJNLGW0oG6SvzrP2w>
 <xme:0l27X0Xru0y6agjCdaBUZBZf4ii60_OWnyEOaZ3ga90xeVlg5kS9D3WCkvUl39vPR
 yR2YNdv7vB5ZjkvFQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepveetleefgeekhfelkedvffduleefvdefgeejjeehfeevtdeulefhudetgffgtdfg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0l27X5KCXzIN2-LY2y19kzkiKD483Pi9HPBuGNjaA_BfF5VrOc_XfA>
 <xmx:0l27X1EwdYEitcSDS1DkaJGD69VyX5RT75av_Bkjzt6QgHWlPPgpLA>
 <xmx:0l27X9UcPm17VCuZcyUszzfZzZ8LdFJMZlVJeyGnmdv10ssKlr6R3Q>
 <xmx:0127X7eA_0Eh0cDTaJVPGmuUj4bte4vbKchTDEXeW11ZqM6zcQ3Paw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AD113280064;
 Mon, 23 Nov 2020 01:59:29 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: allow cmb and pmr to coexist
Date: Mon, 23 Nov 2020 07:59:24 +0100
Message-Id: <20201123065927.108923-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is a resurrection of Andrzej's series[1] from back July.=0D
=0D
Andrzej's main patch basically moved the the CMB from BAR 2 into an=0D
offset in BAR 4 (located after the MSI-X table and PBA). Having an=0D
offset on the CMB causes a bunch of calculations related to address=0D
mapping to change.=0D
=0D
So, since I couldn't get the patch to apply cleanly I took a stab at=0D
implementing the suggestion I originally came up with: simply move the=0D
MSI-X table and PBA from BAR 4 into BAR 0 (up-aligned to a 4 KiB=0D
boundary, after the main NVMe controller registers). This way we can=0D
keep the CMB at offset zero in its own BAR and free up BAR 4 for use by=0D
PMR. This makes the patch simpler and does not impact any of the=0D
existing address mapping code.=0D
=0D
Andrzej, I would prefer an Ack from you, since I pretty much voided your=0D
main patch.=0D
=0D
  [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-1-andrzej.ja=
kowski@linux.intel.com/=0D
=0D
CC: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>=0D
=0D
Andrzej Jakowski (1):=0D
  hw/block/nvme: indicate CMB support through controller capabilities=0D
    register=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: move msix table and pba to BAR 0=0D
  hw/block/nvme: allow cmb and pmr to coexist=0D
=0D
 hw/block/nvme.h      |  1 +=0D
 include/block/nvme.h | 10 +++++++---=0D
 hw/block/nvme.c      | 42 +++++++++++++++++++++++++++++++-----------=0D
 3 files changed, 39 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

