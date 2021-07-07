Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE153BEB9F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:54:11 +0200 (CEST)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19sI-0002lH-Ju
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o0-0008WF-9J; Wed, 07 Jul 2021 11:49:44 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19ny-0003EF-I2; Wed, 07 Jul 2021 11:49:44 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7238D3200919;
 Wed,  7 Jul 2021 11:49:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 11:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=BoSJQgpDpThJHnbOl1S4Wcdg8u
 yckYgV0TgxSt67G0M=; b=YSrFhXB3vZYOtRtLZwziX3c0ZzVvwxicfpELbqlurH
 jE9hP6qFAp5pKgWxBfEa3YqSO0R7PC/EV4JgCpOXAl8ouvMHNulZw63dWLSb61SK
 CFDtXv2mKdWvVDMzIJNpyzA4agC4awizT2dGl3CKUp0W4oMM1QhcctSXeOSTdhf/
 ZoVJk7wq4G9oFt1O1IZanU5F9aHzM9O9Mm1fC207SkxXTEE6XDAH9ydmtKcvJom+
 q3iN31zcrfJMeHtCWdPGGvPYgqe611iPnK8qSmbGoDb4Z0hIhO6nslkN5SQVKXBe
 bmBvHhZ4wpp1i1hoIJBZFtlMdY/kDIKpNhHRKM8Vao8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BoSJQg
 pDpThJHnbOl1S4Wcdg8uyckYgV0TgxSt67G0M=; b=rqw0LG7tyROsLAHg3YMPi0
 Y3e1J1qaUPZxFidPf2FqULc4pbb5lTN1m29Uqmu2CKfDBrmHeIoA92EttTd3peNI
 osGsG3Ml9xt3AqcPHvV49zjNID+ZTktwZNAFQdZh8+d50qYLGs950DY2bYuYVohF
 78TxXkDtOgTu8bz03+LGBDF6DDxH3bc3qVTyPzOgWou30XtIsjV28smk1rlKQJPM
 ffoi10XfMNOWEeKXgZ53nvEsCj3Ew+L03WKYHESv171lQ/KpvquTZlnhdvSnj3uD
 4+81rMjK8STWTK56EMJoPMXTxBOJDqRBiRfMPakK53hvhtoulZxuDkNVDgZAMO3Q
 ==
X-ME-Sender: <xms:Es3lYDtZr4Cb2wF2PmDonirR9bvdqnMgp4iqGcx9QFDnKQHNpeZJdA>
 <xme:Es3lYEccLgnQ3r2byu4DvGjOqZOAriXLVezPTcNTPHiNP46ckfyc6IBuSOVN9-xNN
 Tqstterd2RBLtK-2kk>
X-ME-Received: <xmr:Es3lYGws3vA3an16sTq88P47_gg33mhRRlmXEFGbBZk3bBSUiXuDlCS-DnCOOZfCdyoz4fKmQJWRiO7Yw66uAX2_8hWt1fzNx9m4SguBNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeghfen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Es3lYCNe9Qq7UMyMeJJxMOpv5JcOfKgq6NNjPwmlsphD0amawowIKQ>
 <xmx:Es3lYD9LlHsklcwGfvCOuTH8Z6IFJglVPR80gtchdpR46WWiysAtxQ>
 <xmx:Es3lYCVAuVo1VsMDqTixVPYVRlV75-TnOIDPE1VweO1AAoFTSpeTMw>
 <xmx:FM3lYPavQM51bp9N_We4BRkbvZHdmRiFDKtAbAGv4rR9qilxXV1W2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:49:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
Date: Wed,  7 Jul 2021 17:49:32 +0200
Message-Id: <20210707154936.200166-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We=0D
discussed a bit back and fourth and I mentioned that the core issue was=0D
an artifact of the parent/child relationship stemming from the qdev=0D
setup we have with namespaces attaching to controller through a qdev=0D
bus.=0D
=0D
The gist of this series is the fourth patch "hw/nvme: fix controller hot=0D
unplugging" which basically causes namespaces to be reassigned to a bus=0D
owned by the subsystem if the parent controller is linked to one. This=0D
fixes `device_del/add nvme` in such settings.=0D
=0D
Note, that in the case that there is no subsystem involved, nvme devices=0D
can be removed from the system with `device_del`, but this *will* cause=0D
the namespaces to be removed as well since there is no place (i.e. no=0D
subsystem) for them to "linger". And since this series does not add=0D
support for hotplugging nvme-ns devices, while an nvme device can be=0D
readded, no namespaces can. Support for hotplugging nvme-ns devices is=0D
present in [1], but I'd rather not add that since I think '-device=0D
nvme-ns' is already a bad design choice.=0D
=0D
Now, I do realize that it is not "pretty" to explicitly change the=0D
parent bus, so I do have a an RFC patch in queue that replaces the=0D
subsystem and namespace devices with objects, but keeps -device shims=0D
available for backwards compatibility. This approach will solve the=0D
problems properly and should be a better model. However, I don't believe=0D
it will make it for 6.1 and I'd really like to at least fix the=0D
unplugging for 6.1 and this gets the job done.=0D
=0D
  [1]: 20210511073511.32511-1-hare@suse.de=0D
=0D
v2:=0D
- added R-b's by Hannes for patches 1 through 3=0D
- simplified "hw/nvme: fix controller hot unplugging"=0D
=0D
Klaus Jensen (4):=0D
  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions=0D
  hw/nvme: mark nvme-subsys non-hotpluggable=0D
  hw/nvme: unregister controller with subsystem at exit=0D
  hw/nvme: fix controller hot unplugging=0D
=0D
 hw/nvme/nvme.h   | 18 +++++++++-------=0D
 hw/nvme/ctrl.c   | 14 ++++++------=0D
 hw/nvme/ns.c     | 55 +++++++++++++++++++++++++++++++-----------------=0D
 hw/nvme/subsys.c |  9 ++++++++=0D
 4 files changed, 63 insertions(+), 33 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

