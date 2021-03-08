Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8C330D6F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:28:06 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEzU-00055P-UG
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEux-0002xY-Sd; Mon, 08 Mar 2021 07:23:23 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEuu-0006rb-6m; Mon, 08 Mar 2021 07:23:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A5C645C004D;
 Mon,  8 Mar 2021 07:23:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=ASzIQgY1oPWy7gvhlykNFMQtCx
 ghTSYgHGe/z8ogpyE=; b=VT2z4+lQsqFj17/OVpAI+Ai6LecXg5SeaaZyJiylea
 ykFQUhXi5oG1fAsJ3A9xSKcAglsFStvjYPG50IECdJYgaTYMpoaFmRgDjFHBTwxl
 K1PVgeFYj23xzv8U6/IwfcQJW3/2pcH/lj1O9gqKyIUDxIIMeN5WERdIVPzbUFme
 uwOzvzl79+Wa5co/SYDtqx+cDYJjnq645xB6KS0tpZbPurx1tsGcsyAL7r9u+feU
 kvSSs0ehX2uXqjpcE+uCfKbpETp5Zrfw7r0QaE6934W1fINliED9m84N8F+6JJiV
 VR3/6sRtC1huLS8pus/TMH3DlQv6ElAX1M5GPW3EPfhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ASzIQg
 Y1oPWy7gvhlykNFMQtCxghTSYgHGe/z8ogpyE=; b=l8pvkzIggtCxvcppuM+CKj
 oe6islSqQd8ySKtr50QKWjSzguSNRo2Bf7SIpAo3wTFZkjzg1mle/E7I93RA4EOI
 UesDItNYtCG9rkhfaFdRBgzPJaHsOObqPcnx6+07teSlPePEOKfK63Xe8f43RWqn
 O/W0FiIcWDv1yj/6QjMZXTDlyMrxJheDCrtWEP7UCmXYxAySkTQjWjqkAmFrXNXp
 uB88pZFvo+i8Zk28HZHjdJ7ZcSjB2U+qjq9y5e6KUJ0bKdo1JA9aUTA0j+zwJMS1
 deqQHfvBut9z7Ag712RNSHUc4Ci+lao3lvouCDcKYaFE1t/Gw18kVLd6IvAyZ2UQ
 ==
X-ME-Sender: <xms:NBdGYCp4Mr7faWcagLiRSKRgmJSQVESneQzlVWrVF_8PFz-LwgyiFw>
 <xme:NBdGYAoCIc4Qn8lONObcrqZElkePhOVxIaecR2q4A65hh_VA0nB1q5kIpJgZWs9Va
 ObURJqpYHGoDqa9sno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NBdGYHMye_DCkN1xobY8UmynFRR2o5gdUub4cLyZwIzsCGuAt8bG_g>
 <xmx:NBdGYB45r5SVudR_UTv6CBbKdQ4LxKYtAS_bDui1hMPIsaCgl12wdg>
 <xmx:NBdGYB4K2KNk_xuW85JVwRDYM_E5BtlaHUnRIxeWdcq2RzU027BnJw>
 <xmx:NhdGYMYiVzc8N41CzGw_GvWMDsdtglHeBdf7SOEt6aXSEIsbn14Bmw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EFFD11080067;
 Mon,  8 Mar 2021 07:23:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/38] emulated nvme device updates
Date: Mon,  8 Mar 2021 13:22:35 +0100
Message-Id: <20210308122313.286938-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' =
into staging (2021-03-05 19:04:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 552dca9ce2473acfa78e65320538d4d0a07e11b2:=0D
=0D
  hw/block/nvme: support Identify NS Attached Controller List (2021-03-08 1=
2:28:30 +0100)=0D
=0D
----------------------------------------------------------------=0D
hw/block/nvme updates=0D
=0D
* NVMe subsystem support (`-device nvme-subsys`) (Minwoo Im)=0D
* Namespace (De|At)tachment support (Minwoo Im)=0D
* Simple Copy command support (Klaus Jensen)=0D
* Flush broadcast support (Gollu Appalanaidu)=0D
* QEMUIOVector/QEMUSGList duality refactoring (Klaus Jensen)=0D
=0D
plus various fixes from Minwoo, Gollu, Dmitry and me.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dmitry Fomichev (1):=0D
  hw/block/nvme: fix Close Zone=0D
=0D
Gollu Appalanaidu (7):=0D
  hw/block/nvme: use locally assigned QEMU IEEE OUI=0D
  hw/block/nvme: add broadcast nsid support flush command=0D
  hw/block/nvme: remove unnecessary endian conversion=0D
  hw/block/nvme: add identify trace event=0D
  hw/block/nvme: fix potential compilation error=0D
  hw/block/nvme: add trace event for zone read check=0D
  hw/block/nvme: report non-mdts command size limit for dsm=0D
=0D
Klaus Jensen (16):=0D
  hw/block/nvme: remove unused parameter in check zone write=0D
  hw/block/nvme: refactor zone resource management=0D
  hw/block/nvme: pull write pointer advancement to separate function=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
  hw/block/nvme: add missing mor/mar constraint checks=0D
  hw/block/nvme: improve invalid zasl value reporting=0D
  hw/block/nvme: document 'mdts' nvme device parameter=0D
  hw/block/nvme: deduplicate bad mdts trace event=0D
  hw/block/nvme: align zoned.zasl with mdts=0D
  hw/block/nvme: remove redundant len member in compare context=0D
  hw/block/nvme: remove block accounting for write zeroes=0D
  hw/block/nvme: fix strerror printing=0D
  hw/block/nvme: try to deal with the iov/qsg duality=0D
  hw/block/nvme: remove the req dependency in map functions=0D
  hw/block/nvme: refactor nvme_dma=0D
=0D
Minwoo Im (14):=0D
  hw/block/nvme: introduce nvme-subsys device=0D
  hw/block/nvme: support to map controller to a subsystem=0D
  hw/block/nvme: add CMIC enum value for Identify Controller=0D
  hw/block/nvme: support for multi-controller in subsystem=0D
  hw/block/nvme: add NMIC enum value for Identify Namespace=0D
  hw/block/nvme: support for shared namespace in subsystem=0D
  hw/block/nvme: support namespace detach=0D
  hw/block/nvme: fix namespaces array to 1-based=0D
  hw/block/nvme: fix allocated namespace list to 256=0D
  hw/block/nvme: support allocated namespace type=0D
  hw/block/nvme: refactor nvme_select_ns_iocs=0D
  hw/block/nvme: support namespace attachment command=0D
  hw/block/nvme: support changed namespace asynchronous event=0D
  hw/block/nvme: support Identify NS Attached Controller List=0D
=0D
 hw/block/nvme-ns.h     |   13 +=0D
 hw/block/nvme-subsys.h |   56 ++=0D
 hw/block/nvme.h        |   63 +-=0D
 include/block/nvme.h   |   88 ++-=0D
 hw/block/nvme-ns.c     |   38 +-=0D
 hw/block/nvme-subsys.c |  106 +++=0D
 hw/block/nvme.c        | 1434 +++++++++++++++++++++++++++++-----------=0D
 hw/block/meson.build   |    2 +-=0D
 hw/block/trace-events  |   21 +-=0D
 9 files changed, 1424 insertions(+), 397 deletions(-)=0D
 create mode 100644 hw/block/nvme-subsys.h=0D
 create mode 100644 hw/block/nvme-subsys.c=0D
=0D
-- =0D
2.30.1=0D
=0D

