Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E013C332485
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:56:00 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaxz-0005kN-Po
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJano-0008AI-DW; Tue, 09 Mar 2021 06:45:28 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanj-0008Qb-Ou; Tue, 09 Mar 2021 06:45:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 21A812711;
 Tue,  9 Mar 2021 06:45:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=RqYmDlidKqv1xqG+K00WbuYsiD
 Y6f1c2nMNmRwG/O3o=; b=XW3WZiuRiBs/Yx/RXAuX8LKFlLdJ5zT0WIce6iU4W3
 COz0yT9my1LCK048poukgj8zlxNfcKwATsajcOyAwVIlotMse3aXq9UVyrdjrNX5
 OVANN2KVdi0g5ubpBaTmRQuF58WMbX1VpACCbVMdms6yNTNGQTJsOhg1KSF3GkYZ
 7PRHJErcRFZI9tAYE0qcMjCcYwYI039t7y3cXHfZT/NzI9LMk6RXJ7rEGNZMNbHP
 0jUtaU3sSIzhSArrIkfTwPE533c01ofeO+7vwYN1fi5bMMnFsPV4lbd0qA+vv57i
 TzdDws2afVeeb2PFNSGQp5ZsSSriWSkztZ0pCvv4fwMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RqYmDl
 idKqv1xqG+K00WbuYsiDY6f1c2nMNmRwG/O3o=; b=O+6FnjXSO4KMIigSTS7ssb
 CJTbsB5inA7eTDa5Ktz7idM78whryVh4qqTDK9Cu6Y7Gn7NcemjTaBjbj4dzZX82
 PvBTxgHD0LH6YyEeSfxBMpD/RZA8xn7OLBiZNxqJ4IRkxNNxzC1r/D5viTcENKiY
 oNKUj+O7KTOjHgLhi54Bka1oJ2lViaN8knjKUGaI22rMkEldAJasPrnkShbev1hA
 yn7HrGzG/tLpt3Ury5Lps9QSERxhlSdDu4bfev5NEF+32pgy0MNZXVkYFbw+kxIw
 P3Epzd69X7uzrqZ8o8YZCAppD/bzStS/5HhpzToqoKJJKz90oxN7ARD4jqqCEPkg
 ==
X-ME-Sender: <xms:zF9HYEuMsLj6hWkYV8CfLU_avVKPZd9eG8v2hOREgOQ7aY_WnjhmRA>
 <xme:zF9HYBc6Uejw7j9F3bGkS1pmy_CRcPyMVNNI3Ndrw5AtfFnxHqBUIyf-_3Y0W6rxe
 PZHPGJ1zzxRIVojo40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zF9HYPy9WlvuhWqWCkN6MizIYymgDaiTEyw44jH_sMLp5oRlztmAsw>
 <xmx:zF9HYHO4hl2IGCrsPJzUqE4WuH6IYiNH7M7NA0iZ1XuqCustq6XyXg>
 <xmx:zF9HYE-fW9wtG34mPGik5vBGoETfyEAFhPoNHlAf-cY5BoBNT2mkmQ>
 <xmx:zV9HYBN46YO9nITIlESzEnhayJUu6Yg9ynYKWC3_Z50cmizE5yhDmA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9093240057;
 Tue,  9 Mar 2021 06:45:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 00/38] emulated nvme device updates
Date: Tue,  9 Mar 2021 12:44:34 +0100
Message-Id: <20210309114512.536489-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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

The following changes since commit 229a834518b950d56fd1bc94923276504d0ee9d4=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-20210306=
' into staging (2021-03-08 15:45:48 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 23fb7dfeca17c55e4329ca98459d33fc204c1f59:=0D
=0D
  hw/block/nvme: support Identify NS Attached Controller List (2021-03-09 1=
1:00:58 +0100)=0D
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
v2:=0D
  - add `nqn` nvme-subsys device parameter instead of using `id`.=0D
    (Paolo)=0D
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
 hw/block/nvme-subsys.h |   60 ++=0D
 hw/block/nvme.h        |   63 +-=0D
 include/block/nvme.h   |   88 ++-=0D
 hw/block/nvme-ns.c     |   38 +-=0D
 hw/block/nvme-subsys.c |  116 ++++=0D
 hw/block/nvme.c        | 1443 +++++++++++++++++++++++++++++-----------=0D
 hw/block/meson.build   |    2 +-=0D
 hw/block/trace-events  |   21 +-=0D
 9 files changed, 1447 insertions(+), 397 deletions(-)=0D
 create mode 100644 hw/block/nvme-subsys.h=0D
 create mode 100644 hw/block/nvme-subsys.c=0D
=0D
-- =0D
2.30.1=0D
=0D

