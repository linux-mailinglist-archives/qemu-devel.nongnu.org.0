Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93D2F47BA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:42:19 +0100 (CET)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcfS-000129-7S
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcVm-0007NL-0z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:32:18 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcVj-0003NW-Tl
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:32:17 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DG2Hx61Kgzj69W;
 Wed, 13 Jan 2021 17:31:09 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 17:32:03 +0800
Subject: [PATCH V3 2/4] bsd-user: suspect code indent for conditional
 statements
References: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <db8990fc-f702-bd2e-93cb-8c96587535d1@huawei.com>
Date: Wed, 13 Jan 2021 17:32:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=shiliyang@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl:
ERROR: suspect code indent for conditional statements

Signed-off-by: Liyang Shi <shiliyang@huawei.com>

---
 bsd-user/elfload.c | 10 +++++-----
 bsd-user/syscall.c |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 35c340f13a..a121e71339 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -184,7 +184,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
     memset(regs, 0, sizeof(*regs));
     regs->ARM_cpsr = 0x10;
     if (infop->entry & 1)
-      regs->ARM_cpsr |= CPSR_T;
+        regs->ARM_cpsr |= CPSR_T;
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = infop->start_stack;
     /* FIXME - what to for failure of get_user()? */
@@ -784,7 +784,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
         sp = sp &~ (abi_ulong)15;
         size = (DLINFO_ITEMS + 1) * 2;
         if (k_platform)
-          size += 2;
+            size += 2;
 #ifdef DLINFO_ARCH_ITEMS
         size += DLINFO_ARCH_ITEMS * 2;
 #endif
@@ -871,7 +871,7 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
                 malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);

         if (!elf_phdata)
-          return ~((abi_ulong)0UL);
+            return ~((abi_ulong)0UL);

         /*
          * If the size of this structure has changed, then punt, since
@@ -1267,7 +1267,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,

             if (strcmp(elf_interpreter,"/usr/lib/libc.so.1") == 0 ||
                 strcmp(elf_interpreter,"/usr/lib/ld.so.1") == 0) {
-              ibcs2_interpreter = 1;
+                ibcs2_interpreter = 1;
             }

 #if 0
@@ -1314,7 +1314,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
         /* Now figure out which format our binary is */
         if ((N_MAGIC(interp_ex) != OMAGIC) && (N_MAGIC(interp_ex) != ZMAGIC) &&
                 (N_MAGIC(interp_ex) != QMAGIC)) {
-          interpreter_type = INTERPRETER_ELF;
+            interpreter_type = INTERPRETER_ELF;
         }

         if (interp_elf_ex.e_ident[0] != 0x7f ||
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index d38ec7a162..9b471b665c 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -241,7 +241,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
         return -TARGET_EFAULT;
     holdlen = oldlen;
     for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
-       *q++ = tswap32(*p);
+        *q++ = tswap32(*p);
     oidfmt(snamep, namelen, NULL, &kind);
     /* XXX swap hnewp */
     ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
-- 
2.29.1.59.gf9b6481aed


