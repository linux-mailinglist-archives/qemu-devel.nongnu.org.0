Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6903053AE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:57:20 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4elT-0005GY-1W
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eit-0003ul-1p
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:39 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:52245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eiq-0000sj-Ae
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:38 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 84D3A5807BC;
 Wed, 27 Jan 2021 01:54:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Jan 2021 01:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=GpQVJMbcT8lnW+YT9nHhhkONH4
 YMa5yU+cLp/rL7Vt4=; b=uPTk4FjyREvl8/uZ3v/Wf5PUr5ZK/w9T1YpWiOF55z
 Iml/EcD1sUtVN8kFb8eMA7hmFqtfvgnFfxhGg0po/NK+26mQs3nLmADYxYoC8NfM
 1Bw5Qy9o5xhYLkVSCsnTdk6B3PgDdknX4jytDkXHG1vG9MjCHcD2m779Qng2psWm
 J0L3bbto/cR82i7FwaFB1tFUKhve1RGRt+8E9i5jcQuzyu0W6E3jbZp4rZ9eQtm1
 ikosDIB0f7PPyCB0quLbZp+jaabKMF+i7/XRR4cKQGHKJIqnQ2WxlBno6c/EOczv
 ub/mcbXFBf6ThapSrQKj02w4rEmXkxR4lSmSIdRdy/bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GpQVJM
 bcT8lnW+YT9nHhhkONH4YMa5yU+cLp/rL7Vt4=; b=FLmBUp8tLFjF3e4oyd77Dd
 tlBzVRmPNkZsDxd2B47ORgfSJaQPKZWg1DzxS98gJB4B/kZ6bwpFzCUCmnpRmVgk
 ZwxsC4zVgLAIQRIZzC3Q3vtlLR2G+dgoKRGPQPO3cI/0fIfiShw45a3Wz2x4U7mt
 sPvxdau5qI5hogjqgX6C34p8dtAdPaC1NrsSHH7qvQQNaZY8/V3w4568UgGKgnI1
 se5DJR3nnFClUGXV+vovB8IM6w/spf2EDEoDbK9JyM0I3+ljxLJHmcRMFtjMCWQi
 yQaF+HIE5aun8ognvhzZd3r1W+KShhYNGVVEzcL8Kqhu+ZyH2QqvdQtXAw6JAPbw
 ==
X-ME-Sender: <xms:KQ4RYG0Fqy9O4eAK3-DaXQF2kX87prUc6hXsKzk9XpGJCZ6l-pAyOw>
 <xme:KQ4RYJFZI8F-OOgsGAJ6DOeQAmcZOkLz_ofdxV2de2_oFuSfKe3tRAgxI14nMpAHY
 t3f4QpGGSMWjOxCdEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeevgeeufeegledttedutdetteefkedugeetvdffgefhledugeefgedt
 hedvgeevleenucfkphepudduhedrudeljedrvddvgedrvddvfeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:KQ4RYO7AkUUAp8SIxC1IDrmUAMnyCJ7OhSiEjFskdDFLZZFJEh7WvQ>
 <xmx:KQ4RYH1lsBbbWO2Nb-zTXb3_uNNn1BSc5QBIrjLvMYiyfMT_CExtWw>
 <xmx:KQ4RYJFIyVW0jtWkscNF2EUI3AZaYqBNxBQsBOgtBLAwSpcKoMEH2A>
 <xmx:Kg4RYNi8udnDcC84CIU83ZgplryKtNaqDh6rA0Pp3pqGS8AkRsbL7w>
Received: from strike.202.net.flygoat.com (unknown [115.197.224.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id B249924005A;
 Wed, 27 Jan 2021 01:54:29 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] MIPS Bootloader helper
Date: Wed, 27 Jan 2021 14:54:20 +0800
Message-Id: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
A big reconstruction. rewrite helpers with CPU feature and sepreate
changesets.
v3:
respin

Jiaxun Yang (4):
  hw/mips: Add a bootloader helper
  hw/mips: Use bl_gen_kernel_jump to generate bootloaders
  hw/mips/malta: Use bootloader helper to set BAR resgiters
  hw/mips/boston: Use bootloader helper to set GCRs

 include/hw/mips/bootloader.h |  49 +++++++++++
 hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
 hw/mips/boston.c             |  64 +++-----------
 hw/mips/fuloong2e.c          |  28 +-----
 hw/mips/malta.c              | 109 +++++++----------------
 hw/mips/meson.build          |   2 +-
 6 files changed, 260 insertions(+), 156 deletions(-)
 create mode 100644 include/hw/mips/bootloader.h
 create mode 100644 hw/mips/bootloader.c

-- 
2.30.0


