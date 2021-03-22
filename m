Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A423440B5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:19:09 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJWV-0001Ii-TF
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNc-0007N0-FF; Mon, 22 Mar 2021 08:09:56 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNZ-0005x7-5p; Mon, 22 Mar 2021 08:09:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 737071678;
 Mon, 22 Mar 2021 08:09:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 22 Mar 2021 08:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=kJoMisoleu37iXxhPCHP6QH4xA
 bJL14cm1ZpjdGl7XU=; b=fzyy3udBWRDdBYJN9WbkAwNwiBJr3Cv4q/201cC56V
 1Tp/FcFcAk27DLoGBT+vIGCA1kr5k71Yc8WC2txYBKlBi/eP3x/zasRWs6l1v4nQ
 d1e1Btqnd2l9wMMkJMM5utDTvMzk7Mash0kya9W9hCfHG8zwK9TCC7vkGlYpnaZB
 CAsZMfoHaVC0nd6j039ZURL/pJfQ+IGKUsvyIEWnHIybI74rN7a+EYitWiYnFQIH
 WPo3kmrwxIAW5dcb56R+vCCGqrZWwSnL3B0A4S/Ke5l71f75k4iLDFOmEmfvR+u/
 ibmTduS9c49fg5t2ACiK/Ua9VwTZA4zWyYC3Ft/rMybg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kJoMis
 oleu37iXxhPCHP6QH4xAbJL14cm1ZpjdGl7XU=; b=tKydVkmGYZDLr3gX0IRU9x
 2yQYXSHYa0KSQLMQ56XLcMPBHoORjLFtN63fEq3lQUzoArFG3AC2zVj3/KRM6Rb/
 qpmB9SAZ2Yj6GQWdvvJvtaxm82RXcxJxRDwaT5tdGPm/I2CyM341zFNPq+MltZDT
 jm9d4GHfDSZJgYn4YvKDxApD2RX9xkrho0enNtcJhLsxltMlNxKOnAdi3MWqYdA8
 EiY8gyOYA/QbdgWw+eXeXlyd1Bg6HauUeUVBmmCzSV8x8XFZ4N9C8mY2vHUUYipe
 +k533jK8fH/EXoH5xV64Eaj1iGVaZ1exC+b5jE5qLHhp5JCM1AwPCcnWqhrcshDA
 ==
X-ME-Sender: <xms:DIlYYBaLXHfnbyhSdbknyLh9op7SFyStD7Q73dYA1QTvUKEFGWWyrw>
 <xme:DIlYYC8Kj7G3fLDMmeiERJKWLOnfGbFSqnJsWKQI9gtiuW-snnZAMsED9pW6U1M1D
 3MJz6kEH0ujP-vRSts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:DIlYYAiegRucOQw3XALKaaC__Xy2tT5ZaB1o3jIzcYTzjul_DWsWQg>
 <xmx:DIlYYCevzHbdZJLRLdwHqCQvQSg9tjEtegQO81H9ty95qvnWmdMa2Q>
 <xmx:DIlYYHrrDRNxHA5pipMUlysGCMB7FjQBimwXkckVE46accj0Lj_naA>
 <xmx:DolYYC0-K8UY6Oy8J3LKUcfXNXRB1Cy5NAGJI9YYvZXxA_k2_0FJgA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 769C324041D;
 Mon, 22 Mar 2021 08:09:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/block/nvme: coverity fixes
Date: Mon, 22 Mar 2021 13:09:42 +0100
Message-Id: <20210322120944.225643-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
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

Fix two issues reported by coverity (CID 1451080 and 1451082).=0D
=0D
v2:=0D
  - replace [2/2] with a fix for the bad reference counting noticed by=0D
    Max=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix resource leak in nvme_dif_rw=0D
  hw/block/nvme: fix ref counting in nvme_format_ns=0D
=0D
 hw/block/nvme-dif.c |  2 +-=0D
 hw/block/nvme.c     | 10 ++++++++--=0D
 2 files changed, 9 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.31.0=0D
=0D

