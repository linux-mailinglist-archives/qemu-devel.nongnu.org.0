Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C860A2F26BD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 04:35:48 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzATD-0002PM-EA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 22:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQq-0001JI-MA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:22 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzAQo-0001Kt-DM
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 22:33:20 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C8B1580574;
 Mon, 11 Jan 2021 22:33:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 22:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=FSPZJp88roBgYLO+DissdA6plp
 lyblON6o6awxR+SJk=; b=o1ytkuo1LuMu3WUzatoXgq5Feg4pyaisuzgULIny/G
 1aMrNvpXByvuCBVQrLffdYx++8iUvxFdP/j+rj8tZooS/ngqM+EhK9UqoZhltPPq
 AhleGg5UL8u01SXtVWZyEnfefyEYZDJGd1h4npUiU8L6H5ZenTMcwyqMylt/iaOV
 Az77aTcVE7gRK5qtVllVQ6qlvI4U/Kg1ukVRBBYjrWPzV0iETQXPIEcXeKWC24xP
 qewrGQyz7pET07XAv5oxdGqeguqTA3CRzkNzwqHiFLhGG+N3xPI5bowU6Bqjs4ZF
 XQ5eqBoEmmosWusyjwp7HhSlPYS1PX5vIB/DHQxhP8EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FSPZJp88roBgYLO+D
 issdA6plplyblON6o6awxR+SJk=; b=SgadKP0IS7B1AG9zDMo2ZfSRKVdKEyOfP
 uPKId+acZmOd5tyLxB9ymskYab5w4brZSK0a+OVwpsfnnp/83Op2xqtCUh3bIZd6
 b3vdJFG/eiihbKunl5v0fvDuYh+rNqHsVvr1YNZYBG8QvhNVrmrWP3FYus4Lcp7p
 0pDMzy3Q/Kjeb4l89F6ACBgv02aAjGS84VSeQXw3NiWJZ1vsQPnGvxErCyWaLD6M
 MW7rH8jCR/E80530SvITCYnMGIv7RK45Ve0BVqLskoTv6B5FOQayjmV/Uwltcmwl
 R9wWvoe+JZQmKnXMUoRaVUG9RuTItjbrYFxVeqmTFwUZjKhErGtKA==
X-ME-Sender: <xms:exj9X-rQHOhLgHh2NvQYRPzFVCsoVhuxDR3ViTy-C78J34TTQLLXZA>
 <xme:exj9X8pLpYOm54Tb08xrfPFKavltmWIyGSk2q_50CDvUrYp_FcaPx0SqKQol1eqNN
 RMfuJwTxztD0tSLrvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhephfejtdektdeuhedtieefteekveffteejteefgeekveegffetvddugfel
 iefhtddunecukfhppedukedtrdeljedrvdegtddrvddunecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
 ohgrthdrtghomh
X-ME-Proxy: <xmx:exj9XzMZEZH22kA1T8-0uewxKSE7RHipGKBHXpwPrRZq6m8Ynu0f8Q>
 <xmx:exj9X9740tqPO8wFCxeH-_2qXn68rQImnheuxC--RIEzBjbcOQGqPw>
 <xmx:exj9X94uV-SRK8RHhD4qzXeYfUufR-jYLqzZ2hM57k1SFXbP8vpbIw>
 <xmx:exj9X9H5Ofo7l0beuecqyUDbiuzhq_l51bS8J0CDOHLbyn4m3nmUAw>
Received: from localhost.localdomain (unknown [180.97.240.21])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1FAB108005C;
 Mon, 11 Jan 2021 22:33:10 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/mips/loongson3_virt: Add TCG SMP support
Date: Tue, 12 Jan 2021 11:32:51 +0800
Message-Id: <20210112033253.138140-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now it can boot with SMP.
TCG SMP appears to be extremely slow that the boot time
extended for about 3 times.
Also I tried to enable MTTCG for mips64el but system get
stucked at boot.

Jiaxun Yang (2):
  hw/intc: Add Loongson Inter Processor Interrupt controller
  hw/mips/loongson3_virt: Add TCG SMP support

 hw/intc/Kconfig                |   3 +
 hw/intc/loongson_ipi.c         | 146 +++++++++++++++++++++++++++++++++
 hw/intc/meson.build            |   1 +
 hw/mips/Kconfig                |   1 +
 hw/mips/loongson3_bootp.h      |   1 +
 hw/mips/loongson3_virt.c       |  20 ++++-
 include/hw/intc/loongson_ipi.h |  20 +++++
 7 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 hw/intc/loongson_ipi.c
 create mode 100644 include/hw/intc/loongson_ipi.h

-- 
2.30.0


