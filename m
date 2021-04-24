Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0036A20D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:21:27 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL26-0005rM-8H
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKih-0005lA-2P
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:23 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiC-0004Ik-4n
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:22 -0400
Received: by mail-il1-x135.google.com with SMTP id v13so3393220ilj.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Loms89On+HG9roTBfduFzz7Xoo1aA4kWUV9uyqYbeY=;
 b=ECHxF7/4yFj0sHwTsaaO5iNAlcpzk8HoOyYbcixVvu1ckLhkhYbJNpsCvH1LvMfb9A
 2So1TJwPPa2SNBijuA8b7lftmsY+xcAbPD8WR95KWkJfafY2ma5gpyrB7PWcSEuVh79N
 oxHtSEtDiWjq9jnj698Uqwo4/ZghVfJbE0/XSVTuVMHCfDKE5oDslEMblbCwn3PbkyCc
 u5S79JUVIYkH47i0+D7FPxbrtuLHCQhokBvT/H0WaFAdxCbogFMBWzZiHs4p5gdUXVH8
 WUfrMkKZUeQvp1SXknXcXKa+fj4oo8BAidEBemQ9HygJWJnZwGsX0zuEQHDq/0OwHAwe
 Jh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Loms89On+HG9roTBfduFzz7Xoo1aA4kWUV9uyqYbeY=;
 b=hPgAIqw44f+TcaErJsasCjvq5VhTfz9mSH6xAt6q3DlnrBsY+/xoiSglEoTqjXUCH7
 Y77wzi7401euLEUFtndgZHtFgNg6GHhHfEm9UuJtxLc8zhBIMvsQTq7F/A1k2SOA3S5e
 7Uw+CCI0RK6y805fvR+ZIZITOOVu8TDrBAXIvoPYRY+2+svrMffemiXDFNY5tIYvz+R+
 2ClPgDGHZacIUPtjfkLX4+goKZnEBnlV05i2MePoLr88KRcl7FOhHraHkgV5M/0CmIF4
 XpPLYiSItVcF1CQbyGO2Q7omfOkGK4D12DY7WfzHt6FpGXZYDlsTI8cakbV1c/LWlKZv
 tDRQ==
X-Gm-Message-State: AOAM5317xtrN3Yu/AKffPJ/HVHBYRRD5kXE+6/u8AAsfnRAYDkNagIKY
 XcQgLlMOszChX43S1ni0cjM1Fd+mXxYSAaq7
X-Google-Smtp-Source: ABdhPJyqtky+iU68d9nnrzHk7kqqArEm0SK6iJrpXCx46W63rNE81pry715KYXHoItoPDb/+NZaMWw==
X-Received: by 2002:a92:6908:: with SMTP id e8mr7172809ilc.207.1619280049949; 
 Sat, 24 Apr 2021 09:00:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:49 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/48] bsd-user: style tweak: comments
Date: Sat, 24 Apr 2021 09:59:56 -0600
Message-Id: <20210424160016.15200-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Use the preferred block comment style, move comments as needed for line length
restrictions, delete some dead code that looked like a comment, break some lines
> 80 columns at the same time since there are many associated with comments.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 216 ++++++++++++++++++++++++++-------------------
 1 file changed, 123 insertions(+), 93 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index f455a3812a..75ccc06719 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -23,10 +23,10 @@
  * These occupy the top three bytes.
  */
 enum {
-        ADDR_NO_RANDOMIZE =     0x0040000,      /* disable randomization of VA space */
-        FDPIC_FUNCPTRS =        0x0080000,      /* userspace function ptrs point to descriptors
-                                                 * (signal handling)
-                                                 */
+            /* disable randomization of VA space */
+        ADDR_NO_RANDOMIZE =     0x0040000,
+            /* userspace function ptrs point to descriptors (signal handling) */
+        FDPIC_FUNCPTRS =        0x0080000,
         MMAP_PAGE_ZERO =        0x0100000,
         ADDR_COMPAT_LAYOUT =    0x0200000,
         READ_IMPLIES_EXEC =     0x0400000,
@@ -117,7 +117,8 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_DATA       ELFDATA2LSB
 #define ELF_ARCH       EM_X86_64
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->rax = 0;
     regs->rsp = infop->start_stack;
@@ -143,18 +144,21 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA        ELFDATA2LSB
 #define ELF_ARCH        EM_386
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->esp = infop->start_stack;
     regs->eip = infop->entry;
 
-    /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
-       starts %edx contains a pointer to a function which might be
-       registered using `atexit'.  This provides a mean for the
-       dynamic linker to call DT_FINI functions for shared libraries
-       that have been loaded before the code runs.
-
-       A value of 0 tells we have no such handler.  */
+    /*
+     * SVR4/i386 ABI (pages 3-31, 3-32) says that when the program starts %edx
+     * contains a pointer to a function which might be registered using
+     * `atexit'.  This provides a mean for the dynamic linker to call DT_FINI
+     * functions for shared libraries that have been loaded before the code
+     * runs.
+     *
+     * A value of 0 tells we have no such handler.
+     */
     regs->edx = 0;
 }
 #endif
