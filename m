Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F18D328070
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:14:32 +0100 (CET)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjJe-0003Xe-WC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6X-00028C-IA; Mon, 01 Mar 2021 09:01:00 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6T-0003xE-6K; Mon, 01 Mar 2021 09:00:57 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5179E5C0124;
 Mon,  1 Mar 2021 09:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 01 Mar 2021 09:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=iTzJdZfhmwp76ut9UrmrJAo/WL
 RBYCclCTFUVLoRX/o=; b=X+zK8sLC+NEpiZPb5QmTDvQSNJyF5sjmwzodLl6vRE
 ifUA59dTQfIJoOLsKBTjtjtIfaLIaGG3DHaP0zfySxkUFYg9qCkuYVGth86VR9te
 6oEXwYDAEjbOKWP5qYAR56X3O5F2fCK7zBqgzuSuepvCr0T03uJgaQYKI14agDMH
 AJpIMMs96s1AfsXw3smIeLbzzlORBzE1V++bAoWTH5WOHz9XFT+le26OUzustCkB
 tBXSuxtlvUuYlomLNbBusfUH35+b2MJA2yOqSs51oE+/5nzOceNOnQlXazAAV43c
 KkdM2+Z6QfoyS/pI9IJ1k5LXAM+695pBlXRvRMoxxu9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iTzJdZ
 fhmwp76ut9UrmrJAo/WLRBYCclCTFUVLoRX/o=; b=KlcfM83Krb6rK5RM1V2UwB
 QeXJrFB1QHRlt+0ASRbwpq1HP09o9yJsGVHiv8LNFuXj4v4nH2Oj6Ra/eJESd/h7
 pvZGV9omPvifHLFy8fcYnRDVv6DbIuiNIl4mWlyGk4qj4EWCNhFBt6zdRCVzseVv
 22SexUz9yN692O4gTmejuveMjMo/hGKdI1e+F40CJ/BEJWC+CXbUcqcSNOYod1KM
 DS2Ocd0kDJ+9doCd0eTqMma7XlQ0lSj5qFeh42t60zKaUhDRlf5HgAEKbWFhmbyO
 3+5FZgjKDlRts4jzbzawsNyZyLwB4odxo6h0LCv3EW65SjhFFypKpudsGXXnj6vQ
 ==
X-ME-Sender: <xms:kvM8YAQroRCBdLhofM1AvtjhZuYBiH8hIwEtXxEaWYqwNyfdlfAucA>
 <xme:kvM8YPXk-8mJsM5ZaJH-x_92ScyHozn5r1sOgSiuVEhNmen1HSPCzyGkIJn8L-Qz2
 L6OfwcjeDIt9fk819c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kvM8YEKBnE8rMsAyr66sFafcZZTJfvafbvDbPuepy6WUHJ_m3uyfsw>
 <xmx:kvM8YP2NQloPjYmKSj2OIkhOxr08WaNqEm9-05HH8MgOzs59Rx2h_A>
 <xmx:kvM8YBLEmLUcSpMTwgn0t91eGSItC6FXsv9JD6NNP8c7eLdEgz_5qw>
 <xmx:k_M8YJsKujlUriET_XYkQcdc-a_clUxyLQDa2vPeu0PIe8BAlGB9XQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 221381080067;
 Mon,  1 Mar 2021 09:00:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Date: Mon,  1 Mar 2021 15:00:35 +0100
Message-Id: <20210301140047.106261-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is v4 (RFC removed) of a series that adds support for metadata and=0D
end-to-end data protection.=0D
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
v4:=0D
  * promoted from RFC=0D
  * moved most eedp additions to nvme-dif.{c,h}. (Keith)=0D
=0D
v3:=0D
=0D
  * added patch with Verify command=0D
  * added patches for multiple LBA formats and Format NVM=0D
  * changed NvmeSG to be a union (Keith)=0D
=0D
Gollu Appalanaidu (1):=0D
  hw/block/nvme: add verify command=0D
=0D
Klaus Jensen (9):=0D
  hw/block/nvme: remove redundant len member in compare context=0D
  hw/block/nvme: remove block accounting for write zeroes=0D
  hw/block/nvme: fix strerror printing=0D
  hw/block/nvme: try to deal with the iov/qsg duality=0D
  hw/block/nvme: remove the req dependency in map functions=0D
  hw/block/nvme: refactor nvme_dma=0D
  hw/block/nvme: add metadata support=0D
  hw/block/nvme: end-to-end data protection=0D
  hw/block/nvme: add non-mdts command size limit for verify=0D
=0D
Minwoo Im (2):=0D
  hw/block/nvme: support multiple lba formats=0D
  hw/block/nvme: add support for the format nvm command=0D
=0D
 hw/block/nvme-dif.h   |   53 ++=0D
 hw/block/nvme-ns.h    |   49 +-=0D
 hw/block/nvme.h       |   51 +-=0D
 include/block/nvme.h  |   34 +-=0D
 hw/block/nvme-dif.c   |  513 ++++++++++++++=0D
 hw/block/nvme-ns.c    |   90 ++-=0D
 hw/block/nvme.c       | 1548 ++++++++++++++++++++++++++++++++++-------=0D
 hw/block/meson.build  |    2 +-=0D
 hw/block/trace-events |   25 +-=0D
 9 files changed, 2071 insertions(+), 294 deletions(-)=0D
 create mode 100644 hw/block/nvme-dif.h=0D
 create mode 100644 hw/block/nvme-dif.c=0D
=0D
-- =0D
2.30.1=0D
=0D

