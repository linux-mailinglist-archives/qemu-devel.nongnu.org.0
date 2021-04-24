Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE136A1F0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:09:50 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKqr-0006US-Ka
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhw-0005SY-RH
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:36 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhq-0004Br-52
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:36 -0400
Received: by mail-io1-xd35.google.com with SMTP id f21so15648034ioh.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLSunyF7yqNE6jwrYnXqTpq83LjJhVTopLCSU9ZyU5Q=;
 b=yEINUFVz4xH4Y1ikNC0Tyd6uoblZXafUr611Iy4jdeol480nBeh+iY1l44kOPPa72F
 m7Y91La7og1HqJQQYw/8R0kVSYCABG9K6dHWlFwno2DF9L2BsYK7xUZh7lYU4Xfa/8jU
 S9425HlrqXg6N9Oto1eEeDImZ0D9tVofBYQd1Eq5sW3JzWYi6eoYqjxK8oNoTS9zu1T2
 b7HO69jjhSiwqHIisYpE6+va8+baVlgJij7PpBErB29ftF77W+1n0Fs4NjmdVOPm1p7Q
 oY+7M+G6/mPaMgRAl2MCVQ5ksiyUs+Ewo2X0UYtCiP1IoiDWpms/KDYSexsGoU7yieMt
 1CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLSunyF7yqNE6jwrYnXqTpq83LjJhVTopLCSU9ZyU5Q=;
 b=CobvX2OnEcivIny73W3DgiuKh7jqgjVxz8EckK8skKB2SN/GjXPXQUJDxf1c8slAQM
 56pQjPseKXcOlWgIt9W5r/I6CAPkRayicw6vA0hwX7UN/KJguCIzbTnDBYkO9y6thizZ
 cz+iAQiL8rWorj+mrBq4dQvJ53s75DYrgfVogZb9EKaTh8wv8eDlIKoJXhVmzRt7ZLhd
 Tby6cc+a3BYKMpRKIAq/eF14MS0BbbCYaI4ScXFWi7kq4uuYsUPqVPhg4B/8D0vp/E9g
 giEapJMNk23MHAxq2qYNmBqaooZ48g1Au3ZaH88HSBTSpDpaDl0NapReDvz8BMAmgrLs
 HqBA==
X-Gm-Message-State: AOAM5336rsnzDof5+hDl0BF9GJJjjg/eM0G+JxxGUUx5JqKt8tM08ZlC
 tOCTJDhz0qjjpoRWoFyvmavx/5fekC/7oefY
X-Google-Smtp-Source: ABdhPJziMkvyF9PF9KlByAyKne4kYEIVOZZizgVAfHzDqapQzr+alVdP98mwlGjRJCjLglS+OJvk8g==
X-Received: by 2002:a5e:880c:: with SMTP id l12mr7484726ioj.195.1619280028320; 
 Sat, 24 Apr 2021 09:00:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:27 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/48] bsd-user: whitespace changes
