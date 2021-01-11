Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1F2F1264
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 13:39:37 +0100 (CET)
Received: from localhost ([::1]:47660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywTw-0004g7-Mg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 07:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN9-0002Qr-7F; Mon, 11 Jan 2021 07:32:35 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kywN4-0006qx-M8; Mon, 11 Jan 2021 07:32:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1842F29D8;
 Mon, 11 Jan 2021 07:32:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 07:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=sWf6KoltIfHXxGdCFKVcRtHlnI
 h5Jupto30GYPyEzNw=; b=NSG4CjZMzAapaUvDOLCS275YurLdh10ow6e8kUt7NJ
 hWcjs9cFrQeysKCcMNvI6ScvAxGTFvfedEB83jrTJe4ZVvm2F9Z7YKy4MQV2bVCv
 vExXVA+UMQtiC0MOYnZUXPaIld+n1gs+Mzo7W1QBRTTmaI5C5HrUz6IPhuVU+cmu
 D2Y+VV/TRGwyZ0nWHnsb+gzvLoMJfrRSUikPtWWI21Bx9uwrR3bM3dRZwzj7WLS2
 5bL9kj+BzkoxxSRVdb833tBaFuVWExGK8kH3gG1tL6t3IGk3AtzImtxd4e2+tel4
 f5GSQJBiQd7WDSEJyZsjdEl6dVbCz4upbYcFCjWqvsEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sWf6Ko
 ltIfHXxGdCFKVcRtHlnIh5Jupto30GYPyEzNw=; b=GRCqV0JTMajIUtG1l9UzQC
 OYXmRh4p2ykt66Fup10eVi70NBgO5h7fCQWA8BkPsBBxwJRxeWRTMxhyibOHLuqh
 WknTVrV98wxAw58C3Lv9cewkrw6WSuK9p/jtAuaL8R4XI6qat5KDR4t5+N1ddus5
 zSSKgSR8QCbHls144pWRV9RIBVQeXmqD9scYeL2vADJid/u9WCEXdb1drPbJ3y1e
 cJeAVzxFvstRPf+pb5v5zlmtwztGTTnk11t3J1BvXaHYSQvvSNMVmaJYxiNp1fmW
 mhlLpUAZ3lA0V++27e4Oube8SmWVGvHH0P0Y4j2dcJHQR6CGCBrsm1lHjk/R1Zfw
 ==
X-ME-Sender: <xms:WkX8X9xBW0llWw29mbpmmOW1MsrXy_0MTwkBVqJO5krB0v14NZwgog>
 <xme:WkX8X9TOzP9JXr8_vJ8HA33aBJsq-CtCnB4KpQEaqHFDZnn_lVGyCyKchZ9f1eoMb
 px7ehT6cupEjNlLdyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WkX8X3Xg1mZGCRWZExcm6YyyL9bSpPpsLH2BN7Dx54bhEEVodP-JVQ>
 <xmx:WkX8X_gb5n2ukGC4zeBoFOu0KS65Cqh3LQXeLNRwtUFAqUN--jR0RA>
 <xmx:WkX8X_B8_mykwPWAVDZFoU9vQogHq80WwM0sOY3V3iZ-eT4XFr3W7A>
 <xmx:W0X8X65LnGeUol9HndpxuZTC25mSrQHTUFLgcAHEicNtrk9JlsAEYA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A5E31080057;
 Mon, 11 Jan 2021 07:32:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/block/nvme: zoned misc fixes
Date: Mon, 11 Jan 2021 13:32:17 +0100
Message-Id: <20210111123223.76248-1-its@irrelevant.dk>
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

These are some follow-up patches to the just merged zoned series.=0D
=0D
The biggest addition here is asynchronous zeroing of zones on reset.=0D
=0D
Klaus Jensen (6):=0D
  hw/block/nvme: fix shutdown/reset logic=0D
  hw/block/nvme: merge implicitly/explicitly opened processing masks=0D
  hw/block/nvme: enum style fix=0D
  hw/block/nvme: zero out zones on reset=0D
  hw/block/nvme: add missing string representations for commands=0D
  hw/block/nvme: remove unnecessary check for append=0D
=0D
 hw/block/nvme-ns.h    |   4 +-=0D
 hw/block/nvme.h       |   4 +=0D
 include/block/nvme.h  |   4 +-=0D
 hw/block/nvme.c       | 200 +++++++++++++++++++++++++++---------------=0D
 hw/block/trace-events |   1 +=0D
 5 files changed, 140 insertions(+), 73 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

