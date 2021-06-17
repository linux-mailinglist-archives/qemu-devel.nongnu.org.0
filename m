Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327B93ABC6E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:13:41 +0200 (CEST)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxSO-00061D-3p
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM0-0002NH-VN; Thu, 17 Jun 2021 15:07:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxLy-0002sj-TU; Thu, 17 Jun 2021 15:07:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D051A5C0106;
 Thu, 17 Jun 2021 15:07:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Jun 2021 15:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=x6jKfFPi8R6Rni6Gp6+YUawa8M
 uY0GzKy4cL/XsTPjo=; b=UNrG/x9dKV19m27ue32ZZnozjinGEbPhVtfCGW1lDS
 hsEm3p/FZZkZMv8+dZzIEd/xsa9YubJ995kYbdDXSOexg50FjZefV+nci3NgsDQR
 UH1AZCK4QRPNa9vx+m3mDSMGsEFsPsnvkMRHOZjTLUaGOix0aQZBU2xEq6ZM1syI
 QLKz8iVdcry+dbpZIRC+b2vEKnrJ1r/M4vRM6gaSOAdC4rqGI084imYpW6q2srx6
 mkkrcxFrtEqGb6av5pyNIYodcrNc4VEYa9ns+sf1YYg7fGtfa+TCsT1mFNpL915g
 7MI/LOHXGHjdkPN8eUGScu5TztaI0uP24cwr55U/2Fng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=x6jKfF
 Pi8R6Rni6Gp6+YUawa8MuY0GzKy4cL/XsTPjo=; b=S3lbNIcl52UEZG7UnUkgli
 5vsa61dBLIfDBVMpJL4wIXoK53DwE341v7QwLHb90SDrrgfUce3Rv+7p9u8Xdj4h
 HR+HH5znuYi/+M0c10bJwW1Zg3G+USVa14MRtj4ROAFoKNkuf/FJ3hilBU25GVOt
 Y27VrKxzfx6O9/so4gFga58GYzrrLloo+8zCyxe1CJoebgHZ9ZlbLIdCvrUV+K79
 Ij/AULFGk7Ojh/6w83uVRBvOETqiZXpKVXRtN7+Cg9Th1f5w0PRhvxGip7P6nHf3
 bpS6LAeasFXDAJAnryyJxwTmGSUg/7pqMQbWZA5uLSkx/fyDtx6CUx8coH8bHg+w
 ==
X-ME-Sender: <xms:U53LYKN0mxaiu5sQFEi81jQvJ8MbaZCZwnvEJhTpIlN04EU2BicOaQ>
 <xme:U53LYI83NXOnsoXahkXeKZLgL2m2DbC973FJ9HYYsqJYr4AscT93l3dnhXdi3DGXm
 _2EANyHu-91u0AItoo>
X-ME-Received: <xmr:U53LYBR6xw4ynMouE-bWYmWJ2RXcPZPZKwOPSjzx22WDrpI36-_td9meDLBAWklyjMcC4hMTa-0Thwu7jfQ6_jxcItAv2-ATZpSIZMdE_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:U53LYKte8KmL4sJ-DOBgrIIuRUmk5vYneGuGWd4jpVCrLTUChNVWxg>
 <xmx:U53LYCe1TRybL7bRVHOjY63C_YwVUsK_M2LwFBTzEYMJxcT2gMIDrg>
 <xmx:U53LYO3HsTBSFsnS7Zn1CmMvFgtDcbVVIIgibrEp3nwMZjF0R0mT1w>
 <xmx:VJ3LYJwPWVgUXuCA6yq4Majx5GkvirOcfDx8coYefTc4rvsC_eK1SQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:06:58 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] hw/nvme: reimplement all multi-aio commands with
 custom aiocbs
Date: Thu, 17 Jun 2021 21:06:46 +0200
Message-Id: <20210617190657.110823-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
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
v2:=0D
  - dropped RFC=0D
  - fixed flush cancel from being unintentially a noop (Vladimir)=0D
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
 hw/nvme/ctrl.c       | 1883 ++++++++++++++++++++++++------------------=0D
 hw/nvme/dif.c        |   64 +-=0D
 hw/nvme/trace-events |   21 +-=0D
 5 files changed, 1124 insertions(+), 862 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

