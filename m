Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F4354642
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 19:43:11 +0200 (CEST)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTFm-000677-7w
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 13:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT8h-0004rJ-0C; Mon, 05 Apr 2021 13:35:52 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT7a-00014S-UN; Mon, 05 Apr 2021 13:35:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BA75C5C00B3;
 Mon,  5 Apr 2021 13:34:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Apr 2021 13:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=ZwhF10FDYxX4gf7wwnO9zyIQpH
 qb5aysGiFxj+LAeZU=; b=PgTBpN9JaoQknzE15KwcYHfpDGnbLvtdJ0qQ7s3CbJ
 rzXrohy/Y7BN3L8RxqKc6P3gpGfwMaWP4/4nM2731fyZ3RMpx7XZSKA8+EFT0inW
 K8adApxfMSi/RBCSDFTr2njojfi9XcH5xuD0tI2qpc7WgS/S5AqY/tT6cVIV/oDi
 rve9kw108TNe49vhrAEha/YtZZSDl5mTJqIdLMhnlP9cEkvlGZ0LJX1KMpjTRSLR
 PrTK8G3KjQbHtTRxZZe4dn1y0y7G3fa/8ydEoCMIl+WWq6roM6DaNjaaYb9+DmAQ
 bgrHWXW4eINdQA/ugCoiTBZjoerLEYOyfvL7gb38xfEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZwhF10
 FDYxX4gf7wwnO9zyIQpHqb5aysGiFxj+LAeZU=; b=ZF4Ox9l5sZdu7+AcYxvr3a
 vpvOlQSQqKpItdymZ17oV4qAAAdiDUl5empqh7MrDdE611KTf6dd4YMJkc0w2eZo
 6JhL8eH0lL6WjpBJWyvnbUjRDMw+vAayjedP0TPEa9VjDFxSrJUBwvCts8f0sK5e
 z2402dmzJsANhnouzqFJTKM3Iv6g9WOOF6hYvjBWUI/5tzs4m/3XLcG0c3xQtZSY
 MUqVOY0ySWgkt1bmecNgAT19sP8rsVGTTUQuXhONIxo682kLMfMJdi+REGgEywN3
 V9vh+ux48qx6AIBHgVLDlHhGpjTnzp1UNQkwbwvwrTnK7Noh+ec9jO9kNmhUjDBw
 ==
X-ME-Sender: <xms:MEprYJHlWh1rmjvme4wcTG0jMJXqsd91WFNIEgvAiZ5xcWYkR2r1RQ>
 <xme:MEprYFz8cTugkcq2GZKt3rG0r-RrWaSr0Jm8LJOyY8BgSCYfnoaSkzOle51SwdFez
 Cc0jAAzYm42AWhgYmk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgveffkefgfedvteejtddugfefffefgeejgedvgeekueeggfdvleduueehvdev
 veenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MEprYIgjkVleUIyCtJzbhFkgE6hq3tG322RAyWr5GTrgljnS1V02oQ>
 <xmx:MEprYIzU4iJoc8gxvJrF_m6WKn81tSKmYY_peDv_2ZyYFGUUrnatvg>
 <xmx:MEprYDLD-2g3LWiSXrd7wwNQROTcM96LyXswsQEjOCV9emekA8yL9A>
 <xmx:MUprYAqxkL6btIb_Jr4mKKkr9ttxckupy3YrEx5XXHesa-_TDwsDLA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7225C1080063;
 Mon,  5 Apr 2021 13:34:38 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 0/2] emulated nvme fixes
Date: Mon,  5 Apr 2021 19:34:33 +0200
Message-Id: <20210405173435.36486-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 25d75c99b2e5941c67049ee776efdb226414f4c6=
:=0D
=0D
  Merge remote-tracking branch 'remotes/xtensa/tags/20210403-xtensa' into s=
taging (2021-04-04 21:48:45 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.0-pull-reques=
t=0D
=0D
for you to fetch changes up to 498114b37bc99fddcfc24b92bff7f1323fb32672:=0D
=0D
  hw/block/nvme: expose 'bootindex' property (2021-04-05 19:33:04 +0200)=0D
=0D
----------------------------------------------------------------=0D
emulated nvme fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Joelle van Dyne (1):=0D
  hw/block/nvme: expose 'bootindex' property=0D
=0D
Niklas Cassel (1):=0D
  hw/block/nvme: remove description for zoned.append_size_limit=0D
=0D
 hw/block/nvme.c | 16 +++-------------=0D
 1 file changed, 3 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

