Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF172D0B77
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:06:26 +0100 (CET)
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmBXM-00043Z-PJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmBQt-0002Y2-U5; Mon, 07 Dec 2020 02:59:44 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmBQr-0005Ea-Dh; Mon, 07 Dec 2020 02:59:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B33A45C012C;
 Mon,  7 Dec 2020 02:59:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Dec 2020 02:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=G27+aBm4Mfy94BK6wp2jhCUTBO
 VUoi4cWDBI9qgJ8AA=; b=pozGIS558mFa5NgWQ608vxvzuRBQLU1L4Eb9hFWufP
 ASvuEvN0Ms174KJ6Gom6VhhYDXrTJ/Mum6yBqKBdEWOy3bpsmvWy8jCz9Y1mnaiX
 r/1XVXjaOnP1EDG4YPRv0x07rQqFbKbUBDKVWAXqnlFH90F+V7W+5Z5d7vJy/G7t
 lbnP4s0ez47CsFVjrCyLVMBMT7VwE8iFRwIJ3qMHMHMukgarS6at7wEvcIwEplsd
 Ec0+OlRJAFl4nWoI7N3IAbajI6DXpder9dPXKh0/RkWRthjJ/uOCVtalDeHcs5ia
 FRuh0fIw7+YziYaiorE2OskVYwReEhMPMNO1uoRwJkmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=G27+aB
 m4Mfy94BK6wp2jhCUTBOVUoi4cWDBI9qgJ8AA=; b=JY/oqSM2uiLQCemDh1E6MU
 6LlMdGrKQ6w4woubaZVuO/LA1/o4hZpUcC6tYC4N8irhPx/eojKPyavl7cutOqjo
 8VNAqM1zadwVfixfReBpb2mGp07FbDsHNGoQ22yI8VTQoUdV23nRDcfFQ8hIKN+J
 HSkS7xz6VtOZARSWExKIDClvGTdgEerIu2UjTZFuzfaioCkTZT7dIQLZRv/dzDjQ
 DC4Gu/s/w3KuIGzvrcmfGpoduMhamNqWqLzrWiJ1aOsB8MfUm+oER9rWyxHN2s9D
 gUIUP1hRzn18XYydVZ7kjYIUwJjMCZjm+a/7hroI+mINdhHQhQ+dcP65J80cswdQ
 ==
X-ME-Sender: <xms:6uDNX0-2YsvkhtuFEfRCUw62shPdf37ol8Ptw--VJg01A8dl2681HA>
 <xme:6uDNX8u1nCNXILa6oO0nLiw2TRhGZdpx9JX7VY3nAY7A-QQBwuPdHZ15Un3HqYpbq
 fgyVopdMie5NjUfl6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejfedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6uDNX6Ahko3J9wjmubn64e37OhZTOVKUy9a5d1pzzesAp0fXgWoAVg>
 <xmx:6uDNX0d90ZXcfT08Bue86tD0BL2hMaiTAjVn-LDPDm4Zxy_Wr1OS8Q>
 <xmx:6uDNX5Pld0xbN0rEu_EkM613F8r6JX4FwncQAwEnnj2hwx43X0QQCg>
 <xmx:6-DNX-reTAf0Cc0GB0M4w_Q3e-8fNFA3DPJ_OZe-ygQvUJf5nx4qog>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 390A124005A;
 Mon,  7 Dec 2020 02:59:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/block/nvme: add simple copy command
Date: Mon,  7 Dec 2020 08:59:33 +0100
Message-Id: <20201207075935.238638-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Add support for TP 4065 ("Simple Copy Command").=0D
=0D
Changes for v2=0D
=0D
  * prefer style that aligns with existing NvmeIdCtrl field enums=0D
    (Minwoo)=0D
  * swapped elbat/elbatm fields in copy source range. I've kept the R-b=0D
    and A-b from Minwoo and Stefan since this is a non-functional change=0D
    (the device does not use these fields at all).=0D
=0D
Klaus Jensen (2):=0D
  nvme: updated shared header for copy command=0D
  hw/block/nvme: add simple copy command=0D
=0D
 hw/block/nvme-ns.h    |   4 +=0D
 hw/block/nvme.h       |   1 +=0D
 include/block/nvme.h  |  45 ++++++++-=0D
 hw/block/nvme-ns.c    |   8 ++=0D
 hw/block/nvme.c       | 225 +++++++++++++++++++++++++++++++++++++++++-=0D
 hw/block/trace-events |   6 ++=0D
 6 files changed, 286 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

