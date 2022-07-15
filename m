Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D90575DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:48:47 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH0A-00067S-Gb
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvN-0000XI-Ml; Fri, 15 Jul 2022 04:43:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvL-0004JM-MP; Fri, 15 Jul 2022 04:43:49 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C95A5C00F3;
 Fri, 15 Jul 2022 04:43:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 15 Jul 2022 04:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657874624; x=1657961024; bh=M9
 Yb9/9aa9ZotXafar9FOIVQQnPuKbykEZZRDNOads4=; b=OhKoAVljboQqqKQDGI
 /QlXp8r1zUF3LaO+ZCSA8yioFPELrv1xCgj9rz+1vG2jLCCbKiehw1M8upy3jGWZ
 5+z5luvI5vEPeqrCxwNEf8a2TfKWT/Cjoz9qFU8G9ZoYpisKAlj0/jY24gSaZ69n
 x8uofMjgJdfgLw5IUgGpMgVz5+FVh5W0N0/fayhlcZCa1PhmAq4MsSls6ptHMFnW
 yAMwQ2AZI193H/fC7lRtoz/2q593L1b6LR9RbPs7fxRVF88tw14f6LovMtlzCVBc
 Ycv4X2dHl2uwGdgtgvKyOATxwmL8q6F+btDu1SdcD+0VwtRpKdxRxjUotShT2fXl
 mH0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874624; x=1657961024; bh=M9Yb9/9aa9Zot
 Xafar9FOIVQQnPuKbykEZZRDNOads4=; b=AwtYLWl99Y6BUP3sAPzzWQBsIDeQA
 DNJGsFgznN4TxrLDcDthVAq71NDNAOVeUaeC4MJnqBdaI3InItE1eCNN0oFm20wu
 WxL1ZMozOv0jDEdxBV3+bL+CHOfwU+/1gP8xf5orGlKrZo9woc6/7sKpojS7NFly
 4uTZQLKtK5IOAaEHvlxlhaaxfF1EfK3qDO4H9L7K4dx2dCr3WzgPRtvWh6cY0FAt
 GplHMKhtwmcdQxSBPJRxxlHsW7l3u0cInOgXT2d93Whu65WSi2IXpRZ5tOXma2oB
 ZdCcs4RllsfVNdZ8Cpp7t4SHSgRqrdjgZhi1Lw7qVHnXRe42xsKPHEuEg==
X-ME-Sender: <xms:vyjRYpc1iPsnQqt75r_2JRMTtSBY7zljqNrj3zXyqZB_vgkCURuovQ>
 <xme:vyjRYnOXTho1DyNTJ1vf_wpeWlcyui4NT9FXIRUs5xb_01esMWWAQVw33tfkzTg3d
 N1fp-Ws13M6jBPQlMc>
X-ME-Received: <xmr:vyjRYigm7B7oFdhdhpqbD0ikgnInNv48eaOqfbcL6fXiSfFO7g69hg5aLw6F-LnR5nHW9NOYoPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeettdfhudekkefggeefgeeijeekleehleegffeileejkeehueekvdduffduueff
 hfenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdr
 ughk
X-ME-Proxy: <xmx:vyjRYi-bl3b150MPzmKb5mloc8GkRYsWb8Cm758EzB5ZRw_h6PJTZg>
 <xmx:vyjRYlsRkcEud7TECTmLUvSO37cHq9ECoJ5TsnnqLgnSHmP47mblwA>
 <xmx:vyjRYhHCJitEVlS_BfVQEregEJuwskLSXYwKnaKYubpPatYnfJ049g>
 <xmx:wCjRYrLlFVrxmHka0-4qF8fDbCNO-k2qI2-8uuyFHi1uBABKit_Jqg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 0/6] hw/nvme updates
Date: Fri, 15 Jul 2022 10:43:34 +0200
Message-Id: <20220715084340.1128455-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hi,=0D
=0D
The following changes since commit 8482ab545e52f50facacfe1118b22b97462724ab=
:=0D
=0D
  Merge tag 'qga-win32-pull-2022-07-13' of github.com:kostyanf14/qemu into =
staging (2022-07-14 14:52:16 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 2e53b0b450246044efd27418c5d05ad6919deb87:=0D
=0D
  hw/nvme: Use ioeventfd to handle doorbell updates (2022-07-15 10:40:33 +0=
200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
performance improvements by Jinhao=0D
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0D
* shadow doorbells=0D
* ioeventfd=0D
=0D
plus some misc fixes (Darren, Niklas).=0D
=0D
----------------------------------------------------------------=0D
=0D
Darren Kenny (1):=0D
  nvme: Fix misleading macro when mixed with ternary operator=0D
=0D
Jinhao Fan (3):=0D
  hw/nvme: Implement shadow doorbell buffer support=0D
  hw/nvme: Add trace events for shadow doorbell buffer=0D
  hw/nvme: Use ioeventfd to handle doorbell updates=0D
=0D
Niklas Cassel (2):=0D
  hw/nvme: fix example serial in documentation=0D
  hw/nvme: force nvme-ns param 'shared' to false if no nvme-subsys node=0D
=0D
 docs/system/devices/nvme.rst |   4 +-=0D
 hw/nvme/ctrl.c               | 233 ++++++++++++++++++++++++++++++++++-=0D
 hw/nvme/ns.c                 |   2 +=0D
 hw/nvme/nvme.h               |  13 ++=0D
 hw/nvme/trace-events         |   5 +=0D
 include/block/nvme.h         |  46 +++----=0D
 6 files changed, 277 insertions(+), 26 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

