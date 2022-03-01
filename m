Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25F4C89AA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:51:39 +0100 (CET)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP06U-0001EP-TF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzi-0006IA-HY; Tue, 01 Mar 2022 05:44:39 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzg-0005gx-Dq; Tue, 01 Mar 2022 05:44:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 175F25801FA;
 Tue,  1 Mar 2022 05:44:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Mar 2022 05:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=Q1pLH+qS4YeFYxht4Y2tah7Kn/9h2U
 l8BOSoMEiPsgc=; b=a5siqCpGIJ+srhPklbUPHXFD+A9NGA+HqIjEdIvvwDk6GM
 6rL/lo2t44pkbMHj76xa4XGvPjWCtaxPrhFQ3SYUAfSeVrqR82TtFgdlygTcyWhU
 imKbNl2HaqzPhG3xPuUr8ZP52ZtuPFYaR66Mrqe2OFlncZCMZ5uuVKh/FmHnA0ew
 AWFNk3htfqjiON4OS0eJniajKqONGJxzS8sIHnzS5r2y2a3T5SOTAp2tIF+xTXH1
 LpbnrpmNzUz85IuI5EABF7QuDnGI22s6LBYIj+z/Hhf+Uw0LPjrWTjRBM7TrbvCU
 ewvYqvTYenbDr09diQL0LdunWkbfuU2HWP6/xx2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Q1pLH+
 qS4YeFYxht4Y2tah7Kn/9h2Ul8BOSoMEiPsgc=; b=XnGSO5a6AGVeTZZwS6YFlP
 ph7PQdRi2118sUxtbcKl9TN2R0OOFVxhFDjgwFb0VAzsnhDHCmYVKJtew64kxG5I
 BVibl9yvqjWvDN82piTT1upPeFbqTTbCNHLm3T7FAkevdOgIiWmLaVS+cDj7RzKr
 rNm9sfuBirgpHH1t5twi+dhJOSL7EhXDf7Q6ZTWfKZJt8gQAsNGqLhHrJwkwQ7da
 Yw3B/gwmILGUgoYXb1AQ33+8tatxD8pdXuqLyZ17izM6NSJl81RxcziTAiVELq13
 90PmJqAhEH4SEnmgzJ3UHYSFAG3z6P+faL/sija5ltKEfhMr2NmMNVfJSZR70g4g
 ==
X-ME-Sender: <xms:D_kdYvOBUTB4IuuAwK-aRTd22F7TzkW5pULw-Zk4o9CDFbfVaYCiaA>
 <xme:D_kdYp_CbpsCJqnmlG5TjoRD2D_h8iFrHd0a2_NKWKlw_ux1gTyJF1SI2uK5Y1Bb9
 VFxjQPGEDyjqZ9QVIM>
X-ME-Received: <xmr:D_kdYuQP-PQMV5oDkhzEOJz64FedZb5PtrGlXE1vz1_zs3uhh57GALQK9f1no9VfIYX6KE6n6cQYCfGVK9LsGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepveetleefgeekhfelkedvffduleefvdefgeejjeehfeevtdeulefhudetgffgtdfg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D_kdYjsI-c5ygo7OGGGyLEQUJhnucqcgaeG32lTFEe09hqyXrR1aww>
 <xmx:D_kdYndHFdqFrZz_ow56CCR3HHf1tRmmOFoDGjbgcKTzsv3aRlkU9g>
 <xmx:D_kdYv3z3o3dddo0Ul7iDb2AR1IR0hz9zZugulTk7-dBQDa4v5nO9g>
 <xmx:EfkdYr6tHHfcUJJK26GLfATKuQtQkMuEwi0vVGbSor_Rh0ZlygN2WQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 05:44:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 0/6] hw/nvme: enhanced protection information (64-bit guard)
Date: Tue,  1 Mar 2022 11:44:22 +0100
Message-Id: <20220301104428.160017-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This adds support for one possible new protection information format=0D
introduced in TP4068 (and integrated in NVMe 2.0): the 64-bit CRC guard=0D
and 48-bit reference tag. This version does not support storage tags.=0D
=0D
Like the CRC16 support already present, this uses a software=0D
implementation of CRC64 (so it is naturally pretty slow). But its good=0D
enough for verification purposes.=0D
=0D
This goes hand-in-hand with the support that Keith submitted for the=0D
Linux kernel[1].=0D
=0D
  [1]: https://lore.kernel.org/linux-nvme/20220201190128.3075065-1-kbusch@k=
ernel.org/=0D
=0D
Changes since v1=0D
~~~~~~~~~~~~~~~~=0D
- Check metadata size depending on pi guard type selected. (Keith)=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: move dif/pi prototypes into dif.h=0D
  hw/nvme: move format parameter parsing=0D
  hw/nvme: add pi tuple size helper=0D
=0D
Naveen Nagar (3):=0D
  hw/nvme: add host behavior support feature=0D
  hw/nvme: add support for the lbafee hbs feature=0D
  hw/nvme: 64-bit pi support=0D
=0D
 hw/nvme/ctrl.c       | 235 +++++++++++++++++++++------=0D
 hw/nvme/dif.c        | 378 +++++++++++++++++++++++++++++++++----------=0D
 hw/nvme/dif.h        | 191 ++++++++++++++++++++++=0D
 hw/nvme/ns.c         |  50 ++++--=0D
 hw/nvme/nvme.h       |  58 +------=0D
 hw/nvme/trace-events |  12 +-=0D
 include/block/nvme.h |  81 ++++++++--=0D
 7 files changed, 793 insertions(+), 212 deletions(-)=0D
 create mode 100644 hw/nvme/dif.h=0D
=0D
-- =0D
2.35.1=0D
=0D

