Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47393321135
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:12:00 +0100 (CET)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE5Nv-0008T5-8L
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J8-0006g6-EX; Mon, 22 Feb 2021 02:07:03 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J1-00030G-Pl; Mon, 22 Feb 2021 02:07:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B06175C00F0;
 Mon, 22 Feb 2021 02:06:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 02:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=qo8lK+EodHOcW+uDvL+/3UvbPe
 n+mba8a0FG7W+iIaU=; b=sBGhFZOoiDd+Bt9QRDWwy1xeInXp2vzblWLSk0sAyx
 t8hmTZ26fxZldjf0vxtIQo9zxXbr/YZCeSRn/QU9SxfJzooHV/gc+TLgvVm4cfWz
 3yYGqnBViLb2ibDeQ3S11pE2GUKIvkUL8AdOG4C1gQVg/OdZtIvhNWx5hqLbZ/TO
 eWFgQqNYbpgzif1MybQOJ7aJhuQvtyqDhxIgT7RqJsf2LDjsmM2ZkOUadhRBqbhw
 biFVdlk3Beh/7h9+wO5kSqLGBsI3MxNXZ13i7d+ZdimIXzcW4RH/9Vv3D7QBG5jy
 TCJSpB3Gb5dufqk5/kBHtrKkprvKU+7KZ9JE1NDvjOSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qo8lK+
 EodHOcW+uDvL+/3UvbPen+mba8a0FG7W+iIaU=; b=ZAWEo2UuCpTJDHRpwaBU1E
 FyeJ693ueMij4275c6CqS3jyoxj6i0RkVv10QDH19a9UFJfjhBlCw02Kb+eXguek
 6w99Sz5s7ocVFujtfd9hDal9/HmEkHcI9KKi0Nzg4aUkEHLzCGwGE6vyD35tKF5e
 /rV5Pl/IpED86gb1zOkFD8IHWhGgIaNdI5u4lYcdr8bHfAdTLfzaRg/F0nzwdMYZ
 IMJA2gNpBYT9N1kcSQLiSPiW/tKQCSbDmwo3Blm+DYTzItaPkjMoNVlZM7gw7gn3
 MgyQtdVcau5EhToNauUPfCbPhXy60hbR5VWNGXWiX49+7/0Ne8FmEm0tBtuyHl/g
 ==
X-ME-Sender: <xms:ClgzYENeFABG9H3Iq8krRea-9KEq5STvYfZ8RoUPDjQsFZP7-RNvbA>
 <xme:ClgzYK9wFp0-1C-6TpyYOVHT4EbbmWK_q-tzfcfKl-nF1jKZERZLAitaniyqkhIkn
 C00aXp5aCIAQerEu_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ClgzYLSMf6auGkrCPdYWCTr1pRwgLzNyh7XWG8XGUDO7RzozHmmk6Q>
 <xmx:ClgzYMsMjI8-xPed0NSM0JpKZ5ONb8o9PgBH8_k9wAbxh1IXjV1neA>
 <xmx:ClgzYMeYhwMP_Zi7Wi29enGAvZLphp5qEugVZKdwSztqMZKIObuvNA>
 <xmx:C1gzYETasa8S_nsvL-oPlygzY5TcV78btz8T2xKHjYqUWvWlc8K5cg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C2BA24005A;
 Mon, 22 Feb 2021 02:06:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: misc fixes
Date: Mon, 22 Feb 2021 08:06:12 +0100
Message-Id: <20210222070615.9177-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Small set of misc fixes from Gollu.=0D
=0D
Gollu Appalanaidu (3):=0D
  hw/block/nvme: nvme_identify fixes=0D
  hw/block/nvme: fix potential compilation error=0D
  hw/block/nvme: report non-mdts command size limit for dsm=0D
=0D
 hw/block/nvme.h       |  1 +=0D
 include/block/nvme.h  | 11 +++++++++++=0D
 hw/block/nvme.c       | 46 +++++++++++++++++++++++++++----------------=0D
 hw/block/trace-events |  2 ++=0D
 4 files changed, 43 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.30.1=0D
=0D

