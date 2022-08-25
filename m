Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F695A1A2F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 22:19:20 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRJJv-0005kx-BR
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 16:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFn-0002Rw-U7; Thu, 25 Aug 2022 16:15:03 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRJFl-0000ay-F9; Thu, 25 Aug 2022 16:15:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F18825C00CE;
 Thu, 25 Aug 2022 16:14:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 25 Aug 2022 16:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661458498; x=1661544898; bh=R4
 Z389CKQPEiy1aPuNJ3VTqrYSqMO8DaSLLDOu3N3Fs=; b=xs1F05mFBcjJgbvloT
 usdWARMKZ1NlxrQJJYbG5kHZkm8hl6R4XXlOWipwRwRY4D5Dfg/MPXXBEwFlspNA
 0TA09/wIJxi4ScR7xEH+fwf5UYPEKhNaLO7gVklBh4a541VaAbV+b9xXdRH3twX+
 t043ufWAOuOIM7kIziBTioF04xJIIxaR6PGANhL2lJj3NZYmtJ3sraBP5SBLCn5q
 pe2pg7XM56KssnKLpmpJbQRQenCjIcxK1j0EzZOA11e6PxTksSANLiryrTHlH5wx
 FpcG1U1zbHm+64VzY9mGKT6x67TgwYcMXxexAW0nJueijvlkn2Vuu1/ulf4BB2b/
 gUgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661458498; x=1661544898; bh=R4Z389CKQPEiy
 1aPuNJ3VTqrYSqMO8DaSLLDOu3N3Fs=; b=twWVM0+rdGx9Wm7KoSnmIFaLHviNa
 AT4LKbFejZwowRD/CTBkZYlb8qK8pU5zwcQ3ah5rDQVueicAO3aHRijbddwwnRdF
 YNWjejbTbLb+kBZQD1Fluw3u/RV/ZuoqNudJUFHu5MM005wQ34GUpf49qfaRWAKf
 ggVhe0cLtGn/HD69wftYf/ZhAdKNOaRKLl6pho3aTNiuCZ2oriS9EUAxiUgzlDVf
 il/44oTH+HaBY+OQty60johPjTEy90MnO17HqMbxVojiFhziAdxBMC2S124uhcv/
 jm7GSx9L3e+0rC3Oq8dmxDMM99+BL9wjfER9AxwWMkhy4tJjOwgbOksPA==
X-ME-Sender: <xms:QNgHY6Fn6n5onV3U5QS1Q_6FERRumPSmjagq9q96UD5Zw_nIRTygqQ>
 <xme:QNgHY7XhShGQAzGzrB63uKOc3U3RTkBlbsXq-pV4npiOon_Iv1JMnrAlWklBqeMFe
 jqY5qbdxuVNGd3TXe4>
X-ME-Received: <xmr:QNgHY0IQ56PNMWRUoOiLTyjv-K8byI_M4u6QKu58y4seoXFj4nUoUpyjlGLyr8rOuJZPxD8TNoaJTOVObU4H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieehteejvdejkeelueehhffhffefuddvjeevleeijeeuheejgfettdfhteef
 hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QdgHY0GkuN-RL1Qx4WAndm1HzeoI70bWlOz_kjbd_MpuL1OwZblWcQ>
 <xmx:QdgHYwUaYCvnq-9d6kkE58M4IUCQAZAsslusBMpMoxaaRQ7Yo1wuBw>
 <xmx:QdgHY3MuzqL1uwBKCyVqDikvFjqlj6jEduAzUb1UEAwzqqYrWnWYNA>
 <xmx:QtgHY6exm_diDkIdNclMKs2K7Sz2T0aXs-uLu-vaVd--ZAxinF0-aw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 16:14:55 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 0/2] hw/nvme: add irqfd support
Date: Thu, 25 Aug 2022 22:14:52 +0200
Message-Id: <20220825201454.259190-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This is a re-spin of Jinhao's irqfd support series that fixes msix=0D
vector masking/unmasking to work correctly.=0D
=0D
I kept being bugged out about that msi route not getting updated, so I=0D
hit the code into submission with a hammer.=0D
=0D
I finally noticed the core issue:=0D
=0D
  1. The vector notifiers was never set because msix is not enabled at=0D
     the point where nvme_init_pci() is called.=0D
=0D
     Move this call to nvme_start_ctrl().=0D
=0D
Since the unmask callback was suddenly getting called now, another fix=0D
was needed:=0D
=0D
  2. Call kvm_irqchip_add_irqfd_notifier_gsi() in the unmask handler -=0D
     not in nvme_init_irq_notifier(). The vectors may potentially be=0D
     masked/unmasked and shall cause a pair of add_irqfd and=0D
     remove_irqfd calls. Removing it from nvme_init_irq_notifier() makes=0D
     sure we do not try to double add.=0D
=0D
Now it does what it is supposed to; no hacks required :)=0D
=0D
Jinhao Fan (2):=0D
  hw/nvme: support irq(de)assertion with eventfd=0D
  hw/nvme: use KVM irqfd when available=0D
=0D
 hw/nvme/ctrl.c       | 261 ++++++++++++++++++++++++++++++++++++++++---=0D
 hw/nvme/nvme.h       |   6 +=0D
 hw/nvme/trace-events |   3 +=0D
 3 files changed, 253 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.37.2=0D
=0D

