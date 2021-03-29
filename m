Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19834D5D2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:14:06 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvSn-0007SD-5p
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJz-0003Op-MZ; Mon, 29 Mar 2021 13:04:59 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJw-00031b-Nk; Mon, 29 Mar 2021 13:04:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 24E1D5C0004;
 Mon, 29 Mar 2021 13:04:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Mar 2021 13:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=+1H2Im4JUjlzjACmQCtUZM0bV0
 Vu4DERVh2LhrwxySg=; b=uG3tdVOxl6rk6Ipu5Kj/C34VXBTepWEctOr3heX2ix
 JHdw4bxeSKXVFgjNkjRnsuaqoGorCycC+49QzO+uiCxtIB0VjUfnJFb8PpThThWw
 v2rLRPvdWNRMyvsKaB5m1S+cep3yDFE6n9ExueQ/pGdb4We0cvTKvswCBrQmHEQT
 FhMfZKiAH0wgsRfg3SgTUYzKDhFYFKeC7Q08pooTjk4i5Uv1CYmVNGhjDv0wNiKI
 U0IUQuou8a5YVvAfwZT1NihivcD1SAcbZtY/aHsOGMUstQ8lSflEFXIXkKvjWSIf
 y+A9IX+KKB7UKTLNTs/tOOUAJ5tYqbzOgyotPW4vE3rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+1H2Im
 4JUjlzjACmQCtUZM0bV0Vu4DERVh2LhrwxySg=; b=hARRfBwsM2pcb/RdR7J8jK
 KPPSNAjgKeF/xVnls75UOJtyHmJgExhqs4mQx7YsDCRvoxkeMHjd6i9BXjUoVpb1
 zTflxYIQecwfx08VPsvCeOdLlbwVkno0rwCu89qlRTswoddWiUqf9xCuspDah6Fm
 Yv5z0qeqcuHR6vfRNup+nPv+gN+GgPesw/KkCZyuFGWHj1isk+NJhGctuitVRL4x
 Qc/ApY1R+j3ZUhaumX6+veS+TvX+spWgfna1gW6sSBIDprjQVTH/BR+CWKE0pDFT
 YQkjeTcPO8EJKusUwLhhh3HvrXW0kDHEqqiua7OYzlvAmG/BmoIAySMta0iyshpw
 ==
X-ME-Sender: <xms:tQhiYAR4gk6BekgP1Dx7ETS6pv2ykoC3b6SC9HJ600EWJPhalFiGiA>
 <xme:tQhiYNzNBgnaNjNVeMGzj1cvu6k9GzIcjUddpHu4GcZ0BkpkyYFWW8UHVH-tcD-WA
 Mva45p_FghhC5mRr-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehkedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tQhiYN2mCXuI_qTx_tkFFXlG8oicg19mLYIhRUXhPp6z4j7egjQHvQ>
 <xmx:tQhiYEAGps38uaWUZDsRBNRWr6KfuWvsQ5d-bj_XjKhDMceTtbPnWQ>
 <xmx:tQhiYJjtkThvD9nN2bzDkDi5ZsK2bZvbmdCfWQO6i2hIBBetXwyJtA>
 <xmx:tghiYHajcpmIsmvftSZ1kOUnhea8DbXqOzk8sFv0CwlnyRhJcZQaEw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24C771080057;
 Mon, 29 Mar 2021 13:04:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 0/2] emulated nvme fixes
Date: Mon, 29 Mar 2021 19:04:47 +0200
Message-Id: <20210329170449.125958-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit ec2e6e016d24bd429792d08cf607e4c5350dcdaa=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-request' into staging (2021-03-28 19:49:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.0-pull-reques=
t=0D
=0D
for you to fetch changes up to 3a69cadbef7af23a566dbe2400043c247c3d50ca:=0D
=0D
  hw/block/nvme: fix ref counting in nvme_format_ns (2021-03-29 18:46:57 +0=
200)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix resource leak in nvme_dif_rw=0D
  hw/block/nvme: fix ref counting in nvme_format_ns=0D
=0D
 hw/block/nvme-dif.c |  2 +-=0D
 hw/block/nvme.c     | 10 ++++++++--=0D
 2 files changed, 9 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.31.0=0D
=0D

