Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD533B0AD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:10:36 +0100 (CET)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLl7J-00064O-7d
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl19-0004E5-C6; Mon, 15 Mar 2021 07:04:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl17-0006RV-7A; Mon, 15 Mar 2021 07:04:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E1182236F;
 Mon, 15 Mar 2021 07:04:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=hlF6KIL/GYdGCuz1fYlSfTetzR
 J0If5Tb+piIpPC2DY=; b=Kd26NpL01kRJx0OGb5JPbHdGHGXrAJJBUcYHtNxaC/
 YcPZ4GAvZubFoscId5bgiv6i71N6L3fxIR1T21Zm/5tG69SRKD/HCMLIJz1wGBC3
 PxE3QSyal1YcUeRRkgbbO4Qofv7wIWz8sjFdVCqBIpWiUeQOmbpazydwRXEQsHhv
 y2GuscPn5NBAu38x+OvY/u1HowX8Fnmu0luoyAeiXvh100qc4/o7S/J/F6Am8Mgf
 TUnOApJtvXhcn4g7M6emVuPtKDwKKVROPgkfRhtLyDxEiVIt+z7+HXrcDcpxfTNG
 m4UCkCI9urm/Mazu1D46LO1CfWGz/FFyXJ2OaM2t4BlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hlF6KI
 L/GYdGCuz1fYlSfTetzRJ0If5Tb+piIpPC2DY=; b=g98V3ou1enY6gnFbq28u5i
 xtcUGsZM0kQSwSI4+wWt9ZxwsaKXdNd3PC1PUIut0IBY15dg1s0UA2djgpbqyBCw
 iZID4oq9IXQllVlXo9Br4IEsQZm8hXkrj9GOsLT1AEULW0bXjTAobA83PM6mScEn
 Ly3GZwq1fgcvdK6O1pIMMXo5v8R6FW0hfGRbMXIuT8hPZCgILwRDHZBF0EpTKThi
 8e2/awAEdxIgLC1aFuDMQBNmbiP2iBz/hqkplz6WeZlhH4yUQ2sY3bvPQep+ND2p
 Z3lGpeK7xQBtkn1qnXXuFdASERTL0QhiAIiXweAH/2shU5Gszr6K6KUcbnASI7OA
 ==
X-ME-Sender: <xms:Ij9PYBBOtx8eWJ1vMw8Tf_5nk0g89dNSoYhDCLRCxBuyERRCOv2QFA>
 <xme:Ij9PYD2IhqWPUqYcYLYmHl7jpBesCOPsJJvRLSGrGr7x8lhyZnnMYu7d9Q0lExJLr
 LF7IpQSk2cgNXtX4uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Ij9PYLuCf7IvOQNvtkbHQR7hyA5gygFbj_a06rXNpyCqsKnzLhuwKw>
 <xmx:Ij9PYD6j9O8oLgAtkzVVK1LCOgy9RfjfC40JcPwhLJ1-hGzM2N1c_g>
 <xmx:Ij9PYMI9eWtUgv8frz2Y0I7aL_mXxXbnkR9fNqbnjKPnaD-Mc9wwTA>
 <xmx:Iz9PYN79HY-IrkwXIIgLlQ0hsl80M2McsDaqVdWFxcd6aMkMLvUzkw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D3C9240057;
 Mon, 15 Mar 2021 07:04:01 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: coverity fixes
Date: Mon, 15 Mar 2021 12:03:57 +0100
Message-Id: <20210315110359.51450-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Fix three issues reported by coverity (CID 1450756, CID 1450757 and CID=0D
1450758).=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix potential overflow=0D
  hw/block/nvme: assert namespaces array indices=0D
=0D
 hw/block/nvme-subsys.h |  2 ++=0D
 hw/block/nvme.h        | 10 ++++++++--=0D
 hw/block/nvme-subsys.c |  7 +++++--=0D
 hw/block/nvme.c        |  2 +-=0D
 4 files changed, 16 insertions(+), 5 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

