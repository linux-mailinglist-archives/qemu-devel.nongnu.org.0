Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839862F97D5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:23:11 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KCE-0004tN-Jn
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K8v-0002V6-W6
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:19:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K8t-0003Dt-J4
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:19:45 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DJwST6rHpz7WZp;
 Mon, 18 Jan 2021 10:18:33 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 10:19:31 +0800
Subject: [PATCH V4 1/4] bsd-user: "foo * bar" should be "foo *bar"
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <02263a65-7e3a-2d09-d7b1-6d54a19c8454@huawei.com>
Date: Mon, 18 Jan 2021 10:19:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=shiliyang@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error style problems found by checkpatch.pl:
ERROR: "foo ** bar" should be "foo **bar".
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
---
 bsd-user/bsdload.c |  4 ++--
 bsd-user/elfload.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index d708a54b03..65a2346bc7 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -36,7 +36,7 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
     return 0;
 }

-static int count(char ** vec)
+static int count(char **vec)
 {
     int         i;

@@ -188,7 +188,7 @@ static int find_in_path(char *path, const char *filename, char *retpath,
     return found;
 }

-int loader_exec(const char * filename, char ** argv, char ** envp,
+int loader_exec(const char *filename, char **argv, char **envp,
              struct target_pt_regs *regs, struct image_info *infop,
              struct bsd_binprm *bprm)
 {
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 373292e468..4d1a572534 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -66,12 +66,12 @@ static int load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr,
 abi_ulong target_stksiz;
 abi_ulong target_stkbas;

-static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
+static inline void memcpy_fromfs(void *to, const void *from, unsigned long n)
 {
     memcpy(to, from, n);
 }

-static int load_aout_interp(void * exptr, int interp_fd);
+static int load_aout_interp(void *exptr, int interp_fd);

 #ifdef BSWAP_NEEDED
 static void bswap_ehdr(struct elfhdr *ehdr)
@@ -156,7 +156,7 @@ static void bswap_note(struct elf_note *en) { }
  * to be put directly into the top of new user memory.
  *
  */
-static abi_ulong copy_elf_strings(int argc,char ** argv, void **page,
+static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
                                   abi_ulong p)
 {
     char *tmp, *tmp1, *pag = NULL;
@@ -288,7 +288,7 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
     }
 }

-static abi_ulong load_elf_interp(struct elfhdr * interp_elf_ex,
+static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
         int interpreter_fd, abi_ulong *interp_load_addr)
 {
     struct elf_phdr *elf_phdata  =  NULL;
@@ -614,11 +614,11 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     unsigned int interpreter_type = INTERPRETER_NONE;
     unsigned char ibcs2_interpreter;
     int i;
-    struct elf_phdr * elf_ppnt;
+    struct elf_phdr *elf_ppnt;
     struct elf_phdr *elf_phdata;
     abi_ulong elf_bss, elf_brk;
     int error, retval;
-    char * elf_interpreter;
+    char *elf_interpreter;
     abi_ulong baddr, elf_entry, et_dyn_addr, interp_load_addr = 0;
     abi_ulong reloc_func_desc = 0;
     char passed_fileno[6];
@@ -785,7 +785,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
        and then start this sucker up */

     {
-        char * passed_p;
+        char *passed_p;

         if (interpreter_type == INTERPRETER_AOUT) {
             snprintf(passed_fileno, sizeof(passed_fileno), "%d", bprm->fd);
@@ -2254,7 +2254,7 @@ out:

 #endif /* USE_ELF_CORE_DUMP */

-static int load_aout_interp(void * exptr, int interp_fd)
+static int load_aout_interp(void *exptr, int interp_fd)
 {

     printf("a.out interpreter not yet supported\n");
-- 
2.29.1.59.gf9b6481aed


