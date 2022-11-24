Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F06380B1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 22:35:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyJnB-0006UV-Ee; Thu, 24 Nov 2022 16:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn7-0006SY-Bv
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:53 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn5-00048W-JX
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:53 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 11E685C016A;
 Thu, 24 Nov 2022 16:29:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 24 Nov 2022 16:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1669325387; x=1669411787; bh=1zsrzX6vaejmJbURVi62glnsc
 fYVvJuRsmZxbAbDBaE=; b=jvFckfFpbiJZBJj4U0GneZJ5Qkwb1G6gorijSc+G+
 Oo6cWeEqzuyvVDs67Y+xEd3qpu4W4fkHFoDO4mqBFMw4HPSMLGam++FXJ35tQRMm
 E1tsns/U8z8bUfPpKqR7/t5rJcEp4E/qI+xBnHeATM7Z7wfIh5iF1Fr2TZkqy4V5
 kL4PjHtPx7A4fMwiEbnUg3o1s/J0A0yBTog0Z+WIboC/KUP22439lnbok39TBpoj
 dHLYuX77Nctr0+mjKGkllwrJjPx2FORG1qli+ewjYk8NA76Y0iB55i7r/5jdeeSD
 VX/W7atkg/fUsvCElWruc45s5ZiUcWQSoTS4PqfSPlQOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669325387; x=1669411787; bh=1zsrzX6vaejmJbURVi62glnscfYVvJuRsmZ
 xbAbDBaE=; b=eUfpqdd7XxqYJ5ZG5lq89RVofhb0SbtDqfmCe03JGTGd8uuI50H
 Pa+9ZJxKAWIp0iOrNYZK/ljbXb9U61E5xcmXDwaJ6bR/XB0MLQn5OoYMfIjj/+NY
 u0QWXCQ2TfH9DQumtZAYaVJMWnyjrhmmzNwAiP9LgsRI1Cpnx7IfPBCm6BEi8xVV
 o7VhT3HliXSZdNfp9bKTA8hC3zxhcudQ9+7rZfFULo616Lh7FwdsyD0TGo8bgmUo
 by7mGUeNgf/ZJwoidOM8iVwZhmqYMkJAwo6JR6t60nFFsAsNCPka9fI4C+HkDQgc
 xYObd3W5/EcpVVaX1msLN7xPe+uUnRZ/lKw==
X-ME-Sender: <xms:SuJ_Y3kF9O5LWSHrNK4jrsSpO3TNveongHj9pSc5RVIs9CmLayj5rw>
 <xme:SuJ_Y60mUzyQfyhBUXt6kqEkZMHTznilgHUH4yPczsN7oklY4hMnWJKqGL1hSP87M
 PgYIzjveAzNKT_Hs_k>
X-ME-Received: <xmr:SuJ_Y9o9AwnqpZXURgky0xbGD18ctYG-nTGL-yIHmkrKrdfqVBEymAvuZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfdtheehiedvgeduudduvd
 duleegleffgeekjedttdfhhfefleetheevvefftefgnecuffhomhgrihhnpehgihhthhhu
 sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:SuJ_Y_mdzhXkK0mgMdCQvUCxyYJQVsCrBlc-O82ELoMCtuN8jywa5g>
 <xmx:SuJ_Y129trbwMc6FVcEEJP6M1Nxj_pr9TIhh5rgND1pxv1Bruh9uIg>
 <xmx:SuJ_Y-vKkrJz_FNOEw8mpPq69z-GOkPTm6fRx4oYhuNmGU9RaE28mg>
 <xmx:S-J_Y28PFLt8ZHIfFY5dPVH-lZ8vUDBzhzd_XGkIEeEej5ozid9IBQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 16:29:46 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 0/3] MIPS VirtIO Machine
Date: Thu, 24 Nov 2022 21:29:13 +0000
Message-Id: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi there,

This patchset is to add a new machine type for MIPS architecture, which
is purely a VirtIO machine.

It is design to utilize existing VirtIO infrastures but also comptitable
with MIPS's existing internal simulation tools.

It should be able to cooperate with any MIPS core and boot Generic MIPS
kernel.

For testing purpose I've built little endian kernel[1] to work with this
machine with R4X00, loongson2f, octeon, mips32r2, mips64r2 and mips64r6. 

TODO:
- Documentation
- Test against big endian kernel
- nanoMIPS options

Thanks

[1]: https://github.com/FlyGoat/qemu-testing-blob/tree/main/kernel

Jiaxun Yang (3):
  hw/intc: Add missing include for goldfish_pic.h
  hw/misc: Add MIPS Trickbox device
  hw/mips: Add MIPS VirtIO board

 configs/devices/mips-softmmu/common.mak |    1 +
 hw/mips/Kconfig                         |   18 +
 hw/mips/meson.build                     |    1 +
 hw/mips/virt.c                          | 1039 +++++++++++++++++++++++
 hw/misc/Kconfig                         |    3 +
 hw/misc/meson.build                     |    1 +
 hw/misc/mips_trickbox.c                 |   97 +++
 hw/misc/trace-events                    |    4 +
 include/hw/intc/goldfish_pic.h          |    2 +
 include/hw/misc/mips_trickbox.h         |   41 +
 10 files changed, 1207 insertions(+)
 create mode 100644 hw/mips/virt.c
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

-- 
2.37.1 (Apple Git-137.1)


