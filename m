Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CA321FA1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:06:47 +0100 (CET)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGXc-00082h-PE
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFo-0004ts-4l; Mon, 22 Feb 2021 13:48:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFc-0003iI-63; Mon, 22 Feb 2021 13:48:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DBA475C01F7;
 Mon, 22 Feb 2021 13:48:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=VqsKQTSt1M+SbGwi8W1uYmnO6X
 nSj/QyJ6kwx3wVYOg=; b=cD2ByqZta0EePUxz3+jEdz2Eo6IuNyXN3YFzJLqbYc
 sbe3C1SbJ1jF6hpfSdgjDgVsrQ951vxBTgUXThwD8UhIOIdo2rDOL/gQeVFL0ADK
 mtau7sPkPMALOZXM3PrCEpYaZYwUD9T/wbxvUFPg8/Sj4tDw9AJRnu0g8nMIk+YO
 vsCIsCEbzhN0KIsvmVPhavorj2rI0WgNZSbA0cgmJEj8looSyBBWfm+tf63HKMrR
 GBvpJIJu53lF+sUDmBs4+MfvRb6LXNNh7AJ2HJfVqvCIKZkvQH6YGqyaqYyWFpxm
 qnTgrj5wWZfrohFwnaCdhvtmy6ssvBOixfGSWnmbIE2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VqsKQT
 St1M+SbGwi8W1uYmnO6XnSj/QyJ6kwx3wVYOg=; b=bZJ6Qa5BMfH7elW4rwPRbc
 Mc2gUl+uUm4W8x9nD39VAK88Nb2ls2iUPml0M7czw2NTrP/aTzImg+fXyQVvlTtP
 r7mx+b7VSU4tg2S8Bac0UaCQJE8PXHqes3zvfq5e7s4GMW1qWsK+kNDo2SjTyS2V
 FMEU7Wp33XH1rgr8GLeBetNH41cIi4l8MsXa8QXXTZpaHvxdJ+ou1Q8rZZT6Zbt5
 fhVxtXPdtqsDfy3LNu6jo+oFJnE//oh2575p/HfvhdtH9bW4oF2moGtRcbnKQb5U
 gXv9xDZxB322RAKIEZXi1GUaMAH3gl5+aIp5IIIpAaCZ/h9MeKHSMFiiHqxYLS0g
 ==
X-ME-Sender: <xms:YvwzYAKucIJGN0ZKrEkUhQfevhTIhjX0_pEC1Q4J3mi9_WGqERhNPg>
 <xme:YvwzYAL_HTRx21jMED5NQCrNkL5hk0_FJqF8dfJQ6EnQZxqd4KTXokRpIn8zWjuXm
 ily6N2zYHRRxqIvLno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YvwzYAu4Ge15hmJK-r4jarz0erxMwZI45IzQ9a35ltJ5SDH5YQ2X_w>
 <xmx:YvwzYNaqVIjNtGdIBktvQABaktQMvIHnyUMBdj54XQRhBUSk6-XZtg>
 <xmx:YvwzYHbFFGsZe4iy_ye90TEaG8UI0bp6wec3lyuXABmQwOraBsmS-w>
 <xmx:ZPwzYMOXTUT_ET7irj8OsEpdmKcYkdT9n2HWBQS5MtD1uhmUhGy1eQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3A1724005A;
 Mon, 22 Feb 2021 13:48:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/block/nvme: misc fixes
Date: Mon, 22 Feb 2021 19:47:54 +0100
Message-Id: <20210222184759.65041-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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

Small set of misc fixes from Gollu.=0D
=0D
v2 changes=0D
=0D
  * Split off the trace event additions from "[PATCH 1/3] hw/block/nvme:=0D
    nvme_identify fixes" and "[PATCH 2/3] hw/block/nvme: fix potential=0D
    compilation error" into their own commits (Minwoo, Philippe)=0D
  * Fix a missing check on the zasl_bs param in the=0D
    nvme_identify_ctrl_csi refactor (Minwoo)=0D
=0D
Gollu Appalanaidu (5):=0D
  hw/block/nvme: remove unnecessary endian conversion=0D
  hw/block/nvme: add identify trace event=0D
  hw/block/nvme: fix potential compilation error=0D
  hw/block/nvme: add trace event for zone read check=0D
  hw/block/nvme: report non-mdts command size limit for dsm=0D
=0D
 hw/block/nvme.h       |  1 +=0D
 include/block/nvme.h  | 11 +++++++++++=0D
 hw/block/nvme.c       | 45 ++++++++++++++++++++++++++++---------------=0D
 hw/block/trace-events |  2 ++=0D
 4 files changed, 43 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

