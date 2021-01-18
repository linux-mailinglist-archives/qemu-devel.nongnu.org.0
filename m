Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BB2F97D7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:24:07 +0100 (CET)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KD8-0006YS-8A
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1KAh-0003ey-Fg
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:21:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1KAc-0003yT-NH
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:21:35 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJwVX000Pz15rk0;
 Mon, 18 Jan 2021 10:20:19 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 10:21:18 +0800
Subject: [PATCH V4 4/4] bsd-user: space required after semicolon
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <6bdfc158-0f16-b19f-4c65-8c47338f1dcc@huawei.com>
Date: Mon, 18 Jan 2021 10:21:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
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
ERROR: space required after that ','

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
---
 bsd-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 2842dfe56b..c89c998c22 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -636,8 +636,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,

 #ifndef __FreeBSD__
     bprm->p = copy_elf_strings(1, &bprm->filename, bprm->page, bprm->p);
-    bprm->p = copy_elf_strings(bprm->envc,bprm->envp,bprm->page,bprm->p);
-    bprm->p = copy_elf_strings(bprm->argc,bprm->argv,bprm->page,bprm->p);
+    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page, bprm->p);
+    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page, bprm->p);
     if (!bprm->p) {
         retval = -E2BIG;
     }
@@ -739,7 +739,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
             if (retval >= 0) {
                 retval = lseek(interpreter_fd, 0, SEEK_SET);
                 if(retval >= 0) {
-                    retval = read(interpreter_fd,bprm->buf,128);
+                    retval = read(interpreter_fd, bprm->buf, 128);
                 }
             }
             if (retval >= 0) {
@@ -769,7 +769,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
         }

         if (interp_elf_ex.e_ident[0] != 0x7f ||
-                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF",3) != 0) {
+                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF", 3) != 0) {
             interpreter_type &= ~INTERPRETER_ELF;
         }

@@ -792,7 +792,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
             passed_p = passed_fileno;

             if (elf_interpreter) {
-                bprm->p = copy_elf_strings(1,&passed_p,bprm->page,bprm->p);
+                bprm->p = copy_elf_strings(1, &passed_p, bprm->page, bprm->p);
                 bprm->argc++;
             }
         }
-- 
2.29.1.59.gf9b6481aed


