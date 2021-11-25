Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB845D5B8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:46:06 +0100 (CET)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9SG-0002gR-H1
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:46:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KA-0007ke-Rn; Thu, 25 Nov 2021 02:37:42 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:32787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9K8-0000Vh-Pd; Thu, 25 Nov 2021 02:37:42 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AC0D5C019E;
 Thu, 25 Nov 2021 02:37:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 25 Nov 2021 02:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=z365vtZJco6hBLo8Kyay+Khn0J
 CKwAMvlBSTXbnaGS8=; b=PggkAFXqUEWpAow4FjsMts0CpEL5nEw7TEXLIJBkMI
 vPZvtuDUh4rsymVD8cSlXayqYIyfRuUJ9ylVuJUuk7KtEM4xZIaM3yeLRUesWkJV
 rw+2lAxOTn1w0q+OgPiI0orp8SsMlyStm9u7PnEbKGHixOuFLZQd+191/tFoJSQV
 qEb+3p0nW2pu3BwDeTocBDkpo3VNfAyVo8NMCqltdi20DVCWFqnNJk4t0fWlPo2v
 nFrNK4EXrNKXI8qso7R8fQEk+HgD+uui25pQOK2C9kX940GNuYQ+22+/k7q+mhEC
 vwrVyJ+C5zyoJwVl5clgjAIFI2tIWpooopwW/5P7WCFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z365vt
 ZJco6hBLo8Kyay+Khn0JCKwAMvlBSTXbnaGS8=; b=dJho7Z/7n6bcR8pNueX9GY
 FK0VT8B5FusQ7G5JNZEw0xGIgHsYJNCVMxfLR++44F2jvEEhMYLmYv2ZLwWSdzpa
 MmlWU1TIYthC8imCk/2+2lM8aYo6bZ5igiVa6PUBpa0R9J8PHfvg4lP1J0GSNkK7
 1XPcUTsg+kFGOWtqRKx9y+Ap2zRqU6CKY3zWiGNvNbmmaRPjTaz4oqLmGMeMYd0H
 cpYwNpUEgTDbnNU3/8kdHytpk9ZlDEELeFJoXg6tlUo+O9ALmp2kWzvsP6VQ9A7M
 4hLUWF/O3YJJGLoqdvN1lXIV1/Kf5YY+/NcHDSGTFmtLAjW4s2YVOnfe/cbQg55w
 ==
X-ME-Sender: <xms:Qj2fYc-dSt_v8p7bhWrslcngUJ9_xHVZ9EYiAfcVQLsPfZgWdv_JbA>
 <xme:Qj2fYUtHV2HKAdzx7x13ax32HEbYgTTJklgEZ1ewdgSvkqM4Dd34MR5MMnFbBzG3t
 HDrFvz52AbJu5i3b7Y>
X-ME-Received: <xmr:Qj2fYSAVu5aTczSlnKqR69idNaXlWK_KZ1epawdSWJuVaTR4ilvAETCZaFJg6E5nvcebsRmWISN6gbiCFK3bkQQARpK_WQoiO01NpIiZNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Qj2fYccqBsG427hYYwoEO9s5wxJGaImBO9pVCsmcEpuklubsYA-a7A>
 <xmx:Qj2fYRPFxvcW8_UEGWMXWr3v2-h4F6N3x-1FwNZp_XL6VQq0slVTqg>
 <xmx:Qj2fYWmXG72t05ao9arRDtbYzCji6MlMX8p4-CKj9PexASEDeXi3Cg>
 <xmx:Qz2fYaiF2YXqjkc7HlvbJFANChdGbk0CuCD3TGfxF95qhGwJtwGS9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 02:37:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH for-7.0 0/4] hw/nvme: zoned random write area
Date: Thu, 25 Nov 2021 08:37:31 +0100
Message-Id: <20211125073735.248403-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series adds support for a zoned random write area as standardized=0D
in TP 4076 ("Zoned Random Write Area").=0D
=0D
Klaus Jensen (4):=0D
  hw/nvme: add struct for zone management send=0D
  hw/nvme: add zone attribute get/set helpers=0D
  hw/nvme: add ozcs enum=0D
  hw/nvme: add support for zoned random write area=0D
=0D
 hw/nvme/ctrl.c       | 185 ++++++++++++++++++++++++++++++++++++-------=0D
 hw/nvme/ns.c         |  61 +++++++++++++-=0D
 hw/nvme/nvme.h       |  10 +++=0D
 hw/nvme/trace-events |   1 +=0D
 include/block/nvme.h |  43 +++++++++-=0D
 5 files changed, 271 insertions(+), 29 deletions(-)=0D
=0D
-- =0D
2.34.0=0D
=0D

