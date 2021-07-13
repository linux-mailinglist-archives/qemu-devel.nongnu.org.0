Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B964E3C76F5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:30:53 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3O7H-0001rK-Ux
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1G-0007Nl-8y; Tue, 13 Jul 2021 15:24:38 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1E-0003NL-3g; Tue, 13 Jul 2021 15:24:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 02ED15808A5;
 Tue, 13 Jul 2021 15:24:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Jul 2021 15:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=K8m6lW/5tkPx53yhFl2kYS/nTK
 NP0OZ8YcKud68i4ck=; b=Yi0EIaKu/ty6x1LrPtWFxYQl4/r5jMlPmVQRy1Xkup
 seqwADAT7gO2FHHfL1uuKcBiVemMUKTtDbFl7kJ4lobG3UOvIxR45LQa3vCUTKOf
 NaVWqcnSy4dQDlCwxyiwLm1CnD8s7KVjSbqXgFbN5rasefLb/29dhLvggLHdRqPN
 xseupxBF293Mf3MDCI5QhR7PrKrO9rP7sMExtnulMmImL11tkqDxZPwRI2KfRmj8
 yvISQW0Az+yG76xHFQ99UnxGmWEyH+RPQFEUgu0vpryhV/zLq3shYeYDZ1U0ZHlL
 nZW2BDeP2p/e0evT8U0eqyLgxmdIYgKf7HrBFMSZIDBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K8m6lW
 /5tkPx53yhFl2kYS/nTKNP0OZ8YcKud68i4ck=; b=cLA2E2MEw4LjdGeIeUXyc7
 4jZhLvPT0TYSnSX0Xxh3NjbudVAhp5AEFTTdUsW71qDibFCVQjTF56AIbAQa/f/l
 BE6I6cvc3ClIgp/6+XbHEK8WPvzyb2Un8ICtIOXdUbf7szNLaywfGQZh/XsPzvJu
 86//MEjMMS328OYwScbdEdx+RyD9So/IrClV2p2F5wZfsZwvMO4oU9afLBItpoU6
 KqWE/yxpAerA9GGGz5ZsgOcQrf7Kj++P+SCFqwHM4DrYnlHattXFtokRc061Jpgz
 w9Xn604nLPbNBOBPjiYi+tT7enX1RUz0WqHRJbasqcazjo1lrpynLc0068h9cVXQ
 ==
X-ME-Sender: <xms:cOjtYAm5stgUbqZpAb-0lTrSFb_uMkLhKUNyq6FLlXuWqRGn8Qf53A>
 <xme:cOjtYP36mIBLjrFVR8YyADZF6Hse-qh10Du8Yn0utdfu8GCkSnhGQQb6Fhjvq3kBT
 8iEWAfuzRE0W934on4>
X-ME-Received: <xmr:cOjtYOqDPvGTXETCHGndBl6dIMnqnpdyu1wFUy_6MsRJCJ0xYeJl6bQX3V8XoS1JQVJz9SDNmGRet-4ZLYyhnHKCHIOL1bqEl5x2GA6Ytg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:cOjtYMnSva5C3f0jdfVsSTKukvMVd1RQkfy27dNoYmsBoPKRMBo1HQ>
 <xmx:cOjtYO0Zw80S7StBE9x46BV7XYNL6rvtTyeaTsOfpJtGetSu0gGZuA>
 <xmx:cOjtYDuUv9L2RjfkU0jXnOm6bru5H_gH2oQfXvSXWoQieCmK7-Zlvg>
 <xmx:cejtYEMkvqCEcdKuXUQsx2XTUrFwfPcV39-gnH9PMzQswe7reGY46Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:30 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/nvme: fix mmio read
Date: Tue, 13 Jul 2021 21:24:23 +0200
Message-Id: <20210713192428.950160-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Fix mmio read issues on big-endian hosts. The core issue is that values=0D
in the BAR is not stored in little endian as required.=0D
=0D
Fix that and add a regression test for this. This required a bit of=0D
cleanup, so it blew up into a series.=0D
=0D
Klaus Jensen (5):=0D
  hw/nvme: split pmrmsc register into upper and lower=0D
  hw/nvme: use symbolic names for registers=0D
  hw/nvme: fix out-of-bounds reads=0D
  hw/nvme: fix mmio read=0D
  tests/qtest/nvme-test: add mmio read test=0D
=0D
 include/block/nvme.h    |  58 +++++--=0D
 hw/nvme/ctrl.c          | 366 +++++++++++++++++++++++-----------------=0D
 tests/qtest/nvme-test.c |  26 +++=0D
 3 files changed, 276 insertions(+), 174 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

