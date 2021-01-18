Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63272F9A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:48:35 +0100 (CET)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OL4-00062R-Ri
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBm-0002oD-2O; Mon, 18 Jan 2021 01:39:01 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:57275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBk-0007Sa-9V; Mon, 18 Jan 2021 01:38:57 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 66B3316B0;
 Mon, 18 Jan 2021 01:38:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JTe4D5W39+VsE
 I965mQwGabhGQ49JRkP3Msu7hBi17U=; b=roAetzHyYROCAOKzP4DJ32++2D8em
 t1XzogpI2+0xrZ1G0Hd5WDAHMMY9cG0YXaP9o3iDRi+2optlQlbak/qNG9aE+3Ho
 Xah7Svm6qKbhk9nsgMdSb31Tv8nX1TFA1fYDskblNF+c+GRNsApFtEHyJOT98Zh4
 ECYM/ivkxTV4yW/9172fHhBk2PcgPjP5jHy3oFpFHfmru5PS8SwTwJnYdtjwRGFC
 jlgwo9Kg7Wp+JlGl3gTDDq46dac/vpFRMbltzWQo4mRaE/ZkuNc3rFmSSXkCL+Dq
 nv1JgW+m0Ay8AAW64tAXFEBJuQPalYPRcW3GRGJzgWKPXDH4sNLONxifA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JTe4D5W39+VsEI965mQwGabhGQ49JRkP3Msu7hBi17U=; b=iI/ZXW6S
 YEDfWT71qXGiVYFdL2SpiwMZeSp07qGQXljtV76iEemQb6D4U4DojAm61JTULBnL
 VgJAyEPUuiycUXPfexfcZiKpWn5pTBH6nP+8lnYdjAeJF8JFKOOzMgkQk7yaNYlX
 1I5F4UbtH0sa/bLslt1AlsJzXw3UDDgRaJeTjxnOH/2L6LzMrlKmxri5x6ljEibU
 RBDKsa7qtDnR/3rBdJHLzw4R9kINgvXZf2mhtCfXlxtYKlpv28QRub3KNF2f/rJz
 MoHF2/WCbAqtZxSrhJVsBQ49a8RcOhto9u2F6tPfNym5XfvSqvBM4GkWRNfYUJY8
 fZBtrNfYnJEjlw==
X-ME-Sender: <xms:_CwFYCXLcg77GOkPOtCAVaw2V2lJLBhLB75eFiOGnC1PIGqWMj4tSw>
 <xme:_CwFYOnYde20oj7O6kPwIvBev_GZDt5Tik0JAWskv7_Yu9fdJqKlLX7WRrvcb26Eq
 j9kqithOLKmRqZDJTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeegudehkeduudehkeetvdevffeiveetteeffeeikeduffeiuddutedv
 teffieelkeenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghdpphhhhihsihgtrg
 hlmhgvmhhorhihsghlohgtkhdrrhhunhenucfkphepudduiedrvddvkedrkeegrddvnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguh
 hnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:_CwFYGYJO_iKwnpEF_Jpv9mmox9YbiRAbw18T28SoRVFeJR8jJpvVQ>
 <xmx:_CwFYJUQgB6-3cj5feAqsTfjUMmMJFpEI_jJh1XSzG5dHvhBKNBuBg>
 <xmx:_CwFYMmxDMcrKvU0C02dbNq8bpdV0Czlh_OvTEEaGl5a98QbzsS9zw>
 <xmx:_CwFYAkjsIxVPVFN49Tr98cmaj-WPMITWayLvoUowJb2e5L7W0SZ2d2y3-VTtG5d>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D2D924005C;
 Mon, 18 Jan 2021 01:38:46 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
Date: Mon, 18 Jan 2021 14:38:04 +0800
Message-Id: <20210118063808.12471-6-jiaxun.yang@flygoat.com>
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
 contrib/elf2dmp/addrspace.h |  6 +++---
 contrib/elf2dmp/addrspace.c |  4 ++--
 contrib/elf2dmp/main.c      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

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
2.30.0


