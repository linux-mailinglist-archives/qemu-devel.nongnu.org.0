Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DB39B36C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 08:58:15 +0200 (CEST)
Received: from localhost ([::1]:38310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3mY-0000Tb-L1
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 02:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hF-0005V4-FD; Fri, 04 Jun 2021 02:52:45 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hD-0007G5-8i; Fri, 04 Jun 2021 02:52:45 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CE6AA5C0125;
 Fri,  4 Jun 2021 02:52:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Jun 2021 02:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=yZxRCJvt2JwzD/sDDRBryqk/69
 7bHZBUTOvB3xH3CYM=; b=B253lAsDG6KSLaH5YUN/VxCaXOWpkuVQTR+CaYvpKC
 diDIXa6HRCl0grGvn6kNPRQ/HWzzUwFqWAKqJ07WIjVSBwd8p0w9fQwV1e0t+HZY
 5LnMvfJca/rL7X5nmpJFAeig1yYZxyUjS85m/uJL0p8yVZBMsaQQGRq8jcv/WY70
 7qFO7Ht3J81kiGTMP0NMxCYI08d2XgzgBMOK7m5LNiTRAxVo4sz96KCsN3ExkuGz
 m6llVQGFhdPcaznmubxFFjkEDIHaO3+ygmB2dIR2hmijKNlCh9WEe5jezOsevM3f
 KlxspT2uLpYB42qTWgmWTfKK3pxUUITwNt8LKjEyEh9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yZxRCJ
 vt2JwzD/sDDRBryqk/697bHZBUTOvB3xH3CYM=; b=S2Q4mKZnw+ZpmKgUj+G7mJ
 dZxFV7I5A3chuHQLkR0Ig5mBrIpi4FZ6G9gyeU5pOGp/ZoDMqJqgCDR+tpfT0wzn
 XuNv6XsY6BxhfhjB4xoE+R5dJgfPS5mKf8rRDfe6M3SSECUIw9B5Xv5hsnflBZUz
 NID/fxCbonDHtpg4E1SS1dVR+43gxeG/qwgYEXnj+QVQCLQ/Hy+MvEGMTYatKbRk
 QyWpzDndeddwuETJrtBWRAs4Euc8wwhfLbO27ZNX97gBPLeohmSH4HvSD23AzwR2
 bAav/qKbz7f+4MGR43Re6h0zEmu2YLtQ+Ww8MwUkIi38RQYsZcrkx/Kh6ra+9mtg
 ==
X-ME-Sender: <xms:uM25YF_jlhliqV1RbMT70qUXzlrzW4B-SiNa4TfC4FEEkFY8lIDvKw>
 <xme:uM25YJtFELuvXUvprp5wts7oZkpCl6Eg8OuCK71IKqYuAIXJk4132MMswEun25F2K
 DN1S9nP2MIPPXKeEgk>
X-ME-Received: <xmr:uM25YDA9u9CRHp07Ae2ttpW3k4wRHxqMO0EQHhTmRBV0NcRqXnXTCIzSOSkmtFQYjyQ1SI1oexaqdYKB3pMn2Hw9aco5JLVaCnVucB5PJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uM25YJeZ1WWK3wcXz36o6Fz8WOouiRA2b_VPR7O70EqnswJM9kMlqA>
 <xmx:uM25YKPTZwlFhApZLbAE0tAAhhTKWpO2Jv16Mh6sOkCwYnK_3IAKXQ>
 <xmx:uM25YLkqhD676z0d1w_1QotS4J5v_tuCP6Kr54_HJyvCT7l1LwowQQ>
 <xmx:uc25YJdsUjy_io7gSwnjCTr3unU60UW8YTqstr4NIrzrte2ECKxg5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands with
 custom aiocbs
Date: Fri,  4 Jun 2021 08:52:26 +0200
Message-Id: <20210604065237.873228-1-its@irrelevant.dk>
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

This series reimplements flush, dsm, copy, zone reset and format nvm to=0D
allow cancellation. I posted an RFC back in March ("hw/block/nvme:=0D
convert ad-hoc aio tracking to aiocb") and I've applied some feedback=0D
from Stefan and reimplemented the remaining commands.=0D
=0D
The basic idea is to define custom AIOCBs for these commands. The custom=0D
AIOCB takes care of issuing all the "nested" AIOs one by one instead of=0D
blindly sending them off simultaneously without tracking the returned=0D
aiocbs.=0D
=0D
I've kept the RFC since I'm still new to using the block layer like=0D
this. I was hoping that Stefan could find some time to look over this -=0D
this is a huge series, so I don't expect non-nvme folks to spend a large=0D
amount of time on it, but I would really like feedback on my approach in=0D
the reimplementation of flush and format. Those commands are special in=0D
that may issue AIOs to multiple namespaces and thus, to multiple block=0D
backends. Since this device does not support iothreads, I've opted for=0D
simply always returning the main loop aio context, but I wonder if this=0D
is acceptable or not. It might be the case that this should contain an=0D
assert of some kind, in case someone starts adding iothread support.=0D
=0D
Klaus Jensen (11):=0D
  hw/nvme: reimplement flush to allow cancellation=0D
  hw/nvme: add nvme_block_status_all helper=0D
  hw/nvme: reimplement dsm to allow cancellation=0D
  hw/nvme: save reftag when generating pi=0D
  hw/nvme: remove assert from nvme_get_zone_by_slba=0D
  hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check=0D
  hw/nvme: add dw0/1 to the req completion trace event=0D
  hw/nvme: reimplement the copy command to allow aio cancellation=0D
  hw/nvme: reimplement zone reset to allow cancellation=0D
  hw/nvme: reimplement format nvm to allow cancellation=0D
  Partially revert "hw/block/nvme: drain namespaces on sq deletion"=0D
=0D
 hw/nvme/nvme.h       |   10 +-=0D
 include/block/nvme.h |    8 +=0D
 hw/nvme/ctrl.c       | 1861 ++++++++++++++++++++++++------------------=0D
 hw/nvme/dif.c        |   64 +-=0D
 hw/nvme/trace-events |   21 +-=0D
 5 files changed, 1102 insertions(+), 862 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

