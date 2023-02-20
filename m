Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9369CA66
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4pX-0001MD-9M; Mon, 20 Feb 2023 06:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pU-0001Lk-NT; Mon, 20 Feb 2023 06:59:36 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pS-0006cD-DV; Mon, 20 Feb 2023 06:59:36 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6B7F83200D57;
 Mon, 20 Feb 2023 06:59:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 Feb 2023 06:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1676894368; x=1676980768; bh=Ij6oZshDCw
 Tiy0ecdCbDegmHgY04cXkrYBCXAQfZdu4=; b=umRILSBYuj9r6D2dQ0VSsu9Fzd
 TtkQeGxLmRU/hxYmJVCr5nkJyZlIMoGZRoSCUBKRib9/om1wGwlLddD+8+DiRPZp
 +qXYqdHEeBIOnJamkT0hdVqtWFrSzlREjx2ONRxxpGtZH+tzics4ThUOfVxFa09B
 BGBzv1YGNJJyGJ/DKmMQ8/VKuazqrL1vR+o+Axa2PcAGCTItwWL2H7r5JcUStgST
 7PWRMep3evTM/KA7WCvolUc7RNrfCJZrDQA2gMf5TOwV5kFLdUnXeATCr0+GYvYg
 J7S2LnESoPIsPOFWTagOpmbLIYk1PFMSfVHPm+THBSoy1d13ImTU+sUjnAxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894368; x=1676980768; bh=Ij6oZshDCwTiy
 0ecdCbDegmHgY04cXkrYBCXAQfZdu4=; b=QXdQMtc71DXItP0foTZMvlmiPXBra
 Dd2FI19mpG2tOIPMFXEzdtLFa5aeGv5uOy7g6GZ5vh/OZgdYdjptx57t0Ce3nztT
 1I9jGOcLQmpagIpKPqT/W25BGap95aww7PHLfpKJU44lEmPya2W5HI+615hbe+dr
 W350bHPGsjWdH9E3VsP5fdL3BEKKiPdZuQauHKNcL8FaNKLIIfBpnZsQ7vHCM7r0
 kCqYprD9XL+YAqSJ2DmftT2E1Ykcut4ub8YokPr7v/uB+FKtmNevo31sQjE5p/tT
 JNuxK4qNbgqr7Ps2yGgg92PSBkqSiqd/x+7bwrjEvl+0hzjJBYw/fFaog==
X-ME-Sender: <xms:nmDzY9cUkA2BDEdtXku7yhzcIkad8OF4KLcxAuA5lYs00SBw7nbl8w>
 <xme:nmDzY7MlPCnMjlKOwZwlWThqwzSoB9ah9hQioptXWY6yn8vSt_9fv3-3Bhzn-ggm8
 OCmK2A_qtLdbTAXJ3A>
X-ME-Received: <xmr:nmDzY2g334rgtuqKeVBuAba9JphQwOJRREFl2RB4KxERc9aQOKYYjmx2fwwpfdNOELUZUyqxf10e6r08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeflvghsphgv
 rhcuffgvvhgrnhhtihgvrhcuoehjfiguseguvghfmhgrtghrohdrihhtqeenucggtffrrg
 htthgvrhhnpeffgffftdefffelgeeggfehgeekkeffveeghfetgfdtteeuuedtkeeugedv
 vdegheenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhifugesuggvfhhmrggtrhho
 rdhith
X-ME-Proxy: <xmx:nmDzY29zlTU5saLLyu1wI8lgKlYEJJKrEy3-waMJiPXp0Fa00p6moQ>
 <xmx:nmDzY5uk7_4wfu1cv0ukwEXvNwu8sYYz0tb0vCOGpDSWjrAEYgf6ag>
 <xmx:nmDzY1H0toO7nR3Om0NRt29ejgpZXL09Y9Uxm4Ke1jHiAqUzkU5w3w>
 <xmx:oGDzY_JNOtFVMR3-tPPzY1n7dOF2z7TXAOlMnvCtJTx-EsJP-iSF1A>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:25 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Jesper Wendel Devantier <j.devantier@samsung.com>
Subject: [PATCH v3 0/5] Support Flexible Data Placement (FDP)
Date: Mon, 20 Feb 2023 12:59:21 +0100
Message-Id: <20230220115926.54623-1-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
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

From: Jesper Wendel Devantier <j.devantier@samsung.com>

Flexible Data Placement (FDP) is a newly introduced enhancement
of the NVM command set introduced by the NVM Express, Inc.
organization as TP 4146. FDP aims to extend the NVM command set
to enable host-guided data placement. FDP-enabled namespaces
can be used as before, but writes may now reference a specific
placement id which in turn points to a reclaim unit (RU). RUs
are defined as some amount of physical, non-volatile storage which
can be erased/reused/repurposed without disturbing any other
reclaim units.

For further details on FDP, consult the specification, which is
available as "TP4146 Flexible Data Placement 2022.11.30 Ratified.pdf"
in the following link:
https://nvmexpress.org/wp-content/uploads/NVM-Express-2.0-Ratified-TPs_20230111.zip

The FDP work builds on 4 preparatory patches, chiefly to add support for
endurance groups and directives.
The final patch adds FDP support itself.

Changelog:
==========

* v2 -> v3:
  - remove unused trace points (Keith)
  - style nit - place '||' on preceding line (Keith)
* v1 -> v2:
  - "hw/nvme: add fleible...": check that max 128 placement handles
    are being created (Keith)
  - removed unused NVMe directives struct (Keith)

Gollu Appalanaidu (1):
  hw/nvme: basic directives support

Jesper Devantier (1):
  hw/nvme: flexible data placement emulation

Joel Granados (1):
  hw/nvme: move adjustment of data_units{read,written}

Klaus Jensen (1):
  hw/nvme: add basic endurance group support

Niklas Cassel (1):
  hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace

 hw/nvme/ctrl.c       | 798 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         | 147 ++++++++
 hw/nvme/nvme.h       |  92 ++++-
 hw/nvme/subsys.c     |  94 ++++-
 hw/nvme/trace-events |   1 +
 include/block/nvme.h | 236 ++++++++++++-
 6 files changed, 1341 insertions(+), 27 deletions(-)

-- 
2.39.2


