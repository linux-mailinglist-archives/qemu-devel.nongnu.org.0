Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0235728D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:00:15 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBXK-0007hM-0y
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUBQY-0003tC-TK; Wed, 07 Apr 2021 12:53:14 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUBQQ-0006Kr-FU; Wed, 07 Apr 2021 12:53:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 92C3B1581;
 Wed,  7 Apr 2021 12:53:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 12:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=2hF9kX9C60XTSChfVyr4dfOL5I
 VUYauW9azXyQ+j3hQ=; b=JgsUQOrKgxyQj6agBpPzWvHysnBMFGbiuV3zoyFovu
 h+M1upH7UQ+21w3wxiodmEXZZOfG/PmZfNIEkibpLFlSka07KqCbrpdRpZO8GQJJ
 JF1lMFIyn44Y0WRS4mMKx/A/lvXRIybkxGysxcSuoxNUyBKRIUSf+bZqTj0h2krH
 ZMwA2WzKFUzZoax/ubXmuddSZznM/OwlTHJVzwHChLSc1jmJjOiyhETRR5dKYl5g
 3DOi2Gd1alr4nODB4s08mWJ0dCm29DY30rVdSJjteGFwaTwVLf/VusOg51Pbg4Fy
 6o5qLQ2EeBHa/hGeucYKCGOtmpqSBg+0MoArY3yMvCuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2hF9kX
 9C60XTSChfVyr4dfOL5IVUYauW9azXyQ+j3hQ=; b=OvPQhgi+BYhHgmp1KnN6p/
 TnGPu2MuTwM5BWkcke4OlG/CiNJWGjnJxsdDIdkvxjhcUpgPagsFFl4ESr1hgh3a
 gfb77dlwwCuK3uEgZUYjrThtLSDGdwpKT00hiZSI7vgk25bbyGVPLgBdn+CsmTzI
 EP2as65/rfREeLWumKL0LnkerVAflCPrWvOiPBV0oRWU/FOhm4cYGXK/3zFoU2SK
 We5dnzNEP/k0E669A+V79QXUqYUN3vVK0Nfr6daKHdTtjCbRnKKlRzyLX2RkgmUK
 O1AORiGqmZLZN05pnerPS6aWXqiJauwVi16PESWDci/SIMI/mmRgYuU9Klx3R4KA
 ==
X-ME-Sender: <xms:beNtYJkGS1Y9vlpTXVwF7ehv4aAjTrV5zUgb7zOqp4C42V27t-tNtA>
 <xme:beNtYE1h4TASN8XWGOktS9RiSqaTtiXt9U-WT3MBXeW1XW7VouMiBA0sFR_rHvEfI
 ibCxtFHLjmTLVtS-FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:beNtYPrzvb00QkzdEGTfXSKBC1REG5kfwxoUMU9czBiuAkJa-4Gd6g>
 <xmx:beNtYJnpbm7kMLi-JpwUNmjqd7YIQ5PfZjxW_MA_Jf3WOOLAeNYMXg>
 <xmx:beNtYH2waO67yBjA3oi7l4OEOhkea7VzOnfDci5DhFRsFyBF86WNgw>
 <xmx:b-NtYMnYSRUoHi5mp_ISKHxuzVUpYdxelaZQPfK66JWQPjSshqRRNA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D0AA1080054;
 Wed,  7 Apr 2021 12:53:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 v3 00/10] emulated nvme fixes for -rc3
Date: Wed,  7 Apr 2021 18:52:57 +0200
Message-Id: <20210407165257.237372-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
Gitlab CI finally got back in business :)=0D
=0D
Note: only cover letter sent for this v3.=0D
=0D
=0D
The following changes since commit d0d3dd401b70168a353450e031727affee828527=
:=0D
=0D
  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-20210407-pull-reque=
st=0D
=0D
for you to fetch changes up to 7645f21f409b67eb9aad9feef6283c2e186e3703:=0D
=0D
  hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (2021-04-07 10:=
48:33 +0200)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme fixes for -rc3=0D
=0D
v3:=0D
  - removed unnecessary deprecation warning=0D
=0D
v2:=0D
  - added missing patches=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (10):=0D
  hw/block/nvme: fix pi constraint check=0D
  hw/block/nvme: fix missing string representation for ns attachment=0D
  hw/block/nvme: fix the nsid 'invalid' value=0D
  hw/block/nvme: fix warning about legacy namespace configuration=0D
  hw/block/nvme: update dmsrl limit on namespace detachment=0D
  hw/block/nvme: fix handling of private namespaces=0D
  hw/block/nvme: add missing copyright headers=0D
  hw/block/nvme: fix ns attachment out-of-bounds read=0D
  hw/block/nvme: fix assert crash in nvme_subsys_ns=0D
  hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl=0D
=0D
 hw/block/nvme-dif.h    |  10 +++=0D
 hw/block/nvme-ns.h     |  12 ++--=0D
 hw/block/nvme-subsys.h |  11 ++--=0D
 hw/block/nvme.h        |  41 +-----------=0D
 include/block/nvme.h   |   1 +=0D
 hw/block/nvme-dif.c    |  10 +++=0D
 hw/block/nvme-ns.c     |  78 ++++++++++++++++++----=0D
 hw/block/nvme-subsys.c |  28 --------=0D
 hw/block/nvme.c        | 142 +++++++++++++++++------------------------=0D
 hw/block/trace-events  |   1 -=0D
 10 files changed, 155 insertions(+), 179 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