Date: Sat, 24 Apr 2021 09:59:30 -0600
Message-Id: <20210424160016.15200-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Fix various whitespace-only issues from checkpatch:
    keyword space (
    no space before ( on function calls
    spaces around operators
    suspect indentations (including one functions reindented)
    extra spaces around unary operators

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 326 ++++++++++++++++++++++-----------------------
 1 file changed, 163 insertions(+), 163 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 5f4d824d78..3c9d8c2845 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -111,7 +111,7 @@ static uint32_t get_elf_hwcap(void)
 
 #ifdef TARGET_X86_64
 #define ELF_START_MMAP 0x2aaaaab000ULL
-#define elf_check_arch(x) ( ((x) == ELF_ARCH) )
+#define elf_check_arch(x) (((x) == ELF_ARCH))
 
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2LSB
@@ -134,7 +134,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ( ((x) == EM_386) || ((x) == EM_486) )
+#define elf_check_arch(x) (((x) == EM_386) || ((x) == EM_486))
 
 /*
  * These are used to set parameters in the core dumps.
@@ -168,7 +168,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_ARM )
+#define elf_check_arch(x) ((x) == EM_ARM)
 
 #define ELF_CLASS       ELFCLASS32
 #ifdef TARGET_WORDS_BIGENDIAN
@@ -184,7 +184,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
     memset(regs, 0, sizeof(*regs));
     regs->ARM_cpsr = 0x10;
     if (infop->entry & 1)
-      regs->ARM_cpsr |= CPSR_T;
+        regs->ARM_cpsr |= CPSR_T;
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = infop->start_stack;
     /* FIXME - what to for failure of get_user()? */
@@ -224,9 +224,9 @@ enum
 #define ELF_START_MMAP 0x80000000
 
 #ifndef TARGET_ABI32
-#define elf_check_arch(x) ( (x) == EM_SPARCV9 || (x) == EM_SPARC32PLUS )
+#define elf_check_arch(x) ((x) == EM_SPARCV9 || (x) == EM_SPARC32PLUS)
 #else
-#define elf_check_arch(x) ( (x) == EM_SPARC32PLUS || (x) == EM_SPARC )
+#define elf_check_arch(x) ((x) == EM_SPARC32PLUS || (x) == EM_SPARC)
 #endif
 
 #define ELF_CLASS   ELFCLASS64
@@ -261,7 +261,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #else
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_SPARC )
+#define elf_check_arch(x) ((x) == EM_SPARC)
 
 #define ELF_CLASS   ELFCLASS32
 #define ELF_DATA    ELFDATA2MSB
@@ -285,13 +285,13 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
 
-#define elf_check_arch(x) ( (x) == EM_PPC64 )
+#define elf_check_arch(x) ((x) == EM_PPC64)
 
 #define ELF_CLASS       ELFCLASS64
 
 #else
 
-#define elf_check_arch(x) ( (x) == EM_PPC )
+#define elf_check_arch(x) ((x) == EM_PPC)
 
 #define ELF_CLASS       ELFCLASS32
 
@@ -376,7 +376,7 @@ static inline void init_thread(struct target_pt_regs *_regs, struct image_info *
 
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_MIPS )
+#define elf_check_arch(x) ((x) == EM_MIPS)
 
 #ifdef TARGET_MIPS64
 #define ELF_CLASS   ELFCLASS64
@@ -406,7 +406,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_SH )
+#define elf_check_arch(x) ((x) == EM_SH)
 
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2LSB
@@ -428,7 +428,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_CRIS )
+#define elf_check_arch(x) ((x) == EM_CRIS)
 
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2LSB
@@ -448,7 +448,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_START_MMAP 0x80000000
 
-#define elf_check_arch(x) ( (x) == EM_68K )
+#define elf_check_arch(x) ((x) == EM_68K)
 
 #define ELF_CLASS       ELFCLASS32
 #define ELF_DATA        ELFDATA2MSB
@@ -473,7 +473,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_START_MMAP (0x30000000000ULL)
 
-#define elf_check_arch(x) ( (x) == ELF_ARCH )
+#define elf_check_arch(x) ((x) == ELF_ARCH)
 
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2MSB
@@ -538,8 +538,8 @@ struct exec
 
 /* Necessary parameters */
 #define TARGET_ELF_EXEC_PAGESIZE TARGET_PAGE_SIZE
-#define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE-1))
-#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
+#define TARGET_ELF_PAGESTART(_v) ((_v) & ~(unsigned long)(TARGET_ELF_EXEC_PAGESIZE - 1))
+#define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE - 1))
 
 #define INTERPRETER_NONE 0
 #define INTERPRETER_AOUT 1
@@ -547,12 +547,12 @@ struct exec
 
 #define DLINFO_ITEMS 12
 
-static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
+static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
         memcpy(to, from, n);
 }
 
-static int load_aout_interp(void * exptr, int interp_fd);
+static int load_aout_interp(void *exptr, int interp_fd);
 
 #ifdef BSWAP_NEEDED
 static void bswap_ehdr(struct elfhdr *ehdr)
@@ -613,7 +613,7 @@ static void bswap_sym(struct elf_sym *sym)
  * to be put directly into the top of new user memory.
  *
  */
