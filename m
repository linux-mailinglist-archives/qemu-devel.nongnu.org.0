Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D209699B41
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1v-0002dG-5x; Thu, 16 Feb 2023 12:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQh-0000QZ-1s; Thu, 16 Feb 2023 11:48:19 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQf-0003qw-4n; Thu, 16 Feb 2023 11:48:18 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3797F5C021E;
 Thu, 16 Feb 2023 11:48:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 16 Feb 2023 11:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1676566092; x=1676652492; bh=aS5LTQIZw5
 /McVSJ+1OEWgDYgnPT1ouTl3r3fXe3wOY=; b=gCnEhLrJCAVqoYaTgE7Wlg/Z9b
 MnK6iUuDRO1Iwd8LhuynV4GJ7YcWClTVD6TQxfL0/TEHA2buS6z1H2qnnZ0PA9f/
 YiWcC+Egru/ExHPau4FOxdSg0px0QgfJqp5gB6FNTOJEkOn+vJDzIYQmebNwdq0u
 eBWjceczzVQ9/fbrDf3U8qkj6F3CDBE5w+98SZ/cGL8L8avq8ou/oBJ6pTbIWF2Y
 5DqXj5Y8io09WM2waofP2Qgq/wGvFncdxAJmm2KoMPTCCrD+TS0bMIqHhrv3Z40t
 iWuI/24y1TaENAZ+qHfk06JWm0LHZdOD1pyVFqv6mWAaoGo6qkJCK1AMMNvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676566092; x=1676652492; bh=aS5LTQIZw5/Mc
 VSJ+1OEWgDYgnPT1ouTl3r3fXe3wOY=; b=tFWSMJaI1vjxm6CPAEi7K8aq1CeCx
 IV1rHvigAYxQVrQVgbnz00CudBnorUK9vLpNnV5dW5/yy+CE4TotFRRByMWG1QgK
 Z7yFD8s7UhyilGZzYYKhZWJLWsP7AvzucfotKDniVyRcltMJfmF3LRHn9uDQBrOZ
 WidbtoI1U+prA+bWNmhL4sjW/niPYTjgxieXOCm6E3oyP5tw205l08EPdfy9G9NO
 dTrMHQ70KcB6s1oOMKHthv+lh0uwwPzR7pjU3GopZOGNsKEAVAZn8tzSgB9WQKeJ
 d+ZtJoSx9TaL4B6HM0O2v8YV0B8fG1NDMvNZyq2LywHznKfOQym0W+cTQ==
X-ME-Sender: <xms:Sl7uY8l_xzV6BVTfJcy4czC2IetXSMLfyk9JKiDt4cQiWfNhhT7jOA>
 <xme:Sl7uY70aAoaJYRpub3peNHGeWUzbk41CEYIlnzVy4kgey4HAFD6DRddn-Mw0PX66D
 WOsEvs1G0RlnmgRlUg>
X-ME-Received: <xmr:Sl7uY6qIh3aDFF5B4uSyS2EOXwB3SnIFYxUq5RRrEwUNQkL78wvteKPRrKemDPeQngqncH3kokY3ZlAFmtddO4BIYYr27Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeflvghsphgv
 rhcuffgvvhgrnhhtihgvrhcuoehjfiguseguvghfmhgrtghrohdrihhtqeenucggtffrrg
 htthgvrhhnpeffgffftdefffelgeeggfehgeekkeffveeghfetgfdtteeuuedtkeeugedv
 vdegheenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhifugesuggvfhhmrggtrhho
 rdhith
X-ME-Proxy: <xmx:Sl7uY4lYGeokGfI3Zs0RLxmZvQhHozrdSPQBCzdAPTcFPAifo_dvxQ>
 <xmx:Sl7uY62M5RrY6P_GV5JJBEuPq4MibCNyim4b383blNTm9_9a4eUc1Q>
 <xmx:Sl7uY_vvguYhSEqbL6tJ0eRQNY_qWUfpYls4WM1Jp5XR---e2d7AKw>
 <xmx:TF7uY4ytST5l2YYL3DIz4PRSlbqsBuYDPMkU3Ne2WXlwTBFlQc4Olg>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:48:08 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jesper Wendel Devantier <j.devantier@samsung.com>
Subject: [PATCH 0/5] Support Flexible Data Placement (FDP)
Date: Thu, 16 Feb 2023 17:48:01 +0100
Message-Id: <20230216164806.233533-1-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jwd@defmacro.it;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 12:26:45 -0500
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

 hw/nvme/ctrl.c       | 803 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         | 145 ++++++++
 hw/nvme/nvme.h       |  92 ++++-
 hw/nvme/subsys.c     |  94 ++++-
 hw/nvme/trace-events |   5 +
 include/block/nvme.h | 241 ++++++++++++-
 6 files changed, 1353 insertions(+), 27 deletions(-)

-- 
2.39.1


