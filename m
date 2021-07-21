Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FBF3D0A16
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:55:48 +0200 (CEST)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6750-0001b9-Px
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yI-0006na-HC; Wed, 21 Jul 2021 03:48:50 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yF-0002M1-CK; Wed, 21 Jul 2021 03:48:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6DB745816CF;
 Wed, 21 Jul 2021 03:48:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 21 Jul 2021 03:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=AlkZxzAIh7PJsfLQFSn8kImp0K
 aqqq1wcUiVkA/1+u4=; b=DDa+8codAitVgx4NC0KXTWwrg03w6qjz5lZv0YjnYk
 8OmpIjVirzx0DIluang9VkhoCWRJZTqWGHNEGIEkFJbsB2ARDsqemAuylJ5zpTnB
 zM0pJqUSt4IU5Xo+REPnswtw5//tcdm71DIyONngCRQ9+e+xCJruNPl7O8fo/uOm
 IcuEFhPXZnYKltjyhkey7E+rsaNQTCKNhk0Ghw0ks0dRHQOBzq4JQnLHN26KPfaQ
 vlhmPVjpbzGEoTEGV2WHCuoUuNvO2ml7qF59zp2W659D0/yl2dOGEeE9Sb4zPBIQ
 Pi1IpPtzXGPOoi2nSqRW/iZ/7bm/aMI4+Cdrl/DE6R3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AlkZxz
 AIh7PJsfLQFSn8kImp0Kaqqq1wcUiVkA/1+u4=; b=mQGzmIgWkAuKYwP7hW5djn
 TcKBAJAfe0yJiAP5JKVgNcOqWIGacqvC04c6seE/zz3olrphuW24gjnNEYixJ9U0
 kK9OU/7X65AaDaewjryAqWj73H8l2wTw19vG/0o4TcQ1Gm8wy194MZTQDW0EE3rh
 RnMxt4PA8QxTvigJsX+yelSIzFQ64yw6/cxFNjiqTBdsP1L3Su9u6Gub431I+caT
 r1gyrWdueGSteTaZAWbbT5Hns2WV1DKKcWQwDZHPk3aHSB9A9dluvc9koamSB4kI
 XzMBPWh45ptIWl9Q46keyUvbn8NZkAK8yQrNmoM6Xd4KiimCZ86WhbV0NxNJkXPg
 ==
X-ME-Sender: <xms:WtH3YM1YRo9AuJptzk71LtYjvo3gzHAarw5tXZ7fHk-8edHofcfdEQ>
 <xme:WtH3YHEZrh-VhNk86HYAx19e1izyKJ1PuOMdh_ijXyO5zSrCmewXBZgVOeSFOCOpD
 b8w1jWkEOvvY_gpSeY>
X-ME-Received: <xmr:WtH3YE6ziFHiIapuLl3-iY6ToYFq6Ono7W8TzYaLSMpj3Aa60O-iXBp-_1ZDZiwW2zox-NbgqbmU1b6EmlpmXrrDaUwzoANNHdSzN7uKyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeduheefudfghfdutdetffefleeutddttefgudeludduudfguefhleeuueeugffg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WtH3YF3YF70jUkp0BVvSs5MXF6EWCVC5kp_-uQcu6-tvmoHKVJGIHg>
 <xmx:WtH3YPFxikfAJE48GZ3E2VF4RSxXw0YbEqkoIo2gSv8bS0eRDQJXUA>
 <xmx:WtH3YO-lY2HTOB1qPMTr4YjMP-38Gi32d0jepRoic-iXs5qq6sDVUQ>
 <xmx:XNH3YPHF4xR6ACxDhotfMbkrdZeczTHJUaTdwIizXaMO5utSv9VorA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 03:48:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/5] hw/nvme: fix mmio read
Date: Wed, 21 Jul 2021 09:48:31 +0200
Message-Id: <20210721074836.110232-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Fix mmio read issues on big-endian hosts. The core issue is that values=0D
in the BAR is not stored in little endian as required.=0D
=0D
Fix that and add a regression test for this. This required a bit of=0D
cleanup, so it blew up into a series.=0D
=0D
v6:=0D
  * "hw/nvme: split pmrmsc register into upper and lower"=0D
    - Remove unnecessary masking (Peter)=0D
    - Missing shift (Peter)=0D
=0D
v5:=0D
  * "hw/nvme: fix mmio read"=0D
    - Hurried the changes a bit. Fixed.=0D
=0D
v4:=0D
  * "hw/nvme: split pmrmsc register into upper and lower"=0D
    - Fix missing left-shift (Peter)=0D
=0D
  * "hw/nvme: fix mmio read"=0D
    - Remove unnecessary masking (Peter)=0D
    - Keep existing behaviour and do not zero the register fields doing=0D
      initialization (Peter)=0D
=0D
v3:=0D
=0D
  * "hw/nvme: use symbolic names for registers"=0D
    Use offsetof(NvmeBar, reg) instead of explicit offsets (Philippe)=0D
=0D
  * "hw/nvme: fix mmio read"=0D
    Use the st/ld API instead of cpu_to_X (Philippe)=0D
=0D
Klaus Jensen (5):=0D
  hw/nvme: split pmrmsc register into upper and lower=0D
  hw/nvme: use symbolic names for registers=0D
  hw/nvme: fix out-of-bounds reads=0D
  hw/nvme: fix mmio read=0D
  tests/qtest/nvme-test: add mmio read test=0D
=0D
 include/block/nvme.h    |  60 +++++--=0D
 hw/nvme/ctrl.c          | 352 ++++++++++++++++++++++------------------=0D
 tests/qtest/nvme-test.c |  26 +++=0D
 3 files changed, 265 insertions(+), 173 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

