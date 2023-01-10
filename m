Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087C6639CE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8tW-0006o6-1f; Tue, 10 Jan 2023 02:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tQ-0006jj-Re; Tue, 10 Jan 2023 02:17:56 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tM-0003K7-CA; Tue, 10 Jan 2023 02:17:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DE42D3200942;
 Tue, 10 Jan 2023 02:17:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Jan 2023 02:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673335067; x=1673421467; bh=+b
 2qaEIkclLJL6qrmQoUwKihWjVqkJVVVeuag4JGJcE=; b=iXDylgQyBuEQqoGJeY
 lVhLvEQ+PmpfCLwlANEHsNYEKSBX86LeRtyp9CIDQt5lCV9eK+1KnUrlr1p3DaUS
 pdLjFcxnva8tfRqwRUukTpCJ2PYq7UE+mOsUefNKqMJZG15/1haa84V8D0d8AaBL
 PrLx2yTPQ8wuMzNNYK1g1Kykz+VXLlCqrBiXMtRgZVc2uMaqZdZ19eDLoVTQHPyD
 PsEkn63eMkNNQhVUgeDrGW6S/46KFHa8dwPQlGKAQfx1nwxf90cgUHKMcrOQiarC
 xpV1J9UNpN6lJTm94XgqLqFXPA5CRxaKjvG8zAN0FVE51LNxjgcW8+2JXAmkKRvz
 iSAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673335067; x=1673421467; bh=+b2qaEIkclLJL
 6qrmQoUwKihWjVqkJVVVeuag4JGJcE=; b=ONobUpWwL0DwFg+BUotwvGGncYVIb
 n4tIU1daH2P/M79+S99qvxX4ZkQ1oq39D2NEkNIfyBpyix3+KGvcfv1nqow+0MHm
 99mOOKbeMYkHJYExb1OcincfNyNCHG9QJwdb/iMm2KDdOHF9GCNHWB8+ILR+DGHc
 4FxRLainYg4PimvVEvs+rKKJfXcjwcH2Gkup18brFNlmWK0GibiGFgD4z0TBQNkX
 lluQA2xFyj8YG58x6MOxsxI+PWH2gdcjuMEh8N8ctPYz1O9Q12uS2fmmFMBZJxAB
 EgEiDabjy+MFL6YwAgq26VS4Z9N1alBZGjh7FQvhB4LzNcBHNOJPhoZPA==
X-ME-Sender: <xms:GhG9Y5BeFj_Ka6WuDK9LiHMEOcl4TczLtePmW87sY12x2_nLTETGjg>
 <xme:GhG9Y3i_MUoL1arYFfYgS1J8GE2LqEvlyZKOF0f10Sp-lgrntBnSTbc3yfXAwucje
 YZoi_Ue-5BnaPf4G3E>
X-ME-Received: <xmr:GhG9Y0muNNPQYPD6QyQ5rIGCr8zbCTdUyUHrOL8GrckMa498Ag1VYS8SopOFmcl9ibgxpvUYOJU2Te9NHOdhToZ3kAZwy5ohDQF1wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetgfekieetveeljeeugfejledtkeeujedtgfeiveelvefhtdelgefhjeefgfek
 udenucffohhmrghinhepghhithhlrggsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GhG9Yzw3M4Cu3V6YRyrxIS61eRrnSP4hoxDz08Zc8kbmRCaM6T3myg>
 <xmx:GhG9Y-QwAsmdiMH0_J434PHxIphyyw6Ws2Ra0DVhOnQRXlKvsDfj-g>
 <xmx:GhG9Y2ZF8ti6Pdilt73tb51UqFjR7fu_YKD0_7r6GR6vb7MCbBZGww>
 <xmx:GxG9Y0MbqyouRyMfRUbCnlxaxYpeqJ8Dycc9vI6lCdYksebBPXQLig>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 02:17:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/4] hw/nvme updates
Date: Tue, 10 Jan 2023 08:17:39 +0100
Message-Id: <20230110071743.63507-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=k.jensen@samsung.com;
 h=from:subject; bh=7Eo9rmc+jO6BvWZE/+OCCKJIaquvA2Qf15f6otDXln4=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO9ERcSYBJMvQrDzwtYOp8o0ve8VFtd+V4gEfGV
 E99ESJxlzokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvREXAAoJEE3hrzFtTw3pS9
 gH/R4A5rAJXbr1k8NR3Q2w+qmXTPfXUjyACZbJqB1VNdhpLE38XsnXP9NXVR8Zo/Ny1f1pJAjFVcIJ
 b6Un3igsLJ5U5+1xXdFhqkDwLeGdkv9zSpfhbrjA2z2ratsQuEKp0RC6WEqQ9uYxgENWrWVN9hS2aq
 YVFkP2mTa/A2cx15fGnBopR0J++NGYJtKP4FWezz0sdMroxwmkOFovgA1R93iVxTt5F59pS090JqJl
 ysjoVP2soQ8MGtvO0xeQ2XhvK3i5ZYVtrsI8p0ogmnPKUUR8X+B+lfqO0FmtPUy50bQx5uWcLdGEcg
 hyR1gOQjmArXszIwlNkZ3vO94i7Ew89+2q2Kim
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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

Hi,

The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:

  Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)

are available in the Git repository at:

  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request

for you to fetch changes up to fa5db2aa168bdc0f15c269b6212ef47632fab8ba:

  hw/nvme: fix missing cq eventidx update (2023-01-09 08:48:46 +0100)

----------------------------------------------------------------
hw/nvme updates

----------------------------------------------------------------

Klaus Jensen (4):
  hw/nvme: use QOM accessors
  hw/nvme: rename shadow doorbell related trace events
  hw/nvme: fix missing endian conversions for doorbell buffers
  hw/nvme: fix missing cq eventidx update

 hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
 hw/nvme/trace-events |   8 +--
 2 files changed, 78 insertions(+), 51 deletions(-)

-- 
2.39.0


