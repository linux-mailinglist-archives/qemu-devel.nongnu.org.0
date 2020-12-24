Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772112E240C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:23:53 +0100 (CET)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHEG-0006Fg-Fk
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9S-0001mB-EH
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:54 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH9P-0003je-Qw
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:54 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C208F580389;
 Wed, 23 Dec 2020 22:18:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=V0LuZZg623h5V
 3lLsQ0jXCAD1bYriarzFcP5TppuE58=; b=Cs/sZust+SicqqqX84GexvtW/Z4yN
 dnwR6I88xEzoNIKY82MXZ9RhKcOUZ7JhcJZViUn3Wz/AA+w8DrpYcx1FCjEoQZBc
 BckbVpfA/9bF1kZbxT26sBm9FCxRiTod/YSPzD+fnx3Z8LPeaQr3u1RtBWXBSy7X
 oMkmFpK67gyq3UNN+l70ETWxnJjklyyGLZJD/HVsxIEEafefmxGRoVU6sRZWJtTz
 QyW4a8d6/0O7WvlZwwgtMHJkggDCkh5pYsmfVCVRkRRd5bG2Q5/zGUnhk66hM8vr
 /vZQ00hvRX66Rqu5kUI8/5FWgHJzj+yCPHepmoaFROcSImQP9+62KhM/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=V0LuZZg623h5V3lLsQ0jXCAD1bYriarzFcP5TppuE58=; b=Tn934DUr
 nKOKGFgVIoRXpvwV7tT5lbCyZxm0Lk0KlRaNk3EVb7OW9zCC7MVPt6//JDLjf0og
 226YQS9ka53wXpXugbadH3q93SHxwog2OuUfHVjK6R9vPoVkuq9WZKEB1x5D7Cn0
 ULep6lBErYi+MbiL6IXQDxcelT+4vuy44EQ3wmkMpW9rnuUsCk7WiUlrLawbhRPg
 SIx0BO2cSbLgeXiQYj+KvcviF+SRHMiQ/6YXAD+3nL06xtZqrI7XFk80H5SAuqAG
 LmewaWbk1Zdd5nTdhnGsLHb0YQz4VNZKgZOfGPiS9Nb49NpHMnIvp1bLvVGpcec5
 rc7LJq9LO+xkUQ==
X-ME-Sender: <xms:mgjkX3hjo1CKdPK_dN310-bvHYbx2NBR3WkjHYBe28Yev5PuVjT_7Q>
 <xme:mgjkX0BGhSv_erHVn-gr23ud8RoceXBPKyEslDkYSBXtZOMRpdoFiND_sJoh1NB5G
 AogO4BVLGPD5B1b97A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepvdekieeutdejhfefgffhveeivdeitdegjeejudekgfejgeegudek
 ffegieffueffnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepvddvfedrud
 dtgedrvdduvddrheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:mgjkX3HBPH-zzISYiM4EdvBc_w-MZSk6ASN3dqzzzJWH4upduhRq6A>
 <xmx:mgjkX0RPuVnVj_pzcKrkPN_bQcI3m1MSQNLBwu_xFEOlvvBSqLN-2A>
 <xmx:mgjkX0ycEfhqjQLbfA_21snpJ2lrhCps7QTqk4EowyP_LT50Z2DDHg>
 <xmx:mgjkXzrdVu0pLMWUoKPNcRvXOuvybrKcG-EbmsXcOqE5ZNr3FZhOxvTpMNU>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E0A91080057;
 Wed, 23 Dec 2020 22:18:45 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] tests/acceptance: Test boot_linux_console for fuloong2e
Date: Thu, 24 Dec 2020 11:17:50 +0800
Message-Id: <20201224031750.52146-9-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel comes from debian archive so it's trusted.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
---
 tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cc6ec0f8c1..fb41bb7144 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -170,6 +170,27 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips64el_fuloong2e(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        """
+        deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
+                   'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
+        deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips_malta_cpio(self):
         """
         :avocado: tags=arch:mips
-- 
2.29.2


