Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2DE3D6776
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:24:37 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86DL-0007Sx-W5
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m8689-0004TP-Li; Mon, 26 Jul 2021 15:19:13 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m8687-0007XW-3y; Mon, 26 Jul 2021 15:19:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A8B9A580412;
 Mon, 26 Jul 2021 15:19:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Jul 2021 15:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=KtOF5lUYsVN3XbrTgTCgJi3UGj
 B+++U7lQolnvXqkTU=; b=ZMRsmGIHpTGmpZRkAsCYvMt/tES6flVqn+GGqNhvuJ
 JTlmbI4Mgrt8OoQw4U1HNLqaw6O/TVCEn5eJWHW8KEY199IjXxllIUXvqyPAD0oV
 pOdUSewyP+jE5yn+UhXD6BMeUF5/7pI7nrcW4NVbeDovh5dXJVFEMx/jT1Ft0at/
 Itde22GmQLNy7vrDI1mG2E+JzHjL2Vw8SgmsyIvzGzTCsUShGQTrHEPy5anXtPlI
 2UlUMpPUzrQeyMY2ext0l12mjwWTXxHZ5LcPO+fGjKh4lNfe/us8dTb3+fSfpD4V
 U1OGnFYCeNyfvZg4GPSwAC3jfrzR5lyFt5l4X8VXTV7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KtOF5l
 UYsVN3XbrTgTCgJi3UGjB+++U7lQolnvXqkTU=; b=SD5xmWTm8nsI1nrXFCmjbj
 s+yIx4trOD+D1s4nGyUafdf3d3XgHKQiWTu4DGCIg7jOxexXIWc1vLfFr/y6J7Dt
 HzFt6K0KZ8EfPIfM8S1RbPxRCBtt6TGsq6PmExOm4LZ/9s8uK1gdKPeIyv2CxHCD
 FS0zeszUZwIQgrOIaSg221pdZBQOpW/S320S9eD9wZN/kounSfbZVAfMHqJdlLRv
 jsNSG97NiIQZvm+0CtfycvKlwDdAI7t4IhCmYJaZNKmtBJyHyOP55mCpTZrLem7x
 9tFxyjShurVuOkD+YpRCFlvt7SjaXV6rwjQ4E1V0NVckVt1V05MSkCr4jOXu3PPg
 ==
X-ME-Sender: <xms:rAr_YA8MYOs_m_xnrb7Eq79vBhWVuUvwqQj3VQfu2onX20pPOCTS7g>
 <xme:rAr_YIu4hOoUp9Zsvcm0SnVJ03Y5ldSjSQDDXxcnc7PT94KcgGTe1iem6DpX3e2IQ
 rBvtAVFpZ6Wr6L4S-8>
X-ME-Received: <xmr:rAr_YGDN07m7YAP2KFqwPh4pOy4YeRylMQIg9ab9MX3ND3MhyXe4h4ulalZQ4XHbWoMI5_ypzSPxNTY3DIKRYb3Sf0e8Zc74XqLcjxWknA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:rAr_YAceFkOJRxSJndtYYup3K4fCMUDAvbOU-uYtT-VMqVlCMhS8dg>
 <xmx:rAr_YFPXHGyb0bZ2p9bfirBqA5ePwzadSojAjAT__mspGorSQIv9Zw>
 <xmx:rAr_YKncJu1w3oKCOu-7IaTWp31_yi-MrIsUatT86Z8jyFjQHLm0Ww>
 <xmx:rQr_YKlrwR8Zslrc9UEWCR1ztnmh4a_7ov2ToDhsYr7te05pH7V39w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:05 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 00/11] hw/nvme fixes
Date: Mon, 26 Jul 2021 21:18:50 +0200
Message-Id: <20210726191901.4680-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 1d6f147f043bece029a795c6eb9d43c1abd909b6=
:=0D
=0D
  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20210725' into s=
taging (2021-07-26 13:36:51 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 9631a8ab21679e3d605f7f540dd8c692b9593e02:=0D
=0D
  tests/qtest/nvme-test: add mmio read test (2021-07-26 21:09:39 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme fixes=0D
=0D
* new PMR test (Gollu Appalanaidu)=0D
* pmr/sgl mapping fix (Padmakar Kalghatgi)=0D
* hotplug fixes (me)=0D
* mmio out-of-bound read fix (me)=0D
* big-endian host fixes (me)=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (1):=0D
  tests/qtest/nvme-test: add persistent memory region test=0D
=0D
Klaus Jensen (9):=0D
  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions=0D
  hw/nvme: mark nvme-subsys non-hotpluggable=0D
  hw/nvme: unregister controller with subsystem at exit=0D
  hw/nvme: fix controller hot unplugging=0D
  hw/nvme: split pmrmsc register into upper and lower=0D
  hw/nvme: use symbolic names for registers=0D
  hw/nvme: fix out-of-bounds reads=0D
  hw/nvme: fix mmio read=0D
  tests/qtest/nvme-test: add mmio read test=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/nvme: error handling for too many mappings=0D
=0D
 hw/nvme/nvme.h          |  18 +-=0D
 include/block/nvme.h    |  60 +++++--=0D
 hw/nvme/ctrl.c          | 379 +++++++++++++++++++++++-----------------=0D
 hw/nvme/ns.c            |  55 ++++--=0D
 hw/nvme/subsys.c        |   9 +=0D
 tests/qtest/nvme-test.c |  87 ++++++++-=0D
 hw/nvme/trace-events    |   1 +=0D
 7 files changed, 402 insertions(+), 207 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

