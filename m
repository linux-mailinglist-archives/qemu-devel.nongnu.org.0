Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEC354671
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:00:44 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTWl-0003X0-1P
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRE-000109-Fh; Mon, 05 Apr 2021 13:55:00 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRC-0000G2-TH; Mon, 05 Apr 2021 13:55:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9417C5C00D6;
 Mon,  5 Apr 2021 13:54:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=Yob5OoC+ZULXg7k+iWlEd59MoQ
 Ka4tMIf/Uo8lFz9RA=; b=aQdHYaGWneB+lGw191tu0320hVZiFKorHRY16PprQy
 ib1livELOctf0+1pDi7/d9RdndwWIZBerUG4gWdSWPNniRqRa9MjLa7f0T0yjDgQ
 FeK298KstWMlhSy1iT3EzxUqOjtTXToCcrbBJS8gC8ozKa0OeV3dYsDnVra7R0R0
 XZO9/FNMTlg0eCgdeaTbCYK5uOYbBTLUJ/O1SeitJOfaRxdmUQykVVMR7pj6nAWV
 qClSWmuhmt6FlWkMKriZESHmIbRZjAtcbJVGh6E1AR3jQmCgsJoDjsVTDteUPxJ0
 4xmqjEDAXhLrg9dNjPpx75bMp1+C1+HuugWy+LPZhlsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Yob5Oo
 C+ZULXg7k+iWlEd59MoQKa4tMIf/Uo8lFz9RA=; b=j0rbJ6BudA+dVF5/NP/M6z
 yC400xec6wf8GjY/421g+uy0Skx0knhjvAnvVkSdRWwpcwlO97e36KIRF4Ccs6Oh
 Uu+F3VNPgVQc1q4ppAwEDL4tP0r8A0qq7Za9dItJ+aJ9QsPgs4mJvR7rAx96Buwl
 htx8fbVPKUvTCGOTdl/kMVlbQ1YzKNOyMy8HcG4usn3+WL6DgEiUkmRygpfbfJTR
 u6Jl08WfjR1/hGqwqf7a2JRZHwp4ead5kPowphiwREUPhMSNkr7pwVwiWI+jJd4d
 CjoicnFCmBcDnED0vjYJ7H2gdiaT0I/MesAYcxV/ii9SGftzmywP9craXaTmD7Ew
 ==
X-ME-Sender: <xms:8E5rYCRT7s8MlB7Q3Flqi5-zD5gOPBEthyJi1MrtF8g8LnawYZ54Kw>
 <xme:8E5rYHzaUcxyqTczh4dt8pH-ptvj2I-pZMXeXzUIo15IVv38BsAVRYqGNwZCprE1R
 b_P9zZtmK7dDdxaUAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8E5rYP3G1XKk_gol23kj8vbtm4WKx6RYFlMiBvyfB_jgfSBgmGhH6A>
 <xmx:8E5rYOBz7BEagH-ByXex1VHLDQ4sbB7FdZcvAxMsUWHMdRKQdV0mBQ>
 <xmx:8E5rYLhajGDmBhITWIRowQAhW7nbvMhV-RxrHCMySv3ksgSlXRFNKQ>
 <xmx:8U5rYGXJ5n958wGSi6dkVmhgrojkvVL1MAPSbTvHoGfGYWy5yYsKeA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 635FD24005C;
 Mon,  5 Apr 2021 13:54:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 0/8] hw/block/nvme: misc fixes
Date: Mon,  5 Apr 2021 19:54:44 +0200
Message-Id: <20210405175452.37578-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Various fixes for 6.0.=0D
=0D
v2:=0D
  - "hw/block/nvme: fix handling of private namespaces"=0D
    update documentation (Gollu)=0D
  - add a patch for missing copyright headers=0D
=0D
Klaus Jensen (8):=0D
  hw/block/nvme: fix pi constraint check=0D
  hw/block/nvme: fix missing string representation for ns attachment=0D
  hw/block/nvme: fix the nsid 'invalid' value=0D
  hw/block/nvme: fix controller namespaces array indexing=0D
  hw/block/nvme: fix warning about legacy namespace configuration=0D
  hw/block/nvme: update dmsrl limit on namespace detachment=0D
  hw/block/nvme: fix handling of private namespaces=0D
  hw/block/nvme: add missing copyright headers=0D
=0D
 hw/block/nvme-dif.h    |  10 +++=0D
 hw/block/nvme-ns.h     |  12 ++--=0D
 hw/block/nvme-subsys.h |   7 +-=0D
 hw/block/nvme.h        |  45 ++-----------=0D
 include/block/nvme.h   |   1 +=0D
 hw/block/nvme-dif.c    |  10 +++=0D
 hw/block/nvme-ns.c     |  76 ++++++++++++++++++----=0D
 hw/block/nvme-subsys.c |  28 --------=0D
 hw/block/nvme.c        | 142 +++++++++++++++++------------------------=0D
 hw/block/trace-events  |   1 -=0D
 10 files changed, 156 insertions(+), 176 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

