Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E74615DA1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq94k-0005QZ-T0; Wed, 02 Nov 2022 04:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94U-0005Mf-DD; Wed, 02 Nov 2022 04:26:03 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94R-00041Z-Th; Wed, 02 Nov 2022 04:26:02 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EFB65C00D0;
 Wed,  2 Nov 2022 04:25:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Nov 2022 04:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667377558; x=1667463958; bh=2Z
 crrjfM9M+B120sQWpg7aJt/Sk7j6WOaGnrwpMgY44=; b=xuChhIufBgkLncL7Uf
 TO38S4P0eObjkhtAMTtFjkms/HqWbD3SkwNupd4P2j5rjMDiwvYpZzM3045Qdq8Y
 A37q8by5pO9W7dunakI2DXWaXdeXFwYWztnMFmWT3Sn7/PVgsP/ASIBMupS/gbu7
 +9k8neuI9n2dhj/g/kHcp0cCo2FOB7EigdwNaILtYOAumdAnd+mJghuVAm3CiaQk
 PhNEjLijflZ76Ond0Sbt5vBq68uZK7rZenqQyLE/tW+oQPjr6Y2NPLaEilSWIOdI
 qUHqepSs1Da+bO1mBCYYgy9bn755heIV8NEjldsl95SadBQ6UAQJLpQmLOy3ggJg
 daqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667377558; x=1667463958; bh=2ZcrrjfM9M+B1
 20sQWpg7aJt/Sk7j6WOaGnrwpMgY44=; b=N8XPVm9lDEl7XCv5lOvlvCWzux06p
 SLpveIGlsMAMrhgVatthA5MC/S7B9K92nA7Ndvnx1yLXJOsLJrY7hOZTXADN0DWJ
 paxCdK54toG+ll3ezAy17mEcsQJeywnLWfw2DNPzvXKdCp/WCAGQw2CB15Zrl0Ck
 FwTEjRszlkjogW/NbAUJLDiC53IYQqnyFiQnj5xIsxVeWjTs/sxk320qcrONqOtZ
 UzqENJOzeRPAci/exbgf5sXbJ+kGi2rk8b2LMiXhqQ07Ntpf7F5sGzdYpDCirS7J
 JkFmKjgo/T9CNmv/A6Toyp0cqKE+0DoUj9PtLZh1Ij8OEX3wfwMpxT8QQ==
X-ME-Sender: <xms:lSliYyFXxZTBLwaGM8OU5gMYe1Mc2hKoJegqWtdIX1-O1d1XNYsjxA>
 <xme:lSliYzXbr9wOEmImptPyLVuoiv220PSTFnpQIv8bG-TvFnQN4yVG8iowP9Kx63VSC
 kdEyeZr2aNsgRQQfJU>
X-ME-Received: <xmr:lSliY8JLDvhhRpYch1iLkGhI7C5NXzM3wNjP2ElbZO7Ej5XBqudmyNlI4DlkGwHMWF9z417TdXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejvdegudfhgeehffetffdvjeetueeffedukeegueduudffjeffveduffetiedt
 udenucffohhmrghinhepghhithhlrggsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lSliY8H54c3NFKoinfr8O4RqJ53XScyVvTeE1LsklLPMwWk3-q7yKA>
 <xmx:lSliY4WByoeCA6Zdzy-lGyIXFQP7bok0klP2oCDCQT_5tzh5mXeL1g>
 <xmx:lSliY_M_Gf_OUbrl5BUyDiXcxu8pf_zar2i_QASF7yoU_sqtC31Vjg>
 <xmx:liliY_SQwKHPhH5c_0KQsbbGwR2--oKR6hCzxtCtMiikN8ydvhf9wQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 04:25:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/2] hw/nvme fixes
Date: Wed,  2 Nov 2022 09:25:53 +0100
Message-Id: <20221102082555.65165-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=k.jensen@samsung.com;
 h=from:subject; bh=BvrAMO2kwTzxY9Aq74T7yLZ1N8CbhvfBhZiB8GUPhwM=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNiKZJK/MiwPiAVfHZ9uUF2lFqMAlJWCTLBAx3X
 uIUbfDcLSYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjYimSAAoJEE3hrzFtTw3p7u
 8H/jbgcoDrtTgsnys3hpUkSGep4PXG5y9cmxr/z4j/RrVaTn6apVe0Vg4rz9anxzG6PdgT87UaOgOW
 CG59iH9ni15EylYtnab/7OMPee364ElLojRimIgxu1EMIXQ1CJMeEcKXNq7rMzZyfVIBCquoFVEdX3
 wYCxgqT4knF/XTo/3my0W49cSe7dUuROFITAkzhF6QRt8azUO/L+lZToiGHXUTzUCYQlt1PAPNwSgS
 1+3meLODJtYRbyO62Oh+KtrOfHtfNvGOZuJIjCeIW6U3gMMKY+S7UssN71Ov88vj57d83v8xdmAvrK
 1rbUhiFc7lJq4bUP5DhUGsYszTHC36jY6fq6Tu
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Hi,

The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aaf1:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-11-01 13:49:33 -0400)

are available in the Git repository at:

  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-pull-request

for you to fetch changes up to 632cb6cf07122b330d8ef419ec2f4aab561a9fba:

  hw/nvme: Abort copy command when format is one while pif (2022-11-02 09:23:05 +0100)

----------------------------------------------------------------
hw/nvme fixes

Two small fixes.

----------------------------------------------------------------

Francis Pravin Antony Michael Raj (1):
  hw/nvme: Abort copy command when format is one while pif

Klaus Jensen (1):
  hw/nvme: reenable cqe batching

 hw/nvme/ctrl.c | 29 +++++++++++++----------------
 hw/nvme/nvme.h |  4 ++--
 2 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.38.1


