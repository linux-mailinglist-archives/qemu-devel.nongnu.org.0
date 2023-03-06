Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D736AC367
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBvN-0006Qz-FA; Mon, 06 Mar 2023 09:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvH-0006OM-7X; Mon, 06 Mar 2023 09:34:46 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvE-0005U3-Hm; Mon, 06 Mar 2023 09:34:42 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E48D35C0325;
 Mon,  6 Mar 2023 09:34:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 06 Mar 2023 09:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678113278; x=
 1678199678; bh=GNHVHrXGYIf1YPviKyoay8iuZi9yqmLHup42Ic+lrEk=; b=G
 Y7/92Ul4qTNjm2D5daTcWyadQ+USUhUZAwQAXPXsJJ5QJPeMxfwBwwrzbcJM63YL
 cYl3qjRCdbM8oOFRUvpAPtCHrTw5meWJZiyP50teYoelljMrmDPBL1nXMaToOxzK
 kcBDU0O9ASb2QNFrtEKodNQmoZBCn8hoanexoD42LlchAvUgH87szOt+4uKEu4g9
 rEhjRCAZIAVPuojdxIoz1PEsVp8kV6TFvD1bI7KqhkMuWMND2A7t6340StsbbB5V
 00xkpmTyDweUqhN9CwiosKfkbhXXb9FNaLvZV5BmmsuCevf9MWrCCzAXtomlkdoz
 ZAVdoi7A6uoMX5D9O+F0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1678113278; x=1678199678; bh=G
 NHVHrXGYIf1YPviKyoay8iuZi9yqmLHup42Ic+lrEk=; b=s2ljxkc74NyuCyHqu
 dos1zUq8tWerX/lwEvnF/Qw4slClZvre+otzwGqf70HFbdDiKHe5ygpYP5kDLgea
 lzvMuDJ49N/9T0fIuP7UmY8JkMGyESugsrg2qFxp7GTL9dqfU/dj1R9IAOkKpwKI
 y5DANfhaZRSEz+9ng0w/3c50BvemyYyEyLDnlLOmek3sRCdGIDArTPs/UPfWJiQv
 hMwERXYpt/yhfxrUEvI1paVrG1FUFxKK0A0Aa1xQ8Me6ib2ZqdyEPosYhIssjOjt
 CdQ4eSKQaQ/cXZsp+3NWTQWmr7b9v4OKNrZUR+HwyqZwL43GEJA1174jxj+q3do5
 IhwuQ==
X-ME-Sender: <xms:_fkFZM1vN6lTtekjf5InDar1Okm5ARUFMNkKpZJ0fhKiZQD-phTsjQ>
 <xme:_fkFZHHk_vnEqYgECNpn0DK2mit8Ok2EjSYZF0pb7Nq9BSvbTRP_yXXLs1FNXj8tF
 odOmO_00KiFxK2mWGQ>
X-ME-Received: <xmr:_fkFZE4iUQBPCpjckR4z4qeyL5iaQCbeZ8fsXODqp6NXDGM73SWOaVCmB0SOOXre8Y6tRW4sdSkFnsg0yuvsYPs-ATJ_PxFn51OXpEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeetffffteegfeevueeiieeujefhvdekleejvefhffdugedtveejieejtddt
 geenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_fkFZF0bKZAaNPVwvvCdhilW-Zh81qiPAQ-gRvuC8mNo1RasRCq_SA>
 <xmx:_fkFZPH4FWzSxAKtEYgazGMoEJK40go5_5madlWXOYjVMHup627cJw>
 <xmx:_fkFZO8gFsCCA5yzIEVwbkT-5YfZR5XybxhUfap2IOCFoYyvr0Kdlw>
 <xmx:_vkFZGDN30_mWd2wcFH_2dVmjdizvn6EYEu_h-J-UBucYVeijAN2_A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 09:34:35 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/5] hw/nvme updates
Date: Mon,  6 Mar 2023 15:34:28 +0100
Message-Id: <20230306143433.10351-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435; i=k.jensen@samsung.com;
 h=from:subject; bh=HeR/NLfbjVObeUo0lesSBsNowTErLPQ0mKmSo7CG+bw=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQF+fjxjaEMuJ+ftcaxWDMB+tuMvdLuHiBOm
 ipcuFLZ2fWK84kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkBfn4AAoJEE3hrzFt
 Tw3pIp8H/j/ea7aPdcXnZ7hso+99paJWN0TL5XgwqT4oEm9JcBROtFOarmd27CTZ0Bu5SJYl20f
 5rKbMImsgjIRu0AUlGoOJ/l7LNWOCZ4Fzgg/KBwNCjojmTVkjnnBZ9xa3/EU0KZIA4o9x0RGMck
 FvRqEMNb+HWjU++WPoFN1uh8rj7IFseYXi63WTXO5+dihNDr4meeolrcBKVJXs68RcQI1bj2DgP
 QScV1lQ9dWFVRritqA5L9lxDgXDwUtdiiZB+2y86tJYgyXGRnzzOnEKu8//bwOOFjvAI/3N4GdM
 uP4sRsJuZBhl3Lz2lGv1ch0CAuY68VHfAEuq4ErOK7IYayCAdpv8Uau0
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Hi,

The following changes since commit f003dd8d81f7d88f4b1f8802309eaa76f6eb223a:

  Merge tag 'pull-tcg-20230305' of https://gitlab.com/rth7680/qemu into staging (2023-03-06 10:20:04 +0000)

are available in the Git repository at:

  https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request

for you to fetch changes up to 73064edfb864743cde2c08f319609344af02aeb3:

  hw/nvme: flexible data placement emulation (2023-03-06 15:28:02 +0100)

----------------------------------------------------------------
hw/nvme updates

* basic support for directives
* simple support for endurance groups
* emulation of flexible data placement (tp4146)

----------------------------------------------------------------

Gollu Appalanaidu (1):
  hw/nvme: basic directives support

Jesper Devantier (1):
  hw/nvme: flexible data placement emulation

Joel Granados (1):
  hw/nvme: move adjustment of data_units{read,written}

Klaus Jensen (1):
  hw/nvme: add basic endurance group support

Niklas Cassel (1):
  hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace

 hw/nvme/ctrl.c       | 802 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         | 147 ++++++++
 hw/nvme/nvme.h       |  92 ++++-
 hw/nvme/subsys.c     |  94 ++++-
 hw/nvme/trace-events |   1 +
 include/block/nvme.h | 236 ++++++++++++-
 6 files changed, 1345 insertions(+), 27 deletions(-)

-- 
2.39.2


