Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E3D2D2661
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:39:27 +0100 (CET)
Received: from localhost ([::1]:54334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYWs-0004F0-AR
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmYRV-0002kN-Vg; Tue, 08 Dec 2020 03:33:53 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmYRP-0007X3-HP; Tue, 08 Dec 2020 03:33:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C14BC9B8;
 Tue,  8 Dec 2020 03:33:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Dec 2020 03:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=An5m3UJ0QZBvcqFHrwEcJBwEWb
 XMP3V/3IY5PYQ/OD0=; b=aIAMB8JDFaKveJYULHFSdrO2cyXRfFeZG7LmG9Ro7K
 cHGffAfRFolOF7xFTDsjscbzZO96DhhqO3sc2Hxuc9vsFT4HKsFBDcUFai54NGkS
 +2hbpacCg10pHR73+rV7eqjzdBcPV70VD3/TiHaEVqaaY/p0DOwH+O+v1EVdUter
 arJyASAFLInfsWzm1Ek/0kYBE3VtyN/6kW1braXZ8STcvBezw0Xt/LyrjGKWn+dy
 tTqsR2WSJb4Ud39s8lrlzcJrRCr4wi8N8oi6olW+45+gbKQyFofdc04Iu8+vHm6d
 3B/qD/767sWySbxyvtd446oVF65A+cnxVnT8N1cH31RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=An5m3U
 J0QZBvcqFHrwEcJBwEWbXMP3V/3IY5PYQ/OD0=; b=dEeXKq/bJonq0Mq4tU7Ari
 eSVuIMYByJI/ek3v/MKv4LZNz7iQ6PtOv78vz4/mz61QSiVwIRz40bpWzeEGzlps
 aBQu1Hvp8iQn/UkaArDeu7mZgyzIoHNcUrMeGOaJAJ4dGfSGy8o42h0h+0sl/K7Y
 +AQ1dSYyHtfMAHJOPQN/xUC/Q4Iv26JGH8e2niY1qYkjf8umfj3RPcsDM8WnOAAa
 zO8GV+uQa3E9hx6gybX1feLX1YohdVbrmVCXiEDFFmPvu0a8HPT4iqv5czQ5JNxY
 jtBTZf8C+/O46ix17Iimf5TSoNeCEFuqADjLla2LPPmGYkYURn6dLb+jMB2fWIsA
 ==
X-ME-Sender: <xms:ZzrPX8IwIHjfaymQtCfHuvx4N2qnV7ifRUvfajAh0MVHjzNXBQUB2Q>
 <xme:ZzrPX8IqUYhwHuuKkER0bHDX9OzogvL8a9nUQZ2inXIj5qaZXjNJ67-knDnDHbdD1
 JftuDjQVKLT_waVQdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejhedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZzrPX8vYMZWjiE7r7pFcsrHUHEbaV1tLQkJw8Jt8NppvjyRlQ76VeQ>
 <xmx:ZzrPX5YcB3llwgkH4Fo6BQFwqZyVAUozkDtZIvd9BGtB4HLjSALPxA>
 <xmx:ZzrPXza0QZaeo5HwE3wvcyN8-XPeIg5QOmefNun_PtvjO2_oa3gEaQ>
 <xmx:aDrPXyXeGbtB2svqaiokBo6A7zx1QB3AEWMlzbIey8dV8l976q7Yvg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B910E240057;
 Tue,  8 Dec 2020 03:33:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/block/nvme: add simple copy command
Date: Tue,  8 Dec 2020 09:33:37 +0100
Message-Id: <20201208083339.29792-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Add support for TP 4065 ("Simple Copy Command").=0D
=0D
Changes for v3=0D
=0D
  * rebased on nvme-next=0D
  * changed the default msrc value to a more reasonable 127 from 255 to=0D
    better align with the default mcl value of 128.=0D
=0D
Changes for v2=0D
=0D
  * prefer style that aligns with existing NvmeIdCtrl field enums=0D
    (Minwoo)=0D
  * swapped elbat/elbatm fields in copy source range. I've kept the R-b=0D
    and A-b from Minwoo and Stefan since this is a non-functional change=0D
    (the device does not use these fields at all).=0D
=0D
Klaus Jensen (2):=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   1 +=0D
 include/block/nvme.h  |  45 ++++++++-=0D
 hw/block/nvme-ns.c    |   8 ++=0D
 hw/block/nvme.c       | 224 +++++++++++++++++++++++++++++++++++++++++-=0D
 hw/block/trace-events |   6 ++=0D
 6 files changed, 285 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

