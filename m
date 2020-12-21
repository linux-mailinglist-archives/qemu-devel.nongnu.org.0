Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB22DF758
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 01:56:51 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9VK-0001Ov-Pa
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 19:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9T6-0007zg-93; Sun, 20 Dec 2020 19:54:32 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9T4-0005Ye-6B; Sun, 20 Dec 2020 19:54:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 17363580427;
 Sun, 20 Dec 2020 19:54:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zCKncd9YBiJLe
 /SIK46OV+jqTbALSNNeyfKkVIBdzbQ=; b=bVgCmclr1Iko8K5v3zpByutM15xeU
 E6An0F6L9PO65AO2T4DBJXskDWWOYSiap1ieS8GPXoVTsm01JV4RE7Zdj8b3q6vf
 t3VdrPZnRCHSXVyUhXn8MU4IPR8RDOrF0f4hIDSvRc/nHauok9LBw5/pGXSvfszK
 1A7zAyp2yoEgcg22nSt3QY8JBClBMrMl3CTIeOQ2Tnt48CrbxrQgZf5uuBAOPetX
 +Iyr7ZXrLLhFHgcXoWf5BAw4og/j8hlNXAGQS6KbhcneQIkzVUGo6LBHNdvrWJuI
 AK9Lbi0SsVqc53CEwg9zGn8gVhSkW5DWJbB5Mg6RhquQnC1n0hMYwamGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zCKncd9YBiJLe/SIK46OV+jqTbALSNNeyfKkVIBdzbQ=; b=MdzJ7l3Z
 GlxIEztRG70zvXN8MmOKTf0hidDPSyjfdmjiJATwdniN4lfx0JLYKkca+972hI/R
 AOe2ntN5MFNqvV6NXJ8O7Q0BD0vfjC2wIsKcNT5rragJwK5b6TXNdYATN2REpRln
 IneBvHJHG9UG9uXgLXXrXxerw9zitbvBG15KOP9ib82bVXwZwF55D/PXl3iHnj9k
 r1taxEbC3FO8GbsjFsYGpbfmDP5TB6uF4faLpQcTU1Y9ZYBuUkaxBUhNVmAxiwU0
 EJdXiYqlXlnjeVQ6c9MMz2N4+wZFrFZZRIyucKeJRvSk+437Bk2f9RdQ+m0OdJfQ
 8DJToMpINHWfvg==
X-ME-Sender: <xms:RPLfXxIRc5Lcm4-jP30K8aA4Ty5RvfQDu635aIrMeE6iOjkroxT25g>
 <xme:RPLfX9KM4lyVQy8NgqXgP8CfjfCEM51bI8m_ioF8vJMFpqpUtW-7uImbuYvkJC3Pc
 mgKAS_xCvb8r77GyxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnheptdevhedvfeelgefhueevffejueffteffkefhveeiudejieeivedu
 vdeitdehffejnecuffhomhgrihhnpehophgvnhhgrhhouhhprdhorhhgnecukfhppeeghe
 drfeefrdehtddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:RPLfX5v58vsx7hk9EXBceeO0bvPDgFwLIYSpNWt9ZkGyHvI2MhEGwA>
 <xmx:RPLfXyb1fFy53ncaANO-XuiRweLnYNC-5Zt8KTRlQO5A7qfSC29X_A>
 <xmx:RPLfX4ZJwNS5nW45vxaQPkJXixaYTXUXzycYASTr8WqOp4b0JaTsPA>
 <xmx:RPLfX-ytoaboPKuev0Okn0NbMBNFS8PAkjAC7OGFN5OsjZoTXG5UWvPYlvVOp6JX>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A242240057;
 Sun, 20 Dec 2020 19:54:17 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
Date: Mon, 21 Dec 2020 08:53:15 +0800
Message-Id: <20201221005318.11866-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per POSIX specification of limits.h [1], OS libc may define
PAGE_SIZE in limits.h.

To prevent collosion of definition, we rename PAGE_SIZE here.