@@ -178,7 +182,8 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #endif
 #define ELF_ARCH        EM_ARM
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     abi_long stack = infop->start_stack;
     memset(regs, 0, sizeof(*regs));
@@ -235,7 +240,8 @@ enum
 
 #define STACK_BIAS              2047
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
 #ifndef TARGET_ABI32
     regs->tstate = 0;
@@ -267,7 +273,8 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA    ELFDATA2MSB
 #define ELF_ARCH    EM_SPARC
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->psr = 0;
     regs->pc = infop->entry;
@@ -321,6 +328,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
  *   AT_IGNOREPPC is used for that.
  * - for compatibility with glibc ARCH_DLINFO must always be defined on PPC,
  *   even if DLINFO_ARCH_ITEMS goes to zero or is undefined.
+ * - Handle glibc compatibility with last two...
  */
 #define DLINFO_ARCH_ITEMS       5
 #define ARCH_DLINFO                                                     \
@@ -328,14 +336,12 @@ do {                                                                    \
         NEW_AUX_ENT(AT_DCACHEBSIZE, 0x20);                              \
         NEW_AUX_ENT(AT_ICACHEBSIZE, 0x20);                              \
         NEW_AUX_ENT(AT_UCACHEBSIZE, 0);                                 \
-        /*                                                              \
-         * Now handle glibc compatibility.                              \
-         */                                                             \
         NEW_AUX_ENT(AT_IGNOREPPC, AT_IGNOREPPC);                        \
         NEW_AUX_ENT(AT_IGNOREPPC, AT_IGNOREPPC);                        \
  } while (0)
 
