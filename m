Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4035BAA1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:11:27 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqjG-0006bA-Nz
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqZy-0001GZ-Tf; Mon, 12 Apr 2021 03:01:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqZw-0000uD-TP; Mon, 12 Apr 2021 03:01:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D40E5C00CC;
 Mon, 12 Apr 2021 03:01:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 03:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=blTCwlFKQBMnN4eTb/0LszjWi6
 hL9zv6CmOksLSOGSU=; b=XW2BdPWiEgBTg+TL2u6d/uLptct63tvxlWZW+lOuNP
 HD6L/rtAjkPOKlp2UEurqCdglpK/l2/n8dgbHfVgWUt1p3Nh/DBtlGX+D5JchMv5
 dqLW7tt5v6KV1akPUBePABq/IlAPn5vMXKs5Emld8E/ZPBJs3bNZO6AnMyUepW/8
 U8EF8hiOxuq+RpHdrs8fdZnsmaa1h1E+dScFA5MZPpEeMrdEeKn9osFDk7Y+SUjb
 buBF2xgTEt1LMd3uUl8VqLpkPJEz72iJbd8BvL1KaVG7ZQVsWw4nZSImPvOwInWj
 GwQS1d4KMvPPbsB+XF9l3IZ7ve8ANc9h5m6vsJrtKhIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=blTCwl
 FKQBMnN4eTb/0LszjWi6hL9zv6CmOksLSOGSU=; b=ZwB0hf5D3g/KybcSrc0c4f
 PeOeD5/D8xryr0nhd3hywZ2bajD4YmAXYM+4Y3Tqn7V+rtaCxzxsCafJkbOWkkQ+
 6WT/tFEdMU1exy+U7/JRINY4fNg0SRxhpP9//KvBaMnSZ6fBrHXjORyLm+GIO4M/
 3Z7LcxwER9EgJF+cWF8SSjmw7nP4sC6z8mnUumH2UidomiBrJotpDz/qRrbrj2QN
 VwolFiAdb4uuKTjPlBbvIBDyPUthQUXZJ+oM0oI68semVVv/Zlyr8rpXVSagytdr
 fQ5zykSFR+8o5iKNcprR8jlqPyZXYjWzKWMpbPB+hFC4XOFTg3U6lHGaN++hcWjQ
 ==
X-ME-Sender: <xms:WPBzYKpJmBxk-WIAAmdtYRI2OILvQ4ldtP6TSyWBGVh5gL_V_WsDAA>
 <xme:WPBzYIo1tJuYCKQCntKaIY34joj1Mv-udmfS_sd8Umanah3yJkJ8b4FzIubpQqtuw
 iqxlwk5Swj34wSpCCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedvhfeujeeujeekvddufedttedvtdfghfetleegleduvdevteeuhfefkeefueeh
 gfenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WPBzYPMfbTKpULFPXrHTjRLfc-aTPpJipzyi2hCKhfDpyg14j0vprA>
 <xmx:WPBzYJ5YEvaANAuvDCrqqAOeSCJO3-PkJ3w0HwzIbn06UrXFxMI3Fw>
 <xmx:WPBzYJ5zWTMvZrPslA4Hj1oyvPHexqqy2XcjRhYL3ydwH-53hq35kg>
 <xmx:WfBzYHTHqu1Dpgl9v6vAm2cW1Vjvydo3kV7DR-TwGEV4cCMX_lzaMQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4716D24005D;
 Mon, 12 Apr 2021 03:01:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL for-6.0 0/4] emulated nvme docs and fixes for -rc3
Date: Mon, 12 Apr 2021 09:01:37 +0200
Message-Id: <20210412070141.521593-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-requ=
est' into staging (2021-04-10 16:58:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-20210412-pull-reque=
st=0D
=0D
for you to fetch changes up to 98f84f5a4eca5c03e32fff20f246d9b4b96d6422:=0D
=0D
  hw/block/nvme: drain namespaces on sq deletion (2021-04-12 08:55:23 +0200=
)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme docs and fixes for -rc3=0D
=0D
- documentation=0D
- fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (3):=0D
  docs: add nvme emulation documentation=0D
  hw/block/nvme: store aiocb in compare=0D
  hw/block/nvme: drain namespaces on sq deletion=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/block/nvme: map prp fix if prp2 contains non-zero offset=0D
=0D
 docs/specs/nvme.txt   |  23 -----=0D
 docs/system/index.rst |   1 +=0D
 docs/system/nvme.rst  | 225 ++++++++++++++++++++++++++++++++++++++++++=0D
 hw/block/nvme.c       |  38 +++++--=0D
 MAINTAINERS           |   2 +-=0D
 5 files changed, 259 insertions(+), 30 deletions(-)=0D
 delete mode 100644 docs/specs/nvme.txt=0D
 create mode 100644 docs/system/nvme.rst=0D
=0D
-- =0D
2.31.1=0D
=0D

