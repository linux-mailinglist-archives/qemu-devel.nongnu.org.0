Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A68E2FB6BA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:07:39 +0100 (CET)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rfT-0002or-QD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTS-0002dX-TN; Tue, 19 Jan 2021 08:55:12 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1rTO-0005rb-DA; Tue, 19 Jan 2021 08:55:10 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E7965C00D4;
 Tue, 19 Jan 2021 08:55:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 19 Jan 2021 08:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=tnD2g8og2/q/ZjmGJ5bqck4oDG
 H4ZKY6qF67pP7OFvk=; b=YnNg4jVAtv/G4GwLyJtjBaBnei4bfULlHfYCMQZ93/
 3a7gJKciuPUMq1SNVP8+A+6pn7fCAUlDfmL6aLxcje6mx0pRqnl4zW89M3K/Rgxa
 tUmE7pD0J74TdbnW2tAPsJ33RiCK+JZOEdj+f59lZbsFAwTmIPQ6JQliFbGgQ60N
 aUR1K9nbSnOoGANhp27zzhoHM+kF4yskM2TbtOykIxmqrT2ywnQuWmPS1t1oqGzx
 WgEIgk630AZJXPG6Eh4YNIzQpNmg3J5cqMkzj6kg/Sq79VqimjgVcvdtr4kzCjbO
 2owkzOYKKMCfS2Ziunqtns+vOPxMOppf4l8dq/vObLXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tnD2g8
 og2/q/ZjmGJ5bqck4oDGH4ZKY6qF67pP7OFvk=; b=X7e9l95MzBGeRbVz2Wh7GH
 AqCEaa7pxE832vnYb1D81CH3IMJ5oslNQFg/mUQSMtGrLuKZDqd+ACAx15gNHNHF
 C6F0/HD/ILioUlU72ldi4/SOQcjfzSEo3ThqEsV10Bv2MvlINYDkaomTGmCTHDjb
 9kObJ/gTN2w0laDFjZoLuDa3yftQ87xuByQq9Dh3vKwxEo92Ps9Y/Hp+s6iU54RV
 w2K10Fs/k7seRaTUkkxk9BGXjAxy9OLq0JHqBOoVaiI7NcBXrZXffrjrACetqgx0
 ugxnjMMLAOMfvZhhvyoOwbNyqWLDmK7r3WD5ID+c+hSSjqqj1N3IxIuy+VHlX+5w
 ==
X-ME-Sender: <xms:uOQGYBm0bJZpF2Ssu1z9t7Gf_QNQ6wug8G2ZrF5UpctCmHNAWSi7IQ>
 <xme:uOQGYPEo8WkXRkiFQ6_Gs8WBufusoV1Qb8Ypj6uKJ1r0yYDmuvd0mmy6RGwaptQ_6
 z4UMXZzKFAlmrtNVC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uOQGYJ7Q5m0VrGXnRWyKdVUM3qVOtLqJCO6TiKHC3Hv3eG7QPBez_A>
 <xmx:uOQGYHk1DA-DnHErQdA5mtV8vhlA0BmAFGWy8Z7Q_QBlDiKd7Nc9JQ>
 <xmx:uOQGYOpOfuGmk6g069Yxe0HHVZxu4S2UZAHtPpVPe3GJXhrT2iz2BQ>
 <xmx:ueQGYNq-aFpIzzn8CQ02arav-EoHHV5kW6ILMY3EKMchxq7Ejd2RvQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2971F24005B;
 Tue, 19 Jan 2021 08:55:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: zoned fixes
Date: Tue, 19 Jan 2021 14:54:58 +0100
Message-Id: <20210119135500.265403-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]=0D
refactors the zone write check function to return status codes in a=0D
different order if there are multiple zone write violations that apply.=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix zone boundary check for append=0D
  hw/block/nvme: refactor the logic for zone write checks=0D
=0D
 hw/block/nvme.c       | 89 +++++++++++++++++++++----------------------=0D
 hw/block/trace-events |  5 +++=0D
 2 files changed, 48 insertions(+), 46 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

