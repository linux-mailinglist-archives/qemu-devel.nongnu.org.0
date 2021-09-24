Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95892416C65
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:54:38 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTf6T-0003DG-GJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezE-0006Qn-W2; Fri, 24 Sep 2021 02:47:13 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTezD-00011G-3F; Fri, 24 Sep 2021 02:47:08 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7E558580BB5;
 Fri, 24 Sep 2021 02:47:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 24 Sep 2021 02:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=7J5UHw8ym46ZX1M3GqA4ekDmaI
 sicgH9q9qONdk0jP8=; b=UJFg69OOq6Ui2jSk/beWTrHTUpRLcEQXtrH47IaSAI
 OR4YsQPawI2fVsK1tRy+jOQ3A8Z697vtZQ6I9BUKQVv++4KWhQntjpTYHKoI60Di
 0yM5OPp5YTOfM7Y92MOtKpPcCE3nXXhN4ilw91EEPZhLqg2gtAt4gjYzcnv/Hp3u
 KwIk3OAEdgiT6KJniJiYQqyj4BqtTMPR6368Qp/844fUpV4RGFNIJBo920H6aB4J
 SUa6CJyf0GAFy5JivFpOdOgn4kNIpcMCuKkj3JcpCVNd64Gc94wO+BM+/VNBOVxL
 DMwEYLMoCP18XVkc2xWZFLpvrO1SywldM7v1XfU2KKpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7J5UHw
 8ym46ZX1M3GqA4ekDmaIsicgH9q9qONdk0jP8=; b=IteCmoMbbDGNfk6QZlfhAz
 V4ElO5me+9eB7Z4mz14HWnCqb2lOkjET5F1mGC6kS6md1EnVniP0gceiMbhZjNFI
 Gs4tkEs6qjDyn0vtM9AWTyaEcR7+OZYEP7zhO4p26sGzWStYZ5v6fdqEfyaQPfQX
 Xpssf1ppT6yqSPzF1ZRkEtVH23Pez5y6SQwzQ4ucZ1NQ6dvOO8GbmsHyel7Ni6uC
 kojk3WrvZFRsL/Qwt7EStxfn5P8bTr0FO1jsVFyU4oQDpj2rpgQctt1UJsfT2z0u
 qJYTM25ZisFRYI7ZelsK8NIeFwD4LTOltpFFcCuhj1WgD2Z4WGGWTbMovqcqYNpQ
 ==
X-ME-Sender: <xms:aHRNYaWw9S7aSG1BVsUpdUTLsTkO1OxKHDTvhbCvFxAc68zGQrW_CQ>
 <xme:aHRNYWmQYvEp3EpAU_jI6m37nDkrUhTFRWK4DlNK3NY0AP0F4oSUNCkhLEufVbuZ_
 L1q-vwH1vXdtp77B0M>
X-ME-Received: <xmr:aHRNYeYq4noxCZ7IMVddGA5sevgvahUxj0USJR7Zefq6NIERoVge8f7TERHj-VMCNTxItn-rcPkRMtVCIoyEQwOlY_97c5NdzpzUupY3Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdr
 ughk
X-ME-Proxy: <xmx:aHRNYRVUwsmPX0MY5AwO7RqOwr4HlmR6BczdLLTrflol_O8v3Vurtg>
 <xmx:aHRNYUlv6HSKeDqglG4F-vUsLGJ1PWVZuCUGgHrvtlXnikdlTCxLnw>
 <xmx:aHRNYWeUJQEV9aBVW9DDedHm8XIEtH_ajnO3Ik6NB14hsGRRlqC5vw>
 <xmx:aXRNYRikmNVpK1z68RKAUczB_RGQ6_GK2DqOhOp4v_2e1r0DPDjf9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:47:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] hw/nvme updates
Date: Fri, 24 Sep 2021 08:46:58 +0200
Message-Id: <20210924064701.283182-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply=
-20210921' into staging (2021-09-21 10:57:48 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to c53a9a91021c2f57de9ab18393d0048bd0fe90c2:=0D
=0D
  hw/nvme: Return error for fused operations (2021-09-24 08:43:58 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (1):=0D
  hw/nvme: fix validation of ASQ and ACQ=0D
=0D
Naveen Nagar (1):=0D
  hw/nvme: fix verification of select field in namespace attachment=0D
=0D
Pankaj Raghav (1):=0D
  hw/nvme: Return error for fused operations=0D
=0D
 hw/nvme/ctrl.c       | 31 ++++++++++++++++++++-----------=0D
 hw/nvme/trace-events |  2 --=0D
 include/block/nvme.h |  5 +++++=0D
 3 files changed, 25 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.33.0=0D
=0D

