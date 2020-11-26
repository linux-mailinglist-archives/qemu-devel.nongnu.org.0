Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6C2C5E4F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:50:37 +0100 (CET)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR23-0000mo-TZ
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxq-0007Ol-EL; Thu, 26 Nov 2020 18:46:14 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxj-0003s4-C9; Thu, 26 Nov 2020 18:46:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 919BC5C01FE;
 Thu, 26 Nov 2020 18:46:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=RVwrI04kwWNF8+JObBC8exJRrx
 jwURAWhpAEP5Z9qqk=; b=V+wIZKn+le2vO02v71dsLuydOO+kR0CaUzJM5+qJkd
 cIYgxlLJRRMcez8Wu3gy3DJczkBxd26V0flDD2NiDJbBej34MlL1qFV3azurUlYr
 SCTf444AEiXutOPoJvEgjhCBJps3iieRaJL0f0DstSCRf2GQOvSJYhCiUfg8pJGc
 LtBjk+AqHamk9EDLVOgREEmKz329Hn0rgNsbEC3OyIBcH3mYsO/z1TihFeNCI09D
 hS+7kV7m4JdFiso8FMyWaSVJA4NJNcFSBuhqy2yPStf6n3oJRGFT/+Bc8NRyu0be
 xGnAcycozynHwQp+BR7OHCzIZA/pT0vap+bx244LX8Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RVwrI0
 4kwWNF8+JObBC8exJRrxjwURAWhpAEP5Z9qqk=; b=OIHRXj0RhofVR4PXCOR2Zu
 QSwqGbwgJxhszzyQtH9zZdMH9s+oBkYxbfcRbNj6S3DKwCYKZSJvY7q0RfzxTAPM
 2dIM1kK8wCzn0wSsQcTD2P9CU9MFgOqhgZ0WCDQscspWvFEkbyhRS/SQ3wmyDhES
 wlyoIvJ+hxWwenHgxdTP8qnBXhJKKojmMVVum5Myl1wlEllcvjHASizklksqfPEi
 OPUXGmL7Olq1ohseNWmmXJisso4UNVsQl7p6B4MvvnkLjgdrbkLtlRbyrpwvoJzg
 2mYf56URbnK3d1bqjFr/MHr0oM3vRnoeu57oG1IjYjgZeIgCWe8lcMZPAxQjaNgw
 ==
X-ME-Sender: <xms:PD7AXzeLBJZRiupKzlM4FKV2JTBsVuRcw7n1BR9844sSwayEglnJVw>
 <xme:PD7AX5PMrEW4Ccd7IPgj3rlxiu4KUxV7TjmGUBdJ5hLnRT6nB9VOkxGIg2xUwkivM
 mp6kEmD59i6d0Jv0Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepheegheeukeetjeduvdefkedvudduhedtjedttedugeejgeevhfekvedtvdeuffel
 necuffhomhgrihhnpehirhhrvghlvghvrghnthdrughknecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PD7AX8iEQ_Ne1L8EaGX9rJUlz8OzLdWpHX3FPxlMZnwL1pJQ6xup-w>
 <xmx:PD7AX0-lTlqz6119tk02p-m1SaFz877p5MXn-Y0oHSYSyX0gzmDHyA>
 <xmx:PD7AX_sgGT_4r9kKkJJXqkPP7fCi02BusQKVWQ7c7AYuEWZAa68vkA>
 <xmx:PT7AXzgsl4CGrsdtD-MfyLlvfvR-AWCxlmtD4RrihbP-B3LzU_yFPg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C85A3064AAE;
 Thu, 26 Nov 2020 18:46:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/12] hw/block/nvme: zoned namespace command set
Date: Fri, 27 Nov 2020 00:45:49 +0100
Message-Id: <20201126234601.689714-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Oi,=0D
=0D
Things seem to have slowed down a bit on the zoned front, so in the=0D
interest of moving things forward and catalyzing the process, I'm=0D
posting a v5 of my series (v4 never got posted, but it's in my repo for=0D
posterity, see below). I picked some preparatory patches from Dmitry and=0D
rebased on that.=0D
=0D
These patches apply on top of the "pmr/cmb coexist", "compare" and=0D
"simple copy" series that I've posted previously.=0D
=0D
An applied version is available here:=0D
=0D
  https://irrelevant.dk/g/pci-nvme.git/tag/?h=3Dzoned-v5=0D
=0D
Changed for v5=0D
~~~~~~~~~~~~~~=0D
=0D
  * Rebased to work with the DULBE support, recently merged in=0D
    nvme-next.=0D
=0D
  * "hw/block/nvme: Separate read and write handlers"=0D
  * "hw/block/nvme: Merge nvme_write_zeroes() with nvme_write()"=0D
  * "hw/block/nvme: Generate namespace UUIDs"=0D
    - Picked from Dmitry' series.=0D
=0D
  * "hw/block/nvme: add commands supported and effects log page"=0D
  * "hw/block/nvme: support namespace types"=0D
    - Refactored and cribbed Keith's approach to CSE from the kb-zns=0D
      branch and getting rid of the ugly macro initializers.=0D
