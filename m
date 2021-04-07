Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235935637F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:51:11 +0200 (CEST)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU15o-0003l3-Uk
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11Y-00028C-71; Wed, 07 Apr 2021 01:46:44 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11W-0004zK-2U; Wed, 07 Apr 2021 01:46:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 64F925C0061;
 Wed,  7 Apr 2021 01:46:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=lHKuWc9+qgFvV+Qafo04eoG0o9
 YYDIy7pbiuAE2ytZk=; b=e8ABibdvNc0P143ManKv07EGZ6vnIZsa6MR3/GSRRT
 fNtD3liT0OayrarKV3v7wimTVQrx+zR4JMc7VR3HyCQ1bx/YYDkmUnUOQxc9NRO+
 lWJ5o5Gxt5VfYwiKDF+sTJIrIdsqGWK2ExjGD61s1xWOYn3JoU9hrRZ7BE/udgzJ
 gkGqlp9fANeEAC5t0YWUdPLzuP9AnyJ9u5PBFoMlYitiaI4iUCVYinQAl8L2hfBJ
 JD7MfJvIBKLwtJshE8XCobETnR0ry6NgI0/m9hPwTtWC/T+J5Mq8Jc9GAZFz88Bn
 f+xQoXIAQwhH/F0uwHneGeNOlYrnQoaz21GoBhJ81VOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lHKuWc
 9+qgFvV+Qafo04eoG0o9YYDIy7pbiuAE2ytZk=; b=R4MDWgM8PgtU1MbCTWXNMa
 JBOEtn6tkfXAEcADMNibTobcKWOUmCA6lefIO0gLK7TtjiMHWSutAfPBf+k/MRD3
 KrblGKEdrGTbXhLgrhw7IKj/6z1vxctvzMUvTuztUuDgOrcS8He2WSGUwPG7MpvQ
 c34UuuQ7o/NQAW4Smc2kVzoyXV0iAEc3ckJ8XbBzjN0conhnP5VN6L5vJi/xv/jj
 f650NLlL78kG3AA1CNxUS0XP1vUpUBTK+rJaRc73DRj5vdjjjxTvjgVwdqszuw7E
 /Z2GJbempmaUWoZul+SIt90Mfzg5PWeyk5XTLSuMzUCYZDJcmr1Frzw43CoIjUfA
 ==
X-ME-Sender: <xms:PkdtYHK72jJLOSjd4Qx041NWWxKrH1I0wNNo8XeiGwEJlQ1djvfdFw>
 <xme:PkdtYLJXmBw6LDmQ1kxwxLuOkT4IBKJFb_lM1ze4XfpwEgxB7S1OVul9qgqF3ypue
 5gNPU49PKhRHNMvt-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PkdtYPuaHzciLzWwuQ76PpK0wDS2F_j3TrZ7tmWPtJwUdgkkfQ0O-w>
 <xmx:PkdtYAbr-as-DiksyOYY4AldMTZl1ofkl8ybwvoWiC0a8y5MrRe8LA>
 <xmx:PkdtYOY5XNw6C9qfTPOQdGF6nkJBTeSVotqKvwC0wb0gG8vxI7gS5w>
 <xmx:QEdtYDPhFfrmerh5cVUUu0kMLWpZXIYGPjMnMVnBaJtqpcVPQ3sXYw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE86C1080067;
 Wed,  7 Apr 2021 01:46:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 00/10] emulated nvme fixes for -rc3
Date: Wed,  7 Apr 2021 07:46:25 +0200
Message-Id: <20210407054635.189440-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
My apologies that these didn't make it for -rc2!=0D
=0D
I botched v1, so please pull this v2 instead.=0D
=0D
=0D
The following changes since commit d0d3dd401b70168a353450e031727affee828527=
:=0D
=0D
  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-2021-04-07-pull-req=
uest=0D
=0D
for you to fetch changes up to 5dd79300df47f07d0e9d6a7bda43b23ff26001dc:=0D
=0D
  hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (2021-04-07 07:=
27:09 +0200)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme fixes for -rc3=0D
=0D
v2:=0D
  - added missing patches=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (10):=0D
  hw/block/nvme: fix pi constraint check=0D
  hw/block/nvme: fix missing string representation for ns attachment=0D
  hw/block/nvme: fix the nsid 'invalid' value=0D
  hw/block/nvme: fix warning about legacy namespace configuration=0D
  hw/block/nvme: update dmsrl limit on namespace detachment=0D
  hw/block/nvme: fix handling of private namespaces=0D
  hw/block/nvme: add missing copyright headers=0D
  hw/block/nvme: fix ns attachment out-of-bounds read=0D
  hw/block/nvme: fix assert crash in nvme_subsys_ns=0D
  hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl=0D
=0D
 hw/block/nvme-dif.h    |  10 +++=0D
 hw/block/nvme-ns.h     |  12 ++--=0D
 hw/block/nvme-subsys.h |  11 ++--=0D
 hw/block/nvme.h        |  41 +-----------=0D
 include/block/nvme.h   |   1 +=0D
 hw/block/nvme-dif.c    |  10 +++=0D
 hw/block/nvme-ns.c     |  78 ++++++++++++++++++----=0D
 hw/block/nvme-subsys.c |  28 --------=0D
 hw/block/nvme.c        | 143 +++++++++++++++++------------------------=0D
 hw/block/trace-events  |   1 -=0D
 10 files changed, 158 insertions(+), 177 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

