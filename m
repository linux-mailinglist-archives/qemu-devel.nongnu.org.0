Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C902364ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:52:41 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZwc-0005hi-Ik
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ5-0000FL-9e; Mon, 19 Apr 2021 15:28:11 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ2-0005Ew-Oo; Mon, 19 Apr 2021 15:28:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3A1EC18B4;
 Mon, 19 Apr 2021 15:28:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Apr 2021 15:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=fukgXEAdAmkIfklJMHEFfyp8k6
 0VcUWU0ThXfQ2aoBc=; b=yFXmmDTu5OtgJH9/glaa4GiHw3ZQC5fjepZSRkI4It
 OugWodqoDe0b2XiFgxUF/P5vOSWA3kPlSuNhXWWJjoCebsg+nern5/tDSkeBB25d
 Flly825apQWM0e/h/d1S0LSktaT1FAUOHDvOMejuHU54RJEWXvK95UlAW75d5waa
 Ks/h3jksLxeoKqqPUELcydGYgCMhTWdmB9mGoWzS2o7gXpCKQ2nOKM7QnjqyALD4
 pX7UYhto0NoQaqDDq5aHHwG8N4Qek7YGx5nUgC7pl5q8g+q3HyEAN8AT9gf5YQpD
 utNn1/iuEGqmXkj1k6Nx50N9X5NF2Qq54L/9GmOOuGBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fukgXE
 AdAmkIfklJMHEFfyp8k60VcUWU0ThXfQ2aoBc=; b=IUBJoRJHjhQlWnz0y84DWd
 vjDPE81TwTk00hk9vswL8MDbsI/EYzT8/DqCBfctquOXDBvMxeuwGGoDZVqwEUh4
 DalGtipM+M7OpttcAUOFdrRdfi0ks8gBoa25nZGAQETNxXHFXWSPQWq0rD91JTHM
 apLykAaMzqf6G23UzDCCud4EUHHZWB+2IRpGV/DNn7XRPEqDO9zaTQyq6V9WJ3po
 2MkawuNiriQE6IJYZE6mhZty4MNuO1C1dgDy03W8hCszotbeq2zQ/JUHZrvXOM4L
 wPgEYi+jjxD1rPN3KtJiRbMovLSJ+x7LvLVvYHQZurlixBszCccivF13+UtLpwuw
 ==
X-ME-Sender: <xms:xNl9YB-lFpUw-Wit6CKg3OEP3MTAv4dyZ7LJJqzjl44wagmFvgeDXw>
 <xme:xNl9YFqpB1YUFB_waMsumrhhRvK2Vc_UPrw8bh7x8l3hZr9qbjVXzK96SAeNwAYnb
 gB7svmyxbPFntmA0aY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeefudehfedugffhuddttefffeeluedttdetgfduleduuddugfeuhfelueeuuefg
 gfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xNl9YL7shk8iGsxKenJlWl7ZpIgETr8lBAfrwXe15yNRguwaACDocg>
 <xmx:xNl9YNNt-NlnWAjVy7TGqd8u1m_ywpBF8JZcEHK5dR1LGFtTJIPsqA>
 <xmx:xNl9YFNe9UihelIw2n_lXOJ6XRI8FSh_UJMdZ0BfScyXqFY7cegKMw>
 <xmx:xdl9YGzk993qm3Z61ltywSiMaGZ9IynWic8jP6-0Ykg6L89kLNfisg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 938D71080067;
 Mon, 19 Apr 2021 15:28:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] hw(/block/)nvme: spring cleaning
Date: Mon, 19 Apr 2021 21:27:47 +0200
Message-Id: <20210419192801.62255-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series consists of various clean up patches.=0D
=0D
The final patch moves nvme emulation from hw/block to hw/nvme.=0D
=0D
Klaus Jensen (14):=0D
  hw/block/nvme: rename __nvme_zrm_open=0D
  hw/block/nvme: rename __nvme_advance_zone_wp=0D
  hw/block/nvme: rename __nvme_select_ns_iocs=0D
  hw/block/nvme: consolidate header files=0D
  hw/block/nvme: cleanup includes=0D
  hw/block/nvme: remove non-shared defines from header file=0D
  hw/block/nvme: replace nvme_ns_status=0D
  hw/block/nvme: cache lba and ms sizes=0D
  hw/block/nvme: add metadata offset helper=0D
  hw/block/nvme: streamline namespace array indexing=0D
  hw/block/nvme: remove num_namespaces member=0D
  hw/block/nvme: remove irrelevant zone resource checks=0D
  hw/block/nvme: move zoned constraints checks=0D
  hw/nvme: move nvme emulation out of hw/block=0D
=0D
 meson.build                               |   1 +=0D
 hw/block/nvme-dif.h                       |  63 ---=0D
 hw/block/nvme-ns.h                        | 229 ---------=0D
 hw/block/nvme-subsys.h                    |  59 ---=0D
 hw/block/nvme.h                           | 266 -----------=0D
 hw/nvme/nvme.h                            | 547 ++++++++++++++++++++++=0D
 hw/nvme/trace.h                           |   1 +=0D
 hw/{block/nvme.c =3D> nvme/ctrl.c}          | 204 ++++----=0D
 hw/{block/nvme-dif.c =3D> nvme/dif.c}       |  57 +--=0D
 hw/{block/nvme-ns.c =3D> nvme/ns.c}         | 104 ++--=0D
 hw/{block/nvme-subsys.c =3D> nvme/subsys.c} |  13 +-=0D
 MAINTAINERS                               |   2 +-=0D
 hw/Kconfig                                |   1 +=0D
 hw/block/Kconfig                          |   5 -=0D
 hw/block/meson.build                      |   1 -=0D
 hw/block/trace-events                     | 206 --------=0D
 hw/meson.build                            |   1 +=0D
 hw/nvme/Kconfig                           |   4 +=0D
 hw/nvme/meson.build                       |   1 +=0D
 hw/nvme/trace-events                      | 204 ++++++++=0D
 20 files changed, 928 insertions(+), 1041 deletions(-)=0D
 delete mode 100644 hw/block/nvme-dif.h=0D
 delete mode 100644 hw/block/nvme-ns.h=0D
 delete mode 100644 hw/block/nvme-subsys.h=0D
 delete mode 100644 hw/block/nvme.h=0D
 create mode 100644 hw/nvme/nvme.h=0D
 create mode 100644 hw/nvme/trace.h=0D
 rename hw/{block/nvme.c =3D> nvme/ctrl.c} (98%)=0D
 rename hw/{block/nvme-dif.c =3D> nvme/dif.c} (90%)=0D
 rename hw/{block/nvme-ns.c =3D> nvme/ns.c} (87%)=0D
 rename hw/{block/nvme-subsys.c =3D> nvme/subsys.c} (85%)=0D
 create mode 100644 hw/nvme/Kconfig=0D
 create mode 100644 hw/nvme/meson.build=0D
 create mode 100644 hw/nvme/trace-events=0D
=0D
-- =0D
2.31.1=0D
=0D

