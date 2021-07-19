Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C350C3CECB1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:23:40 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Znf-0007BM-Is
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYF-00014S-N1; Mon, 19 Jul 2021 16:07:43 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYD-0001U6-BU; Mon, 19 Jul 2021 16:07:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6B41C58165C;
 Mon, 19 Jul 2021 16:07:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 19 Jul 2021 16:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=GTZ4EFcE18KimFQmsUxbae3nfz
 mykYr1HT9wDwZ+NO0=; b=dwAGjQJAJ9gVpJ9BmXDSmZ3Fj9Exqny1Szbf553BsA
 LD64/fVJHoNoTMIl6fp6HWGS5a4qxKGubtAJnSYgOuGzJkRgruVbdfGk+cS4AdvQ
 vOOQTHUj5wyjM1F5xFQ2U1aKMmdQXahQI6KSNBTtVsar2YFt0SNF/x588J/mlc2C
 PmwI58/uxfglLU/X7cDuZxqC2nGmfVvPT7emNqgMOGGyrWTzf0Hny6VJ5u+ZVPqM
 VDI5EZd5T8wVk0ENumP8iWA6MovPVSGZXcejuIeyN3/KOrq9GZyFwthaB0C7x60B
 g8PRJfOnTfS1HRdutoSL61IKPhMyNEnl9otWoKM/G49w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GTZ4EF
 cE18KimFQmsUxbae3nfzmykYr1HT9wDwZ+NO0=; b=CURnhIl4IWacD0NNHoVdKv
 hWNj0CEVtq+Qe7enYpfOTnpS+Y5P/QVTp5ndOSmSvf6BaJ/d8Tc8I5qPvI8KMZ7z
 nER657kckPphYrF+bUsB/SbQu0uqIAF97i6Hr6omFHacZCcXBFs9/Lt5Y5qEyRBT
 hsLxYCATu+jjhDU6E0i7ucBAmqdOqMFkFZzaCJr1ibUa5ndC/gEfpRp+iRM6eUI4
 b3onsS4bqvibwz02R6A+VBzU6GNJFPHqB85jJvlyVZ80pfskvBAsFYqpZ3KjCPxs
 vphCIk7PyWxuIwpmELfnF1KRYdWSJSGVjiyO/WWE9mRoQDYdIGJ0fRcz34Ha0CXQ
 ==
X-ME-Sender: <xms:itv1YN20eKZERMU63rFUtW4pjrsi2-5v5d78EQTjImd4pfCbN4IVag>
 <xme:itv1YEGslf1n2L2ziTiz5TXBIZrCyksoqR8iT620GPW2ie315iPiXnqsiWzYU98qA
 __5Tyz9k0fzwmIXmtA>
X-ME-Received: <xmr:itv1YN4VyZLsOotlO8qwzthF2ZQ5uNpq9xt1Q-FtkVDdXiY4Qa34DFR2Cjs9_Ou-LWm0cj34jcQnktiyB63_CwDmw6hnmXcH-lV5rIcpyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeduheefudfghfdutdetffefleeutddttefgudeludduudfguefhleeuueeugffg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:itv1YK0vzxrNwN5FrL6b_zDCJLtr7jRqfT0Yx6RacTJxhd8QhPCmgg>
 <xmx:itv1YAF_zMTQYLzpmkYickJP_cERY0xEGYIYsdTR8XMoh0Oh7K6Hjg>
 <xmx:itv1YL-V__h2h-XJULcs0pwzSWyvoFUAbiW_SRSE-GLr0scud2AXuQ>
 <xmx:i9v1YEH2Tpn9pL5L4VNn4bn8f-FlttuVmyiiqnJuNuh4h1mvElTisQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 16:07:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] hw/nvme: fix mmio read
Date: Mon, 19 Jul 2021 22:07:28 +0200
Message-Id: <20210719200733.28502-1-its@irrelevant.dk>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
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
v4:=0D
  * "hw/nvme: split pmrmsc register into upper and lower"=0D
    - Fix missing left-shift (Peter)=0D
=0D
  * "hw/nvme: fix mmio read"=0D
    - Remove unnecessary masking (Peter)=0D
    - Keep existing behaviour and do not zero the register fields doing=0D
      initialization (Peter)=0D
=0D
v3:=0D
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
 hw/nvme/ctrl.c          | 352 ++++++++++++++++++++++------------------=0D
 tests/qtest/nvme-test.c |  26 +++=0D
 3 files changed, 265 insertions(+), 173 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

