Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71CD4B44C0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:47:09 +0100 (CET)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJX0j-0000Z0-6E
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPE-000381-FP; Mon, 14 Feb 2022 03:08:20 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:48335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPA-0007W7-KA; Mon, 14 Feb 2022 03:08:20 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 891F02B0015C;
 Mon, 14 Feb 2022 03:08:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 14 Feb 2022 03:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=U82tQUJaEAKSbaFRjRzV9MwHOY0dC1
 pv3FnDs3W6wVk=; b=mXjyzOEzr2qi1m/X5mWHXdOYrW5NR/CUj9fwq5+SL7K+qR
 u41Jv1rMQMMplK35+F0JVz3ORY4vn5tgGLTnbAgYW5oTNHKKJqrlp7BL85c/kYc1
 WAX/+2apLCotDRjdQeSFJghUT48PjUvZbhhV6BZ8PXr1TdTjv2+LEPyhzxfUs37o
 6KpX5TA/drSWpUVVF2Ai004shnRwPeM4IabGLsimsNYbzkyMWGaYgWOOtmrp8LHO
 cOcWQbDQLFPNr+5b9Cl6x2DYgLcfjS3jmqWlWV7TYUf0ZDCqR+SkNNN1E8ChW3RD
 fDCXBhBo4PCnNrOi0+Br4a23w3f8keL6Jkk2zoWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=U82tQU
 JaEAKSbaFRjRzV9MwHOY0dC1pv3FnDs3W6wVk=; b=IhBlwkWcw1FvzpQ9wcgdG/
 5TEPLkVQLgnvzZKooUhPvfzTSN6Fm+V39Q0jO9teh8rHQo//hv/+8F4iM+G+DPTe
 S+Lbcxid2uIOQGls8ra0nb8etlwbASqO2jgP6IUkFYwT+MfemmFaYhdJ4REw2MIw
 BBkNJs7TqP2kfnrte6Z1cmh2MnJGg8KlAx7u873SUStPpAz6zHKkyZdMVKxxIgko
 zbFWXgzQupYXH73uhss7P69mVS90yY7Ia0KtN5W7nT2FkGYeb4+5gVOdpqfVGvjy
 ejYD5vUrKGXGMzwCvJPqzxYlrmzhsYxukwjSCRFLhGo0bzbIDEQxI/cnOdL8PB1w
 ==
X-ME-Sender: <xms:5A0KYkzSzxPsscCjm2bcbhZRrplHolFz4ylEGLPu9aKKr8kJ8XjI9A>
 <xme:5A0KYoTucjRkw17SByL6t-NcxWn9v1XIiRfOlA57YffLblmkWU9m-2qK5h7dUsWRy
 C06YSiIlQMswPpeY5s>
X-ME-Received: <xmr:5A0KYmV-Sug4qS7-TF-bOHjLw6qW0wqhHyrnorRztU6jwmI47PumZue08iHmpBFs3t7Wk9vQQx1ymFf6wm4gmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:5A0KYij7RTWCHZZ6ABtjlos0l1GmRQHwS0L46qpE_AvNTm5ihbewjw>
 <xmx:5A0KYmCklQMAFy57MZPOIGvqkyoaHnNXAIpi984e2Mrktw6PBWERTg>
 <xmx:5A0KYjLZy0GVL-L3b3Qq815J_fB-AORUHOAG9zPJ2_PBpLMCl8e20A>
 <xmx:5g0KYus18P2GhVaLhoZuGi7B47Io8LlFONcCe6tf6UCCFnqdlmGeZ5bkkC8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:02 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/6] hw/nvme updates
Date: Mon, 14 Feb 2022 09:07:55 +0100
Message-Id: <20220214080801.13627-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 48033ad678ae2def43bf0d543a2c4c3d2a93feaf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vsementsov/tags/pull-nbd-2022-02-09=
-v2' into staging (2022-02-12 22:04:07 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to e321b4cdc2dd0b5e806ecf759138be7f83774142:=0D
=0D
  hw/nvme: add support for zoned random write area (2022-02-14 08:58:29 +01=
00)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
  - fix CVE-2021-3929=0D
  - add zone random write area support=0D
  - misc cleanups from Philippe=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (4):=0D
  hw/nvme: fix CVE-2021-3929=0D
  hw/nvme: add struct for zone management send=0D
  hw/nvme: add ozcs enum=0D
  hw/nvme: add support for zoned random write area=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/nvme/ctrl: Have nvme_addr_write() take const buffer=0D
  hw/nvme/ctrl: Pass buffers as 'void *' types=0D
=0D
 hw/nvme/ctrl.c       | 215 ++++++++++++++++++++++++++++++++++++-------=0D
 hw/nvme/ns.c         |  61 +++++++++++-=0D
 hw/nvme/nvme.h       |  14 ++-=0D
 hw/nvme/trace-events |   1 +=0D
 include/block/nvme.h |  40 +++++++-=0D
 5 files changed, 296 insertions(+), 35 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

