Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161B2B0EEA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:16:32 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJ1C-00014K-V7
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl8-0003EA-MN; Thu, 12 Nov 2020 14:59:54 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl5-00078C-3g; Thu, 12 Nov 2020 14:59:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1402A5C00EB;
 Thu, 12 Nov 2020 14:59:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=bof7A6J68W2INydadEV1lU8TGc
 bclxJ3NQbDHq0U3UM=; b=mDeR/WuGm+zby+lxbWRQyK6Vdy0SuyyjqrPK6kxCtb
 dmuPEbjTQAY4mlLJANnXvDjxuUrdFsRXVYJbeJ/FkDbRzUUO7uXcX9lA5uY93NY/
 +m5E/LtkvQysTwXo3mwdrsAU9IaZQk2WWH4Sk9w/t4FfLm+tuveRDz4JXdlvR8RF
 sb9qJirs6mLDgznDdF/phQg1JQJND5VpSdtXiMUtZjyNwKaA5LjWt+hbJxQRLyyw
 /+9WCg2KcixCdCwrJY0uesGoB12WY+T4Q1fqog9I6Q4BRdily8Xj/vmnhg9XxS7X
 b4m8jYnHSB73kmDYn5fDNkRoQmBADjk5kQ0m1wBr0daQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bof7A6
 J68W2INydadEV1lU8TGcbclxJ3NQbDHq0U3UM=; b=ebjsiWeElzsy+AY1IUU7e3
 Ou40OZOu4Tr53vI/Mb0c/hCR6M3YHZrN5gmC3ZrrWbHazvdsOG23wE2QLuO0sxqf
 0i7EtEm82pw+2iemprdYH8wi2wmPNPHMO9vL28OP+B+qogFd6NiGUFR8aSWronMh
 WY3Y1bgjQokMSmmas3HHBcA23RlNnfDCSuGVnAfnLF8n/pCbx30uGW1hPQ1+kXEv
 O21HkIor6sAGxZlnC09MbFu1tUN1eO+2HoPCN/P93lGKL1Uf95uWa2Djq24jLgDf
 ZrXR3vG+JmKv5UNxqCQVWx58FHFoRD1oBip4AyK7671jCNsG4COZnks36iJJ+s+g
 ==
X-ME-Sender: <xms:M5StX0OhtVT5iGP9j8gr_vzkZjuAXb1bmnEmQ2Uv1u50ULvmDQbXxg>
 <xme:M5StX6_38UsCgJCUg7GUYKBNrIBHDSCadxRN_eszRydSUH8CTjSLlSBalRcs_qcqM
 uplPet6wTF8hnyyPXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:M5StX7QHQsmzT-ddQeymNAdcOxkEovbpNAKG9-2IdeVOAa19wAJX7Q>
 <xmx:M5StX8tr3Hr1MkCbDgV4mHwdfG5xXQXEO3atx_yC_jTLqiATKEil-Q>
 <xmx:M5StX8cLGv6M6uw5yBtSi9U2rGC4zEsNpg3Gx7Ce7N5syzKGe2Rhgw>
 <xmx:NZStXxEDxZGdaSLqvryoIMSE2rD2Gh4BkorjSalq5gJPR82djB9UHQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4679530689E1;
 Thu, 12 Nov 2020 14:59:46 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/5] hw/block/nvme: dulbe and dsm support
Date: Thu, 12 Nov 2020 20:59:40 +0100
Message-Id: <20201112195945.819915-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This adds support for the Deallocated or Unwritten Logical Block error=0D
recovery feature as well as the Dataset Management command.=0D
=0D
v8:=0D
  - Move req->opaque clearing to nvme_req_clear.=0D
  - Add two preparation/cleanup patches.=0D
=0D
v7:=0D
  - Handle negative return value from bdrv_block_status.=0D
  - bdrv_get_info may not be supported on all block drivers, so do not=0D
    consider it a fatal error.=0D
=0D
v6:=0D
  - Skip the allocation of the discards integer and just use the opaque=0D
    value directly (Philippe)=0D
  - Split changes to include/block/nvme.h into a separate patch=0D
    (Philippe)=0D
  - Clean up some convoluted checks on the discards value (Philippe)=0D
  - Use unambiguous units in the commit messages (Philippe)=0D
  - Stack allocate the range array (Keith)=0D
=0D
v5:=0D
  - Restore status code from callback (Keith)=0D
=0D
v4:=0D
  - Removed mixed declaration and code (Keith)=0D
  - Set NPDG and NPDA and account for the blockdev cluster size.=0D
=0D
Klaus Jensen (5):=0D
  hw/block/nvme: remove superfluous NvmeCtrl parameter=0D
  hw/block/nvme: pull aio error handling=0D
  hw/block/nvme: add dulbe support=0D
  nvme: add namespace I/O optimization fields to shared header=0D
  hw/block/nvme: add the dataset management command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   2 +=0D
 include/block/nvme.h  |  12 +-=0D
 hw/block/nvme-ns.c    |  34 +++++-=0D
 hw/block/nvme.c       | 258 ++++++++++++++++++++++++++++++++++++------=0D
 hw/block/trace-events |   4 +=0D
 6 files changed, 276 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

