Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E988358673D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:11:50 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISOs-0005yW-2J
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJN-0001Bk-6V; Mon, 01 Aug 2022 06:06:09 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJJ-0000WW-8N; Mon, 01 Aug 2022 06:06:08 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DE75332007E8;
 Mon,  1 Aug 2022 06:05:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 01 Aug 2022 06:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659348359; x=1659434759; bh=J6
 mfKMtJ5nT1YWcWqFcVDXyU7jAYEhZTIVI+6jz4Gd4=; b=CkFokfieFaD/N3PCjK
 2eU80V80ul/7tjFWlmH8+l4MO0uKnqOYrTIba8IQI8wct94j23sJiO1Ed5Gh1LE2
 W7fZbD88GECku8Jly4tGnwfyNWq3s7Rxk0Bor8swB9LadmG+YkAiu+UWKsP8HZb3
 sO4iui1R6eluulnJVV5UcKIkSUOt/H1hu0Ck6gJySZ+xvZVWvgzWi9NtA5JPuKwB
 JeNM1BTq2fKanaQhnhHk4jp8O+Kbgjy8+BjuiVJKGogmNJKp/yNQXxvl9FFEBGHj
 MjDAlMYk6Ejrmf3MsNShrv68POuewubjDNBqpOggaN2rs+vabQNR0b8tx+4rD3+1
 BY7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659348359; x=1659434759; bh=J6mfKMtJ5nT1Y
 WcWqFcVDXyU7jAYEhZTIVI+6jz4Gd4=; b=v1nBRYmP2L+xH+NmKWp8wdLPZfRE6
 us1YrML3QfRSg/dTorntcua1WuEdZzueKuzIedd9LNtldEQuOO0yiGqQj/jM9fA7
 SMDz+IKQzf0qWLqNdpatkLbivjsUQ6wd0Dz+mybsxqxwp5ws5Zf+X/CUsa3i261W
 s7X8M8YwoGeaoR8Eaj0YvkA9MFpD53MtFcPA+ms5UhxJjZA6NvC2nd3/1/X1l6th
 gL5eR285SMP63inWunrhGQUpeBWJEk1lQMXkE7Jfzi4mfSc7Y71cX/YECmxeVWB0
 jfTtyZdhqW7MPtbQqLN1M8nM5gRNkYxUysPxrZ7qsAR8Lf7YtEvc8GiLQ==
X-ME-Sender: <xms:hqXnYnpKYO4eioTuIiHhbY0F7rM4_7LxWRQtXYukgC-nv1n2BEyCiA>
 <xme:hqXnYhpuV75hhdpWacLriZmU64iouL4dhreEn0VclcPAqiVlWG-Lnd0Ypp2ihnn2y
 fWUh_hd1H9v-kkRUFY>
X-ME-Received: <xmr:hqXnYkOVfZtYgxuq5mkfNCNlvK0vIgrZiXPhnanQv-qY3QGC40WKcDuX3Q_LCcB7wjYVhap0I03IaKu_9A0n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedvffdvveelveeghfethfeftefgieefhfekgeetffehhfevhfetfeehuddtfffg
 tdenucffohhmrghinhepghhithhlrggsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hqXnYq4rOgFYPRQ0ytvr7m_HCfzoUvbiRMgy4IDBQmcrw0ub59pUzA>
 <xmx:hqXnYm6xri1vajBwYcGJ3_Gi-AZO1KkH214OUwG_5d2_GeV2M6A6tA>
 <xmx:hqXnYij8GN1oBgmlf7fxhENjuzh6owIOG06kp1EDVsld4ECJI_l-bw>
 <xmx:h6XnYh1x-vL_3RJokfVMjv0pRkbxdw3jDVJ6LwOfJbQ24rYTKvOOAA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 06:05:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-7.1 0/3] hw/nvme fixes
Date: Mon,  1 Aug 2022 12:05:53 +0200
Message-Id: <20220801100556.2217492-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi,=0D
=0D
The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3=
:=0D
=0D
  Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into stag=
ing (2022-07-29 17:39:17 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to e2e137f64282a2ee2f359b6df4cd93c83a308e7b:=0D
=0D
  hw/nvme: do not enable ioeventfd by default (2022-08-01 12:01:21 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme fixes=0D
=0D
Some fixes for hw/nvme ioeventfd support.=0D
=0D
----------------------------------------------------------------=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: skip queue processing if notifier is cleared=0D
  hw/nvme: unregister the event notifier handler on the main loop=0D
  hw/nvme: do not enable ioeventfd by default=0D
=0D
 hw/nvme/ctrl.c | 12 +++++++++---=0D
 1 file changed, 9 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

