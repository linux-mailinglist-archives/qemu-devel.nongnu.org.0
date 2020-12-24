Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CC2E2405
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:20:55 +0100 (CET)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHBO-0002e1-8j
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8s-00019G-CE
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:18 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:43439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH8m-0003XL-Lf
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:18 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B25D058032F;
 Wed, 23 Dec 2020 22:18:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=7CC1xyZjVdwBaXEcN6maONscl+
 huf7lbcAzDDky9JaI=; b=NmpiPqmEb9OHadHkNXvTG0k4a2+qukI9r0R5YQXYC8
 n1/iZ7QDxmAKxN/hE3zT75Lp4RHcm8EdNE+Oo++V8hU7qoLWsxz1IMp+xCa0bSKY
 Rm4Dzv9W8ct8+YdVnXDIlNtxqVuHqD1CrEisOzA3ZhRvEFuyPQm+TAwhf5e/zMWt
 6pbcIAiFY3cu7ZEnipCBdDKthN47JYiRhiide0w4stZVzpqCjuGNiLIJ9JHqmHiN
 lrWCMFlE3DfX7bBF/mZIW/4SV9KsY/ZVU3C1ouOXWYJjl86KBKIoqJ6vOO9u8xWC
 CDT6k7FfzHbyYNkLRobOak2J6yi3Z6g8IW/OJD8w1eTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7CC1xy
 ZjVdwBaXEcN6maONscl+huf7lbcAzDDky9JaI=; b=jGDMHWiXIFwgQbg+0io8xT
 A+ZEPsoHXlBfn4hgILalFd4milKck72i/SV52hvSL0b1g3O7FWakG5ErUOEEIco6
 q9HW6wtDH3zlxT/spBYshV9OhCsoN0BkTKB2Ddcsg8o2T6lPsUrdmGGfdICe4HMH
 RFMx6i4E84dzMFrVWLqkqXHlZOnPsdWDZZzi9TUWgQLUXuKJOChfJkmTDm3Nkd/7
 vUQRMwimUM9SCSVAq0Ct7LOaxoDMkiPBOEFByq68wBoF+sw/JWrawpFn+G2WQU13
 2R0hbUYVBkBd7Z4o08jElCQafh0DgufeYIGowHCsebIl0LG2i4wvuLMDtZ9Xwv1g
 ==
X-ME-Sender: <xms:cgjkXwSjZe1srwAJiHdUBpxWK26y2Gn6NDv9aM_w0znbDHHFLH-zoQ>
 <xme:cgjkX9wcYmw-yov_nB6qCMh5-rrlOAkKdPrDo2XEo5htuI5epGCQSPE15rR6BOiEk
 CqgAp_dW278knMEw2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpefgfeeivdeugfeuvefhleffveffleevueeiieeuteetheejueeuhefg
 tdeiledvudenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedvvdefrddutd
 egrddvuddvrdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:cgjkX91J5KU2m1iBNApMpC9ifyXmYp02LMhjNQSdvY_gFdGklUtnBQ>
 <xmx:cgjkX0BtL78N9tsu0AkfPS352_yHOFHKWBExwlfJKGxBR9jbX2uYMg>
 <xmx:cgjkX5jInHZzxxd8ZMoUWreFAONARXwZrGcWd-6sjg4jNcx2o1u_aA>
 <xmx:cwjkX5ciEJXqz4c_YUKUgLmtfwfyLWzoB48vWrhD8R87T43Rou0O4HNxFHc>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1962F1080059;
 Wed, 23 Dec 2020 22:18:05 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] hw/mips/fuloong2e fixes
Date: Thu, 24 Dec 2020 11:17:42 +0800
Message-Id: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It can now boot Debian installer[1] as well as a custom PMON bootloader
distribution[2].

Note that it can't boot PMON shipped with actual machine as our ATI vgabios
is using some x86 hack that can't be handled by x86emu in original PMON. 


Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/tree/fuloong_fixes_v2

v2:
 - Collect review tags.
 - Get CPU clock via elegant method. (philmd)
 - Add boot_linux_console scceptance test

v3:
 - Collect review tags
 - Typo corrections
 - Rewrite PCI Lomem

Jiaxun Yang (8):
  hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
  hw/mips/fuloong2e: Relpace fault links
  hw/pci-host/bonito: Fixup IRQ mapping
  hw/pci-host/bonito: Fixup pci.lomem mapping
  hw/mips/fuloong2e: Remove unused env entry
  hw/mips/fuloong2e: Correct cpuclock env
  hw/mips/fuloong2e: Add highmem support
  tests/acceptance: Test boot_linux_console for fuloong2e

 hw/mips/fuloong2e.c                    | 84 +++++++++++++++++---------
 hw/pci-host/bonito.c                   | 42 ++++---------
 tests/acceptance/boot_linux_console.py | 21 +++++++
 3 files changed, 89 insertions(+), 58 deletions(-)

-- 
2.29.2


