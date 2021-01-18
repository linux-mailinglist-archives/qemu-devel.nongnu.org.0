Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE42F9C08
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:51:52 +0100 (CET)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RCR-0002Vc-En
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7x-0000eh-CL; Mon, 18 Jan 2021 04:47:13 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7v-0000yY-CL; Mon, 18 Jan 2021 04:47:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CE6B5C0114;
 Mon, 18 Jan 2021 04:47:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=qoJaB/EPhlGdBC9rtVhyCg/RjZ
 URJg930lHQLZJPOTQ=; b=Han1yvcNLbtKh+bu1J6vzquYUoc0JvPQhlkRc10A84
 OBZUkdxDj40j278YKDuXZVqwWOuXmzroMH/WlxBkriS9hQ3fGEKDartEIAipq08Z
 FyNSFeLa8eZgB9zeRxoRBU537/MMhUBUuPEa/DUe+5o1cmYuELl5nMvhezaZiNKT
 UMtzP44ch+YQWJDzwEa0O0qTDzwsXjvXwlxaTizIsxrAVHK4L7keD2DloTuK7/jn
 0nJKrgH3G7n4D0K5IuRsajnF4Ecbl9aBlvEWKnUZL/4RSlliBrvp7FhtvT7ixMus
 0IUondkqSacpKFT/GEXOBT1rQIFxvqCVpX2O3MrGJ7SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qoJaB/
 EPhlGdBC9rtVhyCg/RjZURJg930lHQLZJPOTQ=; b=ePbTVoiW4/fDI7nIhIwk0r
 I6b8iH6WCsDXMEi7ir53I9kg2inBApCpm4rul9f6HgXH3hE1805WJkbjpng+WIHG
 wde4xK0Hyrh1x6H0zrnNA+MLrTKkR+Pq4sGhpm+CibBjbgvCCBZBd6WzPU1W2A81
 jT6S0yh1NvVM6kAQQzrvvaeWJUJlxsyn8XJL/+uoTEYIYQ47bWNooOefgJYvm0UC
 /vAmPK3E5OXsBpPF/csGQI+DR7WJn31lF+itULDymEQNqjBdGe0PJDsqPNjMU3fJ
 KrvuFp1/urojbFWpL0tXEBx1fpKDbRQrZCj94paNsCA2KPvvEHguJT/X3LSZSK7Q
 ==
X-ME-Sender: <xms:HFkFYC2h3mphpRli3qkt-ar26oXjHgvVsQ2GYNJ4MRi7Osi4a8N9zg>
 <xme:HFkFYFEqC2kNpo7ONLVuojnlcbWipw7kjjOBa_giKEptE5inq9eevoe1QfClotO_I
 Ldi9WB5G0Tddshz-Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeevteelfeegkefhleekvdffudelfedvfeegjeejheefvedtueelhfdutefggfdtgfen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrddule
 dtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihht
 shesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HFkFYK4i0vncXHR5Fws5W5AKi_-TEzu183PA86GEOzb-7thSX1bfbw>
 <xmx:HFkFYD2E7EovPbo-IJEEe8g1alW3fDzTwridwO0FSH70bvKuQou3_Q>
 <xmx:HFkFYFHgAnBPs9iRcltnflxvxSuUzQ7HuFfNnb1AKgkXZLq-6mWKHw>
 <xmx:HlkFYK6rmnOx1cnubnf0EhKQricu0sUrU7FOxaQgS9B_xgROHXUl8w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C028024005D;
 Mon, 18 Jan 2021 04:47:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] hw/block/nvme: misc cmb/pmr patches and bump to v1.4
Date: Mon, 18 Jan 2021 10:46:53 +0100
Message-Id: <20210118094705.56772-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

This is a resend of "hw/block/nvme: allow cmb and pmr to coexist" with=0D
some more PMR work added (PMR RDS/WDS support).=0D
=0D
This includes a resurrection of Andrzej's series[1] from back July.=0D
=0D
Andrzej's main patch basically moved the CMB from BAR 2 into an offset=0D
in BAR 4 (located after the MSI-X table and PBA). Having an offset on=0D
the CMB causes a bunch of calculations related to address mapping to=0D
change.=0D
=0D
So, since I couldn't get the patch to apply cleanly I took a stab at=0D
implementing the suggestion I originally came up with: simply move the=0D
MSI-X table and PBA from BAR 4 into BAR 0 (up-aligned to a 4 KiB=0D
boundary after the main NVMe controller registers). This way we can keep=0D
the CMB at offset zero in its own BAR and free up BAR 4 for use by PMR.=0D
This makes the patch simpler and does not impact any of the existing=0D
address mapping code.=0D
=0D
  [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-1-andrzej.ja=
kowski@linux.intel.com/=0D
=0D
Changes for v2=0D
~~~~~~~~~~~~~~=0D
=0D
  - Rebased on nvme-next=0D
  - Added a fix for 64 bit register hi/lo split writes=0D
  - Added the patches from "hw/block/nvme: cmb enhancements and bump to=0D
    v1.4" to the back of this.=0D
  - As suggested by Keith, I removed "legacy CMB" support - the patch=0D
    now exclusively bumps the support to the "v1.4 variant", so the=0D
    linux kernel nvme gang have to get their game on ;)=0D
=0D
Andrzej Jakowski (1):=0D
  hw/block/nvme: indicate CMB support through controller capabilities=0D
    register=0D
=0D
Klaus Jensen (9):=0D
  hw/block/nvme: add size to mmio read/write trace events=0D
  hw/block/nvme: fix 64 bit register hi/lo split writes=0D
  hw/block/nvme: move msix table and pba to BAR 0=0D
  hw/block/nvme: allow cmb and pmr to coexist=0D
  hw/block/nvme: rename PMR/CMB shift/mask fields=0D
  hw/block/nvme: remove redundant zeroing of PMR registers=0D
  hw/block/nvme: disable PMR at boot up=0D
  hw/block/nvme: bump to v1.4=0D
  hw/block/nvme: lift cmb restrictions=0D
=0D
Naveen Nagar (1):=0D
  hw/block/nvme: add PMR RDS/WDS support=0D
=0D
Padmakar Kalghatgi (1):=0D
  hw/block/nvme: move cmb logic to v1.4=0D
=0D
 hw/block/nvme.h       |   3 +=0D
 include/block/nvme.h  | 125 ++++++++++++++---=0D
 hw/block/nvme.c       | 307 +++++++++++++++++++++++++++---------------=0D
 hw/block/trace-events |   6 +-=0D
 4 files changed, 314 insertions(+), 127 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

