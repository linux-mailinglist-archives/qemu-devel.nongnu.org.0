Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5853D288
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:57:25 +0200 (CEST)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDQC-0008VM-2m
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN2-0005nf-9k; Fri, 03 Jun 2022 15:54:08 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:41605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN0-00087W-3W; Fri, 03 Jun 2022 15:54:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 679CA3200937;
 Fri,  3 Jun 2022 15:54:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 15:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654286039; x=1654372439; bh=d+
 xrwEADFtpIzsIe1opAmEj5VZxPbvviZXXeLKZZkGE=; b=eLWaGnSxB2VmXrqS5n
 26oUS1/DYj73q30Aj+6ge6cM/GLb9wabuaH7OajTHG9Sp5JvGFJN/8yJrwn9xdGi
 rxiZRoG+YuKwQuymghBxfiNqCRSt6URx5WnXnO3x1pQOGf1/sSEAotnEQ3b3YLbH
 G9acW9FLRKXTK2gLzBz5Gfkks8Sgp+BtoPRrP72udkKvt7ZALW44NdmmRLSRaw6T
 U9myo+LaV8D6pStQaaBG1uAzd9rHw+pZkRKTQdz4DgyPz+NtBgTv7AUutIuzOyQc
 8V8Qlud7GCIll1cszb3EOOBN23ChL+UWu8nafxDiyH1pYOtVDpquorz418ly8SUw
 5KXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286039; x=1654372439; bh=d+xrwEADFtpIz
 sIe1opAmEj5VZxPbvviZXXeLKZZkGE=; b=YJGOL9cGVMyC0iWicdYjsn72aE84Y
 IiMMGJmt7zqsfaXiF/x3qVhtbUjOTYHoicpekbxwpVMQkJEKFL6FXrBFRjhs8eoO
 t67er+tEMUlGPRXbwerB6jrHkXZZ6xSBVPUYhGZY7dQUQcfEWukZkbNKaesozQdS
 h74BuDaDny1wTcceFWWMCAD6uFwymNnM5N2GSCi8zXcEevoolRqioqD+ofwvTSSl
 BQXAcTUz8aT2LtkotsvKNm/tVbpB83xlI+S+bMQaEZ0vrbjgWjaBGG/kix7kjE5o
 Gg1+ACHS3SyjcjM/c7xR5vgT1kHkkYqMlQq/iWH1SBKmiyKIjCXTs+VKg==
X-ME-Sender: <xms:1maaYrKvOX8IoroCQPcdp7aXNxnFBPPO59t3OgaPj7NnTBiWF5-9Ow>
 <xme:1maaYvLWd5uglWilcdFbS7neYYoydr_bUXLLQFUI3eaKex4hBuVl-Q2uYWyJVwQsb
 VQKASHDHWSa6KBbe9o>
X-ME-Received: <xmr:1maaYjtJnNe9FexEyp3ds45nQvQZVF-JPee02UiGoPYzOelXGrQHP--ZmgNy19pYK-Vt4S5P_FoaWjXrNerC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeevuddugeevgeevuddujefhteefhfdtiedvfeehgfefveekveejffekgeduheeu
 tdenucffohhmrghinhepghhithhlrggsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1maaYkacnSjvTA1hk4ph7kDtcHr9jaoewHGYlIjYWCdgvXSDvGmUGw>
 <xmx:1maaYiYyTuYnovE_6mmdNeAe-frBBNXmHTOVP2JYZ1Q3UDn9IRSfKw>
 <xmx:1maaYoAaSADS-kD2tzuVkdrBZX2voqn1hWbOArdCbJD6nshulGL0kA>
 <xmx:12aaYqqPqi1hIOvgMwQcV_aCriKwiA-wE00m2zm2bWQGH3iRZd24fw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:53:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 00/11] hw/nvme updates
Date: Fri,  3 Jun 2022 21:53:43 +0200
Message-Id: <20220603195354.705516-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
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

Hi Peter,=0D
=0D
The following changes since commit 70e975203f366f2f30daaeb714bb852562b7b72f=
:=0D
=0D
  Merge tag 'pull-request-2022-06-03' of https://gitlab.com/thuth/qemu into=
 staging (2022-06-03 06:43:38 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to d7fe639cabf778903f6cab23ff58c905c71375ec:=0D
=0D
  hw/nvme: add new command abort case (2022-06-03 21:48:24 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme updates=0D
=0D
----------------------------------------------------------------=0D
=0D
Dmitry Tikhov (4):=0D
  hw/nvme: fix narrowing conversion=0D
  hw/nvme: add missing return statement=0D
  hw/nvme: fix copy cmd for pi enabled namespaces=0D
  hw/nvme: add new command abort case=0D
=0D
Klaus Jensen (7):=0D
  hw/nvme: fix smart aen=0D
  hw/nvme: enforce common serial per subsystem=0D
  hw/nvme: do not auto-generate eui64=0D
  hw/nvme: do not auto-generate uuid=0D
  hw/nvme: do not report null uuid=0D
  hw/nvme: bump firmware revision=0D
  hw/nvme: deprecate the use-intel-id compatibility parameter=0D
=0D
 docs/about/deprecated.rst | 15 +++++++++++++++=0D
 hw/core/machine.c         |  1 +=0D
 hw/nvme/ctrl.c            | 26 ++++++++++++++------------=0D
 hw/nvme/dif.c             |  5 +++++=0D
 hw/nvme/ns.c              |  9 +++++----=0D
 hw/nvme/nvme.h            |  1 +=0D
 hw/nvme/subsys.c          |  7 +++++++=0D
 7 files changed, 48 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

