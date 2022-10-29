Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ABB611F38
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 04:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oobAA-00007L-GA; Fri, 28 Oct 2022 22:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oobA0-000062-Nn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:21 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oob9y-0002Zj-OB
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:01:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C7E193200932;
 Fri, 28 Oct 2022 22:01:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 28 Oct 2022 22:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1667008874; x=1667095274; bh=alsUBvcVNYjnwXqTjaTonrA90
 ZQsfGC1w9wXraIfb6g=; b=CcLbmHAd0FFKvPz3aDM6g7fXoTITEvKX1BVDhnihc
 BquF6kwVLzmv7nz5Ya2LTE5RuUGZozJ8fimpe9IkkqWSeMgZrDAy2D5yBfREcWGz
 yMGpK7fWs3YzVhekfrh8GjP71JSIOwthuhObIdbWiFkVcV61CJ32l1TZfZxIkqeY
 ngNL2YW2VhoYL0ieAiVt26tmJIa+a9F17EPDXUWMUcUqcm1XdhzlbSeap9DzKNAe
 EKJdeuQ2PY4Rkc9Lft5zitEMDe2SRs3UVfl/ZUhplAQK2NPahG593qFLGjYilQns
 AegtB29CbLoYBRYgeJt/+lZZI2xLodZ6vOKpMgxcj0XUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1667008874; x=1667095274; bh=alsUBvcVNYjnwXqTjaTonrA90ZQsfGC1w9w
 XraIfb6g=; b=Qj/GKfNm8e5Lo2UlwemIZVtr9qZ/z//sqCG3l6MWM/vlYpsSmKD
 JbmGEbXnT0meGlp8o3GOCruypFiZqyVzWMyjDxPqDQ/1r/zswZ0eoHNJOy5CbSaC
 SfBFSnEOUF7AEPYErGOkplrQinq9TucKplreZUgT9pWQct6/yDE/IW3HRRMOPXj0
 TBhpW83qt+qSURVme150XWgIdVs7Up+Sm17koZmz5rJ6UqSC+KAUXaw64nHjyjVo
 deFwbdEHaEBxiPskSwTQtP040SRvYcGF1jamMCkivY7jJGHcJWzhkX1swCQPQVoS
 KIfCr5naiE7xSWpty2l0cKiu9MCohS0vq2g==
X-ME-Sender: <xms:aYlcY0t-cJYf9acqRzze1NxYvTz1q6B4za6pWvXHskzoehi0MxPzGg>
 <xme:aYlcYxdEd94Tj2mxEDTp3ObjmE6q1nAYak5tU8VpGVrAWXHtH1HGYlZ4mddNcC-dd
 1HZipDnur_JcULsqdU>
X-ME-Received: <xmr:aYlcY_z_iI4T2gIdTMRv7OX8ZUeksnEt0IFmBE5XraCT-hYtrH7tlVhuI6Jd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdejgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeehieduieevteevhedthfette
 ekgfdvvdelveekjeeiieegieevueefueeutdejvdenucffohhmrghinhepghhithhlrggs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:aYlcY3PShI_4dI40yvA-FbFalR-ZiYJQc4cI2vHLXzT9kIj45k_PgA>
 <xmx:aYlcY0-x6GiLC6dDOcPllaM6fiUr0kyogkANOjytxEu7N3qCpY-NOw>
 <xmx:aYlcY_UUGzKYNRLbkWhUWbL1FOQN5oewj3f6U-ucDnwjVx2DcCWB0w>
 <xmx:aolcY2L5VHqWqCSkenG-IZedh4jkQXWIq6KSQGBXGvk2q3o7o6S_aw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 22:01:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] MIPS system emulation miscellaneous fixes
Date: Sat, 29 Oct 2022 03:00:27 +0100
Message-Id: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

I was trying to build a MIPS VirtIO board[1] for QEMU that is able
to work with all processors we support.

When I was bring up varoius CPUs on that board I noticed some issues
with the system emulation code that I'm fixing in this series.

Thanks.

- Jiaxun
[1]: https://gitlab.com/FlyGoat/qemu/-/tree/mips-virt

Jiaxun Yang (3):
  target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
  target/mips: Cast offset field of Octeon BBIT to int16_t
  target/mips: Disable DSP ASE for Octeon68XX

 target/mips/cpu-defs.c.inc         | 4 ++--
 target/mips/cpu.c                  | 6 ++++++
 target/mips/tcg/octeon_translate.c | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.37.1 (Apple Git-137.1)