=0D
  * "hw/block/nvme: add persistence for zone info"=0D
    - Marked RFC for obvious reasons.=0D
=0D
Changes for v4=0D
~~~~~~~~~~~~~~=0D
=0D
  * "hw/block/nvme: add the zone management send command"=0D
    - Use a pwrite_zeroes for zone reset instead of a discard.=0D
=0D
Changes for v3=0D
~~~~~~~~~~~~~~=0D
=0D
  * Rebased on nvme-next with "[PATCH v2] hw/block/nvme: add dulbe=0D
    support" applied.=0D
=0D
  * "hw/block/nvme: add support for dulbe and block utilization tracking"=0D
    - Dropped from this series. This series instead builds on the=0D
      support for DULBE that I added in "[PATCH v2] hw/block/nvme: add=0D
      dulbe support", previously posted.=0D
=0D
  * "hw/block/nvme: add the zone management send command"=0D
    - Use asynchronous discards.=0D
=0D
  * "hw/block/nvme: add basic read/write for zoned namespaces"=0D
  * "hw/block/nvme: add the zone management receive command"=0D
  * "hw/block/nvme: add the zone management send command"=0D
  * "hw/block/nvme: add the zone append command"=0D
  * "hw/block/nvme: track and enforce zone resources"=0D
  * "hw/block/nvme: allow open to close zone transitions by controller"=0D
    - In compliance with the concensus I dropped zone persistence=0D
      support from all patches.=0D
=0D
Changes for v2=0D
~~~~~~~~~~~~~~=0D
=0D
  * "hw/block/nvme: add support for dulbe and block utilization tracking"=0D
    - Factor out pstate init/load into separate functions.=0D
=0D
    - Fixed a stupid off-by-1 bug that would trigger when resetting the=0D
      last zone.=0D
=0D
    - I added a more formalized pstate file format that includes a=0D
      header. This is pretty similar to what is done in Dmitry's series,=0D
      but with fewer fields. The device parameters for nvme-ns are still=0D
      the "authoritative" ones, so if any parameters that influence LBA=0D
      size, number of zones, etc. do not match, an error indicating the=0D
      discrepancy will be produced. IIRC, Dmitry's version does the=0D
      same.=0D
=0D
      It is set up such that newer versions can load pstate files from=0D
      older versions. The file format header is not unlike a standard=0D
      nvme datastructure with reserved areas. This means that when=0D
      adding new command sets that require persistent state, it is not=0D
      needed to bump the version number, unless the header has to change=0D
      dramatically.  This is demonstrated when the zoned namespace=0D
      command set support is added in "hw/block/nvme: add basic=0D
      read/write for zoned namespaces".=0D
=0D
  * "hw/block/nvme: add basic read/write for zoned namespaces"=0D
    - The device will now transition all opened zones to Closed on=0D
      "normal shutdown". You can force the "transition to Full" behavior=0D
      by killing QEMU from the monitor.=0D
=0D
  * "hw/block/nvme: add the zone append command"=0D
    - Slightly reordered the logic so a LBA Out of Range error is=0D
      returned before Invalid Field in Command for normal read/write=0D
      commands.=0D
=0D
  * "hw/block/nvme: support zone active excursions"=0D
    - Dropped. Optional and non-critical.=0D
=0D
  * "hw/block/nvme: support reset/finish recommended limits"=0D
    - Dropped. Optional and non-critical.=0D
=0D
Dmitry Fomichev (3):=0D
  hw/block/nvme: Separate read and write handlers=0D
  hw/block/nvme: Merge nvme_write_zeroes() with nvme_write()=0D
  hw/block/nvme: Generate namespace UUIDs=0D
=0D
Gollu Appalanaidu (1):=0D
  hw/block/nvme: add commands supported and effects log page=0D
=0D
Klaus Jensen (8):=0D
  hw/block/nvme: support namespace types=0D
  hw/block/nvme: add basic read/write for zoned namespaces=0D
  hw/block/nvme: add the zone management receive command=0D
  hw/block/nvme: add the zone management send command=0D
  hw/block/nvme: add the zone append command=0D
  hw/block/nvme: track and enforce zone resources=0D
  hw/block/nvme: allow open to close zone transitions by controller=0D
  hw/block/nvme: add persistence for zone info=0D
=0D
 docs/specs/nvme.txt   |   32 +=0D
 hw/block/nvme-ns.h    |  127 +++-=0D
 hw/block/nvme.h       |   10 +=0D
 include/block/nvme.h  |  218 +++++-=0D
 block/nvme.c          |    4 +-=0D
 hw/block/nvme-ns.c    |  341 ++++++++-=0D
 hw/block/nvme.c       | 1613 ++++++++++++++++++++++++++++++++++++++---=0D
 hw/block/trace-events |   35 +-=0D
 8 files changed, 2246 insertions(+), 134 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

