Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D468314DF7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:14:02 +0100 (CET)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qy1-0002Ve-G4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qsl-0000m0-Uv; Tue, 09 Feb 2021 06:08:36 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qsj-0002l3-O5; Tue, 09 Feb 2021 06:08:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1DD4A89D;
 Tue,  9 Feb 2021 06:08:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 06:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=MBWHZgLeeCINLILEUviiTpBt+m
 LZOyfszKJaVssdvKU=; b=k2ZJG2AACC3IELJ00j27LcSHbnj0RJRPeor1KnXGDf
 2+YMnmKbXa/AvltbMTKkDKnxmEuW+5gdm3F+Wa+LpLDnqPoApBSt1O1sOyfdYVH4
 lnO6ltymIhyrFkmj6XYQQYObFGSheFeVjCczrFSuMUc81e0xF2VySVwR+sMMiwUR
 zH2xWOoGpJJMKHkVkPPoFEpInM5C8QJ/eV4SkyhM7nCXFosyi9bMXqQMrtmyhBrJ
 a74DaTP+Yy+ADXGgcFJT4Dq4ZAvoszwHReAtuu/MY6y/rl/nXdIFn7UdB/uBxVCK
 S6PJA3NSllNFIhOdQ7lU4FZrtm3GuceujwB/H1S6/JeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MBWHZg
 LeeCINLILEUviiTpBt+mLZOyfszKJaVssdvKU=; b=WqQiHKsw5ap9wX+5btClai
 2t2kL7C2655Lm3utKumHdaUM1lxn2JqwPHlVymvxL6fYCybpGyS1vf3Y+U6Yp49H
 wDXyWOk5/CH2fwEW9f0ABZjz0u7McPcHxY3incM9o1nLdk4AFpXxp8/SmABcjVtQ
 fx7QL50tUDWmLZg6ekC4Aq1zTjrooO0EkttSFJtUpC2hFVoRKkv4H2qYWHkPnRYm
 5CKUrbGtAesJ+N9TEUPoEriUD6o0DT9aJoI/aGbblCSU+pmJlW+dRpN0nW6KV0nT
 bKqQnchJKgpZnUs8/Y+HrbzdVvoTgC/MR3LLdfPjf2b43OB5AlHkue/oWX21l1Xw
 ==
X-ME-Sender: <xms:LW0iYEiyy6MOfyIjIDMfk2nE7HmXAihf9-AbAYIEbXE1_qZnR5cSwA>
 <xme:LW0iYNC0PdKql7nnrfJh1pi4Cc8P-zPSL675XcVV6BtjL3E3bHOh0goEEDdPVFztb
 TOjkhuiDl1rVPl_p1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheehgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefudehfedugffhuddttefffeeluedttdetgfduleduuddugfeuhfelueeuuefggfen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:LW0iYME02fuagzshdRr8vPMFL7C1X-YzNiEtm4P_GOXya84imPtdIw>
 <xmx:LW0iYFRIsKXF2Q2MyII07POGTG8kpJIfI0tHDbTrf8m0FKsE6nhzug>
 <xmx:LW0iYBwIvq6yQxCEHRnxbunCamwbAtx9OYPhnPoQMgteSA21mqtwTw>
 <xmx:Lm0iYDtYqknlocT3WX_KmYgY-ytIlLJbrqXvUcoLtUudxKO50HmmxA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C34F424005B;
 Tue,  9 Feb 2021 06:08:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/nvme: move nvme emulation out of hw/block
Date: Tue,  9 Feb 2021 12:08:24 +0100
Message-Id: <20210209110826.585987-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

With the introduction of the nvme-subsystem device we are really=0D
cluttering up the hw/block directory.=0D
=0D
As suggested by Philippe previously, move the nvme emulation to hw/nvme.=0D
=0D
Klaus Jensen (2):=0D
  hw/nvme: move nvme emulation out of hw/block=0D
  hw/nvme: move device-scoped functions=0D
=0D
 meson.build                               |   1 +=0D
 hw/block/nvme-ns.h                        | 193 --------------------=0D
 hw/block/nvme-subsys.h                    |  32 ----=0D
 hw/{block =3D> nvme}/nvme.h                 | 206 +++++++++++++++-------=0D
 hw/nvme/trace.h                           |   1 +=0D
 hw/{block/nvme.c =3D> nvme/ctrl.c}          |  91 +++++++++-=0D
 hw/{block/nvme-ns.c =3D> nvme/ns.c}         |   8 +-=0D
 hw/{block/nvme-subsys.c =3D> nvme/subsys.c} |   2 +-=0D
 MAINTAINERS                               |   2 +-=0D
 hw/Kconfig                                |   1 +=0D
 hw/block/Kconfig                          |   5 -=0D
 hw/block/meson.build                      |   1 -=0D
 hw/block/trace-events                     | 180 -------------------=0D
 hw/meson.build                            |   1 +=0D
 hw/nvme/Kconfig                           |   4 +=0D
 hw/nvme/meson.build                       |   1 +=0D
 hw/nvme/trace-events                      | 178 +++++++++++++++++++=0D
 17 files changed, 431 insertions(+), 476 deletions(-)=0D
 delete mode 100644 hw/block/nvme-ns.h=0D
 delete mode 100644 hw/block/nvme-subsys.h=0D
 rename hw/{block =3D> nvme}/nvme.h (51%)=0D
 create mode 100644 hw/nvme/trace.h=0D
 rename hw/{block/nvme.c =3D> nvme/ctrl.c} (97%)=0D
 rename hw/{block/nvme-ns.c =3D> nvme/ns.c} (98%)=0D
 rename hw/{block/nvme-subsys.c =3D> nvme/subsys.c} (98%)=0D
 create mode 100644 hw/nvme/Kconfig=0D
 create mode 100644 hw/nvme/meson.build=0D
 create mode 100644 hw/nvme/trace-events=0D
=0D
-- =0D
2.30.0=0D
=0D

