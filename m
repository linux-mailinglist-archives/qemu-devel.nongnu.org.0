Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9A31412B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:03:47 +0100 (CET)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DhA-0001oA-Il
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97Ff-0007H0-Ui; Mon, 08 Feb 2021 09:10:57 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97FL-0004Ms-Kv; Mon, 08 Feb 2021 09:10:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AF329B5A;
 Mon,  8 Feb 2021 09:10:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 09:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=2nHJk1hbCj+jW6e+PW7hGygvGX
 llKdutdsEMC/NFSMw=; b=csP2CwSiXcuUjnux+iTMPGCzp9T9DPr57VlNKWDVLh
 bfRjcbgCiSSMzoiUPDrZzS/GYKDu+JEhSqfwHmQAVxxsk/b29ATXNYoA/Z+efmxu
 Fz/tetX7n0lWrFuakfrr/7MAXSfYhQk5OfiTq7s5Q0fo3EGaWocHksb6hYECJlwm
 FhemxFyWmwZ8na5Fur6UrRlh6OP6xiJcbM7pF2oSgNyBqAL+FZZnUZQBT/mTemJl
 XOcTuORHKJ8HpZEXW8sEA7KIY1hEUx39RYLcxi4c02zrXKVeOM86F8NLi2H/aURY
 3Aop4vQwIYDBsgaDP220FrAm+eS0Fe40oynt1Lw7ukIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2nHJk1
 hbCj+jW6e+PW7hGygvGXllKdutdsEMC/NFSMw=; b=Lijx+Az/pssJEjIeGTgBXi
 4bcAoLWa5pM2WdNFZQzQLH5ZEI3+95JgFd/kcMsk6/LF5pG98aQgITzxkYx/sE7x
 sruFDwRClfAuUN9jWcTanfUFLVNlNtPlhFxSanz1iK5OffRzCBWdlFHmot1rwJFA
 gESTjXP7lDTE0+lINBosHOIJSYyqa6k+z7F9ybBAPpsyG5+9+FoDrcCIeiFeLxXa
 v/NuhdYKrUhxCFAQFBm/a3N4/fQWzKNqZ25SQ8ZyiHaUxj5ri7UZuywFr6AoqFQt
 HQ0Gf4Lc00pVzFmcRj0zOuVl48cTG8s0yPZH55DicSZJXWxc7f/KhSLm61/u5kpQ
 ==
X-ME-Sender: <xms:SEYhYEF1UbJeRP0sXBBhrN-zZ8MSI8Otd7-IDvk96BcBraVzxJOJbg>
 <xme:SEYhYNVu6dnLhupQyMc7cI9vtsTsAT2oIdMKstotwf2G9S-TFbHdkvYq_LK8M-kfP
 p-75vrG84y3VoufYcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SEYhYOLms1ux_uk4pTqWpJ3BMQ8XN9Ipg8LVhk4GPk6sIHie2UtUQg>
 <xmx:SEYhYGHGQ8aEYMrRyATBVtq3xxqvt92IiqYSfQHFMTqL7GK8nHznWg>
 <xmx:SEYhYKVhxopjA8mAPE7yxOP81f6m4WrmaLn7txoiDHcYzfzNVY-bow>
 <xmx:SkYhYFFYEDKBCOn43hVv7q6lclMWe2N53hUwWB_H87s9wO1Ztuzzgg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5597724005D;
 Mon,  8 Feb 2021 09:10:15 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: add support for telemetry log pages
Date: Mon,  8 Feb 2021 15:10:10 +0100
Message-Id: <20210208141012.377500-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This adds support for the telemetry log pages and fixes up the=0D
controller IEEE OUI.=0D
=0D
Gollu Appalanaidu (2):=0D
  hw/block/nvme: use locally assigned QEMU IEEE OUI=0D
  hw/block/nvme: add nvme telemetry log support=0D
=0D
 include/block/nvme.h  | 23 ++++++++++++++++++++---=0D
 hw/block/nvme.c       | 37 ++++++++++++++++++++++++++++++++++---=0D
 hw/block/trace-events |  1 +=0D
 3 files changed, 55 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

