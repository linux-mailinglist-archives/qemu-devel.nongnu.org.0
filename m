Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93833318B3F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:58:00 +0100 (CET)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABXj-0004Sl-F3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSK-0001nJ-06; Thu, 11 Feb 2021 07:52:24 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABSG-0005Jv-RT; Thu, 11 Feb 2021 07:52:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E86A5C0105;
 Thu, 11 Feb 2021 07:52:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 07:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=S6Spa+1lddvf8LZ5WwyG8bwvVf
 cjC1ju9CHUuKE8MSw=; b=GsAQvC/27/hLubDDXRufEJ5gndc3E6nJ7mk2SdqYZu
 Hxel/UM7+fyvSwcBffmAALYL1iC3QLasjlZYZrLHkohmuQbS3h+iWbu3kYhY64Oh
 Y8JALYjwYp1KXz6jKKoG/53Qsch/9TkPyAlVUReD5er1hyOy7/I+0ocxzwbF16jD
 ivXv66W0gKAdQMdRj/MtB69+g0lMtZgKD6XtQhcQLzAtDUbdr3HPgASg8HqFmrEe
 hHpy6npuOXi+uMdyS6FCxT2jTbZTv5/KNq0pEptMVvfM0yHVb/w76NUvL6ecATXg
 ZC7iuXKg990eYttlAGSW6O3lxXkyXo2IJRha0RKYixDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S6Spa+
 1lddvf8LZ5WwyG8bwvVfcjC1ju9CHUuKE8MSw=; b=toMxGkqVLDLgba+3JoEGrV
 VzuzOvrdDh1eFYOftMGcB09xBlPS1wK7g80yA550rkT0CyeVlTe2vOajmap21ova
 sDfomTvaL1+1RJGyvGPKxiuBE9klSa4BEvSyKhHsvJSpCTPfbgg3q9avblB+z+6x
 DBJinF6QIZxi6YUNmQh+e2ds9OqCM2nT2f8qzmsCVOT1DtO9O8dPf/oI+7gCXPIM
 w6Vs5qdqAohs2r3GlTDoaY4A1CimNwKUAjkVBwIa4yEAQm7IoDxfaCpKsk1IUlPm
 mwT0zVX9CtTlVUPOJyC1uYR9kVDQvj5esE8JFav3tZWKZtM7qY9TrxKChnXFcW8A
 ==
X-ME-Sender: <xms:giglYIHkI8iLWzZynMiPMy5KwyLdamvrFTP3qE-E8ugIOf94i5AfiA>
 <xme:giglYBVNdkN322JG2evYaq_lqUpGfW4214JTHejITy6GRLK4h62M_zvkHW2dsNqcM
 wwGmWkk3L7-oUCICU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedvhfeujeeujeekvddufedttedvtdfghfetleegleduvdevteeuhfefkeefueehgfen
 ucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:giglYCIIXD8Q_BRWKdwa9ThoP4vo-o4ovxp7a9yYlFWXFZai9deoIA>
 <xmx:giglYKFuuekwdpKfJv84Bi8WvttSJ9bD4LT-xXsW33M4mWLLhCBDEA>
 <xmx:giglYOWECPRJAr5Cg-gZhLZlKJBLmjikGsPD9zzSL0FQV7Z7rIn6Xg>
 <xmx:gyglYAduMMsx2-EncI41GQ9UXhu3kT8kEbaWp7ErfgPZqjZRFmCAYg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65D171080057;
 Thu, 11 Feb 2021 07:52:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/2] emulated nvme fixes
Date: Thu, 11 Feb 2021 13:52:13 +0100
Message-Id: <20210211125215.985593-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Two small fixes for emulated nvme for regressions reported by Alexander=0D
Graf and Bin Meng.=0D
=0D
Please pull!=0D
=0D
The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2021-02-10 15:42:20 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-pull-request=0D
=0D
for you to fetch changes up to b4471900d5328b66eeecdbc79de83992cc109d04:=0D
=0D
  hw/block/nvme: Fix a build error in nvme_get_feature() (2021-02-11 13:46:=
50 +0100)=0D
=0D
----------------------------------------------------------------=0D
Two small fixes for regressions reported by Alexander Graf and Bin Meng.=0D
=0D
----------------------------------------------------------------=0D
=0D
Bin Meng (1):=0D
  hw/block/nvme: Fix a build error in nvme_get_feature()=0D
=0D
Klaus Jensen (1):=0D
  hw/block/nvme: fix legacy namespace registration=0D
=0D
 hw/block/nvme.c | 7 +++++++=0D
 1 file changed, 7 insertions(+)=0D
=0D
-- =0D
2.30.0=0D
=0D

