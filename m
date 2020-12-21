Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A712DF760
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 02:01:58 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9aH-0005LK-3t
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 20:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9Sv-0007dP-K4; Sun, 20 Dec 2020 19:54:21 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9St-0005UD-99; Sun, 20 Dec 2020 19:54:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16A10580424;
 Sun, 20 Dec 2020 19:54:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=G6GrFNYxw3Hpn
 lVCxc/Y26AMqdyir1vl9w0Jd4+e1xY=; b=m3VXv3fTWuG+aNWC2Bx7t9oV0jzRa
 446f7x6Jki/oxhC8SWH0+X7gF9mqAd9HdAXkOcXQyXl/BdPyGPFili6UyEuhExIs
 WN//+2jp8oBvMWzEl9eZX5vpsMBwvODI6+yn3olSZFiN+KrsnpemEkErL2k7cKK5
 ap83ZfnlGz5ebZCxT+fDSav8CaWKWmacLO3Xn/7d9yVM43Qzb+Y7lxLz9qcd3G5s
 vHELtXU3LbhFAEYWiKiQpMGMmSCovFfy4j8rB4Ue/T9kAE/gbtV+QXhD86LRhJz4
 8YmLL22xbEdYmyCsPtD/wLMq4IUZHiqvghkiAorwX8Dhu7zwtxSS5rnng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=G6GrFNYxw3HpnlVCxc/Y26AMqdyir1vl9w0Jd4+e1xY=; b=h77b8TCU
 wSGbAzb6GrMsCt4X7FEOkEr/a2aCMzvKdYCGYtuFs+r++hQGgDLqg7bosOyZZnYT
 bzzpPXc3GXas1euO6lEUorHjV+lRtSRaWSCLxVgSAet+enIxSAzInVsSbwLFB/3z
 RxNnLyuux798GDVmgBXalxxObKbw9ld+KkoNCT7feWPafxvytStRqIuIGjC5QuQS
 HuiB9UX0lUCfwlpp6IDxMbcuySHAnKpUkZzFDtjssOed1XIEa63a+j0YQz/XuBjy
 1EqE1VcICjQjc3sH9/yLhShQfVdracLxM9TRf+C5/jmjC1UIAwZofzslpLoapKE0
 YuaP/kwO12kkIQ==
X-ME-Sender: <xms:OfLfX0I-VeQKpZRdijoLZAGNLXpr3RxjUBKYar8qPRZGL2SwpIp6ow>
 <xme:OfLfX0LqCLdXk8ZWe6zhmEt4Z_TPxy-BOQpc6nBTrB1zXljY6WBnkI2lYwIMg4HWY
 IdrFGXOK-8GFLgFzRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepgeduheekudduheektedvveffieevteetfeefieekudffieduudet
 vdetffeileeknecuffhomhgrihhnpehophgvnhhgrhhouhhprdhorhhgpdhphhihshhitg
 grlhhmvghmohhrhigslhhotghkrdhruhhnnecukfhppeeghedrfeefrdehtddrvdehgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgi
 hunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:OfLfX0tiexmnrlWm05fe77Bbjn8d8de3YOhLTXQLvSbjMwXGZEQwPQ>
 <xmx:OfLfXxao359w91XssSEuGeRf46M_XEW1F2lElbfOPDMdkblFefxBqA>
 <xmx:OfLfX7YZykcPmV0qmeYBUi8OesIUYggtZLKBta9R3zz1iQg60FXxZg>
 <xmx:OfLfXxx9-VNDQvkfy9MvdItXzE3GsgJmbteGJiCTVCswZ7j9GroAsyfexKJjpz8D>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id D1EF424005A;
 Sun, 20 Dec 2020 19:54:07 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
Date: Mon, 21 Dec 2020 08:53:14 +0800
Message-Id: <20201221005318.11866-6-jiaxun.yang@flygoat.com>
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
 contrib/elf2dmp/addrspace.c |  4 ++--
 contrib/elf2dmp/addrspace.h |  6 +++---
 contrib/elf2dmp/main.c      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/contrib/elf2dmp/addrspace.c b/contrib/elf2dmp/addrspace.c
