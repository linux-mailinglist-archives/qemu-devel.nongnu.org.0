Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661066557D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVue-0004F1-Nx; Wed, 11 Jan 2023 02:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuM-0004DO-Qo; Wed, 11 Jan 2023 02:52:27 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuK-00069n-Lz; Wed, 11 Jan 2023 02:52:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 34A073200908;
 Wed, 11 Jan 2023 02:52:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Jan 2023 02:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673423538; x=1673509938; bh=vh
 GE/RiWpWfU05hvSr2lPRj1Sh/RwpZCQeBZIX/JliA=; b=h1NPMLHyxUzfH5wUwg
 Qka9DMnVb1VYXKqNicu4jxL7eVbHd632lf/JR6bwJzoWMlTGB6MoFd8iVS2tE2/U
 W4h64c1eQ4q7ePH/ldmZhRkZYcVHdR4qWlTWg3eZxQIxW4rIvigihbTOLa/A8JoG
 TflyhSGdcAlfklST0gO56GQB5POd81uH6Ttqfg2i6wqdb4PWAyoQaRG+7YqpEJgJ
 j1p28WK0yxMhngP0D6yxny6cTMtfHVP9X7FUPPAbypquwG0vFkPS3KtzJLYEYEPM
 E0p7wX6ofs9y+Ot5vGXZ8ihx95rZYrfK+f0MOo1g4f9qtAoJiU2E2vQtKsq9+uyx
 r4Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673423538; x=1673509938; bh=vhGE/RiWpWfU0
 5hvSr2lPRj1Sh/RwpZCQeBZIX/JliA=; b=H7gfP1byDvOCmVk1Nx0IFuL1iB/2t
 9B92OidymPd9k7JuQNCP1/+kQgNwKmd9jlw/xxS8wn4HYBScebae/H4rVLY+kiUQ
 0q6kfhdlI97PyF3Qg8zXRAjkbs6lS7tXhytbJIod0aXvmwXvg+/Pu07QrBFO6R/E
 5WTk58y+mhKRQlu4RtB3iNPb6aHWQ5MmVBOWdW4OPa+GeK7FhQNLWYV8hBOItK7U
 g3y/W7IzxfOlw3jNAdN36H+EfNW/hBrddsjGHvVzXDC65jY00VVxMDDA2A15zUXn
 pINX/x90YWSwJ06RrvMBxABiPUl7FDEnTMguwFIfyM8BkYLRJrs5K/7FA==
X-ME-Sender: <xms:sWq-Y-objB4Bw56nUxHrvKFDGa-yhNcGfiGIiQvORPo_eKLyx3-jzA>
 <xme:sWq-Y8o6atLZyBTCId2yu2YcetLfsbcM11G9ktSnw97YIWDcsGZHDHQTPa8cdvjSe
 qCR3EDeHQea8JF5xik>
X-ME-Received: <xmr:sWq-YzPcpF0G9-_XUG1cXiwqOCV0VCQEndYVjAVo0GffLccb4UWK5WTwX89CUCZ5LQIkLNGMsJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeekvddtvdetiedvjeehjeeujedvkeefvedvkeeftefffffhfeeihfeijeelueef
 geenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:smq-Y97_7npVjWXYAig8a-BCZM1uH86jPqhISfWpDlqBVxsWrc2tfQ>
 <xmx:smq-Y94pkLLnqYv-r4nVqu3VyK0jF1FQkdSBRgTFMWYyIsaOC6y60Q>
 <xmx:smq-Y9jjjSq_oOr36JigsvC94emgxOvnw3MHS2xNW_-2ys82r7OpTQ>
 <xmx:smq-Yw0FogrO46pu64mpfUSiGue2NQv2fqX1g0dLjLO9grq5WmwfqQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:15 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/6] hw/nvme updates
Date: Wed, 11 Jan 2023 08:52:07 +0100
Message-Id: <20230111075213.70404-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=k.jensen@samsung.com;
 h=from:subject; bh=4HLp5YVBMvP2wreB6pMeZsL1UfxUjQCuNZKrVbep2Fk=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aqzWsbI8Qo2avRMqAO0hNCDZfripT1DKaUT4
 B5babeLV4IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqsAAoJEE3hrzFtTw3pU6
 sH/3x8w7qUdUaEUZZ/JNjO622h0UEM6wfmxXSsrGPFTzbuh9066Fcfx+5kVW7oNkVn6H27d5FbGlX3
 z7DJdp09DPvcgo3PQ+dmASmvxKVyI+YCu6z1BC/J5OQBEZGskQaEm9BahqXhuMEzKqT/MFF7ufnX89
 pbhXYfqM2lAZIzIV+vBAShYmAtW2Tc3RcE+AibNjhhGOK1kqY0Lj7Eo651Gx5J38JYlH+KUekYW8xj
 /yoH1/VzAyVaANSTq6sYqBEaPIMJCAceM5lLskuUZQph/tq0Q9Mt9v3aaxBJkpaNY84OCNh6A10c+5
 Yxmnse21Jcpj7a5XDojGuAdx3SSNTBNmvUcqoI
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
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

Hi Peter,

The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:

  Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)

are available in the Git repository at:

  https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request

for you to fetch changes up to 973f76cf7743545a5d8a0a8bfdfe2cd02aa3e238:

  hw/nvme: cleanup error reporting in nvme_init_pci() (2023-01-11 08:41:19 +0100)

----------------------------------------------------------------
hw/nvme updates

----------------------------------------------------------------

Klaus Jensen (6):
  hw/nvme: use QOM accessors
  hw/nvme: rename shadow doorbell related trace events
  hw/nvme: fix missing endian conversions for doorbell buffers
  hw/nvme: fix missing cq eventidx update
  hw/nvme: clean up confusing use of errp/local_err
  hw/nvme: cleanup error reporting in nvme_init_pci()

 hw/nvme/ctrl.c       | 194 ++++++++++++++++++++++++-------------------
 hw/nvme/trace-events |   8 +-
 2 files changed, 113 insertions(+), 89 deletions(-)

-- 
2.39.0


