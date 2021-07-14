Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A73C7E5B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:08:23 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Y4D-00031i-VM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxh-0008Ko-J8; Wed, 14 Jul 2021 02:01:37 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxf-0000ZF-GR; Wed, 14 Jul 2021 02:01:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D2CE82B0123F;
 Wed, 14 Jul 2021 02:01:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Jul 2021 02:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=aIUvZfiFdEBQF5o8/gQ2meQcI6
 Sb6dF2p9i/W6rmFjc=; b=D3mypP3/EDySHSG3bE3W7DGHQytw02GznpcEPGqx7r
 Clukln2yI7Lw5t+qyg0a0Qv/quA64LC7sCVWBPR16kIJznM4Som39qoQ/dKj14Nl
 qZgAcq4MNeIeulI4/sf5NhpOwEtuRbSCHBHQVVUqhlgrUKXI9IVA/0hJEgOY6obD
 Zv2Smsp6B/wrWcrDyfxmPV2V6veSww3shlquWc01X7zH/UpvSdD6Tw/hloYqoXt7
 XY5KMiNkt0zhWj0wodBtD1GvUMmkMm+WmksS/EmPqJkyGu6ToVFgxcz12OX1xV7+
 eT+qxeAN8YsqrFAAeKFehxyzfzF35dmbO2q0c50JZu4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aIUvZf
 iFdEBQF5o8/gQ2meQcI6Sb6dF2p9i/W6rmFjc=; b=JTwBbHqOjhSZSxI6qG4bj6
 a7egmzVw+Qx6JS5Tip4QtvxwW/bNfKszw10o9XhtMtbjUucZ0METXVJm7ct2POgc
 dD/LYMFlt2wtPVN9xbSEJi7PjTIm3a7TltUwVm+WIPcIt9FCM2FKHZ4sxjmwhnA4
 LMT5JbYfTu+u7QntftN1RRLn3W9TeJvfzSp2O39GUxGHp3c8wMrhWtevoX3ySEd2
 LY/Q5H69wkSpOtCb2oZpZyHhsQ5I86coTFWlI6aiv12+Nk/2LP9/L9lDFnQTT+gS
 udrDAZgR1q92XL7scbd2l8gjXNoPdp3bY1z1ypbguvpzTCce72UFm1enjMd5ABZg
 ==
X-ME-Sender: <xms:uH3uYJa7SMO1W3XTP3iwKHD3im4f-vfRXm5UDjxLQ05F7BI2FATqBw>
 <xme:uH3uYAa_vshDbNoeuvMEiTzpP8M0mLCLruUw_NlFb4gqkD5b2HeEoaV7K4ESKCHpt
 KDowqD_MjK6hp2zBb0>
X-ME-Received: <xmr:uH3uYL8Rvx3TEdfchPpfttarQodO_NyPHPH2yc4GbmQo1u3ctOyfmEa1JVXLL9tVBxGBIDmUlIyClVqh7ZqQU9dgF3I8K-1tZHHHCczRMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uH3uYHqUQ5fpz4DgqAlUSz_GKrQFPZBWIR94fS7j7VAkVke6CgxRXA>
 <xmx:uH3uYEqY5wc-bx8CXcYum8OBF7LrJ30IjSsamSjtZoy8tUfp__KppQ>
 <xmx:uH3uYNTvjIE8f4gMarcRH0YU0EM_9Mz9Fv24PeCxw9pCs7cPB0zkMw>
 <xmx:un3uYB4cDDm499f72GnHTTE7VhOSJthSEcP_NUbZaxw2v5rPRXRhgMiBqtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 02:01:26 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] hw/nvme: fix mmio read
Date: Wed, 14 Jul 2021 08:01:20 +0200
Message-Id: <20210714060125.994882-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
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
v2:=0D
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
 hw/nvme/ctrl.c          | 362 +++++++++++++++++++++++-----------------=0D
 tests/qtest/nvme-test.c |  26 +++=0D
 3 files changed, 276 insertions(+), 172 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