-static abi_ulong copy_elf_strings(int argc,char ** argv, void **page,
+static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
                                   abi_ulong p)
 {
     char *tmp, *tmp1, *pag = NULL;
@@ -638,10 +638,10 @@ static abi_ulong copy_elf_strings(int argc,char ** argv, void **page,
             --p; --tmp; --len;
             if (--offset < 0) {
                 offset = p % TARGET_PAGE_SIZE;
-                pag = (char *)page[p/TARGET_PAGE_SIZE];
+                pag = (char *)page[p / TARGET_PAGE_SIZE];
                 if (!pag) {
                     pag = g_try_malloc0(TARGET_PAGE_SIZE);
-                    page[p/TARGET_PAGE_SIZE] = pag;
+                    page[p / TARGET_PAGE_SIZE] = pag;
                     if (!pag)
                         return 0;
                 }
@@ -672,8 +672,8 @@ static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
      * it for args, we'll use it for something else...
      */
     size = x86_stack_size;
-    if (size < MAX_ARG_PAGES*TARGET_PAGE_SIZE)
-        size = MAX_ARG_PAGES*TARGET_PAGE_SIZE;
+    if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE)
+        size = MAX_ARG_PAGES * TARGET_PAGE_SIZE;
     error = target_mmap(0,
                         size + qemu_host_page_size,
                         PROT_READ | PROT_WRITE,
@@ -686,7 +686,7 @@ static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
     /* we reserve one extra page at the top of the stack as guard */
     target_mprotect(error + size, qemu_host_page_size, PROT_NONE);
 
-    stack_base = error + size - MAX_ARG_PAGES*TARGET_PAGE_SIZE;
+    stack_base = error + size - MAX_ARG_PAGES * TARGET_PAGE_SIZE;
     p += stack_base;
 
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
@@ -708,7 +708,7 @@ static void set_brk(abi_ulong start, abi_ulong end)
         end = HOST_PAGE_ALIGN(end);
         if (end <= start)
                 return;
-        if(target_mmap(start, end - start,
+        if (target_mmap(start, end - start,
                        PROT_READ | PROT_WRITE | PROT_EXEC,
                        MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0) == -1) {
             perror("cannot mmap brk");
@@ -738,12 +738,12 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
             end_addr = HOST_PAGE_ALIGN(elf_bss);
             if (end_addr1 < end_addr) {
                 mmap((void *)g2h_untagged(end_addr1), end_addr - end_addr1,
-                     PROT_READ|PROT_WRITE|PROT_EXEC,
-                     MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
+                     PROT_READ | PROT_WRITE | PROT_EXEC,
+                     MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
             }
         }
 
-        nbyte = elf_bss & (qemu_host_page_size-1);
+        nbyte = elf_bss & (qemu_host_page_size - 1);
         if (nbyte) {
             nbyte = qemu_host_page_size - nbyte;
             do {
@@ -781,10 +781,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         /*
          * Force 16 byte _final_ alignment here for generality.
          */
-        sp = sp &~ (abi_ulong)15;
+        sp = sp & ~(abi_ulong)15;
         size = (DLINFO_ITEMS + 1) * 2;
         if (k_platform)
-          size += 2;
+                size += 2;
 #ifdef DLINFO_ARCH_ITEMS
         size += DLINFO_ARCH_ITEMS * 2;
 #endif
@@ -792,7 +792,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         size += (!ibcs ? 3 : 1);        /* argc itself */
         size *= n;
         if (size & 15)
-            sp -= 16 - (size & 15);
+                sp -= 16 - (size & 15);
 
         /* This is correct because Linux defines
          * elf_addr_t as Elf32_Off / Elf64_Off
@@ -800,13 +800,13 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 #define NEW_AUX_ENT(id, val) do {               \
             sp -= n; put_user_ual(val, sp);     \
             sp -= n; put_user_ual(id, sp);      \
-          } while(0)
+          } while (0)
 
-        NEW_AUX_ENT (AT_NULL, 0);
+        NEW_AUX_ENT(AT_NULL, 0);
 
         /* There must be exactly DLINFO_ITEMS entries here.  */
         NEW_AUX_ENT(AT_PHDR, (abi_ulong)(load_addr + exec->e_phoff));
-        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof (struct elf_phdr)));
+        NEW_AUX_ENT(AT_PHENT, (abi_ulong)(sizeof(struct elf_phdr)));
         NEW_AUX_ENT(AT_PHNUM, (abi_ulong)(exec->e_phnum));
         NEW_AUX_ENT(AT_PAGESZ, (abi_ulong)(TARGET_PAGE_SIZE));
         NEW_AUX_ENT(AT_BASE, (abi_ulong)(interp_load_addr));
@@ -834,90 +834,90 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 
-static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
+static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
                                  int interpreter_fd,
                                  abi_ulong *interp_load_addr)
 {
-        struct elf_phdr *elf_phdata  =  NULL;
-        struct elf_phdr *eppnt;
-        abi_ulong load_addr = 0;
-        int load_addr_set = 0;
-        int retval;
-        abi_ulong last_bss, elf_bss;
-        abi_ulong error;
-        int i;
+    struct elf_phdr *elf_phdata  =  NULL;
+    struct elf_phdr *eppnt;
+    abi_ulong load_addr = 0;
+    int load_addr_set = 0;
+    int retval;
+    abi_ulong last_bss, elf_bss;
+    abi_ulong error;
+    int i;
 
-        elf_bss = 0;
-        last_bss = 0;
-        error = 0;
+    elf_bss = 0;
+    last_bss = 0;
+    error = 0;
 
 #ifdef BSWAP_NEEDED
-        bswap_ehdr(interp_elf_ex);
+    bswap_ehdr(interp_elf_ex);
 #endif
-        /* First of all, some simple consistency checks */
-        if ((interp_elf_ex->e_type != ET_EXEC &&
-             interp_elf_ex->e_type != ET_DYN) ||
-           !elf_check_arch(interp_elf_ex->e_machine)) {
-                return ~((abi_ulong)0UL);
-        }
+    /* First of all, some simple consistency checks */
+    if ((interp_elf_ex->e_type != ET_EXEC &&
+         interp_elf_ex->e_type != ET_DYN) ||
+        !elf_check_arch(interp_elf_ex->e_machine)) {
+        return ~((abi_ulong)0UL);
+    }
 
 
-        /* Now read in all of the header information */
+    /* Now read in all of the header information */
 
-        if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
-            return ~(abi_ulong)0UL;
+    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
+        return ~(abi_ulong)0UL;
 
-        elf_phdata =  (struct elf_phdr *)
-                malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
+    elf_phdata =  (struct elf_phdr *)
+        malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
 
-        if (!elf_phdata)
-          return ~((abi_ulong)0UL);
+    if (!elf_phdata)
+        return ~((abi_ulong)0UL);
 
-        /*
-         * If the size of this structure has changed, then punt, since
-         * we will be doing the wrong thing.
-         */
-        if (interp_elf_ex->e_phentsize != sizeof(struct elf_phdr)) {
-            free(elf_phdata);
-            return ~((abi_ulong)0UL);
-        }
+    /*
+     * If the size of this structure has changed, then punt, since
+     * we will be doing the wrong thing.
+     */
+    if (interp_elf_ex->e_phentsize != sizeof(struct elf_phdr)) {
+        free(elf_phdata);
+        return ~((abi_ulong)0UL);
+    }
 
-        retval = lseek(interpreter_fd, interp_elf_ex->e_phoff, SEEK_SET);
-        if(retval >= 0) {
-            retval = read(interpreter_fd,
-                           (char *) elf_phdata,
-                           sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
-        }
-        if (retval < 0) {
-                perror("load_elf_interp");
-                exit(-1);
-                free (elf_phdata);
-                return retval;
-        }
+    retval = lseek(interpreter_fd, interp_elf_ex->e_phoff, SEEK_SET);
+    if (retval >= 0) {
+        retval = read(interpreter_fd,
+                      (char *) elf_phdata,
+                      sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
+    }
+    if (retval < 0) {
+        perror("load_elf_interp");
+        exit(-1);
+        free (elf_phdata);
+        return retval;
+    }
 #ifdef BSWAP_NEEDED
-        eppnt = elf_phdata;
-        for (i=0; i<interp_elf_ex->e_phnum; i++, eppnt++) {
-            bswap_phdr(eppnt);
-        }
+    eppnt = elf_phdata;
+    for (i = 0; i<interp_elf_ex->e_phnum; i++, eppnt++) {
+        bswap_phdr(eppnt);
+    }
 #endif
 
-        if (interp_elf_ex->e_type == ET_DYN) {
-            /* in order to avoid hardcoding the interpreter load
-               address in qemu, we allocate a big enough memory zone */
-            error = target_mmap(0, INTERP_MAP_SIZE,
-                                PROT_NONE, MAP_PRIVATE | MAP_ANON,
-                                -1, 0);
-            if (error == -1) {
-                perror("mmap");
-                exit(-1);
-            }
-            load_addr = error;
-            load_addr_set = 1;
+    if (interp_elf_ex->e_type == ET_DYN) {
+        /* in order to avoid hardcoding the interpreter load
+           address in qemu, we allocate a big enough memory zone */
+        error = target_mmap(0, INTERP_MAP_SIZE,
+                            PROT_NONE, MAP_PRIVATE | MAP_ANON,
+                            -1, 0);
+        if (error == -1) {
+            perror("mmap");
+            exit(-1);
         }
+        load_addr = error;
+        load_addr_set = 1;
+    }
 
-        eppnt = elf_phdata;
-        for(i=0; i<interp_elf_ex->e_phnum; i++, eppnt++)
-          if (eppnt->p_type == PT_LOAD) {
+    eppnt = elf_phdata;
+    for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++)
+        if (eppnt->p_type == PT_LOAD) {
             int elf_type = MAP_PRIVATE | MAP_DENYWRITE;
             int elf_prot = 0;
             abi_ulong vaddr = 0;
@@ -930,23 +930,23 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
                 elf_type |= MAP_FIXED;
                 vaddr = eppnt->p_vaddr;
             }
-            error = target_mmap(load_addr+TARGET_ELF_PAGESTART(vaddr),
-                 eppnt->p_filesz + TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
-                 elf_prot,
-                 elf_type,
-                 interpreter_fd,
-                 eppnt->p_offset - TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
+            error = target_mmap(load_addr + TARGET_ELF_PAGESTART(vaddr),
+                                eppnt->p_filesz + TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
+                                elf_prot,
+                                elf_type,
+                                interpreter_fd,
+                                eppnt->p_offset - TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
 
             if (error == -1) {
-              /* Real error */
-              close(interpreter_fd);
-              free(elf_phdata);
-              return ~((abi_ulong)0UL);
+                /* Real error */
+                close(interpreter_fd);
+                free(elf_phdata);
+                return ~((abi_ulong)0UL);
             }
 
             if (!load_addr_set && interp_elf_ex->e_type == ET_DYN) {
-              load_addr = error;
-              load_addr_set = 1;
+                load_addr = error;
+                load_addr_set = 1;
             }
 
             /*
@@ -962,31 +962,31 @@ static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
              */
             k = load_addr + eppnt->p_memsz + eppnt->p_vaddr;
             if (k > last_bss) last_bss = k;
-          }
+        }
 
-        /* Now use mmap to map the library into memory. */
+    /* Now use mmap to map the library into memory. */
 
-        close(interpreter_fd);
+    close(interpreter_fd);
 
-        /*
-         * Now fill out the bss section.  First pad the last page up
-         * to the page boundary, and then perform a mmap to make sure
-         * that there are zeromapped pages up to and including the last
-         * bss page.
-         */
-        padzero(elf_bss, last_bss);
-        elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1); /* What we have mapped so far */
-
-        /* Map the last of the bss segment */
-        if (last_bss > elf_bss) {
-            target_mmap(elf_bss, last_bss-elf_bss,
-                        PROT_READ|PROT_WRITE|PROT_EXEC,
-                        MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
-        }
-        free(elf_phdata);
+    /*
+     * Now fill out the bss section.  First pad the last page up
+     * to the page boundary, and then perform a mmap to make sure
+     * that there are zeromapped pages up to and including the last
+     * bss page.
+     */
+    padzero(elf_bss, last_bss);
+    elf_bss = TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - 1); /* What we have mapped so far */
+
+    /* Map the last of the bss segment */
+    if (last_bss > elf_bss) {
+        target_mmap(elf_bss, last_bss - elf_bss,
+                    PROT_READ | PROT_WRITE | PROT_EXEC,
+                    MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
+    }
+    free(elf_phdata);
 
-        *interp_load_addr = load_addr;
-        return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
+    *interp_load_addr = load_addr;
+    return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
 }
 
 static int symfind(const void *s0, const void *s1)
@@ -1102,7 +1102,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
             }
             continue;
         }
-#if defined(TARGET_ARM) || defined (TARGET_MIPS)
+#if defined(TARGET_ARM) || defined(TARGET_MIPS)
         /* The bottom address bit marks a Thumb or MIPS16 symbol.  */
         syms[i].st_value &= ~(target_ulong)1;
 #endif
@@ -1143,8 +1143,8 @@ static void load_symbols(struct elfhdr *hdr, int fd)
     syminfos = s;
 }
 
-int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
-                    struct image_info * info)
+int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+                    struct image_info *info)
 {
     struct elfhdr elf_ex;
     struct elfhdr interp_elf_ex;
@@ -1178,13 +1178,13 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
 
     /* First of all, some simple consistency checks */
     if ((elf_ex.e_type != ET_EXEC && elf_ex.e_type != ET_DYN) ||
-                                (! elf_check_arch(elf_ex.e_machine))) {
+                                (!elf_check_arch(elf_ex.e_machine))) {
             return -ENOEXEC;
     }
 
     bprm->p = copy_elf_strings(1, &bprm->filename, bprm->page, bprm->p);
-    bprm->p = copy_elf_strings(bprm->envc,bprm->envp,bprm->page,bprm->p);
-    bprm->p = copy_elf_strings(bprm->argc,bprm->argv,bprm->page,bprm->p);
+    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page,bprm->p);
+    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page,bprm->p);
     if (!bprm->p) {
         retval = -E2BIG;
     }
@@ -1196,21 +1196,21 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     }
 
     retval = lseek(bprm->fd, elf_ex.e_phoff, SEEK_SET);
-    if(retval > 0) {
-        retval = read(bprm->fd, (char *) elf_phdata,
+    if (retval > 0) {
+        retval = read(bprm->fd, (char *)elf_phdata,
                                 elf_ex.e_phentsize * elf_ex.e_phnum);
     }
 
     if (retval < 0) {
         perror("load_elf_binary");
         exit(-1);
-        free (elf_phdata);
+        free(elf_phdata);
         return -errno;
     }
 
 #ifdef BSWAP_NEEDED
     elf_ppnt = elf_phdata;
-    for (i=0; i<elf_ex.e_phnum; i++, elf_ppnt++) {
+    for (i = 0; i < elf_ex.e_phnum; i++, elf_ppnt++) {
         bswap_phdr(elf_ppnt);
     }
 #endif
@@ -1227,11 +1227,11 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     end_data = 0;
     interp_ex.a_info = 0;
 
-    for(i=0;i < elf_ex.e_phnum; i++) {
+    for (i = 0;i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
-            if ( elf_interpreter != NULL )
+            if (elf_interpreter != NULL)
             {
-                free (elf_phdata);
+                free(elf_phdata);
                 free(elf_interpreter);
                 close(bprm->fd);
                 return -EINVAL;
@@ -1245,16 +1245,16 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
             elf_interpreter = (char *)malloc(elf_ppnt->p_filesz);
 
             if (elf_interpreter == NULL) {
-                free (elf_phdata);
+                free(elf_phdata);
                 close(bprm->fd);
                 return -ENOMEM;
             }
 
             retval = lseek(bprm->fd, elf_ppnt->p_offset, SEEK_SET);
-            if(retval >= 0) {
+            if (retval >= 0) {
                 retval = read(bprm->fd, elf_interpreter, elf_ppnt->p_filesz);
             }
-            if(retval < 0) {
+            if (retval < 0) {
                 perror("load_elf_binary2");
                 exit(-1);
             }
@@ -1265,8 +1265,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
 
             /* JRP - Need to add X86 lib dir stuff here... */
 
-            if (strcmp(elf_interpreter,"/usr/lib/libc.so.1") == 0 ||
-                strcmp(elf_interpreter,"/usr/lib/ld.so.1") == 0) {
+            if (strcmp(elf_interpreter, "/usr/lib/libc.so.1") == 0 ||
+                strcmp(elf_interpreter, "/usr/lib/ld.so.1") == 0) {
               ibcs2_interpreter = 1;
             }
 
@@ -1275,7 +1275,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
 #endif
             if (retval >= 0) {
                 retval = open(path(elf_interpreter), O_RDONLY);
-                if(retval >= 0) {
+                if (retval >= 0) {
                     interpreter_fd = retval;
                 }
                 else {
@@ -1287,8 +1287,8 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
 
             if (retval >= 0) {
                 retval = lseek(interpreter_fd, 0, SEEK_SET);
-                if(retval >= 0) {
-                    retval = read(interpreter_fd,bprm->buf,128);
+                if (retval >= 0) {
+                    retval = read(interpreter_fd, bprm->buf, 128);
                 }
             }
             if (retval >= 0) {
@@ -1298,7 +1298,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
             if (retval < 0) {
                 perror("load_elf_binary3");
                 exit(-1);
-                free (elf_phdata);
+                free(elf_phdata);
                 free(elf_interpreter);
                 close(bprm->fd);
                 return retval;
@@ -1308,17 +1308,17 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     }
 
     /* Some simple consistency checks for the interpreter */
-    if (elf_interpreter){
+    if (elf_interpreter) {
         interpreter_type = INTERPRETER_ELF | INTERPRETER_AOUT;
 
         /* Now figure out which format our binary is */
         if ((N_MAGIC(interp_ex) != OMAGIC) && (N_MAGIC(interp_ex) != ZMAGIC) &&
                 (N_MAGIC(interp_ex) != QMAGIC)) {
-          interpreter_type = INTERPRETER_ELF;
+            interpreter_type = INTERPRETER_ELF;
         }
 
         if (interp_elf_ex.e_ident[0] != 0x7f ||
-                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF",3) != 0) {
+                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF", 3) != 0) {
             interpreter_type &= ~INTERPRETER_ELF;
         }
 
@@ -1334,20 +1334,20 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
        and then start this sucker up */
 
     {
-        char * passed_p;
+        char *passed_p;
 
         if (interpreter_type == INTERPRETER_AOUT) {
             snprintf(passed_fileno, sizeof(passed_fileno), "%d", bprm->fd);
             passed_p = passed_fileno;
 
             if (elf_interpreter) {
-                bprm->p = copy_elf_strings(1,&passed_p,bprm->page,bprm->p);
+                bprm->p = copy_elf_strings(1, &passed_p, bprm->page, bprm->p);
                 bprm->argc++;
             }
         }
         if (!bprm->p) {
             free(elf_interpreter);
-            free (elf_phdata);
+            free(elf_phdata);
             close(bprm->fd);
             return -E2BIG;
         }
@@ -1393,7 +1393,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
      * address.
      */
 
-    for(i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum; i++, elf_ppnt++) {
+    for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum; i++, elf_ppnt++) {
         int elf_prot = 0;
         int elf_flags = 0;
         abi_ulong error;
@@ -1538,7 +1538,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     printf("(brk) %x\n" , info->brk);
 #endif
 
-    if ( info->personality == PER_SVR4 )
+    if (info->personality == PER_SVR4)
     {
             /* Why this, you ask???  Well SVr4 maps page 0 as read-only,
                and some applications "depend" upon this behavior.
@@ -1553,7 +1553,7 @@ int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
     return 0;
 }
 
-static int load_aout_interp(void * exptr, int interp_fd)
+static int load_aout_interp(void *exptr, int interp_fd)
 {
     printf("a.out interpreter not yet supported\n");
     return(0);
-- 
2.22.1


