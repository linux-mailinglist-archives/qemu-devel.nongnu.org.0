Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE936A221
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:34:50 +0200 (CEST)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLF3-0004JG-9I
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKih-0005m3-H8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:23 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiD-0004It-VR
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:23 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p8so3349321iol.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CfTfHjIplvFUCZ6Pf4s7liZGutXFFwjfMMaiBUf8GIA=;
 b=zHfIIbhGBLKTq4iSnIgjQtOOGgkkwDuTtOmNMJLOiX0GTzERlYiqyNlbE1ZKkHfyZw
 QX07CjdM61ju7/6NAtsOPoQCtGSstOMe6/vqbBiMweJokSagr9nCGbh6nYr6njXantYP
 kR2qFAXqLvVID4pHGPvWqr7xGU6EhtVifZLfTQZv82QzPu2r4VvF1jpwqb1soTrr7NCN
 J1KXrtmQYZO/w1FXBo8JVlApNIawYI92KyUGYGivZUpIUoyZBDRwpSn1T0WunZWQYBWu
 hHgV8AxRbXNl3oVvsAbYZEiLyakD12fXPdAfiP/s16Ro6s1j8MJ+p1z9f0+22tc3jy1t
 itEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CfTfHjIplvFUCZ6Pf4s7liZGutXFFwjfMMaiBUf8GIA=;
 b=Yq6ohARrrKpFke6hbz+lHDaL3YsEL7jBaparoU+sJfZlDxjnZr2uXVhXajPjW90S1/
 VGDkP4uiPa4mbUuBdj21FBakZNjSuN++GDkTboRa0pOeVh0HE6SWYfQmvWltoVHohnm9
 TTeUKgxe/srw+RK9ipTkUeVPHJHjskzGMkz5ZvwRPFb2KsNV01Chcp1XsK++32S15daV
 nnQnWZApIC9hdQ+hxsOVJvRQ2nR9s4BeYKV+QkjALcggMs2WgRrCaRDGpi+VRo1Skszb
 Sk7XhPqMdOnD/3V+7yQ6A6yw0YFZN6m35i0vz2i6hs5Nh5ayDLCPv43ndF56oslY4X6I
 bzyg==
X-Gm-Message-State: AOAM531NXwL+oojc7Zt9jYHesYTPdwq3crlN17qHJmN/LevehtQKuDj1
 b3g0DulnJ43K8GEoEiOj58nk5zKYRUZFZh3d
X-Google-Smtp-Source: ABdhPJy4zq7Nl6O0irR3o3kt/DBk39curpy7aTTvMnhymF+fP2xIlmJj4iHzZAzUJhT8UnHA+7NsXQ==
X-Received: by 2002:a02:7f86:: with SMTP id r128mr8504270jac.136.1619280051067; 
 Sat, 24 Apr 2021 09:00:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:50 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/48] bsd-user: style tweak: use {} correctly
Date: Sat, 24 Apr 2021 09:59:57 -0600
Message-Id: <20210424160016.15200-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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

Format if/for/while statements with {} always, on a separate line
and fix a couple indentations issues for singletons.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 147 ++++++++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 55 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 75ccc06719..437ee82637 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -93,10 +93,12 @@ static const char *get_elf_platform(void)
 {
     static char elf_platform[] = "i386";
     int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
+    if (family > 6) {
         family = 6;
-    if (family >= 3)
+    }
+    if (family >= 3) {
         elf_platform[1] = '0' + family;
+    }
     return elf_platform;
 }
 
