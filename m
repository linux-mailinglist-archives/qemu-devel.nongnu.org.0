Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA1340520
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:04:53 +0100 (CET)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrOV-00083x-Am
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrI2-00066K-Bx; Thu, 18 Mar 2021 07:58:13 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMrHy-0001YZ-PC; Thu, 18 Mar 2021 07:58:10 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F9185C0131;
 Thu, 18 Mar 2021 07:58:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Mar 2021 07:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=3goACMAD07JmUEIpl3fZnWsJ7X
 /o2dfDZ08z9anN08E=; b=CYFdFj14BFL6EMhQ4j5///PkyUDrxNXuL3yUOx/zbi
 0hSkfcilvCwb+pMVOkWg7B7l5WddOFWdIz+pVb5gtn7Wo9CzUT0jY1w5O8q82oPw
 M70uZupzm7v4rmNuIrYkrIr5sUx6vW6Z2rXDxIuM6nL+HFnI8WiZ/P1c3gPisj7y
 JhgQhna9lXJqwNlJyfG7sJMZz67u6UPXP/tlXL6PyaIknzBb4XYZABs5ybJzaCAp
 zJcGz1OGyaTXj3/glAYj9wfZgQD+ggjKW6zggGpTwF9UqKOt2XeUPInuFx8eEUdl
 uIhOHuvc4jdL8R74pJ2EuJ2gXeM7pJlWMM/4vak+h3mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3goACM
 AD07JmUEIpl3fZnWsJ7X/o2dfDZ08z9anN08E=; b=bMw0dYQ+7imFaiVoaG8Z+R
 IIQufABRmb0ZdPEzGoepRF6bqE9GNFwSjQgj5PzivabvvTHm1k+hybYUiw4gbuDv
 KFX+szlz8ImvIi53hp293BRdPKBKgp09sd+waegiAZUd2IrtFwR8GWkiTByFJEy3
 c12X900JucvkhoJgFQLr5s47nEDk+6RBmTXQg4Jw49Ypd6dO+y63sVDnG2spXcvz
 aCbtCfI0EUCO3uxo5GleInycTT1XNcjBdEZmCS8SRU3+FaXMhpONn1msBjY31ZZQ
 N1CgT4bJ4CN3rFVdllv+UgSKjmKP45sta7DnEnqxWmBS5WOONy6RteQGdj0EFfZA
 ==
X-ME-Sender: <xms:R0BTYIsKEQIeJBGFFPEPQgTcPi6rAWYjSxYiryAiRQJAaxyLAba8xQ>
 <xme:R0BTYFbgU9vGT7SSjoeslx8KsI5G5RkStmhRQrwamlHEBh93ZMH9I8ognfcsWR0CS
 dMhfpni3UI9XOJ5QfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:R0BTYAq-sML7pDyvDDhAaDzblc5es9VJqJPBOi7jQIAADlKbJiJdbA>
 <xmx:R0BTYC_T4E7gBX_U3LbP-C7OVFl2Ump83XvmcN6q44KySN87C1rvsw>
 <xmx:R0BTYH8uyROrMKKXocaBHezi7X5hk9JQ-UZG_Fv_3UGYQnk4Ffe81g>
 <xmx:SUBTYEjx-KBt6024odoJJ9_cYpalbd03ge5t9HgsKTmmSb-5byFWKg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58A97108005F;
 Thu, 18 Mar 2021 07:57:58 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 00/11] emulated nvme updates and fixes
Date: Thu, 18 Mar 2021 12:57:57 +0100
Message-Id: <20210318115757.58923-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Hi Peter,=0D
=0D
The following changes since commit b12498fc575f2ad30f09fe78badc7fef526e2d76=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.0-pull-reque=
st' into staging (2021-03-18 10:05:37 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to dc04d25e2f3f7e26f7f97b860992076b5f04afdb:=0D
=0D
  hw/block/nvme: add support for the format nvm command (2021-03-18 12:41:4=
3 +0100)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme updates and fixes=0D
=0D
* fixes for Coverity CID 1450756, 1450757 and 1450758 (me)=0D
* fix for a bug in zone management receive (me)=0D
* metadata and end-to-end data protection support (me & Gollu Appalanaidu)=
=0D
* verify support (Gollu Appalanaidu)=0D
* multiple lba formats and format nvm support (Minwoo Im)=0D
=0D
and a couple of misc refactorings from me.=0D
=0D
v2:=0D
  - remove an unintended submodule update. Argh.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (1):=0D
  hw/block/nvme: add verify command=0D
=0D
Klaus Jensen (8):=0D
  hw/block/nvme: fix potential overflow=0D
  hw/block/nvme: assert namespaces array indices=0D
  hw/block/nvme: fix zone management receive reporting too many zones=0D
  hw/block/nvme: add metadata support=0D
  hw/block/nvme: end-to-end data protection=0D
  hw/block/nvme: add non-mdts command size limit for verify=0D
  hw/block/nvme: prefer runtime helpers instead of device parameters=0D
  hw/block/nvme: pull lba format initialization=0D
=0D
Minwoo Im (2):=0D
  hw/block/nvme: support multiple lba formats=0D
  hw/block/nvme: add support for the format nvm command=0D
=0D
 hw/block/nvme-dif.h    |   53 ++=0D
 hw/block/nvme-ns.h     |   50 +-=0D
 hw/block/nvme-subsys.h |    2 +=0D
 hw/block/nvme.h        |   44 +-=0D
 include/block/nvme.h   |   29 +-=0D
 hw/block/nvme-dif.c    |  508 ++++++++++++++++=0D
 hw/block/nvme-ns.c     |  124 +++-=0D
 hw/block/nvme-subsys.c |    7 +-=0D
 hw/block/nvme.c        | 1257 ++++++++++++++++++++++++++++++++++++----=0D
 hw/block/meson.build   |    2 +-=0D
 hw/block/trace-events  |   22 +-=0D
 11 files changed, 1939 insertions(+), 159 deletions(-)=0D
 create mode 100644 hw/block/nvme-dif.h=0D
 create mode 100644 hw/block/nvme-dif.c=0D
=0D
-- =0D
2.30.1=0D
=0D

