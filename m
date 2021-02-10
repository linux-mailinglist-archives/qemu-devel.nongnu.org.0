Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAD315FDE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 08:12:43 +0100 (CET)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jg1-0007w0-Pz
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 02:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaS-0006a0-Fi; Wed, 10 Feb 2021 02:06:56 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaQ-00038z-Jt; Wed, 10 Feb 2021 02:06:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9DF06A9C;
 Wed, 10 Feb 2021 02:06:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 02:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=UVuKahTVkfiDcxrxyObh2wh8Pp
 O4QCww81ZD11cDMhA=; b=fvRdEEraCwM+FEVTBnV2EQhbyNzjIOgt0yTmH39nPi
 v8bjouKjMNMMp7sFoNpMDUajItRpTv6JfbJhQgMSDbesfeTnXb6EN7zZeT2DiiLa
 mnDM8+Ee92F4U92A9kJ1EHoX45PMocbg2tT+D7D5e6O2D8Ja18g093IiFy6eOQjB
 zk0rQMxw4G6HaDNlSgTgclmNIzS7rgjX6N8LL8UwjUXgxv8k7wixhXqi7wOi6DbU
 4opsbFAJKJE1L1ygf7D7bu9xI9hTCWC7kvN0LIrv3YupkhYiwDhSlg1fvdfGWWdk
 b5LJDmAzB0yQvpyczgy5F92d8wBI765iUA7us0WJAlDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UVuKah
 TVkfiDcxrxyObh2wh8PpO4QCww81ZD11cDMhA=; b=T4yblj43LSu4W+95LmfUtx
 m8d4s11Cnu2at8UZLjUqt7UP/zi6uPDAz2MKr8amhMcoqTc7HWnm8CAk4yzvhfVe
 8B/Lv+w16+P5tdB/HHx9xv7UO0mza3iIv2Ur6ym+J/vkpFeHWikrzC+SM0fdhePV
 Xt8UYJtgSVfFDIqC3ZsHJsReYL4jgUrEjkQSvpgU2ireK3w+j3FI02TIdD39dSOV
 g9x5vbTzXA+cNBL7hPm/0WepV2dd4r/MDIl/Zm3P4MCsty4dEnYESSXPCs4LJpYX
 y6dtwCaLuMMZoW1fhQh3DbJVkEFNLywNTAzIKZgFNODQPF2qeXhseGJMq7C77b9w
 ==
X-ME-Sender: <xms:CoYjYMynBk4173PWGa8PFhPLcRoIbsyRGmR1w7gh6dsKIMUUvzjvzA>
 <xme:CoYjYATWnBM2geBzqvoRYGQQ7pxLEhGIfuh2IesN7qexT6nSFxZL7mr4IE3grAzZ0
 W2dZqgauqqcv-wOJmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CoYjYOUPH_3MiCTMwBHpWSchzwe0Xx-093jfxYeloIgLFtxjq5hZdA>
 <xmx:CoYjYKjugDC41PDedHHQXlWzw7gY5SsqBcYzKzmbpkF4ok5pJZJPNA>
 <xmx:CoYjYOBRdGx0tUDJA8N9IptZijdahYNJP76Vz1u-iW2ybhPucaCBeg>
 <xmx:C4YjYB-K9hn-UxYhQQDKfYJSXpmlFmkYRLraWGAPo4NZoNd40QbdlQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8007108005B;
 Wed, 10 Feb 2021 02:06:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: oncs and write uncorrectable support
Date: Wed, 10 Feb 2021 08:06:44 +0100
Message-Id: <20210210070646.730110-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

First, add support for toggling optional features through the new `oncs`=0D
nvme device parameter.=0D
=0D
Secondly, add support for the Write Uncorrectable command.=0D
=0D
Gollu Appalanaidu (2):=0D
  hw/block/nvme: add oncs device parameter=0D
  hw/block/nvme: add write uncorrectable command=0D
=0D
 docs/specs/nvme.txt   |   3 +=0D
 hw/block/nvme-ns.h    |   2 +=0D
 hw/block/nvme.h       |   8 ++=0D
 hw/block/nvme-ns.c    |   2 +=0D
 hw/block/nvme.c       | 166 +++++++++++++++++++++++++++++++-----------=0D
 hw/block/trace-events |   1 +=0D
 6 files changed, 140 insertions(+), 42 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

