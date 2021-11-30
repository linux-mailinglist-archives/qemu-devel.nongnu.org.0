Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD7463FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 22:18:58 +0100 (CET)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msAWe-0005Cb-Rc
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 16:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVM-0003oy-PB
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVK-0003l5-LC
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:36 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B0405C0114;
 Tue, 30 Nov 2021 16:17:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 30 Nov 2021 16:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id; s=fm3; bh=qxiaGQ8PMrZRJlNS7j
 01DgqxWd8+eZHYMv/YbF5tBow=; b=IEAzbE5ShOQXzORnJIPBTh0z960a3xV2bn
 EdllBWwGAib++BD2m4la762HHlc4xAs093wPFNlmXPCAN5olV3OXdbCdvj769yaI
 qRShaqhD/oZ08o37APgcjF2bwsYf5Nd8TOM98P9lz/wGO3N3pJuobfUBESmbaM8w
 FrCbl8Rhf3FFEt87An9rfM2c8SEKLsLHVjjb+rZWCx8YN1PTKRpHfFMybPeVSrUN
 kQepZ/GM6uPN2xszEQXtL8jdGSPZrlwMfFY79PUtzeTJoZwKOf49TOzFunZwWg9X
 Dx6czRcOClQMNhC7wc5x7FpPxqD22RzqT7um+KiWKu1nY8iEueZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qxiaGQ8PMrZRJlNS7j01DgqxWd8+eZHYMv/YbF5tBow=; b=M3bc76YQ
 Y2+I9lb+8ZULYpKIFmAQEiGhO9Xe9icsEj/PKAwnyHPUB3iGbGbqnL2XZqssE+Tx
 NP+xycGCMjF9PXSCwAPCjN1rZtYkEouK24tw5NmnGVTWNtV+OxFm1lfLUnKv22bi
 Ln6yT81PJ8HD/E31RR+joWlz7z4WBB35zZEa/x1IqOF1eyBH5U7+YqX7/hM6LJ8c
 NeniVvbdW+M+HWS0pi6ns6LETi+X+rTZyZSupkwxq6eK2lnSfjLRh635VR+xoALG
 pfuXqsofwbxHpOjQYMrZ7IVGnQOKQJ2tw8WeE+wkWiZeCt5tTxZx9CoUbzT+YNPX
 i5laTOYpphF7Dg==
X-ME-Sender: <xms:7JSmYfDQ0KMFQWzBrg0DS0nABFurp9Bkj265KobiKTcW9YMn0oEVDg>
 <xme:7JSmYViy1mCFr4sO4F-hx0MTovHq6Gk_a8lovP_Qoho1h22dspDytHxf3lHOkTgA1
 JcZ3aDS9AouQ-5KQgQ>
X-ME-Received: <xmr:7JSmYalXJdAnlbdghUqU_VAOOKu-ebsRGWm9o6HxwWHNG2s7snnzHaRA1bc9aXYgSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddriedugddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofestddtredtredttd
 enucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfdtkedvuddukeekueelteeuke
 ekhfffudegjeekudetleefudegvddvledvueenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrd
 gtohhm
X-ME-Proxy: <xmx:7JSmYRyVV8-6jSR0gvNy3jlnXsmeFnwuEtzoW5uQ34cAesugyNiYiA>
 <xmx:7JSmYURpVfIKfwDPU1PwSqrG9vSDJ_Rwt96z0mezqeCAho9OWEIxwQ>
 <xmx:7JSmYUaGh26VNfeiPH3rvYhMgScH_rr-0JknTPtFzJvzbhfEmSNRxw>
 <xmx:7JSmYfKnSSxnw1quXqj_6O_TD3RhwPstT8RH8bqs_kea_y-8-p5HPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 16:17:31 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] MIPS misc fixes
Date: Tue, 30 Nov 2021 21:17:27 +0000
Message-Id: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.11.0
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two problems caught when I was trying to add CI job for various configurations.

Jiaxun Yang (2):
  hw/mips: bootloader: Fix write_ulong
  hw/mips/boston: Fix elf_load error detection

 hw/mips/bootloader.c | 6 +++++-
 hw/mips/boston.c     | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.11.0


