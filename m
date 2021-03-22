Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42054343981
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 07:33:15 +0100 (CET)
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOE7m-00089Q-5U
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 02:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODv2-00043Y-PJ; Mon, 22 Mar 2021 02:20:04 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODuz-0007Fi-CH; Mon, 22 Mar 2021 02:20:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A7BA210C7;
 Mon, 22 Mar 2021 02:19:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 02:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=i39X46HRjlk/oebYYKnjHJ4o+6
 XItqtxi7HbJE0qbF0=; b=MPYHqPrZSM3/Iadw99e5F5qMgBUf/CcmQuRlnlD//R
 V8KdYlMOdJlQNQbRg5w3X0mrxWoynU4OODAPpUweE3Nwk+qG9h/F/HA3RyBq+gW8
 6b1UZqF1DNyuLqAwki/nmjnMZW1kBpsTnDVSNefQZEQcrG1Oq+bLrrVPzQCkdiur
 4E3Z6+GW3DcWFlnUc6nnJWI74RJm3TCQ6HBE8ZjU9EB+O1Ga84zrAvAzebjgzqP3
 NFFjDCKhtMOc2lJKzFMzO6cp7VnhJRCQxICTNWCc7vO8UTUzRo+8389MYtd7Keyr
 jFZcmYAE9Vz17uaoTO9+AhPhDaT7/+2CMUQFpZ5E/QLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=i39X46
 HRjlk/oebYYKnjHJ4o+6XItqtxi7HbJE0qbF0=; b=FxCSsazoGF6ufK9NKY5QI1
 e5fISAmxj8Twd6wPLwwx3Cq4M2GZb//HD/M9H9M6Wxu+tfVOoitvqd2R1UgbSHnR
 pa13RmYgESi/LgfeB3ubzbJql+kYxC4pB7jlk5vm+bJs6IOW6fB6nYCpfXGJO9nb
 j4aoTP62PnQYZxRgyjN3rSFUZc2vuclspe8pl6peayX6327PenQpkpDk12koji9T
 rjkj0cRwcSKctkzj4x4XSaOGQX7rLMzR9jB9wOcZKY0Kpm8t20f1ls3tajr4DTvO
 t8CZO5e/KXhybEgjqSTNzlF2Iw8YSXjKSoP6J7poGaps0v4d0hi2RDKp+Pv/qHBQ
 ==
X-ME-Sender: <xms:CzdYYKXLIYUpbBvA4xhnrOS_aNBHfCtI6hBoU5p81xYXUxe1RV4GTg>
 <xme:CzdYYGkPbCabXTg9t7fFaEGV0vGPlwyPXP951kLMiABu4SU_Fp42sU7N5XKfkpGHj
 TNBu_hxfW7fFwKILJ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CzdYYOY9B6yIb2L1QsKHXxpD87eUMLoQba3gTW0FWsVpeTMMeXuArg>
 <xmx:CzdYYBVrnYnfA3ZTZOxhjwxVwld0bTJOLLJjpCRoZosYLWI55Z9HiQ>
 <xmx:CzdYYEk62y8V1S4ViTo_GJOstmunosBeM6jxFMkI8S-tN1alcQyyvQ>
 <xmx:DDdYYFAoAII7J0SsTrDZpqApzPLDXz9F8-JmvBKCVzA4cdy1j8WXUw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E63D240356;
 Mon, 22 Mar 2021 02:19:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/block/nvme: coverity fixes
Date: Mon, 22 Mar 2021 07:19:49 +0100
Message-Id: <20210322061951.186748-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Fix two issues reported by coverity (CID 1451080 and 1451082).=0D
=0D
Klaus Jensen (2):=0D
  hw/block/nvme: fix resource leak in nvme_dif_rw=0D
  hw/block/nvme: fix resource leak in nvme_format_ns=0D
=0D
 hw/block/nvme-dif.c | 2 +-=0D
 hw/block/nvme.c     | 5 +++++=0D
 2 files changed, 6 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.0=0D
=0D

