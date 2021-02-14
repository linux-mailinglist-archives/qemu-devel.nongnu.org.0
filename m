Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50F31B331
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:08:57 +0100 (CET)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQVb-0007DP-Ne
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPn-0004Lo-IW; Sun, 14 Feb 2021 18:02:55 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPk-0001mM-72; Sun, 14 Feb 2021 18:02:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F2E15C009D;
 Sun, 14 Feb 2021 18:02:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=3myw+3vzLKL4E12AFq/cSTTmFW
 CMM/DbUHP+ZYUp7es=; b=fph4D+vE1k+lxXUFEjLqlGkYYP3U8zwWztu1zN33Lc
 UB60kiOPhQfVnh9JD+wnBlqiG665NJO/LKDfvDqAXd8NWGvYhvPbF+2tz224TvfC
 84QtIsCzDw71ScDJDBEWEdz3P9qv24LCH8qaW29f6gT9MwcGDl9GPwcFdRcFqcOs
 wWJLD/WItgJEoDzFXQ9R29rNoXE4osC5cnmbFqkCBOhA+idbGDN33bJy8Et/alO9
 c5Qq3QtcILtCHakXWCk9TtLZV8EoChYF6r8E32ck0qv+ieCjmbghZir1exGjnL8I
 AeHWter0atT/9U7O4SNICl0LK0DeY9M+Nmxit1hfB4CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3myw+3
 vzLKL4E12AFq/cSTTmFWCMM/DbUHP+ZYUp7es=; b=mRZlJ2yGCTJAs3PWy9jnKw
 qUkCQlx+Z0HSx/g2lARZtKryR62m/eFP15n0MKEticeVKGDcB6M8cMIXLvDXUm9T
 XbfcmKBcPUMXVXuNhX/OXHZ8IZC6FMYz+0sIQdC3a++p9h1sMni7du1b+sK44SaQ
 665quYnkzYZeN37FLKfGNC2QWKPu14IOhE4YjHESJem9bSe5vAvMxAWXexffg3Uf
 wL5YOApQKr/ULz8t6/18Q8OPSXB9k4NQIbZQz5xb7gq4bxq+kg3uTbWdKOE3SMWz
 ucznxNrgf1ocAsIKBGN9KQE7c7YYVGxZxBdaJqYoMtSADJariPaSbCiyi1KzhRxA
 ==
X-ME-Sender: <xms:FKwpYCg-NVohLx7p57wlenrGDC4sckn2V3AQ4Lx5_rymVd3NGcx87Q>
 <xme:FKwpYDCDWYMbq6B0AA3bOKD6BoCcxLlB2QU81jDiI8F65O_4llCjPjgUaMLWMDsIa
 jl68V2hJ26yLp7Vsi0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FKwpYKFTmuD8TxH71CztZFIDk6r1hXS0dAXyxHKC5RXhJr5mF6wvGA>
 <xmx:FKwpYLStJ0Tqb9MGfBa0xa7Z1QpzQ1esekO2j9PQdXqOobyz_nZJmw>
 <xmx:FKwpYPxxKCH6TuqgNkezvM9fzW7vRQn51t0sMZZh5f8oI4mJ_CMncQ>
 <xmx:FqwpYGw56nBRu3T6r-k-fZPm9ot0IN5ccRI9BrYsM-5hS5AUDHx20g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 384F924005A;
 Sun, 14 Feb 2021 18:02:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Date: Mon, 15 Feb 2021 00:02:28 +0100
Message-Id: <20210214230240.301275-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is RFC v3 of a series that adds support for metadata and end-to-end da=
ta=0D
protection.=0D
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
 hw/block/nvme-ns.h    |   47 +-=0D
 hw/block/nvme.h       |   56 +-=0D
 include/block/nvme.h  |   34 +-=0D
 hw/block/nvme-ns.c    |   90 +-=0D
 hw/block/nvme.c       | 2063 +++++++++++++++++++++++++++++++++++------=0D
 hw/block/trace-events |   25 +-=0D
 6 files changed, 2027 insertions(+), 288 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

