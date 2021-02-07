Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89163127C1
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:02:53 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8s8q-0006IP-PG
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwH-0000av-T3; Sun, 07 Feb 2021 16:49:53 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwD-0004NS-NA; Sun, 07 Feb 2021 16:49:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E86685C009F;
 Sun,  7 Feb 2021 16:49:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=UYBfnaj6PSBb8WyWF37yHq3cp2
 CkZSP/YMgnJIf+pBQ=; b=WP2f5dxT9zAw2Zpzsu0+0epj5QFWQh5F4pQbDsAPS5
 yQsVdEmuMqkrRVFU2rZjzwuC1vYg90iklv4+es6aQWDDyYgrae+VGb6NW1mq9cEG
 n9kqrObFACUbTdWKuWO6zDGMI2g4SJhvCNAXGMAQajbxLZh7oN0bIRn+QDP7qplD
 sFfO0bjFHTc0Dh6Q8qrVlEVbkBhxK+mOcQipx09bHik2i6C40wbzmewEX99793Xm
 wqcVm/UK6rZxytxfHYG1PrKGAvkk8gSeAntrWcRVwNzBjLjrQznyzxBubNm7x2KY
 PLGd/ALElBNTiBlU9sfJRxbOSGQym1hPVL9dUwhs/yDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UYBfna
 j6PSBb8WyWF37yHq3cp2CkZSP/YMgnJIf+pBQ=; b=VfpsRgRvhjmuYt4DIdTPU6
 upRPu1yaiWltgH8gI4tzpLpdUgvuiZoY4LmG64u7/T3XB1L3t8HlzbQhEdQWdDjq
 m86rFIRHeLoXILtlXfaCfA6ErAIf/ubwB1lpkLegof+LOb/uVe9QiAggOyvjiYce
 rCeqkf1W0H++S+IZO1kUgelCa5ON9H477ZLDOoEcEFLXJliUBEX5vDg9anUh8HPN
 n7sydjjJOTenCG09rSswZa1MbdNE59hI1dqwkArO2smkWLarSFsVa/shBAQdhhwY
 IzZIY+d1Sat5BrAl3SodON0GBKPULa6J403EzJZSkFN8YtYDrqnDbiFypqCAdHgQ
 ==
X-ME-Sender: <xms:d2AgYFKJ8XW_OWxoapneG26imXHNX7i-oBQbl01VGUhCL1OXr7wkeQ>
 <xme:d2AgYBJAxTR9diXy1hU5omP3LDfYu4fpGtraWS7H9fl3qFZc-oDFIr3gEJDoyf431
 9y0SQDtRE0djy6bjgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:d2AgYNvLhFNixUY2H7augqGYfyuAZoh3scQJ-kroGhSHluTXu3yFpA>
 <xmx:d2AgYGb6ePsyNHDwc-0daeial5k_IOL_YclBPDOfs6BE6RI-zOlJWw>
 <xmx:d2AgYMYFxknZlrWIw5lmxxKY8-gjciuoTO4kGUC3f4qcGwCS9z7q2Q>
 <xmx:eGAgYM7yJquG78oLXULi-duhb2xpV5JYkxX717fagAkFaNMTgM70fQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FA9F1080057;
 Sun,  7 Feb 2021 16:49:42 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 0/8] hw/block/nvme: metadata and end-to-end data
 protection support
Date: Sun,  7 Feb 2021 22:49:32 +0100
Message-Id: <20210207214940.281889-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is RFC v2 of a series that adds support for metadata and end-to-end=0D
data protection.=0D
=0D
First, on the subject of metadata, in v1, support was restricted to=0D
extended logical blocks, which was pretty trivial to implement, but=0D
required special initialization and broke DULBE. In v2, metadata is=0D
always stored continuously at the end of the underlying block device.=0D
This has the advantage of not breaking DULBE since the data blocks=0D
remains aligned and allows bdrv_block_status to be used to determinate=0D
allocation status. It comes at the expense of complicating the extended=0D
LBA emulation, but on the other hand it also gains support for metadata=0D
transfered as a separate buffer.=0D
=0D
The end-to-end data protection support blew up in terms of required=0D
changes. This is due to the fact that a bunch of new commands has been=0D
added to the device since v1 (zone append, compare, copy), and they all=0D
require various special handling for protection information. If=0D
potential reviewers would like it split up into multiple patches, each=0D
adding pi support to one command, shout out.=0D
=0D
The core of the series (metadata and eedp) is preceeded by a set of=0D
patches that refactors mapping (yes, again) and tries to deal with the=0D
qsg/iov duality mess (maybe also again?).=0D
=0D
Support fro metadata and end-to-end data protection is all joint work=0D
with Gollu Appalanaidu.=0D
=0D
Klaus Jensen (8):=0D
  hw/block/nvme: remove redundant len member in compare context=0D
  hw/block/nvme: remove block accounting for write zeroes=0D
  hw/block/nvme: fix strerror printing=0D
  hw/block/nvme: try to deal with the iov/qsg duality=0D
  hw/block/nvme: remove the req dependency in map functions=0D
  hw/block/nvme: refactor nvme_dma=0D
  hw/block/nvme: add metadata support=0D
  hw/block/nvme: end-to-end data protection=0D
=0D
 hw/block/nvme-ns.h    |   41 +-=0D
 hw/block/nvme.h       |   44 +-=0D
 include/block/nvme.h  |   26 +-=0D
 hw/block/nvme-ns.c    |   29 +-=0D
 hw/block/nvme.c       | 1687 +++++++++++++++++++++++++++++++++++------=0D
 hw/block/trace-events |   19 +-=0D
 6 files changed, 1574 insertions(+), 272 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