-static inline void init_thread(struct target_pt_regs *_regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *_regs,
+                               struct image_info *infop)
 {
     abi_ulong pos = infop->start_stack;
     abi_ulong tmp;
@@ -353,11 +359,12 @@ static inline void init_thread(struct target_pt_regs *_regs, struct image_info *
     infop->entry = entry;
 #endif
     _regs->nip = infop->entry;
-    /* Note that isn't exactly what regular kernel does
+    /*
+     * Note that isn't exactly what regular kernel does
      * but this is what the ABI wants and is needed to allow
      * execution of PPC BSD programs.
+     * FIXME - what to for failure of get_user()?
      */
-    /* FIXME - what to for failure of get_user()? */
     get_user_ual(_regs->gpr[3], pos);
     pos += sizeof(abi_ulong);
     _regs->gpr[4] = pos;
@@ -390,7 +397,8 @@ static inline void init_thread(struct target_pt_regs *_regs, struct image_info *
 #endif
 #define ELF_ARCH    EM_MIPS
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->cp0_status = 2 << CP0St_KSU;
     regs->cp0_epc = infop->entry;
@@ -412,11 +420,12 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA  ELFDATA2LSB
 #define ELF_ARCH  EM_SH
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
-  /* Check other registers XXXXX */
-  regs->pc = infop->entry;
-  regs->regs[15] = infop->start_stack;
+    /* Check other registers XXXXX */
+    regs->pc = infop->entry;
+    regs->regs[15] = infop->start_stack;
 }
 
 #define USE_ELF_CORE_DUMP
@@ -434,9 +443,10 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA  ELFDATA2LSB
 #define ELF_ARCH  EM_CRIS
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
-  regs->erp = infop->entry;
+    regs->erp = infop->entry;
 }
 
 #define USE_ELF_CORE_DUMP
@@ -454,10 +464,8 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA        ELFDATA2MSB
 #define ELF_ARCH        EM_68K
 
-/* ??? Does this need to do anything?
-#define ELF_PLAT_INIT(_r) */
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->usp = infop->start_stack;
     regs->sr = 0;
@@ -479,7 +487,8 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #define ELF_DATA       ELFDATA2MSB
 #define ELF_ARCH       EM_ALPHA
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->pc = infop->entry;
     regs->ps = 8;
@@ -538,8 +547,10 @@ struct exec
 
 /* Necessary parameters */
 #define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
-#define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
-#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGESTART(_v) \
+    ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGEOFFSET(_v) \
+    ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
 
 #define INTERPRETER_NONE 0
 #define INTERPRETER_AOUT 1
@@ -557,7 +568,7 @@ static int load_aout_interp(void *exptr, int interp_fd);
 #ifdef BSWAP_NEEDED
 static void bswap_ehdr(struct elfhdr *ehdr)
 {
-    bswap16s(&ehdr->e_type);                    /* Object file type */
+    bswap16s(&ehdr->e_type);            /* Object file type */
     bswap16s(&ehdr->e_machine);         /* Architecture */
     bswap32s(&ehdr->e_version);         /* Object file version */
     bswaptls(&ehdr->e_entry);           /* Entry point virtual address */
@@ -565,16 +576,16 @@ static void bswap_ehdr(struct elfhdr *ehdr)
     bswaptls(&ehdr->e_shoff);           /* Section header table file offset */
     bswap32s(&ehdr->e_flags);           /* Processor-specific flags */
     bswap16s(&ehdr->e_ehsize);          /* ELF header size in bytes */
-    bswap16s(&ehdr->e_phentsize);               /* Program header table entry size */
+    bswap16s(&ehdr->e_phentsize);       /* Program header table entry size */
     bswap16s(&ehdr->e_phnum);           /* Program header table entry count */
-    bswap16s(&ehdr->e_shentsize);               /* Section header table entry size */
+    bswap16s(&ehdr->e_shentsize);       /* Section header table entry size */
     bswap16s(&ehdr->e_shnum);           /* Section header table entry count */
-    bswap16s(&ehdr->e_shstrndx);                /* Section header string table index */
+    bswap16s(&ehdr->e_shstrndx);        /* Section header string table index */
 }
 
 static void bswap_phdr(struct elf_phdr *phdr)
 {
-    bswap32s(&phdr->p_type);                    /* Segment type */
+    bswap32s(&phdr->p_type);            /* Segment type */
     bswaptls(&phdr->p_offset);          /* Segment file offset */
     bswaptls(&phdr->p_vaddr);           /* Segment virtual address */
     bswaptls(&phdr->p_paddr);           /* Segment physical address */
@@ -668,8 +679,9 @@ static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
     abi_ulong stack_base, size, error;
     int i;
 
-    /* Create enough stack to hold everything.  If we don't use
-     * it for args, we'll use it for something else...
+    /*
+     * Create enough stack to hold everything.  If we don't use it for args,
+     * we'll use it for something else...
      */
     size = x86_stack_size;
     if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE)
@@ -717,9 +729,11 @@ static void set_brk(abi_ulong start, abi_ulong end)
 }
 
 
