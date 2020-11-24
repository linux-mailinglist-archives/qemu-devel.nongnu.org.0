Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D52C1EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:20:37 +0100 (CET)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khSct-00081v-Ru
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSWy-0006pK-EG; Tue, 24 Nov 2020 02:14:28 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSWw-0001JV-9L; Tue, 24 Nov 2020 02:14:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16D385C017C;
 Tue, 24 Nov 2020 02:14:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 24 Nov 2020 02:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=MHXcjAVsot2qowLMCybG+CPATt
 Gew0PCreVJOz6KxqQ=; b=XY1ouQ29/zIp3K4dkFJBCBzI6/yxFOirDYTuENkaHN
 k6bLskdC+9QcTfceRmFT3UHkBYWasrnwB3mO8PlP9u3meOhL7e2bnuLUwZgn132G
 3WiqHXGBYIiPR86T6lQ9Kpv85OQBo6yIJcX16qKL4s9nJLdWb79wEzO6BvECPxky
 +Fq1vNVll8Sj26i5oHIdhqgPHuBTEQ0eri4nwm1dcxzvIXM2OUYIf3PdRPc16+pW
 cqkpwsco/7hXvq9peO1sY/E5iUl7yzqcT+5joKb4XRJX6Eq4NX1sdsXtm4Q9AZEH
 iRW2Ca+PQLKF1TDv2e4arnVqB7PW7m27tH/9Rl6cvuoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MHXcjA
 Vsot2qowLMCybG+CPATtGew0PCreVJOz6KxqQ=; b=aB4apEV+zQlAdKA9s8Q+S6
 EN8me3PBxnWdmw+msuOp387osR0ZraG7BW9M8wWAfRJusKTIpCA0FcCLp8TznWBl
 XZImdTlHh9E/dq0lqGuP1x9egNvQhj0o1fei9KsKJPkKeM4w8YjOUr6GU/EvRmPC
 ULxy1d58WC6kJ+IqIdUJjxpN2I5lKIEs+Dx7Vxfro6Ue+GBh9WujqaRsFPdTwT+g
 rPpZvYlTTveMtRBedMr0T/C+NfoaBPIU4URCtfcR3l+NHkdOL5JKnu4ChwQaTk4b
 sPshfuPuC2mkXl6LXP8Mj2N30ajqmwKdYxmTK2AukvmeCRLK2LJUfOOOcvuH1RYg
 ==
X-ME-Sender: <xms:zrK8X1Q-46h8MQYZdJkpzHRyuFUq8Cy2FQ_vcRxMgvbzyU69J-xDlw>
 <xme:zrK8X-wdJ6hXl_ySQax4fnRPpayQ9RddXgvn_AQSgMDAIO_2iORzJAJwvvVebNwge
 aq8WEY24a7x9qFc5vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zrK8X60devLO3vwxVbFDQ82MOUdvF-iIpvHdlJZgAEMs7frZoUo5Zw>
 <xmx:zrK8X9B8B5tMHMP4jMTbUNZTNRWAgcnZLLu6mzIpaZDO8AOPJdrPXw>
 <xmx:zrK8X-jIVmhwxAm_5TSRTngqwZH9eeWThpKppzIb6ZIZJZYiqfFbTQ>
 <xmx:z7K8X2etVs85nMw87crtvWk0Kw7S8jO-4UOqJQchZSXiRRC6AfJ_Iw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23E653064AAF;
 Tue, 24 Nov 2020 02:14:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: add simple copy command
Date: Tue, 24 Nov 2020 08:14:16 +0100
Message-Id: <20201124071418.12160-1-its@irrelevant.dk>
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
Klaus Jensen (2):=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   1 +=0D
 include/block/nvme.h  |  45 ++++++++-=0D
 hw/block/nvme-ns.c    |   8 ++=0D
 hw/block/nvme.c       | 225 +++++++++++++++++++++++++++++++++++++++++-=0D
 hw/block/trace-events |   6 ++=0D
 6 files changed, 286 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