index 8a76069cb5..53ded17061 100644
--- a/contrib/elf2dmp/addrspace.c
+++ b/contrib/elf2dmp/addrspace.c
@@ -207,8 +207,8 @@ int va_space_rw(struct va_space *vs, uint64_t addr,
         void *buf, size_t size, int is_write)
 {
     while (size) {
-        uint64_t page = addr & PFN_MASK;
-        size_t s = (page + PAGE_SIZE) - addr;
+        uint64_t page = addr & ELF2DMP_PFN_MASK;
+        size_t s = (page + ELF2DMP_PAGE_SIZE) - addr;
         void *ptr;
 
         s = (s > size) ? size : s;
diff --git a/contrib/elf2dmp/addrspace.h b/contrib/elf2dmp/addrspace.h
index d87f6a18c6..00b44c1218 100644
--- a/contrib/elf2dmp/addrspace.h
+++ b/contrib/elf2dmp/addrspace.h
@@ -10,9 +10,9 @@
 
 #include "qemu_elf.h"
 
-#define PAGE_BITS 12
-#define PAGE_SIZE (1ULL << PAGE_BITS)
-#define PFN_MASK (~(PAGE_SIZE - 1))
+#define ELF2DMP_PAGE_BITS 12
+#define ELF2DMP_PAGE_SIZE (1ULL << ELF2DMP_PAGE_BITS)
+#define ELF2DMP_PFN_MASK (~(ELF2DMP_PAGE_SIZE - 1))
 
 #define INVALID_PA  UINT64_MAX
 
diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index ac746e49e0..20b477d582 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -244,8 +244,8 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
     WinDumpHeader64 h;
     size_t i;
 
-    QEMU_BUILD_BUG_ON(KUSD_OFFSET_SUITE_MASK >= PAGE_SIZE);
-    QEMU_BUILD_BUG_ON(KUSD_OFFSET_PRODUCT_TYPE >= PAGE_SIZE);
+    QEMU_BUILD_BUG_ON(KUSD_OFFSET_SUITE_MASK >= ELF2DMP_PAGE_SIZE);
+    QEMU_BUILD_BUG_ON(KUSD_OFFSET_PRODUCT_TYPE >= ELF2DMP_PAGE_SIZE);
 
     if (!suite_mask || !product_type) {
         return 1;
@@ -281,14 +281,14 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
     };
 
     for (i = 0; i < ps->block_nr; i++) {
-        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / PAGE_SIZE;
+        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / ELF2DMP_PAGE_SIZE;
         h.PhysicalMemoryBlock.Run[i] = (WinDumpPhyMemRun64) {
-            .BasePage = ps->block[i].paddr / PAGE_SIZE,
-            .PageCount = ps->block[i].size / PAGE_SIZE,
+            .BasePage = ps->block[i].paddr / ELF2DMP_PAGE_SIZE,
+            .PageCount = ps->block[i].size / ELF2DMP_PAGE_SIZE,
         };
     }
 
-    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << PAGE_BITS;
+    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
 
     *hdr = h;
 
@@ -379,7 +379,7 @@ static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
     size_t pdb_name_sz;
     size_t i;
 
-    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= PAGE_SIZE);
+    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
 
     if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
         return 1;
@@ -509,10 +509,10 @@ int main(int argc, char *argv[])
     }
     printf("CPU #0 IDT[0] -> 0x%016"PRIx64"\n", idt_desc_addr(first_idt_desc));
 
-    KernBase = idt_desc_addr(first_idt_desc) & ~(PAGE_SIZE - 1);
+    KernBase = idt_desc_addr(first_idt_desc) & ~(ELF2DMP_PAGE_SIZE - 1);
     printf("Searching kernel downwards from 0x%016"PRIx64"...\n", KernBase);
 
-    for (; KernBase >= 0xfffff78000000000; KernBase -= PAGE_SIZE) {
+    for (; KernBase >= 0xfffff78000000000; KernBase -= ELF2DMP_PAGE_SIZE) {
         nt_start_addr = va_space_resolve(&vs, KernBase);
         if (!nt_start_addr) {
             continue;
-- 
2.29.2


