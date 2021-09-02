Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440723FF851
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:19:37 +0200 (CEST)
Received: from localhost ([::1]:35648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwvg-0003cI-9T
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRU-0007LA-EB
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:24 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRR-0003Ec-PL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:23 -0400
Received: by mail-io1-xd2e.google.com with SMTP id z1so4732677ioh.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CR10JlOlEAQKf3unljvg+q/iEV0fpRG0cHSgOERU434=;
 b=hKht9dXVZ0DVAEOk2kWcj2kAugX7N3rhgDjTM3o3fZ9Yd3RtMTV9cSx42TmTKTEflr
 QeWJPorhPdTVRCSyrqQX4/LChMSwdK9p2K+rS2QmWWT1Vsx29LZBgyp1PkEHQStOEb1Z
 f4l77xeuxv1yqRDn70tXle/71fei5U5xcGCSr9Aoq7gNOyH77TZ4IUf9U1SvKZSqsR3Q
 89EjVMSH6MR76dLssJoaofLFqWXSYD2LH5EblbP9k61UnglTLgbwbZki44eWErZuv8i4
 dbMux2k5+52JZ5e4Z7LV4gsfssggT8XpqFN/fwsYzGEqQc47xO693vmZ8JOeSWBNVCu7
 NDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CR10JlOlEAQKf3unljvg+q/iEV0fpRG0cHSgOERU434=;
 b=bZizhePS7RaVkSptMxPTsrkrs9AcM64fP6e7RLtUhmRCCV4E4hzRtGXH+0djtmN9BD
 ZgxOCy3pJPgRBpkIWgqgZ7VdSMpdiQoS3rsD6iU9MvUMx5O0ujTuF77dtRY6bwMGjSqc
 v5cIpVE9AecFVKL0zQA7sbkKV/2xppVQ10jcQMhr5YlRYhN0gigFLWguomyXfBZ4Jc06
 VzvJYryrglCvoZ7f74tv6L7K9dx7GoMRxyqwjfRxqN3umgqSXvowl7PVAVuqeva5gg9K
 u2T7JJHqalGhb3V5phjgdEqXcKgqnkeFCU8rGLKkhfongsX6Zgdn42xe67zm5n1zNO8n
 kAiw==
X-Gm-Message-State: AOAM530g2vaSqIFn14es5RF2Yz3cZbNq+mZleKVqk5I21QQ3C+cIfPz7
 /4+6trE64eHcndg/kBpPYg+u08GZc7BegA==
X-Google-Smtp-Source: ABdhPJzQ+Tnba9C8sFOUzNL41k6x5lrL25ZDt0IcceBHmNiMpYeslTdZ2k2fCfkslWq+oV5bxmyEvg==
X-Received: by 2002:a05:6602:200f:: with SMTP id
 y15mr729330iod.64.1630626500412; 
 Thu, 02 Sep 2021 16:48:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:19 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/43] bsd-user: elfload.c style catch up patch
Date: Thu,  2 Sep 2021 17:47:24 -0600
Message-Id: <20210902234729.76141-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Various style fixes to elfload.c that were too painful to make earlier
in this series.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 208 ++++++++++++++++++++++-----------------------
 1 file changed, 104 insertions(+), 104 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 05751f3ce7..3660961582 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -143,10 +143,12 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
             exit(-1);
         }
         tmp1 = tmp;
