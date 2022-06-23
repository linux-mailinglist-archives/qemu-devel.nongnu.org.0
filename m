Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C1558A97
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:20:13 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UFI-00088A-7T
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDg-0005bW-PV; Thu, 23 Jun 2022 17:18:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDe-000443-9i; Thu, 23 Jun 2022 17:18:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BAA3832007BE;
 Thu, 23 Jun 2022 17:18:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656019105; x=1656105505; bh=S4
 U91liIMzavhJlcUBWlB16qpSfD43zSyZovZPIvjWg=; b=T0sOUHnAcxIBJlswcN
 8nzdy2bJEPMqPAgVJqp+GTwb7rGUPFunSp2LyyNqEoRY965qKGLNhXYPkwMb4VXc
 rgoq4atzhtyPQgCR5Uh6GNndQF6bq7KVbmZq+WFol5qzyVDzg9Q5nY+eqH1dlxem
 a/chVEmLL1Oc5bI5xLKqs7Hi1f/7pP8mWDjB8KBF14JPdiQWSnzPTPRdhHZohk4Y
 A1hyxzTVx/dLl6IYPNy7iEySaJyKmsZlyojZcDXhm2HybEVrJOLtqAofFTkvxSRP
 J9in4KoD4/W+sBW/PEN3tbxl9bndMkVcSUDuPk+qV9MkwJ3Vk5+hsGL+wtWuyhsh
 3JbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019105; x=1656105505; bh=S4U91liIMzavh
 JlcUBWlB16qpSfD43zSyZovZPIvjWg=; b=QEjTBRxg/T9yYlDAPev7Ai0bKzMl+
 qo83if8QlDLYotCMaBwVlR9QgVq1K2yRG5UdLjE/bEYAeKa0VIlPxp1qqK4To+Rh
 atfnThwKkod6pQ303qYPhqUEOesb+Q79ZUykpkC6DP4NKURwKk+OV1tREm028CRa
 1xpO6Avo/4Y/aigutK6MCeJP5yLAW0Wc+ipeeP8FCSgs8dRT8z5nxv16DhSAbyaS
 t/RIRm45wAjKqtEcKnql65hbANYRerffrTOf8P5MrWor14BCpdWZjQLtd+S3GH8W
 RBIJ0ocf/je+yFVAY7QI+qZgF6WQUFtzODqY1nftG3fCiAkvj+JSAnxdg==
X-ME-Sender: <xms:oNi0YgZ0kdsj9gCn-l4ItedTKqp3kJWv2wmGtBbzeySsIlhrVNMfHw>
 <xme:oNi0YrbmqZyMxaNYRR2m63WMuA97sRucJcL8xDU0UmNEOheN1Gf4432QrtnM1dTKh
 YbVajR7nJXkZYfxlWk>
X-ME-Received: <xmr:oNi0Yq8Xx9RBSh4Choma4O4RjGCNlcUe19g4bX1BTq4GBV2Yw8Tvf_a3DdqDb5F6R--ONXlP9TwbBnK_hDgH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieehteejvdejkeelueehhffhffefuddvjeevleeijeeuheejgfettdfhteef
 hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:oNi0Yqq7Q1TNLxNlN1OXZRWFeROEzFw84LrXAcYRl54YIyx78ayfbg>
 <xmx:oNi0YrpnbWSL3ZERHzSKMbTrhRrtN1VvzZUAwtQB5HCaXvt5FqNkmw>
 <xmx:oNi0YoTiJHpzm7r5YA0YfJx3g7V76DKUyh0Z_4RDRtWW461OxUOS6A>
 <xmx:odi0YqWULUYH-agcPl1c7mpq1H0DsqLlknaktXAOuzvCYLAFA1Q2OQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:23 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 00/12] hw/nvme: misc fixes and updates
Date: Thu, 23 Jun 2022 23:18:09 +0200
Message-Id: <20220623211821.50534-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series includes a couple of misc fixes as well as some cleanup=0D
pertaining to the aio handling in flush, dsm, copy and zone reset. As=0D
Jinhao gets around to iothread stuff, it might come in handy to have=0D
this stuff cleaned up a bit.=0D
=0D
Dmitrys fix (nvme-next commit "hw/nvme: add missing return statement")=0D
for dsm prompted me to audit the flush, dsm, zone reset and copy code=0D
and that resulted in the discovery of some bugs and some general clean=0D
up.=0D
=0D
Klaus Jensen (12):=0D
  hw/nvme: fix incorrect use of errp/local_err=0D
  hw/nvme: remove redundant passing of PCIDevice=0D
  hw/nvme: cleanup error reporting in nvme_init_pci()=0D
  hw/nvme: fix numzrwa handling=0D
  hw/nvme: fix accidental reintroduction of redundant code=0D
  hw/nvme: fix cancellation of format operations=0D
  hw/nvme: fix flush cancel=0D
  hw/nvme: rework flush bh scheduling=0D
  hw/nvme: improve cancellation handling in zone reset=0D
  hw/nvme: improve cancellation handling in dsm=0D
  hw/nvme: simplify copy command error handling=0D
  hw/nvme: align logic of format with flush=0D
=0D
 hw/nvme/ctrl.c | 252 +++++++++++++++++++++++--------------------------=0D
 hw/nvme/ns.c   |   4 +-=0D
 2 files changed, 119 insertions(+), 137 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

