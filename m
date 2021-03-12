Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FDA3382FF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:05:19 +0100 (CET)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKWEv-0007GW-Px
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lKWDU-0006L6-NR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:03:48 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lKWDR-0008NZ-QD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:03:48 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C40915C00E1;
 Thu, 11 Mar 2021 20:03:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 11 Mar 2021 20:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=0utuuhQiJ+Uascqr0KAIfp2vzy
 m7MATVMwzI1HAhSYQ=; b=Jr4i7d+56p+V0jCMh/zK0wHU2dlMYPU45svEic4uqX
 KTOMgihw5cPPIwnJ1PzrzGLxCTk4ju9MbtgR4YJpNjh1c6i5zF7X8ft0Yxdpu7zt
 i0dK8tHRE+YAsG/LXrhINrD6zBI+xAhoVtQ1ySO9qzNcWRoktuq+k8Nd6SQ/Tl9B
 RmE3C1JG016Bj9rLD7zDrRk0Mu20SiPE7LhuvnQZyXrD0zaBUIY/ATgq6M0b9yKX
 1b+ejGasohoMKa6BLsx4fx27upfOXHGIRvwzLQlp/xwUwU/zhCCynzzwIyU50wO2
 HM1eVlFgyFuGILpHD/vaENkOv1hslhGsc0cT7VOD+qLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0utuuhQiJ+Uascqr0
 KAIfp2vzym7MATVMwzI1HAhSYQ=; b=shtU1EI767Kbbp62p39ZDdi5y/GelmAkr
 wI6qhaDRV7W8UOlxy9GffEMHLUaEW2g0NCwt9D/4Entr/PDW75iOAgxkemDPqWcw
 6XMWy0leqoh2KES9gNNmHyEZrv2xwjjjsUed4auNCqB0h+vWieXM/ot3oef2KK3a
 yBPj41Jo6FrRv9qe63liPP929NKEv9drbYmEPGafLuVe6z9vIAWZvas9zR2ChxI7
 bzRFRp9HRnWhymM3k3e0i5dJD0pzrvwQO1+wi6bv1PWzWR2hUhA3ueJOiG1ZY4ZG
 DADXtEY1dZpi6mc4lfTzGje9UExG3CE1Rioec3QYsbf37Nqrde4Iw==
X-ME-Sender: <xms:771KYJB6bwWCnmyLlva13mHMBLr9rcoF4s8obIiUKaOTGhMPjTQ8Mg>
 <xme:771KYHirSp2k2-jXvoDGDlMT6Z4k_sL0Uk_DoVz1xyPN5YrpPcJB2QZHVTmCSJk17
 oARNPKDF27kVCDzqFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhepkeduffeikeejleduudfhffeijefhhfejhedtfeefjeejgfefjeevfffg
 ueeguddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddtuddrkedvrd
 dvfedurddukedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:771KYEkq2Sj22XveWmCw2qmjnfx0yyP0uEfXMcU8A4GF5EZIVqXOQw>
 <xmx:771KYDwDpA7lssm7EsedCUkViIsU8e7EI7-Sj3gl4kj0WmU0AVkhYg>
 <xmx:771KYOQMUdYfVFfHx4yFd9HKHXbXW9UiwWmc6RBp1DUa8u_xhwxnAw>
 <xmx:771KYMfdQH8SIhzdB_nfJNdRhDOQKreIMu6juuEwz0zoKiln0XCFsQ>
Received: from localhost.localdomain (unknown [101.82.231.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD21D108005C;
 Thu, 11 Mar 2021 20:03:39 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Deprecate Trap-and-Emul KVM support
Date: Fri, 12 Mar 2021 09:03:03 +0800
Message-Id: <20210312010303.17027-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upstream kernel had removed both host[1] and guest[2] support.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 docs/system/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index cfabe69846..a409c65485 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -496,3 +496,11 @@ nanoMIPS ISA
 
 The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
 As it is hard to generate binaries for it, declare it deprecated.
+
+KVM features
+-------------------
+
+MIPS Trap-and-Emul KVM support
+
+The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
+from upstream kernel, declare it deprecated.
-- 
2.30.1


