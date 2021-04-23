Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D558D368CA2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 07:25:34 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZoJk-0007f0-8e
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 01:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG2-0006Vn-Gb; Fri, 23 Apr 2021 01:21:38 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZoG0-0001Nk-Cs; Fri, 23 Apr 2021 01:21:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B20421427;
 Fri, 23 Apr 2021 01:21:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 01:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=CWJHUKxZ0/O/gLiH65wdgBtlC5
 KiSwJgaDDaU+0FBXw=; b=xLjOGjZSUVedwNZxFDpO+jo7h/03W4xl8JlpyR4qr7
 +in9WD93VcihjmUVk4hKFn6AoNuXMwYIEZ7nERy3I+RCOuODatr5t3XA3KVw0pc6
 1SLTuyxkNR5BxJ8Qmj52wD3rc5NISKcaIcA8bWNglV8Zwn3yN0m7QxxcZ3eYfqFL
 +fj3kgkwjnmsSQ+CKuGamIauGyQzQghbfl1GIPKgq14MTiWkjOhB81ngaOPtnExc
 Qq0tB9Zq9yN9KpwNnmNXivRuP/pFQ6USvwe+J5D6L76g/3kEAHKP24adgg1x+S6Y
 Q2PSRoh1YDrRfxxuyRYfs5vffp6Nhooa35lM2dcZwd4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CWJHUK
 xZ0/O/gLiH65wdgBtlC5KiSwJgaDDaU+0FBXw=; b=bNQ/EO2pWTmom2KMAaRTu6
 GV7Ziu8OL73Pe/ofDgOrPB0jLVL9R4RXWjI14Z26u2qW76xjrYV8qROUo5WaG9tb
 naqhFLe5L7erdEKSf9LYwhWzDhmSvX3PHfReFDV3siddMnvEr2r1D4H9m+ymXWl4
 A5Zo7nst1S/z8xRSZpBdvphnY4FDWqlA2BjlbDEzieRpmvy3a0ZA6yE6iRcpVwMd
 To9zQHbdkARcCC0bBkA3mVQVDohrCxKnoo1Bae6290uSB3lRq45jdiuwMFEp2Uig
 DrdssSGm22v9KXtU01gqxs8hhs45F1D+65OquYwvVagGhnf1G/ZXVfoWlP7Q7wxA
 ==
X-ME-Sender: <xms:W1mCYDEpd9xDf1xO3jKuGUXjrUxb3YvjTwRz1K_KWRuG5ZrA5LyPqA>
 <xme:W1mCYAWs4KyYvL03En19E5AsTUO4FqoFsBATGSr7NfpL5FVFw_E5mIUkuhKg33b8C
 ICqV9w9Q9HeNqw0VLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduuddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:W1mCYFIUMlgCUjeGsXCn5Eb_ycTWAWe6Tk8GIBH-1gpy-NVcas7SJA>
 <xmx:W1mCYBG_D6h2gyNEeHCZkDCqSwXmTR6ipce7dHWydlDBfrpWSL7Rng>
 <xmx:W1mCYJVkTdJi8eHox7aMm4DJ1kXw1ZsTApIw9BhBf9_2pb-CdHjRYw>
 <xmx:XFmCYHfTkHOu5UCADBOQSJpkG_JLfRsPigz7A4gJHSShE4FE2t6nyw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DE13108005C;
 Fri, 23 Apr 2021 01:21:30 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 0/2] hw/block/nvme: fix msix uninit
Date: Fri, 23 Apr 2021 07:21:25 +0200
Message-Id: <20210423052127.512489-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

First patch fixes a regression where msix is not correctly uninit'ed=0D
when an nvme device is hotplugged with device_del. When viewed in=0D
conjunction with the commit that introduced the bug (commit=0D
1901b4967c3f), I think the fix looks relatively obvious.=0D
=0D
Second patch disables hotplugging for nvme controllers that are=0D
connected to subsystems since the way namespaces are connected to the=0D
nvme controller bus is messed up by removing the device. This bug causes=0D
a segfault but is *not* a regression and is related to an experimental=0D
feature.=0D
=0D
v2:=0D
  - remove memory subregion as well=0D
  - add (possible) patch to disable hotplugging on subsystem connected=0D
    controllers=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix invalid msix exclusive uninit=0D
  hw/block/nvme: disable hotplugging for subsystem-linked controllers=0D
=0D
 hw/block/nvme.c | 7 ++++++-=0D
 1 file changed, 6 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

