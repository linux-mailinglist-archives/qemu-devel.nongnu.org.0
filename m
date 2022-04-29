Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52F5144AE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:46:45 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMGx-0005Wy-8C
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4P-0000LP-UD; Fri, 29 Apr 2022 04:33:45 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkM4N-00058v-JH; Fri, 29 Apr 2022 04:33:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5205D5C0184;
 Fri, 29 Apr 2022 04:33:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Apr 2022 04:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651221221; x=1651307621; bh=kU
 pgz1If7MTY0FPuUc4C5pEIO8Pvz7wyFDY+Gjqpklw=; b=DM+TWOHAHEKeGHByjh
 sllDbOK1yjcT6e6x9xfnd+vESf8QiNWrHGfxXFxKYhohepwfx86JKwh+BgIVWeDa
 48xdznhGlBxLl6eo3GtyvuesZ8GymA4Jcu1D/LhTPMNv5LnFPiJNzoQq+kmY9eTx
 oQJ/mQoNZ6J4q47vtRi2qtJKeTHUYz5aE8zaWxwYTKOIt4A43iQztbVHt1eyqtrb
 4BrHpUDl80IIMgLVB9fzJTrl9tg5SEQBdX22GMsDGwJMcxACqe8PBRs4wXPqUMwX
 JvePDuV9ZrcOZ4PrDvvqma+3SmlvXe739Uxq7HJw/DDjZZBp2y2Qc/IIVk+4RjXo
 LLNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651221221; x=1651307621; bh=kUpgz1If7MTY0FPuUc4C5pEIO8Pvz7wyFDY
 +Gjqpklw=; b=IR8VZfPMajjz8P2Rb/ELVXwHKmOxmqknMJZfP5gL5NKwauvHenx
 x/qUbZSYkIHLtOzz8ctXIl9ofEZPbvuOTeaR+Xr3j0GdmHn0kJLBd/8uw1SFoczH
 cLG258T6n2AkJ7Qq1uuRASCYTQ2FqzCkFyvkUXtBiCx/3FhUnzZKFUFoEUq5CXb6
 T1+l8Zmp46ncHZxkEb3NB6YVhRGgEuc/JQrCJ8VODnGmX8jVIJIUBC6fc4Jr7Pdr
 sUikki2kLf+Zpv+IzL9Jb62q3KfuqO1CEmKVIoiva+7CEQHG9cssrLoG6nUIyust
 3+6jiEHfC+dQgHH2xDjitWWFXkzrvWDTGuA==
X-ME-Sender: <xms:46JrYqPTrJZboicbyCmz2SQaOk8KdJGT5SWr2HZmXxTjjHYD_u1B4Q>
 <xme:46JrYo-q9CnGfnP8K9k-DFySlAnghQrI46YkZP1bgxQGe61EYzQ6ubUT_vloAuX7m
 r3CMLfAQC3Ng-ufdLo>
X-ME-Received: <xmr:46JrYhRxnePSe7HDGCcruKj5SPgnj8UKVeuwDCTb85m9CJYAcTdEuCKnU3fZ3ktStAC1GoAvTWh-rBX4gUTh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptefhjeeujeelfeeltdetuddtffduheekveeghfdvudduvdevvdfhteduffegudek
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5KJrYquJ9DgsgZ8f2H1HwtaZzqSq_uDMsHhq5TROBnkl5MD1ryGdvg>
 <xmx:5KJrYicEtmOKravUS2uph0k-E8ed698sUAD7GhNfXU-YlKlxnRNYFw>
 <xmx:5KJrYu1qFSPp5yQPyBFhlNjBTjpOqmubVoBE-4F0XY70YLJJZJ4sAQ>
 <xmx:5aJrYi5ru_1EIgSEpXAXfZngdswaJINAYwCVA_fJkH5a68Vd4OeKPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 04:33:38 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/nvme: fix namespace identifiers
Date: Fri, 29 Apr 2022 10:33:31 +0200
Message-Id: <20220429083336.2201286-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Keith Busch <kbusch@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

The namespace identifiers reported by the controller is kind of a mess.=0D
See [1,2].=0D
=0D
This series should fix this for both the `-device nvme,drive=3D...` and=0D
`-device nvme-ns,...` cases.=0D
=0D
  [1]: https://lore.kernel.org/linux-nvme/20220224192845.1097602-1-hch@lst.=
de/=0D
  [2]: https://lore.kernel.org/linux-nvme/20220413044905.376785-1-hch@lst.d=
e/=0D
=0D
Changes since v1:=0D
 - Revert auto-generation of eui64 (Christoph)=0D
   User should set it explicitly.=0D
=0D
Klaus Jensen (5):=0D
  hw/nvme: enforce common serial per subsystem=0D
  hw/nvme: do not auto-generate eui64=0D
  hw/nvme: do not auto-generate uuid=0D
  hw/nvme: do not report null uuid=0D
  hw/nvme: bump firmware revision=0D
=0D
 docs/about/deprecated.rst |  7 +++++++=0D
 hw/core/machine.c         |  4 +++-=0D
 hw/nvme/ctrl.c            | 19 ++++++++-----------=0D
 hw/nvme/ns.c              |  4 ++--=0D
 hw/nvme/nvme.h            |  1 +=0D
 hw/nvme/subsys.c          |  7 +++++++=0D
 6 files changed, 28 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

