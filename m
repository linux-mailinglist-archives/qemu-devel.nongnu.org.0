Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D033E5C3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:14:14 +0100 (CET)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKlJ-000431-1O
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lMKk5-0003Za-S0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:12:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lMKk3-0002MZ-Rm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:12:57 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6126D5C00E2;
 Tue, 16 Mar 2021 21:12:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 16 Mar 2021 21:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=EespId7H3o/W4EaTvL2QlocxIF
 aKUwKIRiCKzCEpiys=; b=VN7vJN4mT2Y5ZAbMcQjsswTfbcsxNxXxeB+okwGrPl
 m42uC/8JtiqrlLPnNc6+MCzgBpR+oYjDEFXHlsxx/icK6kFSBWJAAbOD/0L0tuoB
 4prvApp0DAAm0pA1Vnk6C+tKDzRP874FofiSIABfiIvt6oTx7k0F99KCly72USOm
 EZnJQsVaU+ee28ZSbQ0qzUtJJsbVJEkTX5oMPHVgEB5saE6I78r6jiZTYe1djVoS
 Axc1viyyzUqODiP6orj6AFRmz/2ewaYJOBdEVdfcj9YCxpifyr9Q/c6zAiIUVsZI
 NXfJ/3Es4jIiuYkcwVCjYQipAeU1U8EVf9UReYXGn36Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EespId7H3o/W4EaTv
 L2QlocxIFaKUwKIRiCKzCEpiys=; b=KTMO8ZMFn4FBja2HKI1qlZtZolbR1H7cJ
 0d2vZGs4yAyAypq2Xorny5M4FfEl2Ex4rWBozINgdXMpp7a7fXdVofz1XMRjTVnL
 RzmKaIXobxh6TDLU7lC3d5Cd5P2QHsbkQ7aLScVVA1NrkTBsh8g05x508mpfvOUk
 xAW+vB06TO0ox8bc7dofxAV4Lvo2gFCArA6LhFNf4ffTeiSNVb1fO3FNnfTPdwgi
 32zO/xV8FFSvFOdAEYmv4r49cTuziaLkNom/jetD0WzBIcAnlM3ti2NzjJzEbHUq
 aphV6f+BlON3OP4nRk3q2GBLfWVuphTZY0IH1AqKOYNn4UFIZa9gg==
X-ME-Sender: <xms:lFdRYLDsi369th9d15kr0dFLqEFTAZZOzj7MeoyY-b1_cChVn3sj9g>
 <xme:lFdRYBgDcLI-72BKXVNoxoBdGOGxnQljTpLHDxwqFQnQWZBHgep1YGbKEPZfw3nDo
 gHe_WsoqdJPkz5QwZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeffedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhepkeduffeikeejleduudfhffeijefhhfejhedtfeefjeejgfefjeevfffg
 ueeguddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepfeelrddugeegrd
 dutdehrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:lFdRYGk5-T0_HX7UlaMuWPNnNAbgM3M2GFA62CcdSXS7LpQtgV4IcQ>
 <xmx:lFdRYNwzYYzuonfVaVJiU6NRf6s-ebKz9uNZQR2kX_zKd2yD6YgjYA>
 <xmx:lFdRYASBDu3SIvSsH_PLaNi6OOqC2er-xA5KmPivXuoLxdkFgT_3_Q>
 <xmx:lVdRYGejmA3OdIk4YFptqZ4fWRKSE8UZ6Rx4Bo_y0SlcELHuhV42uA>
Received: from localhost.localdomain (unknown [39.144.105.103])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3388E108005C;
 Tue, 16 Mar 2021 21:12:48 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips: Deprecate Trap-and-Emul KVM support
Date: Wed, 17 Mar 2021 09:12:35 +0800
Message-Id: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=jiaxun.yang@flygoat.com;
 helo=out1-smtp.messagingengine.com
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

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Fix up tittle and sphinx format (f4bug)
Lost in the sea of emails :-)
---
 docs/system/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 5e3a31c123..9286cdd475 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -292,6 +292,15 @@ The ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, and
 ``acl_remove`` commands are deprecated with no replacement. Authorization
 for VNC should be performed using the pluggable QAuthZ objects.
 
+System accelerators
+-------------------
+
+MIPS ``Trap-and-Emul`` KVM support (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+The MIPS ``Trap-and-Emul`` KVM host and guest support has been removed
+from upstream kernel, declare it deprecated.
+
 System emulator CPUS
 --------------------
 
-- 
2.30.2


