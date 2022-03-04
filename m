Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F84CCDBF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 07:31:47 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1Te-0001oS-25
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 01:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1Mx-0005bs-4D; Fri, 04 Mar 2022 01:24:51 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1Mu-0002PM-M0; Fri, 04 Mar 2022 01:24:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3EE20580630;
 Fri,  4 Mar 2022 01:24:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 01:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=YSBjs/kQAxPEWxR/uASb7R4Sev7cId
 YU8XPKxm6HBqw=; b=jRimv352/a7SbjNh5daBLvverrPXABJxC4VYyzfZSYxDBx
 1xz2Hs5ZcSHeeluWpMR/RI23r+1S39h82WZCZL+ny+tr7cAed4jkbXx7BALUG3js
 DZ3hz/lq4xTGm8O6I9Sfi/uMjYAhoaJ0MFoyuKl7IcVfe6reuBXC4ikcB+3ML9VF
 9iTFKnKkB34FnKu7bXPKpVIDeD2wt7t1R+DYsJ0lP33qYY1qV4c2/uLUJqdq0Unl
 W7RuuaPhJSCnchLb6E0kc20WcAJT8uOVzitB12PNQ5tkSj1NFzEwiVrNdqBJwl5U
 G1HWXvWJYeAJDDLlwipdlBS4MY/DWnbzbRSQoe+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YSBjs/
 kQAxPEWxR/uASb7R4Sev7cIdYU8XPKxm6HBqw=; b=d/zw5lP82TR7jEFi3hVF/n
 tfdH13OhjRVIMswWUc5f2WnMmy7NjY6zN8KTbTKCzpV+AkasIMTOoarvuxVXpTvx
 ZelGvAY324DYKNxjCc3qdZEW8SoO2BkrUSBeqd+1PbKCx5ijafp1s4DmrodlSMho
 AVh+9g+N28zZSS5lGKOrh4e30QAfBGj4TqvNsraAL6SzjcTrsAjvCUXQb2dKfu+a
 3USNX71WFoJoc0yL7HxiqDIuRGjfSqWkXJX4z1mVfLGMLUwu3zvTieiQSdZQjmA0
 oQSrcxryyxxiu5avvso7nxN8PxWNhOR9aEu5Puzgou4cpRIJU3ulDhMUJLDaCZRg
 ==
X-ME-Sender: <xms:rrAhYnrZ-S3P520Day5BzudEKuHR0bENg-blqmfVdwa1afZa61Ku5w>
 <xme:rrAhYhpRM52dakaNkz7DB0wbegKZfR1Aw_AfzCib9kpJdE_tVxfIFsiDNt2VfysWJ
 RfbBxCgZcuQNHCrb20>
X-ME-Received: <xmr:rrAhYkM8D1GRgawRm8z-3LcaD-gDM2Ufy8I6QvypjAOgjxtKi7CiMPpq2_v7PkT24XIQsE2r5hiq4wrkC1189w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepgfevffekgfefvdetjedtudfgfefffeegjeegvdegkeeugefgvdeludeuhedvveev
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:rrAhYq5GSCDy_aEi7g-nm2pgW1vpRdyyHb6r8Wx9wSoxVQNQ3qGVrA>
 <xmx:rrAhYm4w8vZu-Z0Tj0dAe6TqdBlom3X3w4r33Jlcgnp4S1eZE0MtrQ>
 <xmx:rrAhYigP8EbWgApfjh4Ok0SVmDkPyBKgfdl_GZxhwcSL3YePeedPPQ>
 <xmx:r7AhYvFu1CaZi_bBwOlXKt19rpMSvN6afmhPsNWvOLAQQ9Bg5jlDCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 01:24:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] hw/nvme updates
Date: Fri,  4 Mar 2022 07:24:37 +0100
Message-Id: <20220304062443.352515-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
Last round of hw/nvme updates for v7.0.=0D
=0D
The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1=
:=0D
=0D
  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' in=
to staging (2022-03-02 12:38:46 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 44219b6029fc52d5e967a963be91a9cf33f9f185:=0D
=0D
  hw/nvme: 64-bit pi support (2022-03-03 09:30:21 +0100)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
- add enhanced protection information (64-bit guard)=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: move dif/pi prototypes into dif.h=0D
  hw/nvme: move format parameter parsing=0D
  hw/nvme: add pi tuple size helper=0D
=0D
Naveen Nagar (3):=0D
  hw/nvme: add host behavior support feature=0D
  hw/nvme: add support for the lbafee hbs feature=0D
  hw/nvme: 64-bit pi support=0D
=0D
 hw/nvme/ctrl.c       | 235 +++++++++++++++++++++------=0D
 hw/nvme/dif.c        | 378 +++++++++++++++++++++++++++++++++----------=0D
 hw/nvme/dif.h        | 191 ++++++++++++++++++++++=0D
 hw/nvme/ns.c         |  50 ++++--=0D
 hw/nvme/nvme.h       |  58 +------=0D
 hw/nvme/trace-events |  12 +-=0D
 include/block/nvme.h |  81 ++++++++--=0D
 7 files changed, 793 insertions(+), 212 deletions(-)=0D
 create mode 100644 hw/nvme/dif.h=0D
=0D
-- =0D
2.35.1=0D
=0D

