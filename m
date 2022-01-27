Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0CE49DD18
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:57:58 +0100 (CET)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0bN-00039V-18
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00e-0004cQ-LL; Thu, 27 Jan 2022 03:20:00 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00c-0004UP-Gs; Thu, 27 Jan 2022 03:20:00 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8EA2A580353;
 Thu, 27 Jan 2022 03:19:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 27 Jan 2022 03:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=0lMv0/KAwMmVPvglVae4XVwaQz7kf3
 Pi23oBF7jaseo=; b=c1A29LO/1vHyNiNlvgCA6iopyKUIlA81Ab+ceMAK94cK7K
 Irt5HfMIrpdkFiDuk+2de98zjQGyppSjMhs1jRMFkFdpaeVIxEpR/VkU/pIO5jx8
 lM8GVUZ8RYvJvWNDSjMMPEifN/l4J/PNsl/+Y20bwe1pf5hgKGb8r73CxUimfDX+
 fjdjt3u9Lvz/zxFlGaqC9fs3ObfhJUH/Zxe79sZkSBCQiRjZ/nJshxmjlF8WnLrv
 AbyCQBFjEX7lgmVTIaG6Dbf0fdkGO0lkFuUn1QERqtRmDWdH9HTLIqp96coqvohq
 hGJBHpNBvPi76pConSCiVZq2Ye69rEjF+/MsAnhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0lMv0/
 KAwMmVPvglVae4XVwaQz7kf3Pi23oBF7jaseo=; b=A7OzEbqtIVrB4C0Qk0+7ki
 0lhSuiC0EhXuE5cpw29u2fL+sayDPUr9DP2tWw+BS0k+FRxcXKAA2Fj/cm9QKX6A
 TsRHEQgIcb/V89/DjaGpxheK4+MaIY/nUj4mRfvb4uV2+C08hUVgA/8xWnXaxkkh
 rqdExNoaF0Ci9GGYZxUbaiNRtZ6hhs0GG6I0hhJE0TzAVsh05N9rJYncXyTB5vC8
 pE3laxssowkXmZR5ZmSCJF87//gs0jdMSVTCBpcOrOf2WbUBguGSOk+uFkqjLcpK
 jToLtelaw2o43Mq9fftV+gyCX7tWOjqsk0uFqAPSEu2tjfGCRUKnTyJcC8W1NXXQ
 ==
X-ME-Sender: <xms:qVXyYWkCV56kehX6dYi_jbua2oZXnhkMV1UbIpq49PKA7uM7rvjw1A>
 <xme:qVXyYd14-CUYM19w-CzSFTs5TUk5o6J-w38Bh3D7nXtBiJe4nwZrjFUu27S9Q46y9
 fPJi8PwxXsvcY3mVzY>
X-ME-Received: <xmr:qVXyYUpcfnB88lMboCAHhWGAuarQ-TMUuLwUgJ-kf8RiQbdzYJdyL9VP2SIs5oMQUxl3u4izKW-QieWPSijbmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:qVXyYakz0_GveowF_MwQEb-yxyQLpr6svyRPf0WOq2c0eukpdYAOww>
 <xmx:qVXyYU2ZZiFJYoQJd9cfAfUoEio4GbkHaOssKbuUM9K_mDuKFn0RyQ>
 <xmx:qVXyYRsQTQCQO-JWUYB09Z9PCVOWHrBjxQjPvJDA94lEMdAW5PcsWQ>
 <xmx:qlXyYayQsPKArtIL-rsz8DKt6MpALpKthxZNNfztPc4RIJpXxX44GA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 03:19:51 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/3] hw/nvme: zoned random write area
Date: Thu, 27 Jan 2022 09:19:47 +0100
Message-Id: <20220127081950.953572-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series adds support for a zoned random write area as standardized=0D
in TP 4076 ("Zoned Random Write Area").=0D
=0D
v2:=0D
  * fixed rsvd member in NvmeZoneSendCmd (Keith)=0D
  * dropped patch 2 ("hw/nvme: add zone attribute get/set helpers")=0D
  * amended patch 4 to open code the helpers removed from patch 2=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: add struct for zone management send=0D
  hw/nvme: add ozcs enum=0D
  hw/nvme: add support for zoned random write area=0D
=0D
 hw/nvme/ctrl.c       | 181 +++++++++++++++++++++++++++++++++++++------=0D
 hw/nvme/ns.c         |  61 ++++++++++++++-=0D
 hw/nvme/nvme.h       |  10 +++=0D
 hw/nvme/trace-events |   1 +=0D
 include/block/nvme.h |  40 +++++++++-=0D
 5 files changed, 266 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.35.0=0D
=0D