@@ -188,8 +190,9 @@ static inline void init_thread(struct target_pt_regs *regs,
     abi_long stack = infop->start_stack;
     memset(regs, 0, sizeof(*regs));
     regs->ARM_cpsr = 0x10;
-    if (infop->entry & 1)
+    if (infop->entry & 1) {
         regs->ARM_cpsr |= CPSR_T;
+    }
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = infop->start_stack;
     /* FIXME - what to for failure of get_user()? */
@@ -205,8 +208,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-enum
-{
+enum {
   ARM_HWCAP_ARM_SWP       = 1 << 0,
   ARM_HWCAP_ARM_HALF      = 1 << 1,
   ARM_HWCAP_ARM_THUMB     = 1 << 2,
@@ -252,9 +254,9 @@ static inline void init_thread(struct target_pt_regs *regs,
 #ifdef TARGET_ABI32
     regs->u_regs[14] = infop->start_stack - 16 * 4;
 #else
-    if (personality(infop->personality) == PER_LINUX32)
+    if (personality(infop->personality) == PER_LINUX32) {
         regs->u_regs[14] = infop->start_stack - 16 * 4;
-    else {
+    } else {
         regs->u_regs[14] = infop->start_stack - 16 * 8 - STACK_BIAS;
         if (bsd_type == target_freebsd) {
             regs->u_regs[8] = infop->start_stack;
@@ -520,8 +522,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #include "elf.h"
 
-struct exec
-{
+struct exec {
   unsigned int a_info;   /* Use macros N_MAGIC, etc for access */
   unsigned int a_text;   /* length of text, in bytes */
   unsigned int a_data;   /* length of data, in bytes */
@@ -640,7 +641,9 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
             exit(-1);
         }
         tmp1 = tmp;
-        while (*tmp++);
+        while (*tmp++) {
+            continue;
+        }
         len = tmp - tmp1;
         if (p < len) {  /* this shouldn't happen - 128kB */
                 return 0;
@@ -653,14 +656,14 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
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
@@ -684,8 +687,9 @@ static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
      * we'll use it for something else...
      */
     size = x86_stack_size;
-    if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE)
+    if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE) {
         size = MAX_ARG_PAGES * TARGET_PAGE_SIZE;
+    }
     error = target_mmap(0,
                         size + qemu_host_page_size,
                         PROT_READ | PROT_WRITE,
@@ -718,8 +722,9 @@ static void set_brk(abi_ulong start, abi_ulong end)
         /* page-align the start and end addresses... */
         start = HOST_PAGE_ALIGN(start);
         end = HOST_PAGE_ALIGN(end);
-        if (end <= start)
+        if (end <= start) {
                 return;
+        }
         if (target_mmap(start, end - start,
                        PROT_READ | PROT_WRITE | PROT_EXEC,
                        MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0) == -1) {
@@ -738,8 +743,9 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
 {
         abi_ulong nbyte;
 
-        if (elf_bss >= last_bss)
-                return;
+        if (elf_bss >= last_bss) {
+            return;
+        }
 
         /*
          * XXX: this is really a hack : if the real host page size is smaller
@@ -798,16 +804,18 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
          */
         sp = sp & ~(abi_ulong)15;
         size = (DLINFO_ITEMS + 1) * 2;
-        if (k_platform)
-                size += 2;
+        if (k_platform) {
+            size += 2;
+        }
 #ifdef DLINFO_ARCH_ITEMS
         size += DLINFO_ARCH_ITEMS * 2;
 #endif
         size += envc + argc + 2;
         size += (!ibcs ? 3 : 1);        /* argc itself */
         size *= n;
-        if (size & 15)
-                sp -= 16 - (size & 15);
+        if (size & 15) {
+            sp -= 16 - (size & 15);
+        }
 
         /*
          * This is correct because Linux defines
@@ -834,8 +842,9 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         NEW_AUX_ENT(AT_EGID, (abi_ulong) getegid());
         NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
         NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
-        if (k_platform)
+        if (k_platform) {
             NEW_AUX_ENT(AT_PLATFORM, u_platform);
+        }
 #ifdef ARCH_DLINFO
         /*
          * ARCH_DLINFO must come last so platform specific code can enforce
@@ -879,15 +888,16 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
 
 
     /* Now read in all of the header information */
-
-    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE)
+    if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PAGE_SIZE) {
         return ~(abi_ulong)0UL;
+    }
 
     elf_phdata =  (struct elf_phdr *)
         malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
 
-    if (!elf_phdata)
+    if (!elf_phdata) {
         return ~((abi_ulong)0UL);
+    }
 
     /*
      * If the size of this structure has changed, then punt, since
@@ -934,16 +944,22 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     }
 
     eppnt = elf_phdata;
-    for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++)
+    for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++) {
         if (eppnt->p_type == PT_LOAD) {
             int elf_type = MAP_PRIVATE | MAP_DENYWRITE;
             int elf_prot = 0;
             abi_ulong vaddr = 0;
             abi_ulong k;
 
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+            if (eppnt->p_flags & PF_R) {
+                elf_prot =  PROT_READ;
+            }
+            if (eppnt->p_flags & PF_W) {
+                elf_prot |= PROT_WRITE;
+            }
+            if (eppnt->p_flags & PF_X) {
+                elf_prot |= PROT_EXEC;
+            }
             if (interp_elf_ex->e_type == ET_EXEC || load_addr_set) {
                 elf_type |= MAP_FIXED;
                 vaddr = eppnt->p_vaddr;
@@ -972,15 +988,20 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
              * track of the largest address we see for this.
              */
             k = load_addr + eppnt->p_vaddr + eppnt->p_filesz;
-            if (k > elf_bss) elf_bss = k;
+            if (k > elf_bss) {
+                elf_bss = k;
+            }
 
             /*
              * Do the same thing for the memory mapping - between
              * elf_bss and last_bss is the bss section.
              */
             k = load_addr + eppnt->p_memsz + eppnt->p_vaddr;
-            if (k > last_bss) last_bss = k;
+            if (k > last_bss) {
+                last_bss = k;
+            }
         }
+    }
 
     /* Now use mmap to map the library into memory. */
 
@@ -1061,8 +1082,9 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 
     lseek(fd, hdr->e_shoff, SEEK_SET);
     for (i = 0; i < hdr->e_shnum; i++) {
-        if (read(fd, &sechdr, sizeof(sechdr)) != sizeof(sechdr))
+        if (read(fd, &sechdr, sizeof(sechdr)) != sizeof(sechdr)) {
             return;
+        }
 #ifdef BSWAP_NEEDED
         bswap_shdr(&sechdr);
 #endif
@@ -1244,14 +1266,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     elf_interpreter = NULL;
     start_code = ~((abi_ulong)0UL);
     end_code = 0;
-    start_data =n 0;
+    start_data = 0;
     end_data = 0;
     interp_ex.a_info = 0;
 
     for (i = 0; i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
-            if (elf_interpreter != NULL)
-            {
+            if (elf_interpreter != NULL) {
                 free(elf_phdata);
                 free(elf_interpreter);
                 close(bprm->fd);
@@ -1296,8 +1317,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
                 retval = open(path(elf_interpreter), O_RDONLY);
                 if (retval >= 0) {
                     interpreter_fd = retval;
-                }
-                else {
+                } else {
                     perror(elf_interpreter);
                     exit(-1);
                 }
@@ -1392,8 +1412,9 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
          */
         for (i = 0, elf_ppnt = elf_phdata; i < elf_ex.e_phnum;
             i++, elf_ppnt++) {
-            if (elf_ppnt->p_type != PT_LOAD)
+            if (elf_ppnt->p_type != PT_LOAD) {
                 continue;
+            }
             if (HOST_PAGE_ALIGN(elf_ppnt->p_vaddr) < mmap_min_addr) {
                 guest_base = HOST_PAGE_ALIGN(mmap_min_addr);
                 break;
@@ -1419,12 +1440,19 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         int elf_flags = 0;
         abi_ulong error;
 
-        if (elf_ppnt->p_type != PT_LOAD)
+        if (elf_ppnt->p_type != PT_LOAD) {
             continue;
+        }
 
-        if (elf_ppnt->p_flags & PF_R) elf_prot |= PROT_READ;
-        if (elf_ppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-        if (elf_ppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+        if (elf_ppnt->p_flags & PF_R) {
+            elf_prot |= PROT_READ;
+        }
+        if (elf_ppnt->p_flags & PF_W) {
+            elf_prot |= PROT_WRITE;
+        }
+        if (elf_ppnt->p_flags & PF_X) {
+            elf_prot |= PROT_EXEC;
+        }
         elf_flags = MAP_PRIVATE | MAP_DENYWRITE;
         if (elf_ex.e_type == ET_EXEC || load_addr_set) {
             elf_flags |= MAP_FIXED;
@@ -1460,8 +1488,9 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         }
 
 #ifdef LOW_ELF_STACK
-        if (TARGET_ELF_PAGESTART(elf_ppnt->p_vaddr) < elf_stack)
+        if (TARGET_ELF_PAGESTART(elf_ppnt->p_vaddr) < elf_stack) {
             elf_stack = TARGET_ELF_PAGESTART(elf_ppnt->p_vaddr);
+        }
 #endif
 
         if (!load_addr_set) {
@@ -1475,19 +1504,26 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
             }
         }
         k = elf_ppnt->p_vaddr;
-        if (k < start_code)
+        if (k < start_code) {
             start_code = k;
-        if (start_data < k)
+        }
+        if (start_data < k) {
             start_data = k;
+        }
         k = elf_ppnt->p_vaddr + elf_ppnt->p_filesz;
-        if (k > elf_bss)
+        if (k > elf_bss) {
             elf_bss = k;
-        if ((elf_ppnt->p_flags & PF_X) && end_code <  k)
+        }
+        if ((elf_ppnt->p_flags & PF_X) && end_code <  k) {
             end_code = k;
-        if (end_data < k)
+        }
+        if (end_data < k) {
             end_data = k;
+        }
         k = elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
-        if (k > elf_brk) elf_brk = k;
+        if (k > elf_brk) {
+            elf_brk = k;
+        }
     }
 
     elf_entry += load_bias;
@@ -1501,8 +1537,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     if (elf_interpreter) {
         if (interpreter_type & 1) {
             elf_entry = load_aout_interp(&interp_ex, interpreter_fd);
-        }
-        else if (interpreter_type & 2) {
+        } else if (interpreter_type & 2) {
             elf_entry = load_elf_interp(&interp_elf_ex, interpreter_fd,
                                             &interp_load_addr);
         }
@@ -1521,10 +1556,13 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 
     free(elf_phdata);
 
-    if (qemu_log_enabled())
+    if (qemu_log_enabled()) {
         load_symbols(&elf_ex, bprm->fd);
+    }
 
-    if (interpreter_type != INTERPRETER_AOUT) close(bprm->fd);
+    if (interpreter_type != INTERPRETER_AOUT) {
+        close(bprm->fd);
+    }
     info->personality = (ibcs2_interpreter ? PER_SVR4 : PER_LINUX);
 
 #ifdef LOW_ELF_STACK
@@ -1554,8 +1592,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 
     padzero(elf_bss, elf_brk);
 
-    if (info->personality == PER_SVR4)
-    {
+    if (info->personality == PER_SVR4) {
             /*
              * Why this, you ask???  Well SVr4 maps page 0 as read-only, and
              * some applications "depend" upon this behavior.  Since we do not
-- 
2.22.1


