Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A46463FCC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 22:19:21 +0100 (CET)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msAX2-0005W8-86
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 16:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVN-0003q2-DQ
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:37 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVL-0003lC-FX
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:37 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B2DF55C00F4;
 Tue, 30 Nov 2021 16:17:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 30 Nov 2021 16:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references; s=
 fm3; bh=fmtfmTe7flwZ7Dsu10dFozw3xNvOHB49G1+Edt1rdm8=; b=jK9QzWzI
 Nx6iuCSQfrhYq60P0PF9BOco9mDFqK4AIc23YIjocRTsqehLDKHph/fwAhUXUXB/
 A7S7wp/6amY7Xg19HXxjWIAxA8//ZsLRXX7pEQJ6gtebviamEIzVNOkR6CzK4V3q
 6q2CJpIXy4L+BwtA8LjJGn+FvI5HlZVzUUejAYAosABxFQ8IKQmVzveyyfBXlX/O
 lP+3xKFhxDYZjuAB4YJU2M59EUfLqf4ih74cxC3EDJDpUBOs0MtOXmgcJ6EHSr07
 Qoijhr9wuxJDVqUqMYBvWiFOyLCAKXtXrKekWGYBnGdPoo9ENMddR6WMVQbCWmLM
 3vZSoTvCv4AGDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=fmtfmTe7flwZ7Dsu10dFozw3xNvOH
 B49G1+Edt1rdm8=; b=Jwkh0f9wdWqcgaXsqKaXXik8okXnVFsz6amYdeqjhXykj
 oB6MFx7O33uyZvrmJm1yf7wfTFvKvgBBBy3WSO4io+5KDaq1APda3pynXRlFZ+p2
 GY4BlapOmhYYYnCe45cWaISzXS1uX9yYGUwUyBttGxPUVvIUSayY+WGAoCFMCBxa
 pfhICg4vtLVtSHcOuprsbCw76dYsT0uEUUzb9kPyh535rYrlqKk1lAcRPzMOAmwh
 NOnqMFqgBWmvK8oqGFQFApMpK0xI8QStFtldouQu4D0b+07TTZ23HYN0GdosO/eB
 YwaO62A7dh+ouAVhWZire9C6o9oHIvdmGf1yYGzXQ==
X-ME-Sender: <xms:7ZSmYZ2uNIK1B_SREMkNX910Q5wnXHyhMRauP5loF01caQ4s0p9w4Q>
 <xme:7ZSmYQGDASz8HLN3-cOtGjsPZjE5CYdgjYb0USUCMWhuKa_mxxhdHG35XRipbkKBi
 tA9r7xlbTfdiLPQEug>
X-ME-Received: <xmr:7ZSmYZ4FpLLgcz1ESZ6kgsrYXs_OXBrutHOnL_JGq2WRJtTSDS0KGa_xAEQY-NATxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddriedugddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhestddtredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefvdehkeeugeffhfejteduhf
 duudeltdegtdfgheekudelhedtudfhudfgleevveenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
 htrdgtohhm
X-ME-Proxy: <xmx:7ZSmYW3EbeMBGgz3lZwqYWbaMSIYcvDYy2PhNS5-amx4pvmznYfewQ>
 <xmx:7ZSmYcFU9krWqvPebEZbwAkGGWTHldEbUw2m1ve1GmcBnn-wWXN7WQ>
 <xmx:7ZSmYX8Y2jv32Aqs9XEISZfo11Qz5kCQwJ_EthrJ3C-hG7QtP37dXg>
 <xmx:7ZSmYWMQPrBUcWT-XfAYJfsxZrmwhqkiATdM6WaPWkEP02qeLXpzKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 16:17:32 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/mips: bootloader: Fix write_ulong
Date: Tue, 30 Nov 2021 21:17:28 +0000
Message-Id: <20211130211729.7116-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
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

bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
while sd is illegal on 32 bit CPUs.

Replace sd with sw on 32bit CPUs.

Fixes: 3ebbf86 ("hw/mips: Add a bootloader helper")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Should be backported to 6.0 onwards.
---
 hw/mips/bootloader.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 6ec8314490..99991f8b2b 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
 {
     bl_gen_load_ulong(p, BL_REG_K0, val);
     bl_gen_load_ulong(p, BL_REG_K1, addr);
-    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+    } else {
+        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+    }
 }
 
 void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
-- 
2.11.0