-        while (*tmp++);
+        while (*tmp++) {
+            continue;
+        }
         len = tmp - tmp1;
         if (p < len) {  /* this shouldn't happen - 128kB */
-                return 0;
+            return 0;
         }
         while (len) {
             --p; --tmp; --len;
@@ -156,14 +158,14 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
                 if (!pag) {
                     pag = g_try_malloc0(TARGET_PAGE_SIZE);
                     page[p / TARGET_PAGE_SIZE] = pag;
-                    if (!pag)
+                    if (!pag) {
                         return 0;
+                    }
                 }
             }
             if (len == 0 || offset == 0) {
                 *(pag + offset) = *tmp;
-            }
-            else {
+            } else {
               int bytes_to_copy = (len > offset) ? offset : len;
               tmp -= bytes_to_copy;
               p -= bytes_to_copy;
@@ -182,16 +184,14 @@ static void setup_arg_pages(struct bsd_binprm *bprm, struct image_info *info,
     abi_ulong stack_base, size;
     abi_long addr;
 
-    /* Create enough stack to hold everything.  If we don't use
-     * it for args, we'll use it for something else...
+    /*
+     * Create enough stack to hold everything.  If we don't use it for args,
+     * we'll use it for something else...
      */
     size = target_dflssiz;
     stack_base = TARGET_USRSTACK - size;
-    addr = target_mmap(stack_base,
-                        size + qemu_host_page_size,
-                        PROT_READ | PROT_WRITE,
-                        MAP_PRIVATE | MAP_ANON,
-                        -1, 0);
+    addr = target_mmap(stack_base , size + qemu_host_page_size,
+            PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
     if (addr == -1) {
         perror("stk mmap");
         exit(-1);
@@ -210,55 +210,60 @@ static void setup_arg_pages(struct bsd_binprm *bprm, struct image_info *info,
 
 static void set_brk(abi_ulong start, abi_ulong end)
 {
-        /* page-align the start and end addresses... */
-        start = HOST_PAGE_ALIGN(start);
-        end = HOST_PAGE_ALIGN(end);
-        if (end <= start)
-                return;
-        if (target_mmap(start, end - start,
-                       PROT_READ | PROT_WRITE | PROT_EXEC,
-                       MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0) == -1) {
-            perror("cannot mmap brk");
-            exit(-1);
-        }
+    /* page-align the start and end addresses... */
+    start = HOST_PAGE_ALIGN(start);
+    end = HOST_PAGE_ALIGN(end);
+    if (end <= start) {
+        return;
+    }
+    if (target_mmap(start, end - start, PROT_READ | PROT_WRITE | PROT_EXEC,
+        MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0) == -1) {
+        perror("cannot mmap brk");
+        exit(-1);
+    }
 }
 
 
-/* We need to explicitly zero any fractional pages after the data
-   section (i.e. bss).  This would contain the junk from the file that
-   should not be in memory. */
+/*
+ * We need to explicitly zero any fractional pages after the data
+ * section (i.e. bss).  This would contain the junk from the file that
+ * should not be in memory.
+ */
 static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
 {
-        abi_ulong nbyte;
+    abi_ulong nbyte;
 
-        if (elf_bss >= last_bss)
-                return;
+    if (elf_bss >= last_bss) {
+        return;
+    }
 
-        /* XXX: this is really a hack : if the real host page size is
-           smaller than the target page size, some pages after the end
-           of the file may not be mapped. A better fix would be to
-           patch target_mmap(), but it is more complicated as the file
-           size must be known */
-        if (qemu_real_host_page_size < qemu_host_page_size) {
-            abi_ulong end_addr, end_addr1;
-            end_addr1 = REAL_HOST_PAGE_ALIGN(elf_bss);
-            end_addr = HOST_PAGE_ALIGN(elf_bss);
-            if (end_addr1 < end_addr) {
-                mmap((void *)g2h_untagged(end_addr1), end_addr - end_addr1,
-                     PROT_READ | PROT_WRITE | PROT_EXEC,
-                     MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
-            }
+    /*
+     * XXX: this is really a hack : if the real host page size is
+     * smaller than the target page size, some pages after the end
+     * of the file may not be mapped. A better fix would be to
+     * patch target_mmap(), but it is more complicated as the file
+     * size must be known.
+     */
+    if (qemu_real_host_page_size < qemu_host_page_size) {
+        abi_ulong end_addr, end_addr1;
+        end_addr1 = REAL_HOST_PAGE_ALIGN(elf_bss);
+        end_addr = HOST_PAGE_ALIGN(elf_bss);
+        if (end_addr1 < end_addr) {
+            mmap((void *)g2h_untagged(end_addr1), end_addr - end_addr1,
+                 PROT_READ | PROT_WRITE | PROT_EXEC,
+                 MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
         }
+    }
 
-        nbyte = elf_bss & (qemu_host_page_size - 1);
-        if (nbyte) {
-            nbyte = qemu_host_page_size - nbyte;
-            do {
-                /* FIXME - what to do if put_user() fails? */
-                put_user_u8(0, elf_bss);
-                elf_bss++;
-            } while (--nbyte);
-        }
+    nbyte = elf_bss & (qemu_host_page_size - 1);
+    if (nbyte) {
+        nbyte = qemu_host_page_size - nbyte;
+        do {
+            /* FIXME - what to do if put_user() fails? */
+            put_user_u8(0, elf_bss);
+            elf_bss++;
+        } while (--nbyte);
+    }
 }
 
 static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
@@ -280,23 +285,23 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
 
     bswap_ehdr(interp_elf_ex);
     /* First of all, some simple consistency checks */
-    if ((interp_elf_ex->e_type != ET_EXEC &&
-         interp_elf_ex->e_type != ET_DYN) ||
-        !elf_check_arch(interp_elf_ex->e_machine)) {
+    if ((interp_elf_ex->e_type != ET_EXEC && interp_elf_ex->e_type != ET_DYN) ||
+          !elf_check_arch(interp_elf_ex->e_machine)) {
         return ~((abi_ulong)0UL);
     }
 
 
     /* Now read in all of the header information */
-
-    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
+    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE) {
         return ~(abi_ulong)0UL;
+    }
 
-    elf_phdata =  (struct elf_phdr *)
-        malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
+    elf_phdata =  (struct elf_phdr *) malloc(sizeof(struct elf_phdr) *
+            interp_elf_ex->e_phnum);
 
-    if (!elf_phdata)
+    if (!elf_phdata) {
         return ~((abi_ulong)0UL);
+    }
 
     /*
      * If the size of this structure has changed, then punt, since
@@ -309,9 +314,8 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
 
     retval = lseek(interpreter_fd, interp_elf_ex->e_phoff, SEEK_SET);
     if (retval >= 0) {
-        retval = read(interpreter_fd,
-                      (char *) elf_phdata,
-                      sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
+        retval = read(interpreter_fd, (char *) elf_phdata,
+                sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
     }
     if (retval < 0) {
         perror("load_elf_interp");
@@ -322,11 +326,12 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     bswap_phdr(elf_phdata, interp_elf_ex->e_phnum);
 
     if (interp_elf_ex->e_type == ET_DYN) {
-        /* in order to avoid hardcoding the interpreter load
-           address in qemu, we allocate a big enough memory zone */
-        error = target_mmap(0, INTERP_MAP_SIZE,
-                            PROT_NONE, MAP_PRIVATE | MAP_ANON,
-                            -1, 0);
+        /*
+         * In order to avoid hardcoding the interpreter load
+         * address in qemu, we allocate a big enough memory zone.
+         */
+        error = target_mmap(0, INTERP_MAP_SIZE, PROT_NONE,
+                MAP_PRIVATE | MAP_ANON, -1, 0);
         if (error == -1) {
             perror("mmap");
             exit(-1);
@@ -430,7 +435,7 @@ static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
     struct elf_sym *syms = s->disas_symtab.elf64;
 #endif
 
-    // binary search
+    /* binary search */
     struct elf_sym *sym;
 
     sym = bsearch(&orig_addr, syms, s->disas_num_syms, sizeof(*syms), symfind);
@@ -446,9 +451,8 @@ static int symcmp(const void *s0, const void *s1)
 {
     struct elf_sym *sym0 = (struct elf_sym *)s0;
     struct elf_sym *sym1 = (struct elf_sym *)s1;
-    return (sym0->st_value < sym1->st_value)
-        ? -1
-        : ((sym0->st_value > sym1->st_value) ? 1 : 0);
+    return (sym0->st_value < sym1->st_value) ? -1 :
+        ((sym0->st_value > sym1->st_value) ? 1 : 0);
 }
 
 /* Best attempt to load symbols from this ELF object. */
@@ -462,23 +466,24 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
     lseek(fd, hdr->e_shoff, SEEK_SET);
     for (i = 0; i < hdr->e_shnum; i++) {
-        if (read(fd, &sechdr, sizeof(sechdr)) != sizeof(sechdr))
+        if (read(fd, &sechdr, sizeof(sechdr)) != sizeof(sechdr)) {
             return;
+        }
         bswap_shdr(&sechdr, 1);
         if (sechdr.sh_type == SHT_SYMTAB) {
             symtab = sechdr;
-            lseek(fd, hdr->e_shoff
-                  + sizeof(sechdr) * sechdr.sh_link, SEEK_SET);
-            if (read(fd, &strtab, sizeof(strtab))
-                != sizeof(strtab))
+            lseek(fd, hdr->e_shoff + sizeof(sechdr) * sechdr.sh_link,
+                  SEEK_SET);
+            if (read(fd, &strtab, sizeof(strtab)) != sizeof(strtab)) {
                 return;
+            }
             bswap_shdr(&strtab, 1);
             goto found;
         }
     }
     return; /* Shouldn't happen... */
 
- found:
+found:
     /* Now know where the strtab and symtab are.  Snarf them. */
     s = malloc(sizeof(*s));
     syms = malloc(symtab.sh_size);
@@ -506,7 +511,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
     i = 0;
     while (i < nsyms) {
         bswap_sym(syms + i);
-        // Throw away entries which we do not need.
+        /* Throw away entries which we do not need. */
         if (syms[i].st_shndx == SHN_UNDEF ||
                 syms[i].st_shndx >= SHN_LORESERVE ||
                 ELF_ST_TYPE(syms[i].st_info) != STT_FUNC) {
@@ -519,10 +524,12 @@ static void load_symbols(struct elfhdr *hdr, int fd)
         i++;
     }
 
-     /* Attempt to free the storage associated with the local symbols
-        that we threw away.  Whether or not this has any effect on the
-        memory allocation depends on the malloc implementation and how
-        many symbols we managed to discard. */
+     /*
+      * Attempt to free the storage associated with the local symbols
+      * that we threw away.  Whether or not this has any effect on the
+      * memory allocation depends on the malloc implementation and how
+      * many symbols we managed to discard.
+      */
     new_syms = realloc(syms, nsyms * sizeof(*syms));
     if (new_syms == NULL) {
         free(s);
@@ -578,19 +585,19 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     /* First of all, some simple consistency checks */
     if ((elf_ex.e_type != ET_EXEC && elf_ex.e_type != ET_DYN) ||
-                                (!elf_check_arch(elf_ex.e_machine))) {
+        (!elf_check_arch(elf_ex.e_machine))) {
             return -ENOEXEC;
     }
 
     bprm->p = copy_elf_strings(1, &bprm->filename, bprm->page, bprm->p);
-    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page,bprm->p);
-    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page,bprm->p);
+    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page, bprm->p);
+    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page, bprm->p);
     if (!bprm->p) {
         retval = -E2BIG;
     }
 
     /* Now read in all of the header information */
-    elf_phdata = (struct elf_phdr *)malloc(elf_ex.e_phentsize*elf_ex.e_phnum);
+    elf_phdata = (struct elf_phdr *)malloc(elf_ex.e_phentsize * elf_ex.e_phnum);
     if (elf_phdata == NULL) {
         return -ENOMEM;
     }
@@ -609,7 +616,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     }
 
     bswap_phdr(elf_phdata, elf_ex.e_phnum);
-
     elf_ppnt = elf_phdata;
 
     elf_bss = 0;
@@ -622,23 +628,16 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     start_data = 0;
     end_data = 0;
 
-    for (i = 0;i < elf_ex.e_phnum; i++) {
+    for (i = 0; i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
-            if (elf_interpreter != NULL)
-            {
+            if (elf_interpreter != NULL) {
                 free(elf_phdata);
                 free(elf_interpreter);
                 close(bprm->fd);
                 return -EINVAL;
             }
 
-            /* This is the program interpreter used for
-             * shared libraries - for now assume that this
-             * is an a.out format binary
-             */
-
             elf_interpreter = (char *)malloc(elf_ppnt->p_filesz);
-
             if (elf_interpreter == NULL) {
                 free(elf_phdata);
                 close(bprm->fd);
@@ -658,8 +657,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                 retval = open(path(elf_interpreter), O_RDONLY);
                 if (retval >= 0) {
                     interpreter_fd = retval;
-                }
-                else {
+                } else {
                     perror(elf_interpreter);
                     exit(-1);
                     /* retval = -errno; */
@@ -673,7 +671,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                 }
             }
             if (retval >= 0) {
-                interp_elf_ex = *((struct elfhdr *) bprm->buf); /* elf exec-header */
+                interp_elf_ex = *((struct elfhdr *) bprm->buf);
             }
             if (retval < 0) {
                 perror("load_elf_binary3");
@@ -698,9 +696,10 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
         }
     }
 
-    /* OK, we are done with that, now set up the arg stuff,
-       and then start this sucker up */
-
+    /*
+     * OK, we are done with that, now set up the arg stuff, and then start this
+     * sucker up
+     */
     if (!bprm->p) {
         free(elf_interpreter);
         free(elf_phdata);
@@ -822,8 +821,9 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 
     free(elf_phdata);
 
-    if (qemu_log_enabled())
+    if (qemu_log_enabled()) {
         load_symbols(&elf_ex, bprm->fd);
+    }
 
     close(bprm->fd);
 
-- 
2.32.0