[1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/block/nand.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 1d7a48a2ec..17645667d8 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -114,24 +114,24 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
 # define NAND_IO
 
 # define PAGE(addr)		((addr) >> ADDR_SHIFT)
-# define PAGE_START(page)	(PAGE(page) * (PAGE_SIZE + OOB_SIZE))
+# define PAGE_START(page)	(PAGE(page) * (NAND_PAGE_SIZE + OOB_SIZE))
 # define PAGE_MASK		((1 << ADDR_SHIFT) - 1)
 # define OOB_SHIFT		(PAGE_SHIFT - 5)
 # define OOB_SIZE		(1 << OOB_SHIFT)
 # define SECTOR(addr)		((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
 # define SECTOR_OFFSET(addr)	((addr) & ((511 >> PAGE_SHIFT) << 8))
 
-# define PAGE_SIZE		256
+# define NAND_PAGE_SIZE     256
 # define PAGE_SHIFT		8
 # define PAGE_SECTORS		1
 # define ADDR_SHIFT		8
 # include "nand.c"
-# define PAGE_SIZE		512
+# define NAND_PAGE_SIZE     512
 # define PAGE_SHIFT		9
 # define PAGE_SECTORS		1
 # define ADDR_SHIFT		8
 # include "nand.c"
-# define PAGE_SIZE		2048
+# define NAND_PAGE_SIZE		2048
 # define PAGE_SHIFT		11
 # define PAGE_SECTORS		4
 # define ADDR_SHIFT		16
@@ -661,7 +661,7 @@ type_init(nand_register_types)
 #else
 
 /* Program a single page */
-static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
+static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
 {
     uint64_t off, page, sector, soff;
     uint8_t iobuf[(PAGE_SECTORS + 2) * 0x200];
@@ -681,11 +681,11 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
             return;
         }
 
-        mem_and(iobuf + (soff | off), s->io, MIN(s->iolen, PAGE_SIZE - off));
-        if (off + s->iolen > PAGE_SIZE) {
+        mem_and(iobuf + (soff | off), s->io, MIN(s->iolen, NAND_PAGE_SIZE - off));
+        if (off + s->iolen > NAND_PAGE_SIZE) {
             page = PAGE(s->addr);
-            mem_and(s->storage + (page << OOB_SHIFT), s->io + PAGE_SIZE - off,
-                            MIN(OOB_SIZE, off + s->iolen - PAGE_SIZE));
+            mem_and(s->storage + (page << OOB_SHIFT), s->io + NAND_PAGE_SIZE - off,
+                            MIN(OOB_SIZE, off + s->iolen - NAND_PAGE_SIZE));
         }
 
         if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
@@ -713,7 +713,7 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
 }
 
 /* Erase a single block */
-static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
+static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
 {
     uint64_t i, page, addr;
     uint8_t iobuf[0x200] = { [0 ... 0x1ff] = 0xff, };
@@ -725,7 +725,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
 
     if (!s->blk) {
         memset(s->storage + PAGE_START(addr),
-                        0xff, (PAGE_SIZE + OOB_SIZE) << s->erase_shift);
+                        0xff, (NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift);
     } else if (s->mem_oob) {
         memset(s->storage + (PAGE(addr) << OOB_SHIFT),
                         0xff, OOB_SIZE << s->erase_shift);
@@ -751,7 +751,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
 
         memset(iobuf, 0xff, 0x200);
         i = (addr & ~0x1ff) + 0x200;
-        for (addr += ((PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
+        for (addr += ((NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
                         i < addr; i += 0x200) {
             if (blk_pwrite(s->blk, i, iobuf, BDRV_SECTOR_SIZE, 0) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n",
@@ -772,7 +772,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
     }
 }
 
-static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
+static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
                 uint64_t addr, int offset)
 {
     if (PAGE(addr) >= s->pages) {
@@ -786,7 +786,7 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, SECTOR(addr));
             }
-            memcpy(s->io + SECTOR_OFFSET(s->addr) + PAGE_SIZE,
+            memcpy(s->io + SECTOR_OFFSET(s->addr) + NAND_PAGE_SIZE,
                             s->storage + (PAGE(s->addr) << OOB_SHIFT),
                             OOB_SIZE);
             s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
@@ -800,23 +800,23 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
         }
     } else {
         memcpy(s->io, s->storage + PAGE_START(s->addr) +
-                        offset, PAGE_SIZE + OOB_SIZE - offset);
+                        offset, NAND_PAGE_SIZE + OOB_SIZE - offset);
         s->ioaddr = s->io;
     }
 }
 
-static void glue(nand_init_, PAGE_SIZE)(NANDFlashState *s)
+static void glue(nand_init_, NAND_PAGE_SIZE)(NANDFlashState *s)
 {
     s->oob_shift = PAGE_SHIFT - 5;
     s->pages = s->size >> PAGE_SHIFT;
     s->addr_shift = ADDR_SHIFT;
 
-    s->blk_erase = glue(nand_blk_erase_, PAGE_SIZE);
-    s->blk_write = glue(nand_blk_write_, PAGE_SIZE);
-    s->blk_load = glue(nand_blk_load_, PAGE_SIZE);
+    s->blk_erase = glue(nand_blk_erase_, NAND_PAGE_SIZE);
+    s->blk_write = glue(nand_blk_write_, NAND_PAGE_SIZE);
+    s->blk_load = glue(nand_blk_load_, NAND_PAGE_SIZE);
 }
 
-# undef PAGE_SIZE
+# undef NAND_PAGE_SIZE
 # undef PAGE_SHIFT
 # undef PAGE_SECTORS
 # undef ADDR_SHIFT
-- 
2.29.2


