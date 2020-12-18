Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A02DE365
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:45:57 +0100 (CET)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqG4x-0002h7-Qm
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoy-0003VF-4c; Fri, 18 Dec 2020 08:29:24 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFoq-0002ty-Vs; Fri, 18 Dec 2020 08:29:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C27C18D9;
 Fri, 18 Dec 2020 08:29:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 08:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=5eiCcBYtm/rnT9BRI5qlhzJvo0
 6abxFCtge01cwRtnM=; b=Xtzil1+yiN4lQrZPZQOJM5FjdjV2/xw8lPhsrrGScZ
 tfg9sgbyY9F5fJQDn8OuQqcvmG/YCXlUElng8hf5MGjMUXOKVWmBVjRZ7h97TAbz
 6I8hfyhvB/qSDgqnVHJK2y2GCbqp53cdekrPcvitMlDfdxivsAllgqOXxIPBLOnb
 a4TURKJCxxWtpz4SOIBinB0sGwDGwOD8U3ZkH0YiFNQCO3qkhr46EL1M7c6HA5AQ
 gIqb4FJsMwg7ZES0XvOgTiegpNUBfrxjqs+dTr5jYLNWRlj3TF8QLXXNn+ISZO4a
 DN7jj8HJC2GHQrDB9JgP3eJc5tgGr2YyReWwfLswNa8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5eiCcB
 Ytm/rnT9BRI5qlhzJvo06abxFCtge01cwRtnM=; b=HG98frwiz7jl66smr8tTTl
 6Sat+ut/2j/iegc/GoewiRdYP+ZyAnjDJG0K4eFHsWY6wIT+qkVtu/Lg5IAUfZZb
 UXZXNK1clalbVSYEA71gFH6bwXwCW+Xxel8xZ2VqNHJgzHhfcgaRWZcNDSfpsPCm
 CDKhoyue/LtlpVRgzMYdaWqTDZWm6yk/KPU6j5biKTe4iGu/wdfOD0NwvrhjvIRr
 kkcTuRjIDvhaz5tF+qZhZzQLE5lfxEL6uy1fFNxZDpcE5JX+g6Xx9urKVdJGOJ6o
 NUz++4DvvnYZO2A4+5HQtM+Fprio6uZWdNRr+EkeBREPIOc+7fifd3SKL0oyC+XA
 ==
X-ME-Sender: <xms:pK7cX4Pun7jWdoRtj1W2HMIZwh3JyzcwdmXw0fzK_V-LsWy6CsTouA>
 <xme:pK7cX3aa6Q_HtbO48UuNAwAGW2ksZcf1EyC-jk_MRDu_kkb4MySdlJRaPj1kEd10p
 tGJkzNXkLuX6U4w9Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepveetleefgeekhfelkedvffduleefvdefgeejjeehfeevtdeulefhudetgffgtdfg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pK7cX_s38kOTRjPMeJIYUpZ33bq3PEQdaP3hMnsRKNbtDrY1W7Keug>
 <xmx:pK7cXxMnRzjy2f6J7K1LoXsuTBFHBzk7KoXvQBt3a-9XQmzhpQmuPA>
 <xmx:pK7cX-7TGvLJ1b09cHXfUOqXq8Y88z5oe8yQoxYdMvFTlESgmxjByw>
 <xmx:pq7cXyfzTq-YI1arBFMt6395diKqVfqNivjQx2rYEAKicWjGe2B4hw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39D6D240066;
 Fri, 18 Dec 2020 08:29:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hw/block/nvme: misc cmb/pmr patches
Date: Fri, 18 Dec 2020 14:28:57 +0100
Message-Id: <20201218132905.967326-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is a resend of "hw/block/nvme: allow cmb and pmr to coexist" with some=
=0D
more PMR work added (PMR RDS/WDS support).=0D
=0D
This includes a resurrection of Andrzej's series[1] from back July.=0D
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
Klaus Jensen (6):=0D
  hw/block/nvme: move msix table and pba to BAR 0=0D
  hw/block/nvme: allow cmb and pmr to coexist=0D
  hw/block/nvme: fix controller reset/shutdown logic=0D
  hw/block/nvme: rename CAP_PMR_{SHIFT,MASK} to CAP_PMRS_{SHIFT,MASK}=0D
  hw/block/nvme: remove redundant zeroing of PMR registers=0D
  hw/block/nvme: disable PMR at boot up=0D
=0D
Naveen Nagar (1):=0D
  hw/block/nvme: add PMR RDS/WDS support=0D
=0D
 hw/block/nvme.h      |   2 +=0D
 include/block/nvme.h |  15 ++-=0D
 hw/block/nvme.c      | 216 ++++++++++++++++++++++++++++++-------------=0D
 3 files changed, 164 insertions(+), 69 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

