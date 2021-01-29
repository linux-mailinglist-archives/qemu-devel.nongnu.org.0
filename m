Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE830874C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:21:36 +0100 (CET)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PyB-0008Lx-Jw
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psf-0006TK-1d; Fri, 29 Jan 2021 04:15:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psb-0003cW-Og; Fri, 29 Jan 2021 04:15:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 625085C015A;
 Fri, 29 Jan 2021 04:15:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 04:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=7qJd+CC/Lsu6U88MlRXSpG0FvZ
 7kM16yA/MBpMOVF1M=; b=1pVbQMntYnBOvLNaCsON9KhYme9vWELtuFKi1csnzt
 1Exrv9GRAVIBMVTD+0zhkyz59+lL6zZ2z8QXv5DuVY4/whzr0b18he88bo1GRKGx
 LSbDrKzvociAzBECRl/sfRduTTn1snWLJ2uwlXxXO4TN4I+luW11mo6UU/YBS8fD
 4CB/HqxpQhiZlXS+4o1xR+8Ub26Tb5bOJW0pCXSw1HYGcq0kOkBcDdfE0DdgMRIm
 04JAIlvbNyESgiPQwYHFbXg4hBhlofPBCnto3Sif9r8ZyVSaMhxkDX8Hakt4OKiv
 dgIJ9ejo8Pi90MXK4+S0stsyqowsqG3nAFZmJTtFTU3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7qJd+C
 C/Lsu6U88MlRXSpG0FvZ7kM16yA/MBpMOVF1M=; b=CHGbt3wwpyh1f8ZccNjO5Z
 C1VQ7XsTWXAl8/Z5RbRx3COS86nhHPLUX0ugVDhtDjZvSp2DUvgcmzkWeLJBw/Jz
 ZVcgyphMoCpn6VgVGG4pohp/SxSZ7twrzts2W0LGOf6uVhW656wVj2mknBLUXZbP
 xM/In8mnq/QI6xGSAhgNB5u0iabBnqu2FeiC81I78lqry+ve/gqn8aSVRIyFIW+j
 zV1IbWMAMGCkl7/nE+EMJvgI8j1VnA9gFld8LRFXbdTZBX6XmTZbti1l6EE3fGpg
 PRSEynEfILSaCFjAulSAa+OwPjJYtlqXnBUO5DNf0AKn++k07dgz005hs5CgE0Vg
 ==
X-ME-Sender: <xms:QdITYJ-HVOiuySODPZhnh5QXXjNNB42I7W_B0EyA-l4mAtfv7MXEaA>
 <xme:QdITYCCEAmSCy6qStx0MtEhyY1JNWstoNiq6xbIUXU-rz936FPNArrB3kt9QfWLwl
 otYgWiBxUdnCQvBm7c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushculfgvnhhs
 vghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhephf
 egveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefhnecukfhp
 peektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QdITYGK020AUHQC6pG3o4n5h6BjeeX9KN3KIAg2ccpaenZLTX5rNRg>
 <xmx:QdITYFnRxfmkk_bZokURAMWEJuaKjMWdc8bHqrZTZyD7e3MbyzWK1Q>
 <xmx:QdITYEEh2nOivNA90MnEkKlCZRy0ovkTVvU2UvYVHkZkPh_miF3PPg>
 <xmx:QtITYBsMRjwnaUp2teUVA-BpdJtxhwQPPafENi0uZS2oVSkLTJ8Ubw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32A0324005C;
 Fri, 29 Jan 2021 04:15:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] hw/block/nvme: add simple copy command
Date: Fri, 29 Jan 2021 10:15:36 +0100
Message-Id: <20210129091541.566330-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Add support for TP 4065 ("Simple Copy Command").=0D
=0D
Changes for v5=0D
=0D
  * rebased on nvme-next (support for zoned namespaces)=0D
=0D
Changes for v4=0D
=0D
  * merge for-loops (Keith)=0D
=0D
Changes for v3=0D
=0D
  * rebased on nvme-next=0D
  * changed the default msrc value to a more reasonable 127 from 255 to=0D
    better align with the default mcl value of 128.=0D
=0D
Changes for v2=0D
=0D
  * prefer style that aligns with existing NvmeIdCtrl field enums=0D
    (Minwoo)=0D
  * swapped elbat/elbatm fields in copy source range. I've kept the R-b=0D
    and A-b from Minwoo and Stefan since this is a non-functional change=0D
    (the device does not use these fields at all).=0D
=0D
Klaus Jensen (5):=0D
  hw/block/nvme: remove unused parameter in check zone write=0D
  hw/block/nvme: refactor zone resource management=0D
  hw/block/nvme: pull write pointer advancement to separate function=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   1 +=0D
 include/block/nvme.h  |  45 +++-=0D
 hw/block/nvme-ns.c    |   8 +=0D
 hw/block/nvme.c       | 494 +++++++++++++++++++++++++++++++-----------=0D
 hw/block/trace-events |   7 +=0D
 6 files changed, 431 insertions(+), 128 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

