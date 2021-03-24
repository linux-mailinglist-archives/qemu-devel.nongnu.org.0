Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E203482B3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:16:08 +0100 (CET)
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9vD-0001Qf-9c
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9of-0007qi-4x; Wed, 24 Mar 2021 16:09:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9oc-0008KT-I1; Wed, 24 Mar 2021 16:09:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 55CB713CD;
 Wed, 24 Mar 2021 16:09:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 24 Mar 2021 16:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=H6werixRTWySEVVvi0qSdg2V6U
 5QqMnNAdEGs57iAdI=; b=Uj9/Cfaz4zLm2S+49MF7JbUKmqi7hs7HvLr6STDgpP
 +OKEuiO6QxH8M4axptZyHmp8Xpff6pp5j7xsgLmuEE7cnULY0bFUkPoEF01/WLMR
 ml3XYgZuDK5FCO/ay/wn2aQhSiF0ukNk4gXPlQYi/GCV4PsBYqYhX47FLxmuBf6M
 trZ+saZJSvF/A9NjPwKYTq4g7r6uSgQVLhiZ2YPnQjKH1cpC0PlfQTOyu3ni2JyE
 jPuZ14FSl1aAof9oQzCyKpUoHV0snWMxn2MuMsLrwj9GcvPkbGpJgwTYG9FPYhnZ
 16CMPjb3WIrsUFUMMiuVlD/Hh3yq0wIP3Z6EKExgFVxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=H6weri
 xRTWySEVVvi0qSdg2V6U5QqMnNAdEGs57iAdI=; b=Li6yS8XYvBPn/Z6fXlZJmF
 sWmjrBfA+9U7DSvOdRdLvzPlY2u6uIJ16OvOyVaH3nWjxO2/UqYMYTLMH5xY2LPj
 VUGFYqxIt1KLhfe5AbSo4C35f/xquRCy9yE+b9dDti6AlOqoGcKh4JqGctglZOx/
 45e1v0aMTKCS1KU8NC2vK/VytM+3N61ShoKouNdg8cKnA/8x0DPqFwvSSe1KiDMd
 OT775/CWqeYiFoNh8zxaDU4s5PZ983/ySn7lapHemnrDF0oVWYcQ8dx1SaeYOf81
 Np+NNbr0y4IkKTID+sjkNzc4A0su1tOOKFPCCOFlIHY/ZQzcdgLY4TjIDlwoqxcw
 ==
X-ME-Sender: <xms:Z5xbYJhyQ6cIM7eGdGTIdtBDORPyHsH-5zloYrNBsbL_8xdfbHiaJw>
 <xme:Z5xbYOB2woximtOpDqrajhIgL_kg6iUbo2xZFxqSQGi5wZ0ScXJKdfFaYA5oEskb5
 HjfRWOrYYjMDbPV6JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Z5xbYJE1enMQH0_RtmgLMKSvKs4pc-rNmN_OepMjocrddwxelsbekA>
 <xmx:Z5xbYOSAuFvmWc4ja5z4sl7c-Bj7uePGvE1EXpssow09iLU-CDG0Og>
 <xmx:Z5xbYGx9z5dmg7VOtvdOTd-_rPsCl4X94SLHBSlhRfEw2QXRn6zIyQ>
 <xmx:aJxbYNmtUpdfVy_43CySDczAjShFwyUaOFhqRFxJ8oizitBcPy-dAA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 592BA1080057;
 Wed, 24 Mar 2021 16:09:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/7] hw/block/nvme: misc fixes
Date: Wed, 24 Mar 2021 21:09:00 +0100
Message-Id: <20210324200907.408996-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Various fixes for 6.0.=0D
=0D
Klaus Jensen (7):=0D
  hw/block/nvme: fix pi constraint check=0D
  hw/block/nvme: fix missing string representation for ns attachment=0D
  hw/block/nvme: fix the nsid 'invalid' value=0D
  hw/block/nvme: fix controller namespaces array indexing=0D
  hw/block/nvme: fix warning about legacy namespace configuration=0D
  hw/block/nvme: update dmsrl limit on namespace detachment=0D
  hw/block/nvme: fix handling of private namespaces=0D
=0D
 hw/block/nvme-ns.h     |  12 ++--=0D
 hw/block/nvme-subsys.h |   7 +--=0D
 hw/block/nvme.h        |  45 ++------------=0D
 include/block/nvme.h   |   1 +=0D
 hw/block/nvme-ns.c     |  76 ++++++++++++++++++++----=0D
 hw/block/nvme-subsys.c |  28 ---------=0D
 hw/block/nvme.c        | 131 ++++++++++++++++-------------------------=0D
 hw/block/trace-events  |   1 -=0D
 8 files changed, 129 insertions(+), 172 deletions(-)=0D
=0D
-- =0D
2.31.0=0D
=0D

