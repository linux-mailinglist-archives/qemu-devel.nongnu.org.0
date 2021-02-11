Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B410D318E47
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:27:04 +0100 (CET)
Received: from localhost ([::1]:36492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADrz-0005V1-KE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADms-0003b0-Ax; Thu, 11 Feb 2021 10:21:46 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmq-0003iY-G5; Thu, 11 Feb 2021 10:21:46 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CA5E5C00BE;
 Thu, 11 Feb 2021 10:21:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 10:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=AEicjRhYEmjEIvdBb+9t8nOMyB
 V+ADV/oYqlvqPpOQM=; b=w8Irh4DjoWw400QW7EtV6EEpE5q2ZHctIWnPxg3FYT
 v0zSbCKaa8h7nZ+jcw0oq9DjgcC7jxleZM+LTGyMPq3xXfQ+W38kaV18f4bUjEYG
 BZa6m1TLZTW0WWLYYY3MdprhRB9FinQV9E62Zj4wf9mjy7ZkeqwO9cgH25/F+rHu
 oUA9i2PpWczQHQXr0oteVFv97iXzZL5T9Sz21Cmf8bkDCH3WvoeDq5vwPmC/wtgu
 fnIzbYkJrlUC/DOapMIWbC0LiYF8hVuS7QIl3rJ9YrCCsIdP1NjSyqb28ello74M
 t939q2oR3Rq3iGT/5ciDdclhKub2JHQpmcTifLk2F0+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AEicjR
 hYEmjEIvdBb+9t8nOMyBV+ADV/oYqlvqPpOQM=; b=t9EX4bWW3a3aDuBucOwd4W
 GJtpEJzh/E1D9FdKOJyNoYbn5PsKSHWy0VuOxSgpZmfD5SFgGVBUCZLENegjKUiu
 eTq+yfFjn/jj/uhRLHeNiZTltrnixAJEw2SW1wZLU1offe7ZljIIbnfFJYQbYrkC
 NdtOze6T9XoartzRIWFk8Okn53Tj07+PntwnX6HFmpKIU1odbeSv0ajHggK69gVq
 QqY6Y4VvOBXGF/2Hif2ECnVgETZ02p95d40sEC7AEKhU+tQnLaD+M0VEoOqrww9j
 9CxemNXjUL9hx2XcRfHps8uhj3BZC8Xanl6qGcW/3hD2u29zzNB4Z4KS8+LEyFlQ
 ==
X-ME-Sender: <xms:hkslYGMZ6gWpeVU9_9vhfyuklY51VpxG1CDKaNpe5AkRXOh5L-x_FA>
 <xme:hkslYE_dtWBLKtfWjnu7QN8zP04xmXdbpZr6yhmvXpMwy_fpxA7wDGiUiIsxC22YL
 SOjpyjhDuUb0NvtCpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedvhfeujeeujeekvddufedttedvtdfghfetleegleduvdevteeuhfefkeefueehgfen
 ucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:hkslYNSMeBD3c8QP1PToDz4moNa3TJssV3ZSOc0yP8IuNkIclt_vXA>
 <xmx:hkslYGvaLULF37GcOfTEPyuMEpcfbWWQtY7jQGiejL9CWXOmAzEGsw>
 <xmx:hkslYOflqcChXmQEV-0lN9savls2qOdAz4p91cJKp_DCohbZa4Nk6g>
 <xmx:h0slYLEvPRXnKRRVuc9Ky920f_0yYLEibUwISgctBOj1cCTX6HxINA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 615DC24005D;
 Thu, 11 Feb 2021 10:21:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 0/3] emulated nvme fixes
Date: Thu, 11 Feb 2021 16:21:36 +0100
Message-Id: <20210211152139.1004257-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
Two small fixes for emulated nvme for regressions reported by Alexander=0D
Graf and Bin Meng.=0D
=0D
Sorry for the noise with v1. This should be good and also got the full=0D
CI treatment.=0D
=0D
The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2021-02-10 15:42:20 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-pull-request=0D
=0D
for you to fetch changes up to 832a59e43b5d8b8a9c2b2565008ebea1059d539d:=0D
=0D
  hw/block/nvme: fix error handling in nvme_ns_realize (2021-02-11 14:23:08=
 +0100)=0D
=0D
----------------------------------------------------------------=0D
Two small fixes for regressions reported by Alexander Graf and Bin Meng.=0D
=0D
v2: spotted one bug in the error handling.=0D
=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (1):=0D
  hw/block/nvme: Fix a build error in nvme_get_feature()=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix legacy namespace registration=0D
  hw/block/nvme: fix error handling in nvme_ns_realize=0D
=0D
 hw/block/nvme-ns.c | 7 +------=0D
 hw/block/nvme.c    | 5 +++++=0D
 2 files changed, 6 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

