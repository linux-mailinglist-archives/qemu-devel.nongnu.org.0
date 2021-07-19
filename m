Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785E3CEF60
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:51:56 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5c78-000318-Pw
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2L-0000Ie-VQ; Mon, 19 Jul 2021 18:46:57 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2K-0005K4-2i; Mon, 19 Jul 2021 18:46:57 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 50BA4580A64;
 Mon, 19 Jul 2021 18:46:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Jul 2021 18:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=XTUs60lT3stFI+YkMgVa6AzY8p
 PlKe9aVeGM98bNywM=; b=W8dcLrHKvO9AQLPXTkHcmZkcJNEZTIt1L8MGsFBKB5
 Od8+OW9LspgrLaheTjmR/DjXqRbRDsHtBEvbCiZ4inpgjc66NS3N5Qpo7x8KK9WF
 zFHS4QIKN4xRSZazklfwvPKV6nFBrv1VFgmWnDpftObfYdOn4pgrOiZtrYC97rDY
 0FWaV39zWKMKbHFbZQ+yHkIK87o1dfUpVUifp02ER4BtbitX3ZcMjV1PYPx4mZ8B
 1gj9id6n1Nl+91srJtlwvpY2qusPlofkFog0gmtVksJfsgH+7sc6wulqzAkbq9OR
 86v+RtGphjWBPFFWinqLdF+b0U/5war5zGDBAnjUnxNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XTUs60
 lT3stFI+YkMgVa6AzY8pPlKe9aVeGM98bNywM=; b=h5C0hrpTNUZqmBhsy5wSuw
 ewqAIfpBBLzG1xPk0QepuaQLjAnAZlfsvLJS9ZtquaXGTKtl7E6B99GDq8coNOHP
 AiDjXC0vDEe3YaiWJm5P6dUwI0Pzn2ZzW/R2l34SLngT8jYDeQEJ4Xliwp6g79Qz
 3HJC1+K8CQ8jPrA3f5hcCA7o++pN4tDPMJjKmcniZZe1KPTIA1L+OdjFWrI++wR+
 cWhe02ifctPMfYa9zq/FXEn/cD6zcxRXSZnos9uOMuxcgYTl+0w/Wb9aMNiQhmZ0
 Y8Jcde1jYM8CpfB54LNwLrL6AkbmFjRwJ1kIw6s253MBgR+TFuyJmNfumueGg/NA
 ==
X-ME-Sender: <xms:3AD2YF6M0M54PEvDPlq2t10hdehLzwWiqq8Yyp54GC28TjjuwmjDbg>
 <xme:3AD2YC5Uhp-XgJ9oAlKGe3_uP7XHedUxS_9U9cOcSeGsw2WR-oAhK3oDojYlarpmS
 flG0vpmeXtWzp0PQpk>
X-ME-Received: <xmr:3AD2YMeDmxEPQcd0PhcdcFJ_yct-F9HxPXFFByIKCB2JeYA8A6gMNi3i0UeuXzKvorbrR-CMuZfEcDFhtMptgzJvSKPHG8TODk5PLZPJ7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedugddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefudehfedugffhuddttefffeeluedttdetgfduleduuddugfeuhfelueeuuefggfen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3AD2YOJR84mqEpf-TzOMaSJN-C3uJ9X33YIPpXAzS8Ct1prBvAc-GQ>
 <xmx:3AD2YJKtxgzxGDD4I9RR6hPOpi_CPrQoiC69yHslvFCr_R9222z3RQ>
 <xmx:3AD2YHyvBxD8XbauDz_iF1p2Rt3v-VtjXHb-fk9V7M3mOvvAIrGOeA>
 <xmx:3gD2YAYSpLjZO_OrowHzhIuAK5WfKDyafELR6HX-j0wNtn_Rs_P6dA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 18:46:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] hw/nvme: fix mmio read
Date: Tue, 20 Jul 2021 00:46:42 +0200
Message-Id: <20210719224647.68559-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Fix mmio read issues on big-endian hosts. The core issue is that values=0D
in the BAR is not stored in little endian as required.=0D
=0D
Fix that and add a regression test for this. This required a bit of=0D
cleanup, so it blew up into a series.=0D
=0D
v5:=0D
  * "hw/nvme: fix mmio read"=0D
    - Hurried the changes a bit. Fixed.=0D
=0D
v4:=0D
  * "hw/nvme: split pmrmsc register into upper and lower"=0D
    - Fix missing left-shift (Peter)=0D
=0D
  * "hw/nvme: fix mmio read"=0D
    - Remove unnecessary masking (Peter)=0D
    - Keep existing behaviour and do not zero the register fields doing=0D
      initialization (Peter)=0D
=0D
v3:=0D
=0D
  * "hw/nvme: use symbolic names for registers"=0D
    Use offsetof(NvmeBar, reg) instead of explicit offsets (Philippe)=0D
=0D
  * "hw/nvme: fix mmio read"=0D
    Use the st/ld API instead of cpu_to_X (Philippe)=0D
=0D
Klaus Jensen (5):=0D
  hw/nvme: split pmrmsc register into upper and lower=0D
  hw/nvme: use symbolic names for registers=0D
  hw/nvme: fix out-of-bounds reads=0D
  hw/nvme: fix mmio read=0D
  tests/qtest/nvme-test: add mmio read test=0D
=0D
 include/block/nvme.h    |  60 +++++--=0D
 hw/nvme/ctrl.c          | 352 ++++++++++++++++++++++------------------=0D
 tests/qtest/nvme-test.c |  26 +++=0D
 3 files changed, 265 insertions(+), 173 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

