Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B83382880
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:37:42 +0200 (CEST)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZgz-00016a-AG
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNr-00038i-On; Mon, 17 May 2021 05:17:55 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNj-0005ap-Hj; Mon, 17 May 2021 05:17:55 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A07CE250;
 Mon, 17 May 2021 05:17:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 17 May 2021 05:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=pN6fpk+iqIBcXOSAHMSWAayhTM
 JH34L6DjHm3LGUvjQ=; b=gwOaxI6kySMbUGGgs+ALob9ESkTZmcbcyO3dNEZZ18
 HFyPi6hX0tU8KQ4mugxrfYUyxeFP24czFEFu62Zk1KZ3QDPauk0XSJTpqOhk+fjE
 tPRjVXTIIhaXJHe8wOucck3Zgq9AqZgffheL2AX8ru5dNqqRwyRyMrCoI6BPspQX
 TihmNveiMKmN5D/GL1D/ivgb9QCQox8+5rAeJitAJqTeq6M2N1zJYUqI7Ox65or8
 FOwc8NKHsjsnAp9b1+A93EbWNgl/QeLtFJzQvEybTsrUtmUE/oasU3kR2YNpDBWR
 anXO0gvoFrZyG8tLA0hYPq+LwQOa2PiNjW5kDWrQzE7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pN6fpk
 +iqIBcXOSAHMSWAayhTMJH34L6DjHm3LGUvjQ=; b=tdxNz5uOpS8rOYuDDTtZkS
 C1dejDPMhIpBCs+nwBNIKNCOLI5FwwL0GF9tTAY+hvD2got/2lSjuYiwyUzj00dX
 7NqukHJmCjJbd3mDfAQ2/IMVo1Jy1JrmIyUtKY2DRDpF9KFHv/cX/FEfySHkLgLE
 0epauT+1Fm6xyp9N4/DGt8A/WAnmg0tVx6vsHYhAkZsrafdCZzErqk6x390n3xDQ
 skwNKCzoJ/9MMh8CjrIe57EvXKedZPt9xQWiZCtH+lH8uivM0cU+S4x/aiKeKPDq
 yaGgAA2up7CyAMJoWjYJ7jmrYCfnSFp9iHHRXSE4AUIt2L8/Kci+ahk7TNr3b7qg
 ==
X-ME-Sender: <xms:tDSiYDvK5aaFnSmB2pLBaU28XX1UXD88lbsRag7L51dbNGQqmU6oiA>
 <xme:tDSiYEc54mPqFjCixYWVBcO2xMXYOe7ry2WnSZGnFaTPiHSIR96huLzptTScKSRns
 NkDKjaAGdWA4I7R8EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:tDSiYGyFnB3EvPKoswq-Pc-1G7Pi-zp3KwVVpPNZ_OnoPKXQ92nH0g>
 <xmx:tDSiYCND9ydWhHNqetj1QtLTDIovznr6wuC1xkSt0yVDlDB4DPEAjQ>
 <xmx:tDSiYD_MIKVP2KlyFBOqLnznncOIRQDXfvCutyi7S97wUiU9Pz150Q>
 <xmx:tjSiYEOjeKdNVbvJJSyplIO3UynprJeShVQkvGwfqGnzNDy4wuNo8Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/20] emulated nvme updates
Date: Mon, 17 May 2021 11:17:17 +0200
Message-Id: <20210517091737.841787-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Hi Peter,=0D
=0D
The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f7d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging=
 (2021-05-16 17:22:46 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 88eea45c536470cd3c43440cbb1cd4d3b9fa519c:=0D
=0D
  hw/nvme: move nvme emulation out of hw/block (2021-05-17 09:19:00 +0200)=
=0D
=0D
----------------------------------------------------------------=0D
emulated nvme updates=0D
=0D
* various fixes (Gollu Appalanaidu)=0D
* refactoring (me)=0D
* move to hw/nvme from hw/block (me)=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (6):=0D
  hw/block/nvme: remove redundant invalid_lba_range trace=0D
  hw/block/nvme: rename reserved fields declarations=0D
  hw/block/nvme: consider metadata read aio return value in compare=0D
  hw/block/nvme: fix io-command set profile feature=0D
  hw/block/nvme: function formatting fix=0D
  hw/block/nvme: align with existing style=0D
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
 include/block/nvme.h                      |  12 +-=0D
 hw/{block/nvme.c =3D> nvme/ctrl.c}          | 298 ++++++------=0D
 hw/{block/nvme-dif.c =3D> nvme/dif.c}       |  57 +--=0D
 hw/{block/nvme-ns.c =3D> nvme/ns.c}         | 106 ++---=0D
 hw/{block/nvme-subsys.c =3D> nvme/subsys.c} |  12 +-=0D
 MAINTAINERS                               |   2 +-=0D
 hw/Kconfig                                |   1 +=0D
 hw/block/Kconfig                          |   5 -=0D
 hw/block/meson.build                      |   1 -=0D
 hw/block/trace-events                     | 206 --------=0D
 hw/meson.build                            |   1 +=0D
 hw/nvme/Kconfig                           |   4 +=0D
 hw/nvme/meson.build                       |   1 +=0D
 hw/nvme/trace-events                      | 204 ++++++++=0D
 21 files changed, 988 insertions(+), 1088 deletions(-)=0D
 delete mode 100644 hw/block/nvme-dif.h=0D
 delete mode 100644 hw/block/nvme-ns.h=0D
 delete mode 100644 hw/block/nvme-subsys.h=0D
 delete mode 100644 hw/block/nvme.h=0D
 create mode 100644 hw/nvme/nvme.h=0D
 create mode 100644 hw/nvme/trace.h=0D
 rename hw/{block/nvme.c =3D> nvme/ctrl.c} (96%)=0D
 rename hw/{block/nvme-dif.c =3D> nvme/dif.c} (90%)=0D
 rename hw/{block/nvme-ns.c =3D> nvme/ns.c} (87%)=0D
 rename hw/{block/nvme-subsys.c =3D> nvme/subsys.c} (86%)=0D
 create mode 100644 hw/nvme/Kconfig=0D
 create mode 100644 hw/nvme/meson.build=0D
 create mode 100644 hw/nvme/trace-events=0D
=0D
-- =0D
2.31.1=0D
=0D

