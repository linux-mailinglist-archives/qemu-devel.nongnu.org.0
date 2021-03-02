Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617B329B9F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:15:59 +0100 (CET)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH30P-00016x-LY
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vR-0006XH-Cd; Tue, 02 Mar 2021 06:10:49 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH2vP-0007Hx-9d; Tue, 02 Mar 2021 06:10:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 888EC5C0167;
 Tue,  2 Mar 2021 06:10:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 06:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=0c0wgf35XxKiPYZZTxg9jlvChP
 A4mrC8DL/ySxMKcNw=; b=PJ4uY3WFIR51XKCxzzyBkmn+kg/IQENyt1R+y7Vx4T
 BtsBxdHu1Qjb0xAZZc+xmEdTGGdNy28PHtMxphrKEcumquSz78YNZpD1ZX+97z7I
 DcSxnIJ+n3F8qAvSWsPHAw2x5+vy4qoNhhuxacxKenzZjxLGXzEyYBGBK51x+8x9
 5qZkhnFGOy75xxV2ao4KUQuLsf5phknoTtvOgejPCftAtnm5DxC6uNSDB0NQ9XQi
 GDMjYlsiNiH7vQmOXNKEJ5Zj9iUKwJag+gP5IYwwDLKlJQExL5rlA9BxipXttFoe
 Z59rNw7gCmaZrJru4QuBzWiiTy7r05Pkm+I2AvFgriTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0c0wgf
 35XxKiPYZZTxg9jlvChPA4mrC8DL/ySxMKcNw=; b=ecuSKK2tSH/NWB/Ibexaht
 U0mLNFGL69rgjGyhOQjd0AEzZi+M5Q0MLwiumy8FiyITcw5D0MXEYXf30BDiHXzH
 7ffMg4rdPKZba3cTNSr1PClbw1hswW+XJiiTCl2hmkeeJJZNS9Ndl8VHDK0qn9dS
 w/AZQT2RBqD/xrrnUYIL1tuEzw2WnbZJ/58zNtGT0KJ1HpFYuq6uRvYzJWaV5Odf
 Vy73nlySoyyOqTF2+k6Ivuljz/tOBqJg5M3HppS9U9WfFHxfr5XsPweQQusF2MPQ
 aS3hTV0gPRiBlyIsxv4EVIm68a0292Nk3QqxT1kmKPBAgbuNI6F5Ddskq/L4lLdQ
 ==
X-ME-Sender: <xms:NB0-YKjkg8rG-ERGHtCu-2BAwJzUIAw0UKf390PEic-exXGUJC_N_A>
 <xme:NB0-YLBnbXw6JFErozIYpndgJCldmkokhVgi7UB6-jotib0_yUjPnsOuLod_J_Ds4
 p98xZ-RP_wU0kxw89A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NB0-YCGeXXPr7VrTegWs5umrKLU9rhMkzJWw-5hwz03se5TQmRLCbQ>
 <xmx:NB0-YDRmPeTRQ9KB2gHSlchqabZp1p1dSPcPZDezRMZvhNvqFey9IQ>
 <xmx:NB0-YHwAK-TjjyFDqXtM9KsquBwjU3cP0oy9G2jTLLxQ9vqvI27KyQ>
 <xmx:NR0-YCpBwkdaJa0NFuA4n64f0ctOxSC9z9H7aweRXV4BHsCSGuykQw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74E8E108005C;
 Tue,  2 Mar 2021 06:10:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/4] hw/block/nvme: convert ad-hoc aio tracking to aiocbs
Date: Tue,  2 Mar 2021 12:10:36 +0100
Message-Id: <20210302111040.289244-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

The nvme device currently uses an ad-hoc approach to tracking AIO=0D
completion when a request results in multiple issued AIOs.=0D
=0D
This series convert those operations (DSM, Copy, Flush and Zone Reset)=0D
to use "proper" QEMU AIOCB processing instead. This requires more code,=0D
but the end result of this is that we gain proper cancellation support=0D
(something that the device would not do correctly in the existing ad-hoc=0D
approach, and something that would have required more code anyway).=0D
=0D
This series makes SQ deletions "just work" and allows Abort to be=0D
implemented such that it actually does something.=0D
=0D
Marking RFC, since I've not really done anything with QEMU AIOs and BHs=0D
on this level before, so I'd really like some block-layer eyes on it.=0D
=0D
Klaus Jensen (4):=0D
  hw/block/nvme: convert dsm to aiocb=0D
  hw/block/nvme: convert copy to aiocb=0D
  hw/block/nvme: convert flush to aiocb=0D
  hw/block/nvme: convert zone reset to aiocb=0D
=0D
 hw/block/nvme.c       | 945 ++++++++++++++++++++++++------------------=0D
 hw/block/trace-events |   2 +-=0D
 2 files changed, 537 insertions(+), 410 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

