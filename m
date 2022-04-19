Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04D506C31
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:21:01 +0200 (CEST)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmqr-0001mX-1K
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh1-0006bf-2W; Tue, 19 Apr 2022 08:10:51 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmgy-0003Wa-Oa; Tue, 19 Apr 2022 08:10:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 345523202092;
 Tue, 19 Apr 2022 08:10:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 19 Apr 2022 08:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650370243; x=1650456643; bh=Ne
 OqZ/wojaskVbdz/pIUbtI/usiQihDcffYmZ4yeSpc=; b=k5BgQTW8aa9edsWfrB
 w4htfsrCLlG+GamwAxxq/k5eo42O5+f4vIzcI45eT0dhxXQA62u2OXNyrMFq6Nts
 sJ3YY86NePN4aYz1zLE0X3GKrcB+9JijiaOLHl2eIADDAbK4/m8SuXX+nriCFgGq
 tgAOwx+H5d5eEEL5nhjVQ0UCDiuke9ECLX3rzN0bBtDC+Uwm2BJMaONq0rerLJKd
 78iinicVXjZFITJ5NG7NdhklyFSVI5nibUTSNTJ9gwSbE7BjQtU+1s+Ms5e8GR6j
 F2SapNPkb+IDhlxvRpOOC1ZnMUErjGNXoPRzkNnnGeoTKhqiVIUMkT51y08lqsRz
 5J5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370243; x=1650456643; bh=NeOqZ/wojaskVbdz/pIUbtI/usiQihDcffY
 mZ4yeSpc=; b=omqq00Vjxlj3FkD13pM17/3pzwrEiC/OI+Va+o2GcKKAnlmBp6I
 MbxjJHoull4ds1iJoH884tNcKgmvTQQqO9GY9+8qNKhd36xRR7g92i581oZgZlwL
 rXjqJPWtToXRqdBRvWA8Mmr6ld05NAqSXP/yv0iJs0xLKlLhQrPuPWiKP98U4RgP
 VPnTxKONnNsax/P6VBKswODar9NpgncMkPoZft+tdbvYAVvtXHIas8x+ppWK7kZk
 M8Pln0kXoqCMLYELfVLqxeEsSbb0wOrj4lpbIlxzMoTQGBsDYoviBp60vlvDeTUu
 us9kMd66apXRdjjnsLUWzeN5o8aQ0EX5WXA==
X-ME-Sender: <xms:wqZeYtUe5uGW-3vHL7ROfmaokVY34DspEg7fJWa07Kka3odJ27Nm2w>
 <xme:wqZeYtmaAFnXzQbQ5xLR7jRRrj_nwczWD3eokCIlzHctsnpOEUem6ADQCEYkt-yEb
 Te9QHpZoiaVj8gDNB8>
X-ME-Received: <xmr:wqZeYpY8zVU7RJXlDyN7S67NDaryE2vsyjEBifOWvjdkwVB6EUpQ5pugL3GSnv2d1X9I9TTYO0zD3Wrek2laDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepveetleefgeekhfelkedvffduleefvdefgeejjeehfeevtdeulefhudetgffgtdfg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wqZeYgX8_B__EoRbFfuo7ddoXP0KDZDhgv3kU6LWa6Ro2WGiK4lClQ>
 <xmx:wqZeYnmQA9BirW7rf5E2MC4ZbnGNp_8veF7KqtG8l34QitNbJD9b5g>
 <xmx:wqZeYtfVw2MYO4Vic15vmB2DZhxH4h0Hh72X8xA-tSvHRtv27qZWLA>
 <xmx:w6ZeYiu-397ZD2UlDKWPyRdzpUYsLoUNeFR5Mswqzvu34d2kgWobZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/nvme: fix namespace identifiers
Date: Tue, 19 Apr 2022 14:10:34 +0200
Message-Id: <20220419121039.1259477-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
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
Klaus Jensen (5):=0D
  hw/nvme: enforce common serial per subsystem=0D
  hw/nvme: always set eui64=0D
  hw/nvme: do not report null uuid=0D
  hw/nvme: do not auto-generate uuid=0D
  hw/nvme: bump firmware revision=0D
=0D
 docs/system/devices/nvme.rst |  6 ++++--=0D
 hw/nvme/ctrl.c               | 21 ++++++++++-----------=0D
 hw/nvme/ns.c                 | 14 +++++++++-----=0D
 hw/nvme/nvme.h               |  4 ++++=0D
 hw/nvme/subsys.c             |  7 +++++++=0D
 5 files changed, 34 insertions(+), 18 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

