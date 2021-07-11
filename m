Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DA3C3F35
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:33:46 +0200 (CEST)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2g92-0000Q6-UQ
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3I-0003p0-5Q; Sun, 11 Jul 2021 16:27:48 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3G-0002qY-0U; Sun, 11 Jul 2021 16:27:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 82D853200201;
 Sun, 11 Jul 2021 16:27:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 11 Jul 2021 16:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=vHGURBGxsp2a6+dhDds7E/zSBL
 zNWjY/0YpMtr6e25A=; b=KPa/2fqPNkpihcfdFdkOuTJjbMVeXA6GA+Gdcr8MA7
 536ZWotjM7OoVog+Tqj6yclaPlUyiD3tgxuVv1jeNimhlYe/etOuFbugdqpWoCYd
 hiolkc7/xH0z2kMm2IC8jJW5EUfuAYGB0YiVt7o+zppHcx/3Q01Js0iuxUfgnX/d
 YVGXqOy7gGe9qDh5A/SeGi9VPoTMwEmStwSwhpwhz01+iZBUPQIdwr5OQFV5to89
 Y1Hl3K85xGkaHUHR8yXELSQZiM15i3boRIlAXKjYDl59vdicdmxn5fCin7G2mUvZ
 rYO21RlvmtLYI3NvvommmoQTnpwJtJqDUHnBav2y2R5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vHGURB
 Gxsp2a6+dhDds7E/zSBLzNWjY/0YpMtr6e25A=; b=bUvfRx/nEslIzDIasQi9s5
 nnXJocLwPNoXF0mmrS39CmAiwrCrNGkUsjVv/vn1+Xe+WnUskVPdqbdJYlZABi7a
 7zIRVzr0VCpy8dpfg78Q9b4WJQgA20+3/JNXTnumbjQ1Bp5EsSHJtvQF4WArfPbe
 oF+8BzaS5496P2CMeuF2AYAOEyHJzLgd0Lye4a/qI4SatF+S4f9d2Yx9tfCIIHKO
 okopT7NjUYKpWGv1ilB/hAsUB0nP8Lp0fAbzocG+tF0ZF5qi/Dmog7I7Q5vhgxmL
 fdTzPrxy8pQl2CHGzEYw+38VKvBE7a+o59HjCkJ3pfD3D+m/RVvk66QtV0D7D7+w
 ==
X-ME-Sender: <xms:PFTrYJzfGTt27DhIOMoH-W9YuMkKQb3YSJ7Z4XJmPCzRV_ckqvZBIw>
 <xme:PFTrYJR5sBy__oeHK8FCDkkAy8oGr3agKLjnmjeg_J62wLt0c0RsiMCEqifjah22Y
 7XMyhgemSycyWDKmQo>
X-ME-Received: <xmr:PFTrYDUULygQb-35lnD8_kOlTstFLhf6KG9iFnhec_uuKICkCkOHQlqlgYHhWHt1gP1aEVUloZGTdYrzRc4_uK4-Xa8pmrVVZ33QgUSlHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepgfevffekgfefvdetjedtudfgfefffeegjeegvdegkeeugefgvdeludeuhedvveev
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:PFTrYLik8kOuPVu7nv12MlASO8s4TZ8xJ7oY8JSUU3jSLdPxiIjEHg>
 <xmx:PFTrYLA2MZRPeftb2hBGJK5bXWhR_LpenPlOgwlafcZ3Mp2IAxhP0Q>
 <xmx:PFTrYEIFPdvkr5ajzmGi4TIXQQgVmHVrRWK8DVfooiQo_0He9LyO0w>
 <xmx:PlTrYG9dCM16Le2mO7dBlbfHXEIzT2eGta57qqL511Qnp9IRWt3O6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] hw/nvme patches
Date: Sun, 11 Jul 2021 22:27:30 +0200
Message-Id: <20210711202736.591334-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Pater,=0D
=0D
The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into =
staging (2021-07-11 14:32:49 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 9cc1a34ec4fe7e89e44e460dcf50159e40962e59:=0D
=0D
  hw/nvme: fix controller hot unplugging (2021-07-11 21:50:22 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme patches=0D
=0D
* new PMR test (Gollu Appalanaidu)=0D
* pmr/sgl mapping fix (Padmakar Kalghatgi)=0D
* hotplug fixes (me)=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (1):=0D
  tests/qtest/nvme-test: add persistent memory region test=0D
=0D
Klaus Jensen (4):=0D
  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions=0D
  hw/nvme: mark nvme-subsys non-hotpluggable=0D
  hw/nvme: unregister controller with subsystem at exit=0D
  hw/nvme: fix controller hot unplugging=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/nvme: error handling for too many mappings=0D
=0D
 hw/nvme/nvme.h          | 18 ++++++------=0D
 hw/nvme/ctrl.c          | 27 ++++++++++++++----=0D
 hw/nvme/ns.c            | 55 ++++++++++++++++++++++++-------------=0D
 hw/nvme/subsys.c        |  9 ++++++=0D
 tests/qtest/nvme-test.c | 61 ++++++++++++++++++++++++++++++++++++++++-=0D
 hw/nvme/trace-events    |  1 +=0D
 6 files changed, 137 insertions(+), 34 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

