Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE33E4453
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:00:18 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD30z-00079k-Cr
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2x4-0003Mp-Je; Mon, 09 Aug 2021 06:56:14 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2x3-0008Ko-27; Mon, 09 Aug 2021 06:56:14 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 17FA35C0100;
 Mon,  9 Aug 2021 06:56:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 09 Aug 2021 06:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=8g34nzaU/6EiauQmaJcSyY15GH
 DQhOGQR9sklDu8G4Y=; b=FsAth+V3ky9rTBkTN4f2kitAzuuOpgmylUIajeT3rN
 kN1ihy3xTMNkJDPb42KFgtq6fTO9peqQAesfpIDOyjQbVl/0geRAquUu/acZZtJH
 23c71Ik6jjsucPqrvVNUPw9XNG4YgxcX1ofNtP8qrkbgqFfarLX6SqiCLJ9wOJLY
 5lJYmQLmBoAL095xulQtiCeHS5Nw39aPE4nvGX1wLhdRtxOiMAjNOCdiLb3ScLTY
 zlQTDkNwdBcjOX33Gxyu4etQESA9KcZlfti2EDM+JMzUh37jkEHxALQ8XLv9KvxE
 Ayl4Kr2yQIty1GiACGOud/NtEJD3Ik70uG/TuIwWex4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8g34nz
 aU/6EiauQmaJcSyY15GHDQhOGQR9sklDu8G4Y=; b=IjFttUEC4K1QI2NEkYjIXu
 aEyiQVb/eEfdMCfiSfnbRzNGrOnVbuwxH2xkzNwEq98a0jSW+j6tR+ewctv/ME1V
 wTyvtrzQny8FK+9OToB8MwgPHdRhHvsCdanXzkldG59/MiDvaG4KAS+fpFgDl0FM
 3fiZLQARaQteBkMTVrLvu7uby4ufHCabJahvqaUnOCaDB7uRYbdnPNEBxGOvYSgg
 WhGY10EofmBWvycelqi0vdWNLRUCztwqBS+DXVkkDA2PrFfUyve19APsu6rmaUs7
 nGVGej8mKbAZyBbHrBY63RyZGlxFBjEkjaw3ndh3LKXxNZIFlrHX3POz7saZBLdA
 ==
X-ME-Sender: <xms:ywkRYbREbPQ-x1UiDxvTGK-EVklVNrpZZMHuHFd9rBOdPP8I2OzzxA>
 <xme:ywkRYcwUuQ08N7pW5iWOGtoppX_gT5aBarBrMAOZWrSmlIWc9cPVbErzI-yAQp3SE
 Rity33ezQWQ5W6hyZY>
X-ME-Received: <xmr:ywkRYQ177Su2yf0lRqyjKCsMOTLszK_D-INET-P-Vnb29dnsozgiNQlzANCJZeHJjqxeAjL7dvmNijuLkYOfpeP1u7TZfaTa2vHrbw7v5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedvhfeujeeujeekvddufedttedvtdfghfetleegleduvdevteeuhfefkeefueehgfen
 ucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ywkRYbB-igvM2Aa18FtFHXAR3EkYd6BZ2Z5YEfPnBhGZ8rLC64CNHQ>
 <xmx:ywkRYUjVTf4ru24jG-8lvb2-pNzYOHNVGhS0_y5ke5vS171kglZvDg>
 <xmx:ywkRYfobCcRC8tRXsXN-FVefXsfFwHVCYaQa3mbhsHJotI7Jh-tpTg>
 <xmx:zAkRYceMSfcrFp9MjDb27m45xqlsLkNFc9cvUIkAOrvBqO1b4eI1WQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 06:56:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 0/1] hw/nvme fixes
Date: Mon,  9 Aug 2021 12:56:08 +0200
Message-Id: <20210809105609.51177-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pul=
l-request' into staging (2021-08-06 10:28:33 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 5f4884c4412318a1adc105dea9cc28f7625ce730:=0D
=0D
  hw/nvme: fix missing variable initializers (2021-08-09 12:52:16 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme fixes=0D
=0D
* coverity fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (1):=0D
  hw/nvme: fix missing variable initializers=0D
=0D
 hw/nvme/ctrl.c | 6 +++---=0D
 1 file changed, 3 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

