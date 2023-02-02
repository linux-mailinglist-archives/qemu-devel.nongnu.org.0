Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3F687E85
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZXL-0006Q7-35; Thu, 02 Feb 2023 08:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pNZXF-0006Pa-UH
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:21:53 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pNZXD-0001Ke-E2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:21:53 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 12FAD5C0070;
 Thu,  2 Feb 2023 08:21:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Feb 2023 08:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1675344109; x=1675430509; bh=e0
 OQT4uz4ABVJKxxqXI7A6P/UBymcjnm1X3NoOPiCDI=; b=K+fY6d1T/WgI07c59L
 zIFm/FcQXm9isY80Tr6VUFW673PPZMocvlvtTf4S/W/rEdsGABHy6OihzSJL8O5o
 fC18fUWvdFzt4xoEGWeci310/UblC190/3HmCo+nqvk4R65uhGvd8P5xZPt2r7IH
 T2XS+NnBr+XIv27+CIYxwmU33zAlYxlTOZ2BMHRXj9iYEtBBhW35DsvZfc+DJ98l
 tgM2L+gnDO2igpKUomSxsiC9mEcXBK4TSJPfnbFqihFWimN2WwOq3fQhnLfCaz9O
 KpejMYqXolBERGfQDHyYKb5NW3MqoQtvIT9t2by2cBJQLacG3nh0jijbtS70bZRg
 9d+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1675344109; x=1675430509; bh=e0OQT4uz4ABVJ
 KxxqXI7A6P/UBymcjnm1X3NoOPiCDI=; b=ZRvVLm3kRZXOOlVPqbZQsLGkvN6+P
 0Wso5h9rwgYp7V9vZCHY54KFfyB8GmV/aWBpI66xLgCwjTR3S50iN7WQtQ2W9m94
 WCeIK8bL3lj89/A44j+dwqMKc0UVUaES8DkA5ZDO90gkA1PIK+7acj2H0ZAMHzj6
 5kFtCXnaQI9Um/DbD5/nGkTBIPLKMiW4QSHx91bkhojixm+AX6zeGq7XqPgk74Sw
 vHxZj7RSKj9ciuhVI0q4lXhroyuCjFOPqx3nJidTYeM7ylRAK43PByZ300qIVhJP
 0XnFfOb78kTukoqcWw26FPa+GFwbVOTNpcN1rCwLvJieTbycW4oIljqQw==
X-ME-Sender: <xms:7LjbY0tOL9FfjjlUoCq5LCKbLM_ga1rNsp44na4wn4O7uZmqqhIWjA>
 <xme:7LjbYxfUlRBzDD0ZOvkkigdv0r0RiQzHY3WSn8_6W_r4YJVHELq_o8YAprBnv5s14
 GOTwWlnqka1fP-pU5Q>
X-ME-Received: <xmr:7LjbY_xP7Bp-HQmILF4etdhSRKPfz-mo_uVvnu7EDYRWrjWZeFe88EsxFj_d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:7LjbY3PirU-RWGdBBKRk28t6orabqvTOSOCMkS_rTXXuSt8QyeTGDA>
 <xmx:7LjbY0-BxN4jHKgav24mFPOO36r56gyQ9EhbdYOGPn8dje4NqAhGmA>
 <xmx:7LjbY_Wkkp1oEILEdhqq4tDC5w3BBD9Z9cs1SfR8NOznWEa_vg820Q>
 <xmx:7bjbY2LJ2kF0Y0RKfCCTlp-DG75GYpy3SZsEqhoSmWJKGgOIETNoyA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 08:21:47 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, balaton@eik.bme.hu,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/3] docs/system: Remove "mips" board from target-mips.rst
Date: Thu,  2 Feb 2023 13:21:36 +0000
Message-Id: <20230202132138.30945-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
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

This board had been deprecated long ago.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 docs/system/target-mips.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
index 138441bdec..83239fb9df 100644
--- a/docs/system/target-mips.rst
+++ b/docs/system/target-mips.rst
@@ -8,8 +8,6 @@ endian options, ``qemu-system-mips``, ``qemu-system-mipsel``
 ``qemu-system-mips64`` and ``qemu-system-mips64el``. Five different
 machine types are emulated:
 
--  A generic ISA PC-like machine \"mips\"
-
 -  The MIPS Malta prototype board \"malta\"
 
 -  An ACER Pica \"pica61\". This machine needs the 64-bit emulator.
@@ -19,18 +17,6 @@ machine types are emulated:
 -  A MIPS Magnum R4000 machine \"magnum\". This machine needs the
    64-bit emulator.
 
-The generic emulation is supported by Debian 'Etch' and is able to
-install Debian into a virtual disk image. The following devices are
-emulated:
-
--  A range of MIPS CPUs, default is the 24Kf
-
--  PC style serial port
-
--  PC style IDE disk
-
--  NE2000 network card
-
 The Malta emulation supports the following devices:
 
 -  Core board with MIPS 24Kf CPU and Galileo system controller
-- 
2.37.1 (Apple Git-137.1)


