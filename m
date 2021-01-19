Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C02FB545
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:22:31 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1o9Z-0004Ey-Vb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2c-0001z1-VM; Tue, 19 Jan 2021 05:15:15 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2a-0004Eu-6I; Tue, 19 Jan 2021 05:15:14 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 43464F5A;
 Tue, 19 Jan 2021 05:15:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 Jan 2021 05:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=xAKEMjBa0cykAdhm3sVNJe+Bi+
 7Dpby8azHSQ3WZRtc=; b=WMfiziTdpzSonT6yMY1iue52S6xnmiNcnymhFFMjxM
 CVZTbYhZ9rFY6HL1a6tq5+t+SSGlR8w1a9y2nAGo1shlJYc14hk5dEF1jMS5OKKP
 mTFxxRmoCs3Pbc3tKVlE8eqsw5MoItdcuWkF6Qf/aB9nLlIu2gtLbOQgW+Rvx/i+
 j9Nhxpf1xxzA8qjGxLMf7l8r93BKPGMwr7GOpQO1CRH174EZl4b+6D2VgDXd3IG7
 jIE0dsR0n0vcQ1Xdy273QfRgtr/+LpRcigLKWVasNT0RG2uF5leLba7ZVMWHBLBN
 hM+Ny9g7Dh0MrkX1mPw6DhHoVZFiE7aCIrpzOoIIpFcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xAKEMj
 Ba0cykAdhm3sVNJe+Bi+7Dpby8azHSQ3WZRtc=; b=b28GZcWJUKna1z36MOAuzw
 BialEk+jehJVDP82B+P5vsAteyRgcaJxBfZosAF8y24YOc8Py4eLHKZDUBSq1jok
 D8EgJPOBPhDYhILGndtAgCVQ1Lnrq6+s4rIoUBW6yqUBDNaK6kox3lXhxnadF901
 7HQodg8Ehf5NXa9mZucpSurl98DqNRe1EUWJiQkm0+jnyXkA/LBwPIvo9YgaX01h
 NLQNTckUhLF+cvdos5wKGKyf4y745JNC5f39vOH57Xp2E+7lbAX4YBPVMIPvgM0u
 Bi8W2UUP30GhtrLUrXFOT0NbuxD+MfqjPCTiRK/d0/5VEeY3iaBgC/MM/a1iOKUg
 ==
X-ME-Sender: <xms:K7EGYOzSdjqg84m9FDU6NLT5HyMft4jALmOXObFsKf1YTxarxTdlIQ>
 <xme:K7EGYBSX1iIFK8LV9xKclHyc8sxgJICOp9nLT2kOj3mr2jh_859vP6DqhVJYffi8i
 tRrj-UrwmUbodHYdkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeevteelfeegkefhleekvdffudelfedvfeegjeejheefvedtueelhfdutefggfdtgfen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrddule
 dtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihht
 shesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:K7EGYFVZdK1UiH287kRPDghoz9t3qhhfj_FACnTRMjyyhUqweLXqCw>
 <xmx:K7EGYDZ1SEwSGZKXCHN7AMz3W9CkxUC2xMpfjKJ99Iev7eXjaO9bLQ>
 <xmx:K7EGYL2hMSNg_A-21CKjPJd_4lYrZZX8bSxMLkIkAZSXus7kPXIb0g>
 <xmx:LLEGYBMFdHBztN-z6EiSUlEMF5otAjD5ZBS6vKXzoK--BzoJvVOo4A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FAA3240064;
 Tue, 19 Jan 2021 05:15:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] hw/block/nvme: misc cmb/pmr patches and bump to v1.4
Date: Tue, 19 Jan 2021 11:14:52 +0100
Message-Id: <20210119101504.231259-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
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
Changes for v3=0D
~~~~~~~~~~~~~~=0D
=0D
  - Fix a masking bug in "hw/block/nvme: fix 64 bit register hi/lo split=0D
    writes" (Minwoo)=0D
  - Restore a deleted comment in "hw/block/nvme: remove redundant=0D
    zeroing of PMR registers" (Minwoo)=0D
  - Restore the 'legacy-cmb' parameter from v1 to allow the device to=0D
    exhibit the v1.3 CMB behavior.=0D
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
 hw/block/nvme.h       |  17 +-=0D
 include/block/nvme.h  | 125 +++++++++++++--=0D
 hw/block/nvme.c       | 350 +++++++++++++++++++++++++++---------------=0D
 hw/block/trace-events |   6 +-=0D
 4 files changed, 351 insertions(+), 147 deletions(-)=0D
=0D
-- =0D
2.30.0=0D
=0D

