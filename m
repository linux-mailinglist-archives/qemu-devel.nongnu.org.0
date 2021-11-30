Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1921463FD1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 22:21:06 +0100 (CET)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msAYk-0008DH-1Y
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 16:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVN-0003pW-4k
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:37 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msAVL-0003lL-1X
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 16:17:36 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A5995C0183;
 Tue, 30 Nov 2021 16:17:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 30 Nov 2021 16:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references; s=
 fm3; bh=SmJPaERWdMqTuz0UPu68VtWbFnJlanPSbui6sViHGt0=; b=Ah6HfbDC
 JwIBs8hTHofvWv7gfflwCc5DN6V2Uda4v9QTVjk7Qr5unx4rxmJ+2V/Y1TiWVlGO
 grxQRaQYz5KnH6TsKi9EbulnVB5lY/E8Cwg9OWYL0i1oOLk5d0/hlbW8KhfLeEab
 StKeGkWvzgWHvh9t1xGsbYmQTOHS1Bg5xHxCK6plCc1Hrwfk0KwvHQVoZ8ns+X5V
 dxJq9Rqvus8048CwShEl5YIjnCjD5nzEkv35FqJf6ifK8hT4OuzfH9tX6yi4aFSG
 a4L28J7wCHQcLUgm7Ec95vRpXTjoi6/sYgiBVBCLeax0AnUOw3cYxRrGDVuGulbN
 IHPIhox/mwwO2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=SmJPaERWdMqTuz0UPu68VtWbFnJla
 nPSbui6sViHGt0=; b=cyOUmVewHVTf72aaOIw0gvCwlQ887kZdIyt9TNJkisiDa
 ShyGPbtI86Ye+f+KC0Jy/p4KA7OI0/iPCFdZst56kyKCiZF1UQHSY6B7gqHDLSQX
 kew1N5yCBX1cnmxO9/x0b0/UhIDrrPN0CbK0ExX14ABGscvnq9AMw+HvVyznotDI
 gVN7NNA6kMp0hlUZmYb1GAKRE+xpV0KMQNO1DTWzW0cpSU4tE6Dg8ikJWuAFX0c2
 TT+8t9F0rech//0FTBjNzTUC+XppHTs8U64PqKTaP9xtAZS/W1yJDjE+YObyBgUw
 er0VcdzJcQxZJSexsRfO7jLA0rjnlU4pGcYjZ5IQA==
X-ME-Sender: <xms:7pSmYX2xR5KSUmN2YiYpl5gWm6q5Upcmqqb8oX85k0lziWrJmCoq-g>
 <xme:7pSmYWH8Lv8SYf7WZJFEZxOJMSXkwG83cKnVNYc2JKN56XxzaLzeglRNT5DGE7kP2
 fOVwV7g3vA-2NS0zjY>
X-ME-Received: <xmr:7pSmYX7zjJx6veKMZjtREkA0TM8hJsHl3WtBoDQKiiDdar5OES3bTcsCZZ2gilmJUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddriedugddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhestddtredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefvdehkeeugeffhfejteduhf
 duudeltdegtdfgheekudelhedtudfhudfgleevveenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
 htrdgtohhm
X-ME-Proxy: <xmx:7pSmYc1M0kuW4_59IxpQrVGO5LHbWnGmFyMwoIxG97kmFAXEyS5TtQ>
 <xmx:7pSmYaGlygg5Uqyr09DB63R9PqwOaX_jgLLvPFXzGRGqQMvP1hNJSg>
 <xmx:7pSmYd_HaZ7-YwP8hn_XyLc_gZyyBQkQyWEova5M6faJZfy7bf5ZtA>
 <xmx:7pSmYcNEx-vnNI8948CSmIqelqW5gElZ_4dAzQsfmcOW8fvmFGifKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Nov 2021 16:17:33 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/mips/boston: Fix load_elf error detection
Date: Tue, 30 Nov 2021 21:17:29 +0000
Message-Id: <20211130211729.7116-3-jiaxun.yang@flygoat.com>
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

load_elf gives negative return in case of error, not zero.

Fixes: 10e3f30 ("hw/mips/boston: Allow loading elf kernel and dtb")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
For 6.2.
---
 hw/mips/boston.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 0e3cca5511..296e9fa2ad 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -777,14 +777,15 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        uint64_t kernel_entry, kernel_high, kernel_size;
+        uint64_t kernel_entry, kernel_high;
+        ssize_t kernel_size;
 
         kernel_size = load_elf(machine->kernel_filename, NULL,
                            cpu_mips_kseg0_to_phys, NULL,
                            &kernel_entry, NULL, &kernel_high,
                            NULL, 0, EM_MIPS, 1, 0);
 
-        if (kernel_size) {
+        if (kernel_size > 0) {
             int dt_size;
             g_autofree const void *dtb_file_data, *dtb_load_data;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
-- 
2.11.0


