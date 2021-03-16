Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853BF33E0E5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:56:52 +0100 (CET)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHgJ-00053o-E8
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXl-0006qA-TY; Tue, 16 Mar 2021 17:48:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXj-0000tN-3r; Tue, 16 Mar 2021 17:48:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B4335C0130;
 Tue, 16 Mar 2021 17:47:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=Ey2Se3LV8WJ84mqLgMF2JcwjWk
 eM6FlxH7E+3UoK7gE=; b=MNIkKAcYzseC+BPRaBJzUuE9gi6g9y+OwXzlDdpU1/
 x986bNo+JHu7aDuHSf9qz4zQWNuQOG9qlWE04XxArbNFiftbBPs1807dEBepQSZh
 8DHQYvYxr/7IjtDnUs8V/qIDnTRrwJ/1kCDMGMfX4rjIeDo9EOkvBTuucZnmE6lA
 Krm7KhsZ0W89IphH1xx7hQlcP7Ew71y+OdtkkSW1pI8TKbYwQDlfP/kTxGq68mcj
 5jbQ2EywoOhNgOmA49o3JWJ0EJvNtmHWrO2+Y/k3I2jXWu4lFyVkXDI5aJ+dBX7u
 jGGK/ABsUz1r7+ra4eMFdu9wt99EZO25egty/WyEA1Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ey2Se3
 LV8WJ84mqLgMF2JcwjWkeM6FlxH7E+3UoK7gE=; b=ENIbSovUOdMKn9YP22TDR9
 1Ey/eGjvdIN7aOow95Pmc14WwnAJNTDatn0uoHOwuR/wX1HGNzQmE7uWa/Qov10b
 gsXL/88TZ1Va0YE2dFfUFHWxbM8ctQTpZhbI/vvBgJ+XQtSHx2+/EinekdoUJJc1
 CDVP5nsIMS3plpTQU8+tsmDopW1HPRMOIUHtsdOqlBYgZIladsSSrqMtufDKyxwU
 Ei+uOlRXySJch1gKVBGg3/yqZVj9cl7KAe8kMYTSJ+4RFuZrXYqCvk7Ggyr3qsyx
 pO1ZYNbxIDg4Gorfg+MQM0erI7byfOJ8ji1crxgkVWWql10cULrI/YpPlr7j401Q
 ==
X-ME-Sender: <xms:jCdRYBse2ooKEn-_g43gtYOa2yWjrwlI8u5z2_wR-OTj4xr3EtdHYA>
 <xme:jCdRYEHGYxxNGV2xeOcE84G6iyq1xwr-3M_CYTTwFjV-e5A0HBiMRv2VfO9Mi50M1
 vPccwptlbrXME-6PN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedvhfeujeeujeekvddufedttedvtdfghfetleegleduvdevteeuhfefkeefueeh
 gfenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jCdRYEzHV451MGxbc448YXtXiZaVK4Mx8WQ_E-6aFJsj86npmMgunQ>
 <xmx:jCdRYLgr_E5g-cgEqvQAaQfQXXQPB8OBuXab_eSXASCtYQwNeycxWg>
 <xmx:jCdRYPxwEPeqFeLhGZeGn8KC9EpYejQUm5ZcDkDnnWGbmaUsImq8Mw>
 <xmx:jidRYOyGutsplPRllBRV8sYCcdiG3Npmih1D6b56bJCWfI0oqVLrug>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BD0B108005C;
 Tue, 16 Mar 2021 17:47:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/11] emulated nvme updates and fixes
Date: Tue, 16 Mar 2021 22:47:42 +0100
Message-Id: <20210316214753.399389-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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

Hi Peter,=0D
=0D
The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2021-03-16 10:53:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to e2c8dd15807886ca234ffffcdd06eba47fa65162:=0D
=0D
  hw/block/nvme: add support for the format nvm command (2021-03-16 22:30:4=
7 +0100)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme updates and fixes=0D
=0D
* fixes for Coverity CID 1450756, 1450757 and 1450758 (me)=0D
* fix for a bug in zone management receive (me)=0D
* metadata and end-to-end data protection support (me & Gollu Appalanaidu)=
=0D
* verify support (Gollu Appalanaidu)=0D
* multiple lba formats and format nvm support (Minwoo Im)=0D
=0D
and a couple of misc refactorings from me.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (1):=0D
  hw/block/nvme: add verify command=0D
=0D
Klaus Jensen (8):=0D
  hw/block/nvme: fix potential overflow=0D
  hw/block/nvme: assert namespaces array indices=0D
  hw/block/nvme: fix zone management receive reporting too many zones=0D
  hw/block/nvme: add metadata support=0D
  hw/block/nvme: end-to-end data protection=0D
  hw/block/nvme: add non-mdts command size limit for verify=0D
  hw/block/nvme: prefer runtime helpers instead of device parameters=0D
  hw/block/nvme: pull lba format initialization=0D
=0D
Minwoo Im (2):=0D
  hw/block/nvme: support multiple lba formats=0D
  hw/block/nvme: add support for the format nvm command=0D
=0D
 hw/block/nvme-dif.h    |   53 ++=0D
 hw/block/nvme-ns.h     |   50 +-=0D
 hw/block/nvme-subsys.h |    2 +=0D
 hw/block/nvme.h        |   44 +-=0D
 include/block/nvme.h   |   29 +-=0D
 hw/block/nvme-dif.c    |  508 ++++++++++++++++=0D
 hw/block/nvme-ns.c     |  124 +++-=0D
 hw/block/nvme-subsys.c |    7 +-=0D
 hw/block/nvme.c        | 1257 ++++++++++++++++++++++++++++++++++++----=0D
 hw/block/meson.build   |    2 +-=0D
 hw/block/trace-events  |   22 +-=0D
 11 files changed, 1939 insertions(+), 159 deletions(-)=0D
 create mode 100644 hw/block/nvme-dif.h=0D
 create mode 100644 hw/block/nvme-dif.c=0D
=0D
-- =0D
2.30.1=0D
=0D

