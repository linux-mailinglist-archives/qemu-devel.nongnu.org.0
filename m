Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA383B780B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:54:06 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIrw-0004b0-PL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIm2-0000z0-6W; Tue, 29 Jun 2021 14:47:54 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIlz-00057i-0j; Tue, 29 Jun 2021 14:47:53 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 0321C2B00A60;
 Tue, 29 Jun 2021 14:47:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 29 Jun 2021 14:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=OwqfN0YyZTl6A3Y4+tkpptTus8
 1/C7QJPY7YGJRIAf0=; b=VbUWIdTO0LV9mIIgeN0GELiJK0QjB0jJoFYaklLeDR
 G23grZUPHEgDpxgPuQilRh17S+uV+0KIKsFt+w7TEmrnBYJ7QvkIW94ZKpb/V0KT
 P/3VjSUn4bxRqKbkqCC4upchLrKpw2eB+Xjcl44YS6bZalGsMamER4Y61ZRGNt9W
 I51v2meAzxM5YCmjYF4wmy6VbGpgQRjfDQnRYqzgyLmhisYkzHNcFOhXJ1FbLzAN
 kqm6t6ULlkc29h366P7m07ve3SehdyAN5HBeuyo+szkvDg4na5FKalnswyZd53xQ
 +3rmUIrMr7iv/hFeUbDj2V28xCd2Vl1LgXdqR3k11qZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OwqfN0
 YyZTl6A3Y4+tkpptTus81/C7QJPY7YGJRIAf0=; b=bNYXbHz45Z8J5R4YY89P/C
 6K2jX4nyQBfslIsHOTplj9ZARoTTLv38f+jjI2iFVvFngcepIiUysyMBYheW+jqg
 NtH/0eNJ6lxgSSm+SEBCYs+tsZQeCrd9MmyI8aSszBspfBAtMuDlHZvYK3CkhwjK
 aqKOE01pnj/NokUfFUS+W1QYSHUSy4oxZnwbfEEBGRJAhMMxC3fc2BvtEwajgVgp
 IumrEJglGw7yEmq58tMmh6mqgSQDpMa8A90GnSP+WF5AjXLZAYX58Ntu8wN8cfhx
 DNWNigmlBh0syaknlxnDOivQg2tx8kJnr6Lhsg84oRfFuXUSvcIiaHE1YaP3uRLg
 ==
X-ME-Sender: <xms:0mrbYMZ2T-v0kNwFnsP4xtzZP8j4nf-J2jwnmkSHSkDAoOYv8keRXA>
 <xme:0mrbYHaSCRCexQiJ58I6TO5-1lxcxmY6UShcf9xgiKoL8OjKsFMauWhVKFIyRr8iz
 5GtLNmVGyEUx7WAWGs>
X-ME-Received: <xmr:0mrbYG-40b1uP07lUot_JGP5smLQv0TLSAQtNX45mp_1D0qAkkeewTlyrRq2pwCHrKGSgaymp736fUbgx9kyof_IsoW1HEr_-MDUODIyYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepvdfhueejueejkedvudeftdetvddtgffhteelgeeluddvveetuefhfeekfeeuhefg
 necuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:0mrbYGqtNsvj4xQ9A597JA82Z4Aa1BZdBg05a7gsCM_elY0jLo5CqA>
 <xmx:0mrbYHrWEKzq3I4EyRsnD1bm56cQrIE7EK32Ozn94sa0xpW9M0l94Q>
 <xmx:0mrbYESKO2lERvtj_sL5i0usRyvbgJVt0gXYmDOsBkSvlDNcE3_x3g>
 <xmx:02rbYEj7oVEbPDJJowivAruKSa8PT6eRkjyW6Gshs1xSPJUzj5PPcxHqKFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:47:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/23] hw/nvme patches
Date: Tue, 29 Jun 2021 20:47:20 +0200
Message-Id: <20210629184743.230173-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi Peter,=0D
=0D
The following changes since commit 9e654e10197f5a014eccd71de5ea633c1b0f4303=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-06-2=
5' into staging (2021-06-28 18:58:19 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.infradead.org/qemu-nvme.git tags/nvme-next-pull-request=0D
=0D
for you to fetch changes up to 176c0a4973d3ca5d46b05d0edb439b154363d29f:=0D
=0D
  hw/nvme: add 'zoned.zasl' to documentation (2021-06-29 20:31:27 +0200)=0D
=0D
----------------------------------------------------------------=0D
hw/nvme patches=0D
=0D
* namespace eui64 support (Heinrich)=0D
* aiocb refactoring (Klaus)=0D
* controller parameter for auto zone transitioning (Niklas)=0D
* misc fixes and additions (Gollu, Klaus, Keith)=0D
=0D
----------------------------------------------------------------=0D
=0D
Gollu Appalanaidu (6):=0D
  hw/nvme: fix style=0D
  hw/nvme: add identify namespace flbas/mc enums=0D
  hw/nvme: fix lbaf formats initialization=0D
  hw/nvme: fix csi field for cns 0x00 and 0x11=0D
  hw/nvme: fix endianess conversion and add controller list=0D
  hw/nvme: documentation fix=0D
=0D
Heinrich Schuchardt (2):=0D
  hw/nvme: namespace parameter for EUI-64=0D
  hw/nvme: default for namespace EUI-64=0D
=0D
Keith Busch (1):=0D
  hw/nvme: add 'zoned.zasl' to documentation=0D
=0D
Klaus Jensen (13):=0D
  hw/nvme: reimplement flush to allow cancellation=0D
  hw/nvme: add nvme_block_status_all helper=0D
  hw/nvme: reimplement dsm to allow cancellation=0D
  hw/nvme: save reftag when generating pi=0D
  hw/nvme: remove assert from nvme_get_zone_by_slba=0D
  hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check=0D
  hw/nvme: add dw0/1 to the req completion trace event=0D
  hw/nvme: reimplement the copy command to allow aio cancellation=0D
  hw/nvme: reimplement zone reset to allow cancellation=0D
  hw/nvme: reimplement format nvm to allow cancellation=0D
  Partially revert "hw/block/nvme: drain namespaces on sq deletion"=0D
  hw/nvme: fix missing check for PMR capability=0D
  hw/nvme: fix pin-based interrupt behavior (again)=0D
=0D
Niklas Cassel (1):=0D
  hw/nvme: add param to control auto zone transitioning to zone state=0D
    closed=0D
=0D
 docs/system/nvme.rst |   12 +=0D
 hw/nvme/nvme.h       |   15 +-=0D
 include/block/nvme.h |   18 +=0D
 hw/core/machine.c    |    1 +=0D
 hw/nvme/ctrl.c       | 2039 ++++++++++++++++++++++++------------------=0D
 hw/nvme/dif.c        |   64 +-=0D
 hw/nvme/ns.c         |   64 +-=0D
 hw/nvme/trace-events |   23 +-=0D
 8 files changed, 1287 insertions(+), 949 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

