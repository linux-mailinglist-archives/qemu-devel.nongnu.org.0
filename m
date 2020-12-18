Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE72DE07C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:42:18 +0100 (CET)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCHB-0006tj-Dv
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqBz5-0005Wq-Ry; Fri, 18 Dec 2020 04:23:36 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqBys-0002ZI-QL; Fri, 18 Dec 2020 04:23:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 01FF35C00DB;
 Fri, 18 Dec 2020 04:23:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 04:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=s175G0RkfqlpDV3w5j51SPtyOk
 TBHts2gCqtzoMHDv8=; b=1tqcu23aMw4RhS+JjkX/cvwfNKaWEcBO+gm/UF79Zc
 +v9hN/iuXJNcNk6p97+A/+kSPhjPE/CT/Jw6gqcsI2IkTRNDeHTyxW6Z/nwlsxnb
 EkZ3FPr7cEBGvqo10N0fiLgZTha8FQm/2lDj6hM3C0WsKWjm9PD2MHb8kgNiYBBi
 Hl0RU1tvGDxBwnFryvQ1DbCtCEAah5MkqvRBWetltxrP1T1FKxqlUTUVKdrBSYYU
 PPIS08CyYazTyMbjVTwhQtCjmsWzFWDCeOxycbgHPfCUOvhYvsyAp3z+RMsH5CQz
 F0HxJOGEM7pcbBF/fsAzsQK9OO3SnGvKKiw1SmOu4Wmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s175G0
 RkfqlpDV3w5j51SPtyOkTBHts2gCqtzoMHDv8=; b=QoShx/+22QBUqDidNOdTUQ
 tRY1ohDxcKSzbJuE1/63JvXQGXJOr6VPoxDAv4bhvC219d3i5+TLeXknbr1sazIo
 /pbfJsRffklxJBUFe3SC6nAqzo/ghYczrzmdI92A/S34ZPigF7IV7AvQEmbNqJ3r
 GMir3T2/9jKKc3cefZ8zUpjYTdXPHWdJg1i2LSQ8/9SK+g7DYqLZbXh8OKumWEpO
 0snRrpTdutxEFP6EA30BJghZSxKnTIunODloIznD2fdzAC2K93H3zdlY18U6CjiK
 RIVCoA8Otu2Cc+EdrDK+lF0jg3g7gmFE4EQ2VVZwj1tuKsMSUwfUx8y67MBhfFCA
 ==
X-ME-Sender: <xms:B3XcX1uTpOeZIOSAXnhijTH-2_OxxO-VjRtxrWxg-FHE4REXrYHCKg>
 <xme:B3XcX-ebUIczdSDNKtFSwXJt-2dOfDlddVgmGrOFXngbK8es4nNtytqw_dcBASpQd
 IO2aWoiENLb3UbUPCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:B3XcX4xDuAv0J6h7nxvHubMGzRP8awZmwicOeYDm5iR3X3bg7gbcVg>
 <xmx:B3XcX8P2F3x6h9d-d-tubwwk3gjkANNnMbs7U8GFyg4rSLwKfH2Kzg>
 <xmx:B3XcX18H7y9VHxdtB25sk9Mt1wevu_1piC8orlrc-z9hjxWDDiikBw>
 <xmx:CHXcX1yFmaoczLQ_KUPNNLaGXe5fWoIs5QArg8tOi6WOGGHOVebkrQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 301D01080064;
 Fri, 18 Dec 2020 04:23:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: cmb enhancements and bump to v1.4
Date: Fri, 18 Dec 2020 10:23:04 +0100
Message-Id: <20201218092308.894367-1-its@irrelevant.dk>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This adds CMB logic from v1.4. To my knowledge, this is the last piece=0D
missing for v1.4 compliance, so bump the controller spec version. Please=0D
retort if I am jumping the gun.=0D
=0D
Since the slow-moving (sorry, super poor attempt of humor) Linux kernel=0D
nvme driver does not support v1.4 CMB, this series adds a 'x-legacy-cmb'=0D
nvme device parameter that reverts the CMB configuration behavior to=0D
v1.3, thus allowing the kernel to continue using the CMB for submission=0D
queues.=0D
=0D
The question here is if we should rather skip that parameter, only=0D
support v1.4 behavior and point the finger at the kernel nvme gang. I'm=0D
leaning towards this.=0D
=0D
Keith, what is your opinion on this?=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: bump to v1.4=0D
  hw/block/nvme: lift cmb restrictions=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/block/nvme: cmb enhancements=0D
=0D
 hw/block/nvme.h      |   1 +=0D
 include/block/nvme.h | 106 +++++++++++++++++++++++++++++++++----=0D
 hw/block/nvme.c      | 121 ++++++++++++++++++++++++++-----------------=0D
 3 files changed, 170 insertions(+), 58 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