-/* We need to explicitly zero any fractional pages after the data
-   section (i.e. bss).  This would contain the junk from the file that
-   should not be in memory. */
+/*
+ * We need to explicitly zero any fractional pages after the data section
+ * (i.e. bss).  This would contain the junk from the file that should not be in
+ * memory.
+ */
 static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
 {
         abi_ulong nbyte;
@@ -727,11 +741,12 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
         if (elf_bss >= last_bss)
                 return;
 
-        /* XXX: this is really a hack : if the real host page size is
-           smaller than the target page size, some pages after the end
-           of the file may not be mapped. A better fix would be to
-           patch target_mmap(), but it is more complicated as the file
-           size must be known */
+        /*
+         * XXX: this is really a hack : if the real host page size is smaller
+         * than the target page size, some pages after the end f the file may
+         * not be mapped. A better fix would be to patch target_mmap(), but it
+         * is more complicated as the file size must be known.
+         */
         if (qemu_real_host_page_size < qemu_host_page_size) {
             abi_ulong end_addr, end_addr1;
             end_addr1 = REAL_HOST_PAGE_ALIGN(elf_bss);
@@ -794,7 +809,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         if (size & 15)
                 sp -= 16 - (size & 15);
 
-        /* This is correct because Linux defines
+        /*
+         * This is correct because Linux defines
          * elf_addr_t as Elf32_Off / Elf64_Off
          */
 #define NEW_AUX_ENT(id, val) do {               \
@@ -902,8 +918,10 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
 #endif
 
     if (interp_elf_ex->e_type == ET_DYN) {
-        /* in order to avoid hardcoding the interpreter load
-           address in qemu, we allocate a big enough memory zone */
+        /*
+         * in order to avoid hardcoding the interpreter load address in qemu, we
+         * allocate a big enough memory zone
+         */
         error = target_mmap(0, INTERP_MAP_SIZE,
                             PROT_NONE, MAP_PRIVATE | MAP_ANON,
                             -1, 0);
@@ -931,11 +949,11 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
                 vaddr = eppnt->p_vaddr;
             }
             error = target_mmap(load_addr + TARGET_ELF_PAGESTART(vaddr),
-                                eppnt->p_filesz + TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
-                                elf_prot,
-                                elf_type,
-                                interpreter_fd,
-                                eppnt->p_offset - TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
+                eppnt->p_filesz + TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
+                elf_prot,
+                elf_type,
+                interpreter_fd,
+                eppnt->p_offset - TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
 
             if (error == -1) {
                 /* Real error */
@@ -975,7 +993,8 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
      * bss page.
      */
     padzero(elf_bss, last_bss);
-    elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1); /* What we have mapped so far */
+    /* What we have mapped so far */
+    elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1);
 
     /* Map the last of the bss segment */
     if (last_bss > elf_bss) {
@@ -1109,10 +1128,12 @@ static void load_symbols(struct elfhdr *hdr, int fd)
         i++;
     }
 
-     /* Attempt to free the storage associated with the local symbols
-        that we threw away.  Whether or not this has any effect on the
-        memory allocation depends on the malloc implementation and how
-        many symbols we managed to discard. */
+     /*
+      * Attempt to free the storage associated with the local symbols that we
+      * threw away.  Whether or not this has any effect on the memory allocation
+      * depends on the malloc implementation and how many symbols we managed to
+      * discard.
+      */
     new_syms = realloc(syms, nsyms * sizeof(*syms));
     if (new_syms == NULL) {
         free(s);
@@ -1237,9 +1258,9 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
                 return -EINVAL;
             }
 
-            /* This is the program interpreter used for
-             * shared libraries - for now assume that this
-             * is an a.out format binary
+            /*
+             * This is the program interpreter used for shared libraries - for
+             * now assume that this is an a.out format binary
              */
 
             elf_interpreter = (char *)malloc(elf_ppnt->p_filesz);
@@ -1259,9 +1280,10 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
                 exit(-1);
             }
 
-            /* If the program interpreter is one of these two,
-               then assume an iBCS2 image. Otherwise assume
-               a native linux image. */
+            /*
+             * If the program interpreter is one of these two, then assume an
+             * iBCS2 image. Otherwise assume a native linux image.
+             */
 
             /* JRP - Need to add X86 lib dir stuff here... */
 
@@ -1278,7 +1300,6 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
                 else {
                     perror(elf_interpreter);
                     exit(-1);
-                    /* retval = -errno; */
                 }
             }
 
