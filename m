Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBFB4B50DD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:58:45 +0100 (CET)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJawG-0002dX-3R
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVQ-0005m1-8C; Mon, 14 Feb 2022 07:31:02 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:38227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaV3-0003aQ-OE; Mon, 14 Feb 2022 07:30:41 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D15672B001DE;
 Mon, 14 Feb 2022 07:30:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 07:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=JnAKrHpK/7M1HyK4cyVam5ilaElrZ4
 DsE7pozxtBGRc=; b=aXtZapffPRCir2UZN02whcWDiYamy6W63AC5oUu5NfucPg
 aafVZB2TQR5NqVqOmCr3f4EMrcOYmRhwmO5F0lyS8xbJNEbFsp4us9UhwC4bB+xa
 KC+6jdW4yVYX9npr5pPd8ApzPgs+BISXeATkgxdA6T7GpkjIcZbD8bfGi6qq/nLv
 iLefTOrMWaiGNu5pFYFu4bGMAIMu4wc0ovs1ypSTSaDRbzZzRwkZdphiQd7ntpcO
 SSw0h5gNxjVpKKsNNS6+ALe3v/BcyavIkhGb9hhQeMIUEouY9pVVBdPfa/SNZigM
 FEQ0zxVJZIu35ygQ2hbKZsVSj5AGYmuO2qm5yA8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JnAKrH
 pK/7M1HyK4cyVam5ilaElrZ4DsE7pozxtBGRc=; b=FlTm6Hs+ve5M+737V7qIBj
 jQ2+7zFK7sZo8jcD4HrqbATaikzQ9vhZCIGxh87ur/SehUC9egpgNFMsAjP2PDqt
 mDf6ag44PLmy5DIyYt5c2Hu3IkMLQKi8KLX/nnYRHx2p1K0FKScYwdp7y9U0xaCV
 6qyECMXF+tqubZH6AFFic+kJvuXdEA8U411UzmklSqRvlq9J70bKa+9p7gIDbLWJ
 bwnvUxHGfKbox09OwmKN8lmTHTfek0o6i6Ex56XWhSj/sf0a+H6pPUNI/M6xxCWj
 v/4wojngAntf7Ccff0ni/aXvJEi/8f/MlDW1E252rnPH53JSeRE0AAVxN8qOfdiQ
 ==
X-ME-Sender: <xms:aEsKYjIDYwf35D7QI9nuS6_IDHyAbd3ihLKeGuZOAWau_ufQl_fgmA>
 <xme:aEsKYnJkFbAyvksTNGhV61Htk4EHAzbG81tgUjso-fudBOt1JlR7fskgoB0bh-t9e
 jN40-NGSD8sf58XHaI>
X-ME-Received: <xmr:aEsKYruI0p2PRqTGjALN-AyKjf7hdlMiyo6TIr5de6W8lc77Sq550gqv10sedkNmK8C8tWjW6IAI9-wr7IvxVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeevteelfeegkefhleekvdffudelfedvfeegjeejheefvedtueelhfdutefggfdtgfen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aEsKYsalw9SzJNmVjGu7yijEvhrwHl09anXeEDouX_TrmJxss4ymbw>
 <xmx:aEsKYqY9CSF9rx-8_um4bwvwldU5sC5y_hHJrYDI3u00s8NlbrKebQ>
 <xmx:aEsKYgAAQai7hiFsimAkbwhROw4nvyUgiX_lN_9MOzuL6SwDWyy4BA>
 <xmx:aUsKYgnExQetXIelIy_QDk-u-Wj1iIpOPWXyuGTTjf__2X_lemWo8xuq--Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 07:30:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/nvme: enhanced protection information (64-bit guard)
Date: Mon, 14 Feb 2022 13:30:23 +0100
Message-Id: <20220214123029.106404-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This adds support for one possible new protection information format=0D
introduced in TP4068 (and integrated in NVMe 2.0): the 64-bit CRC guard=0D
and 48-bit reference tag. This version does not support storage tags.=0D
=0D
Like the CRC16 support already present, this uses a software=0D
implementation of CRC64 (so it is naturally pretty slow). But its good=0D
enough for verification purposes.=0D
=0D
This goes hand-in-hand with the support that Keith submitted for the=0D
Linux kernel[1].=0D
=0D
[1]: https://lore.kernel.org/linux-nvme/20220201190128.3075065-1-kbusch@ker=
nel.org/=0D
=0D
Klaus Jensen (3):=0D
  hw/nvme: move dif/pi prototypes into dif.h=0D
  hw/nvme: move format parameter parsing=0D
  hw/nvme: add pi tuple size helper=0D
=0D
Naveen Nagar (3):=0D
  hw/nvme: add host behavior support feature=0D
  hw/nvme: add support for the lbafee hbs feature=0D
  hw/nvme: 64-bit pi support=0D
=0D
 hw/nvme/ctrl.c       | 235 +++++++++++++++++++++------=0D
 hw/nvme/dif.c        | 378 +++++++++++++++++++++++++++++++++----------=0D
 hw/nvme/dif.h        | 191 ++++++++++++++++++++++=0D
 hw/nvme/ns.c         |  27 +++-=0D
 hw/nvme/nvme.h       |  58 +------=0D
 hw/nvme/trace-events |  12 +-=0D
 include/block/nvme.h |  81 ++++++++--=0D
 7 files changed, 774 insertions(+), 208 deletions(-)=0D
 create mode 100644 hw/nvme/dif.h=0D
=0D
-- =0D
2.35.1=0D
=0D

