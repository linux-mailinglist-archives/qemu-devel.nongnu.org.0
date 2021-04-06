Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFAF355D42
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:53:10 +0200 (CEST)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTshB-0005pb-7g
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsas-0002A4-Fg; Tue, 06 Apr 2021 16:46:38 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsap-0001WP-8l; Tue, 06 Apr 2021 16:46:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 34EBD5C00EC;
 Tue,  6 Apr 2021 16:46:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 16:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=P18MWYlhQoH7OUcYTescUtGaXS
 L/mDh/anm1U7ROZLY=; b=rJwEUYO2sGJ8IA80cgFF4oOpe1MNA2a2bdM9cGOQ0K
 dpd/I2OcAfdHS/y8D4ZvqVX0ysgbpkL/PrgAtilH5VYxj5snz9oIgCJ9ZHJkzrml
 prkG+asNdByiOjDjqybsbKqyPqiCxemOqC8j2XTzMhmM4muZXcuhFzWny0srXZGD
 KSnvc5WjrrU2hxpkf2rbpn6B28LuYGdJHm1Re1hFl3JJb2NbeTPF4WPAHsHXcdnE
 THBha6dm1sYMG13a0EJkYDTNWUEUhjFdB/8hgwOucAYEC+mEp9ICBmQepPUVKGOx
 w2JYcON9erDKSdyQz5VsGDjp87FcM4wsTrCo1LQOcABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P18MWY
 lhQoH7OUcYTescUtGaXSL/mDh/anm1U7ROZLY=; b=irY5RcgxR1T8GvZhSzu4Lf
 QAd98sOTwCWdpsAD0fGhrj1u1Zcipl07ahQEuRbm+VPOMMfjtyTb3hDCWLTipGoZ
 KPFc1jISTHtqRSU+8KRjqyYdbZNWAgXuocmz1AmWyRFVUE13555t3EpdUuo0ufF9
 skX43pbZ23f+1G9hUkGrMNdZq4TI2GibxKMC/iW3Zbx+Pg8Sb5RHl21TrIL/SguX
 jo+JrkQBYRKI3tx33iAZlEeaBnPR6Smrcf3xuUHLim8E4DA62G0Pv3pw3VwYJjMJ
 xNBiXuRtiPF+pUgnCmIvpdjHS/DF2sC1u7081Lu6HTqFIjZoJylSNJdLJGCTPG3A
 ==
X-ME-Sender: <xms:p8hsYPQ0-O7vlzytNl6OI6k2yP1zO51UPhzk4-m6Fipg5zsM6tYyoA>
 <xme:p8hsYN6AR12IUrGtvbaXgSKa-_vgx26IkXBKB-0VR_jvZqqKJLjkhgJ9H7u7GYtJl
 q19rweMMrFnGGp625M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:p8hsYD2s3Unf45n8yaRd9KjUSsv9iw9gIPS9Q7BsyG1EgVj40nIhFQ>
 <xmx:p8hsYABslqBtrCr0niWDWC--h8pJgRffZ6oDyeABiF1dznKHAnnxwg>
 <xmx:p8hsYGM9hQzMBMgtvlkdSBEf0XnXysYJOVZYBIs8jfAvarI9cFKbvQ>
 <xmx:qchsYFDCVRAqki_YI_a-J_w2TFT1O47QbrwL1yPFz25-CeH3jLHC-w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC297240057;
 Tue,  6 Apr 2021 16:46:29 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 0/7] emulated nvme fixes for -rc3
Date: Tue,  6 Apr 2021 22:46:20 +0200
Message-Id: <20210406204627.140812-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Peter,=0D
=0D
My apologies that these didn't make it for -rc2!=0D
=0D
=0D
The following changes since commit d0d3dd401b70168a353450e031727affee828527=
:=0D
=0D
  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-2021-04-06-pull-req=
uest=0D
=0D
for you to fetch changes up to 9553f8deebe0e443a0b006aa9d881269fd251a2c:=0D
=0D
  hw/block/nvme: add missing copyright headers (2021-04-06 21:14:25 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
emulated nvme fixes for -rc3=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (7):=0D
  hw/block/nvme: fix pi constraint check=0D
  hw/block/nvme: fix missing string representation for ns attachment=0D
  hw/block/nvme: fix the nsid 'invalid' value=0D
  hw/block/nvme: fix warning about legacy namespace configuration=0D
  hw/block/nvme: update dmsrl limit on namespace detachment=0D
  hw/block/nvme: fix handling of private namespaces=0D
  hw/block/nvme: add missing copyright headers=0D
=0D
 hw/block/nvme-dif.h    |  10 +++=0D
 hw/block/nvme-ns.h     |  12 ++--=0D
 hw/block/nvme-subsys.h |   7 +-=0D
 hw/block/nvme.h        |  41 +-----------=0D
 include/block/nvme.h   |   1 +=0D
 hw/block/nvme-dif.c    |  10 +++=0D
 hw/block/nvme-ns.c     |  78 ++++++++++++++++++----=0D
 hw/block/nvme-subsys.c |  28 --------=0D
 hw/block/nvme.c        | 142 +++++++++++++++++------------------------=0D
 hw/block/trace-events  |   1 -=0D
 10 files changed, 156 insertions(+), 174 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

