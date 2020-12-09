Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A192D4150
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:49:02 +0100 (CET)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxxt-0007qk-Pb
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmxqO-0005Ow-OP; Wed, 09 Dec 2020 06:41:16 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmxqL-0004Bp-Cx; Wed, 09 Dec 2020 06:41:16 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 608405C0475;
 Wed,  9 Dec 2020 06:41:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 09 Dec 2020 06:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=h7tSSeNFlq83C+ZJewJmHMjVoH
 jUWfS4CAYUR/kbER8=; b=PwYQYLlkqEZP4VfEn6647Qig2XyNXKqvvb5IbB9JFm
 zhRovH6JYWtV/VKi8zgZvsypYD7Cg8j7PDtYoAU4bbTQ0SUPHWqzOtzMdUmO3WQO
 Er7bRkPX4PC6i2NZ3OSkfL2C/KvYuiW5NFfubI+mk9te5eJ6dBFMX/Wjgc22ixXu
 mJxFxppzoryG1d4gvu15YD0Ji6Dmqs6WYUEJvjYi2vvmeifWgcruxJZLX7GgBe/r
 QjSUN4b0ct2+x7ZPkbi2JZefOV4r4FrWom2H1zWvC62shucVF9KUxnugL9GQ8arN
 P0+h1/0kJcczXiFmEdT/DIufI3bWvJvzgQVxFkseSgFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=h7tSSe
 NFlq83C+ZJewJmHMjVoHjUWfS4CAYUR/kbER8=; b=CtkrywhOzocqOyIKBWa5D9
 SiXwKLIuw8A1e+4lzg3YNx+0tTkcHFOySMi9KchHbX9vNvXpjuDPDYHM8RitpTNU
 GHhw1PEXv9NzWDCsJqn1r7IcsOwMjP88fUuoRukxHrqrGNf1oqpswIhWZhX08rRb
 SeoDKCbY3f78Fbkpb4WuXnfqP6o4QCL0vx4fafdDWfj+UVBYHOyNa0ogpxND14o1
 f/uyOcQ3YPwHrN1ddK4uG80k26n53oubbQkjIgn0B2IKq+nBBG6VdGsO/lebT71t
 q+r+atfwX+Oi5eKOzukILnitH7aCw63HLh/fkpj/g4S3jYWQdxdhplyAikAWoMvw
 ==
X-ME-Sender: <xms:1LfQX-Q8MuOUOpWawIb6FUEnnxulcpM5mva2RB9Yf-FMsUagFARKyw>
 <xme:1LfQX4C6bVogI87--ru4w9NFS51dohIWpMyt_RVhxFZeAsaKyEUDwCPiPdyP1zi2h
 KropTYHQQZDqbWp3bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1LfQX21V8sWSwDUhiTorRKAB7dJqyGdFZJ1vgN9bF_v11nkJEzqbUQ>
 <xmx:1LfQX-VWaVY8nU1q4qtzBuFSr-6DUnOzzmSeQRaKxnMIgxPTOxvaTw>
 <xmx:1LfQXwldm_iLPQiCiGYz3JeaLRDAJu8gDjPYcdFiVjJxOIxhFAUbAQ>
 <xmx:17fQX6A_mRBZCH66pguXY9OHCIQklYoh75u0w8bqFupkMeogoQUTyw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55D131080066;
 Wed,  9 Dec 2020 06:41:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] hw/block/nvme: add simple copy command
Date: Wed,  9 Dec 2020 12:41:03 +0100
Message-Id: <20201209114105.282569-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Add support for TP 4065 ("Simple Copy Command").=0D
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
Klaus Jensen (2):=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   1 +=0D
 include/block/nvme.h  |  45 ++++++++-=0D
 hw/block/nvme-ns.c    |   8 ++=0D
 hw/block/nvme.c       | 217 +++++++++++++++++++++++++++++++++++++++++-=0D
 hw/block/trace-events |   6 ++=0D
 6 files changed, 278 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