@@ -1289,8 +1310,8 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
                 }
             }
             if (retval >= 0) {
-                interp_ex = *((struct exec *) bprm->buf); /* aout exec-header */
-                interp_elf_ex = *((struct elfhdr *) bprm->buf); /* elf exec-header */
+                interp_ex = *((struct exec *) bprm->buf); /* aout */
+                interp_elf_ex = *((struct elfhdr *) bprm->buf); /* elf */
             }
             if (retval < 0) {
                 perror("load_elf_binary3");
@@ -1327,8 +1348,10 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         }
     }
 
-    /* OK, we are done with that, now set up the arg stuff,
-       and then start this sucker up */
+    /*
+     * OK, we are done with that, now set up the arg stuff, and then start this
+     * sucker up
+     */
 
     {
         char *passed_p;
@@ -1378,18 +1401,19 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         }
     }
 
-    /* Do this so that we can load the interpreter, if need be.  We will
-       change some of these later */
+    /*
+     * Do this so that we can load the interpreter, if need be.  We will change
+     * some of these later
+     */
     info->rss = 0;
     bprm->p = setup_arg_pages(bprm->p, bprm, info);
     info->start_stack = bprm->p;
 
-    /* Now we do a little grungy work by mmaping the ELF image into
-     * the correct location in memory.  At this point, we assume that
-     * the image should be loaded at fixed address, not at a variable
-     * address.
+    /*
+     * Now we do a little grungy work by mmaping the ELF image into the correct
+     * location in memory.  At this point, we assume that the image should be
+     * loaded at fixed address, not at a variable address.
      */
-
     for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum; i++, elf_ppnt++) {
         int elf_prot = 0;
         int elf_flags = 0;
@@ -1405,11 +1429,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         if (elf_ex.e_type == ET_EXEC || load_addr_set) {
             elf_flags |= MAP_FIXED;
         } else if (elf_ex.e_type == ET_DYN) {
-            /* Try and get dynamic programs out of the way of the default mmap
-               base, as well as whatever program they might try to exec.  This
-               is because the brk will follow the loader, and is not movable.  */
-            /* NOTE: for qemu, we do a big mmap to get enough space
-               without hardcoding any address */
+            /*
+             * Try and get dynamic programs out of the way of the default mmap
+             * base, as well as whatever program they might try to exec.  This
+             * is because the brk will follow the loader, and is not movable.
+             * NOTE: for qemu, we do a big mmap to get enough space without
+             * hardcoding any address
+             */
             error = target_mmap(0, ET_DYN_MAP_SIZE,
                                 PROT_NONE, MAP_PRIVATE | MAP_ANON,
                                 -1, 0);
@@ -1520,18 +1546,22 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     info->end_data = end_data;
     info->start_stack = bprm->p;
 
-    /* Calling set_brk effectively mmaps the pages that we need for the bss and break
-       sections */
+    /*
+     * Calling set_brk effectively mmaps the pages that we need for the bss and
+     * break sections
+     */
     set_brk(elf_bss, elf_brk);
 
     padzero(elf_bss, elf_brk);
 
     if (info->personality == PER_SVR4)
     {
-            /* Why this, you ask???  Well SVr4 maps page 0 as read-only,
-               and some applications "depend" upon this behavior.
-               Since we do not have the power to recompile these, we
-               emulate the SVr4 behavior.  Sigh.  */
+            /*
+             * Why this, you ask???  Well SVr4 maps page 0 as read-only, and
+             * some applications "depend" upon this behavior.  Since we do not
+             * have the power to recompile these, we emulate the SVr4 behavior.
+             * Sigh.
+             */
             target_mmap(0, qemu_host_page_size, PROT_READ | PROT_EXEC,
                                       MAP_FIXED | MAP_PRIVATE, -1, 0);
     }
-- 
2.22.1


