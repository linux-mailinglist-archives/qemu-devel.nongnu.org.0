Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B392F9A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:56:32 +0100 (CET)
Received: from localhost ([::1]:55814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OSl-00044N-Dg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBg-0002ij-4g; Mon, 18 Jan 2021 01:38:52 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:54189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBe-0007QT-23; Mon, 18 Jan 2021 01:38:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 29F4816AA;
 Mon, 18 Jan 2021 01:38:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=bDwgdjDoukPi9
 JhR44K/N5hfJGNEOGMrMrIINrNgeD0=; b=gdBewku4fRleeO5ZeEVnZFMVXFrSh
 5SxAcwUfdnIsED6kA/iCtJGhf6W3PtLa79eBWBBtMxdqJKEc1Qu/WkTJ+4l7sQPi
 3Wdjw6e0oMLl0he+233t9fuyNVBzkHoO5k1E40K03nxrYino8HZ4uMCZO4G5V9cy
 t+Lmg0f9mqDaBBGFqREjcO2t+z2vqZxBXIV4BDw40QPhT1OcfFlqalsXz8aHuuz3
 R60r5FL2OxQvaCEnTbAzcW5c1pWgMJ8yMwHJPTAnn9RC9y/oJ9kLqCfHijpnUhqF
 olJMYOOIPbDQwKwTbouQn63P/v18vVVlkQoIB1s14nvfrdAONOSxNfTiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=bDwgdjDoukPi9JhR44K/N5hfJGNEOGMrMrIINrNgeD0=; b=TfBJH/jY
 smmQGGO9rYfBLyi4Vj2JyyhA1bSy/ngjyi7JxzD6XjtG8EjcaY7e/EngcYbxJC5g
 X9vCbIGom+k9w3tA7aJjNxjHOZ6S4COjn3NE2uBNN0zezSmYBb/Az0c/D14RpcCv
 MAIBHI6NP5OjEm4BqCKKh5bGV8YIPEy9npB46XNazp7jwLqzk5cyy2rGO6nkOGZX
 nVZSZMIn2nxKPRO+8z699dGs+fGDg1nZpbvD8Uw1pu/VhH1JWCOoxVZKBfb6VjWR
 ADubhcdV48qJL2AYF41UJtEKEryqbg7cFm9g60vcP0bQ4tIXwOaF5X+phhXnXIVv
 4+cIyQ3sAggv2A==
X-ME-Sender: <xms:9SwFYOZB9uSs4I6rqB7KOj5OWXxc1GMC8brUNCmG9XGrI24eXvBB5g>
 <xme:9SwFYBbPDDjKRseiLmfEN9-zJ9dN1SgfQO3o06eaX3XCzHp95gOfJB3Xsaiubd7qQ
 sztpryAuvLo0zNpUwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpedtveehvdefleeghfeuveffjeeuffetffekhfeviedujeeiieevuddv
 iedtheffjeenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghenucfkphepudduie
 drvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:9SwFYI9IKlNdlZ9I1uxS_Nrv04Pw_oJ6KXRiBp1CSTqC10gz297r3Q>
 <xmx:9SwFYArL6JB8Pl4IP0imMBufBZr7HlFsYDkBPz56YO6ywnMI5UEPkQ>
 <xmx:9SwFYJozBe9WpycXqG53dG5_-B9jCzqJAN1egh5mIFqe4xAYvgwNSw>
 <xmx:9iwFYBYf-jk6paQdcVqIwdu649b8UqxYaAClk6GPq_LlWrCOpRuvU6h5TCiWEngX>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A8EC24005B;
 Mon, 18 Jan 2021 01:38:39 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
Date: Mon, 18 Jan 2021 14:38:03 +0800
Message-Id: <20210118063808.12471-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per POSIX specification of limits.h [1], OS libc may define
PAGE_SIZE in limits.h.

To prevent collosion of definition, we rename PAGE_SIZE here.

[1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/nand.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 123020aebf..cd26a14d57 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -115,24 +115,24 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
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
@@ -652,7 +652,7 @@ type_init(nand_register_types)
 #else
 
 /* Program a single page */
-static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
+static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
 {
     uint64_t off, page, sector, soff;
     uint8_t iobuf[(PAGE_SECTORS + 2) * 0x200];
@@ -672,11 +672,11 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
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
@@ -704,7 +704,7 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
 }
 
 /* Erase a single block */
-static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
+static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
 {
     uint64_t i, page, addr;
     uint8_t iobuf[0x200] = { [0 ... 0x1ff] = 0xff, };
@@ -716,7 +716,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
 
     if (!s->blk) {
         memset(s->storage + PAGE_START(addr),
-                        0xff, (PAGE_SIZE + OOB_SIZE) << s->erase_shift);
+                        0xff, (NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift);
     } else if (s->mem_oob) {
         memset(s->storage + (PAGE(addr) << OOB_SHIFT),
                         0xff, OOB_SIZE << s->erase_shift);
@@ -742,7 +742,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
 
         memset(iobuf, 0xff, 0x200);
         i = (addr & ~0x1ff) + 0x200;
-        for (addr += ((PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
+        for (addr += ((NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
                         i < addr; i += 0x200) {
             if (blk_pwrite(s->blk, i, iobuf, BDRV_SECTOR_SIZE, 0) < 0) {
                 printf("%s: write error in sector %" PRIu64 "\n",
@@ -763,7 +763,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
     }
 }
 
-static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
+static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
                 uint64_t addr, int offset)
 {
     if (PAGE(addr) >= s->pages) {
@@ -777,7 +777,7 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
                 printf("%s: read error in sector %" PRIu64 "\n",
                                 __func__, SECTOR(addr));
             }
-            memcpy(s->io + SECTOR_OFFSET(s->addr) + PAGE_SIZE,
+            memcpy(s->io + SECTOR_OFFSET(s->addr) + NAND_PAGE_SIZE,
                             s->storage + (PAGE(s->addr) << OOB_SHIFT),
                             OOB_SIZE);
             s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
@@ -791,23 +791,23 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
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
2.30.0


