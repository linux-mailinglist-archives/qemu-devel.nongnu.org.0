Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1643BC89C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:43:15 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hbm-0005Xm-3b
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT9-0000gC-DL; Tue, 06 Jul 2021 05:34:19 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT1-0000bT-6m; Tue, 06 Jul 2021 05:34:19 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 988ED320097C;
 Tue,  6 Jul 2021 05:34:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Jul 2021 05:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=p0+yeEEnY6V9BlRooyfKfrXhEc
 VjSNoS2ye34QIXrK0=; b=Q2SJo5ZvhQy5yKt+PEp/UPV051OpuvS4xn2IrUFTbz
 8SAiHV9lbj209bu+lgOscs/IuLsVt0Zuy0JVaHZPoLVkNCGbXpJ9QURU0zHdy6a0
 QtHYasv3aWemyY/VSJHkcgfuYW1nYDpBXjq+yqGjb3NNmnWZaBANrGWFMEQU88Nh
 Lk0B1VuBOEtzuACebbwr4MitGi9Zik+jVapLSL5cwZ5UXeRMT5pSN2W41lKSvJ8r
 flNw2SSALPH6ecM5Aj1fLd+6NO9j1cikLRWH/1+0P4ytWmlqYVpmkxFdYkuBCrOv
 MKQ2zEqdwdu/p6+m1VRUwCUPfm2144U3H54G0lwtsZxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p0+yeE
 EnY6V9BlRooyfKfrXhEcVjSNoS2ye34QIXrK0=; b=beuK3oH3UQiqgx4jtwhD5l
 k0B8zlHmtgYknsUInXyA7e4BT5l5qj2TZWk+Uwp5ab1+lC/V9oacSR2DYDYh86LN
 LbTtBVLoBDnvKRexfRJUcJqiza6AL1YwKehjv0bKr90k8Iw/RGQW+5olo8B7re6x
 EPl6Gh5SCFRkFh3Y0lPuYgaALYxmvFRa5gsuFa291J2FMGS6/8c49px6sejDsckr
 0wpGRVY20gq7EIpP6Itd1mX5f0DMzKdVuKnsnIpRJQX69Ns4DwSmcPhTAMr5bGkb
 /khTeFOWMnGC0hvXLG3bU/E2FQu0C8LByK7i5hp2PzTKOrf/yzPZMCcy1YQQK08g
 ==
X-ME-Sender: <xms:iiPkYNnJvcKnpo5DAlQVRvlFadBHB9cj0m2xq_r8lpFHiVI91URdcw>
 <xme:iiPkYI0DKvgID-OvkWWOAxPSqsVnmTkVxu_kptmag79V08fbL1pUW4pO3Ia3HNKNX
 OJQelv7JRf9okvYND0>
X-ME-Received: <xmr:iiPkYDqJcOw0AVxals7jH6ZBB2re_qelbt3E3shbQRN1ry_lypPEwxJ_40VHl7z-E4CsbCS8YXCVD0jVV0ghLYUJG-48kmoGAIZHkfFi-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfegveekiefgkeevvdetjeejkeekudfgvdehieejfffgkeffvdevlefftedvgefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:iiPkYNn1j9nxq8MYIAoSl9vwKD981_505F6g2jneUGVFQPf09WyRcw>
 <xmx:iiPkYL1nfAcPQ2axUjVdU3y0cCJw9IsqCjdxf_pY4olXjUo60NRWmg>
 <xmx:iiPkYMuVTv5Bj5frQOcD8IIDyOmZOMnynSNec1IjFUmQ4zXrNonmtQ>
 <xmx:iyPkYGTTuz0VqZ6hyA8A4tipmS10JfK9wKhSD9K22GmXBtWFopy-eg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:34:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/nvme: fix controller hotplugging
Date: Tue,  6 Jul 2021 11:33:54 +0200
Message-Id: <20210706093358.1036387-1-its@irrelevant.dk>
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
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
Klaus Jensen (4):=0D
  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions=0D
  hw/nvme: mark nvme-subsys non-hotpluggable=0D
  hw/nvme: unregister controller with subsystem at exit=0D
  hw/nvme: fix controller hot unplugging=0D
=0D
 hw/nvme/nvme.h   | 21 ++++++++-------=0D
 hw/nvme/ctrl.c   | 14 +++++++---=0D
 hw/nvme/ns.c     | 67 ++++++++++++++++++++++++++++++------------------=0D
 hw/nvme/subsys.c | 10 ++++++++=0D
 4 files changed, 74 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D

