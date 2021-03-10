Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD0333955
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:00:30 +0100 (CET)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvdl-0001A4-Dt
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXQ-0007VY-VX; Wed, 10 Mar 2021 04:53:56 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXO-00052X-LX; Wed, 10 Mar 2021 04:53:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D1C85C009C;
 Wed, 10 Mar 2021 04:53:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=HhiXwAPEbFMN54eRAWxzMz8Z5+
 QI7EakfDqoNkL62lo=; b=3z9K1H99pVvRrtONN2AhxKo6XL7MotUhUSnoDPWzeK
 SyrYw7Ss5jUQnByZvK7vNsuoGp1HCe55LdxoFrrBjUUBaTqdEZIAbS+GPX0LMePG
 R3pv2xZWCfgo5A5b9qJ80wXpFGFEf6n0l67BAcRRO6Ootua7V8Ff3GU7O4ISyhjb
 IlDixIz+XO0RV8YxBr0ab7CGTWQciOwQbOh1y4CbTl3N6lAnKmbzGvpM4s4Rp0RG
 pJpQNmlPmA//N4lB0drp9zRwWPFTT4moPfyXt8LmbiaPbSmuRd9Oh3dcuYStedOI
 KwZ12hSt/AVmHnC3RppcIH2rrF13jWwWsyupe5mCYATg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HhiXwA
 PEbFMN54eRAWxzMz8Z5+QI7EakfDqoNkL62lo=; b=G4zZ7OFs+N+wmNiKxe3Oi+
 MGDxSmzPfwMWhl74xqkWbUFDMtOb0aLz1hWSiT+UrmTaWJe7iri5QaZ/YVDmIc4/
 1dBeUv3rvXQ8rqCn331JfvRi0xzF1DawTrWDf8ypjPlQFFrhm3Bj4Zt3yzO0rhOm
 Mffc5hhZc0wkDCfXb5o/edpgp4A2x1fIiOryAGKuaJAVgJJMX6m5mJzw4ItjcPgJ
 i4fRYvB/IGN30bb1HhEVSDvVyALBhl7vJuoT7xyb4DkuHZRApWtIKZ1GkW0wYNz6
 j1eNsg8AAfB6jvzOx7Bmr3twSOxFPNKxE9KZznL5yKMh6LD84dUpW7oVXb9kwWsA
 ==
X-ME-Sender: <xms:LpdIYDpGnHG4D2jfKL2rcTkuHpOwS1YXlR9Y_HES-pXfazPR0MwrsA>
 <xme:LpdIYNoeEBgtXhFv-QilQ-9rOaxHSigzK8591WVs8L8zB8ErUflp5GAkuiUOLHYOR
 k9CklftYTieRWDpTKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LpdIYANX7S6w3QywvUco966TTyLkS0YJqFPdqg9zuKa1F0Ry2Ic0xQ>
 <xmx:LpdIYG4q4kyEM9XJ7SBfEMG0MubBEeeuLOONvPDyljDJR-mjX6YMAg>
 <xmx:LpdIYC6pFqyegLMOX4Iun9as3YTPK0it_c2ePyOFd5wDpsJTNapq-A>
 <xmx:MJdIYJYTh-nKIRNrpPeJIgtmhWxyIQBX9WbS-mwIgi0HHdUb7KzDPA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5625024005C;
 Wed, 10 Mar 2021 04:53:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/13] hw/block/nvme: metadata and end-to-end data
 protection support
Date: Wed, 10 Mar 2021 10:53:34 +0100
Message-Id: <20210310095347.682395-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is v5 of a series that adds support for metadata and end-to-end=0D
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
Support for metadata and end-to-end data protection is all joint work=0D
with Gollu Appalanaidu.=0D
=0D
v5:=0D
  * add a required fix for zone management receive when metadata is=0D
    involved=0D
  * add a couple of refactor patches for the zoned init code to make the=0D
    format nvm patch more straight forward wrt. formatting of zoned=0D
    namespaces.=0D
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
Klaus Jensen (10):=0D
  hw/block/nvme: fix zone management receive reporting too many zones=0D
  hw/block/nvme: add metadata support=0D
  hw/block/nvme: end-to-end data protection=0D
  hw/block/nvme: add non-mdts command size limit for verify=0D
  hw/block/nvme: prefer runtime helpers instead of device parameters=0D
  hw/block/nvme: pull lba format initialization=0D
  hw/block/nvme: parameterize nvme_ns_nlbas=0D
  hw/block/nvme: remove invalid zone resource checks=0D
  hw/block/nvme: move zoned constraints checks=0D
  hw/block/nvme: split zone check/set geometry=0D
=0D
Minwoo Im (2):=0D
  hw/block/nvme: support multiple lba formats=0D
  hw/block/nvme: add support for the format nvm command=0D
=0D
 hw/block/nvme-dif.h   |   53 ++=0D
 hw/block/nvme-ns.h    |   61 +-=0D
 hw/block/nvme.h       |   34 ++=0D
 include/block/nvme.h  |   29 +-=0D
 hw/block/nvme-dif.c   |  508 +++++++++++++++++=0D
 hw/block/nvme-ns.c    |  259 ++++++---=0D
 hw/block/nvme.c       | 1267 +++++++++++++++++++++++++++++++++++++----=0D
 hw/block/meson.build  |    2 +-=0D
 hw/block/trace-events |   22 +-=0D
 9 files changed, 2018 insertions(+), 217 deletions(-)=0D
 create mode 100644 hw/block/nvme-dif.h=0D
 create mode 100644 hw/block/nvme-dif.c=0D
=0D
-- =0D
2.30.1=0D
=0D

