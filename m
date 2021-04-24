Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0A236A206
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:18:58 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKzh-0003Ag-IM
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKie-0005h9-7b
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:20 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiB-0004IN-LM
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:19 -0400
Received: by mail-io1-xd30.google.com with SMTP id t21so944227iob.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=skPt9enRR+SX6X1JLVS3CXeQzytNJXaZIsNfJk8nNA0=;
 b=URaR9I8njhMOsAyVDmMISiIkogB6GUW4mFYtIvUA0yeHrz+RMwN5Dto18eV4ueA/kf
 Iov1MIkWCs3bUyS8nnGN8bUZyfLjNJX6Ch479Q+J9tSR3bq89PIjMwTs8ICNy3pagNVl
 Gz8Aqd8fEhUu4e4OFtBZxdFBbB09VmEPcp2OYuMyXcalppo0GPEPrlExJgbDlWd2ILVO
 18S1gI3m51T7Ftd51PjiUv5Mm31mwmvjEjp6ZzqsPAOKIK1JrVM3J/gst0SQMZtpklDz
 eFpnS7UnVNI7KkdQPtGEbu1nOqbGBTkvzOESoqebbLEmTdrXMf5Z+XxCC+n7KYTJb6te
 d06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=skPt9enRR+SX6X1JLVS3CXeQzytNJXaZIsNfJk8nNA0=;
 b=qwB8XmHX/ZudCq6+6fLEZ0Lff0GLaq1VZmtm3nH7nMltOxvaKjwmMT4sR8fo9mRLCh
 HoJmnvid9QF4U/IyP2Z/ls33nuEhxjPMn1V2TzfugeEjrhB8okyl3Rd85dN3lDGedTvg
 mkDLbjKmj+2UgPvVQ7se+3e3eQgVNhaqHgj/bw4OuLnKa7rLMwAkYtJIeIPBXSruw7p/
 zxPhGN+5zxmpNM+wV0ZH+vSlZ5q6e3/0vUHEJV5yOHRVZl/19DxMIM6ZhcCNTaA1vdMa
 lrjag6YCi05B+Z9H+qIQh+V9m1YwhqsOR/2i5aRVihwz0JRvGMNM8KZ8kMkJZ4RcRUWx
 Unxg==
X-Gm-Message-State: AOAM532vZy5eVoAtfZfM+/3X9T9oD3NyDvGl2eH2ct7J7kqhhLVH6jTc
 zd6VpPsQYmQ79DptQWCVfVkdMHNpzofwtaYT
X-Google-Smtp-Source: ABdhPJzNqZxPU61x3XiV8G4ePWyUkWNfWeDiTwtMb3xpoAusMJhYar9HpflGKWpQa7NUkzYvoFC97w==
X-Received: by 2002:a02:a14a:: with SMTP id m10mr8367292jah.105.1619280049112; 
 Sat, 24 Apr 2021 09:00:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:48 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/48] bsd-user: style tweak: space pedantry
Date: Sat, 24 Apr 2021 09:59:55 -0600
Message-Id: <20210424160016.15200-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 243a5a5048..f455a3812a 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -756,7 +756,7 @@ static void padzero(abi_ulong elf_bss, abi_ulong last_bss)
 
 
 static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
-                                   struct elfhdr * exec,
+                                   struct elfhdr *exec,
                                    abi_ulong load_addr,
                                    abi_ulong load_bias,
                                    abi_ulong interp_load_addr, int ibcs,
@@ -891,12 +891,12 @@ static abi_ulong load_elf_interp(struct elfhdr *interp_elf_ex,
     if (retval < 0) {
         perror("load_elf_interp");
         exit(-1);
-        free (elf_phdata);
+        free(elf_phdata);
         return retval;
     }
 #ifdef BSWAP_NEEDED
     eppnt = elf_phdata;
-    for (i = 0; i<interp_elf_ex->e_phnum; i++, eppnt++) {
+    for (i = 0; i < interp_elf_ex->e_phnum; i++, eppnt++) {
         bswap_phdr(eppnt);
     }
 #endif
@@ -1155,11 +1155,11 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     unsigned int interpreter_type = INTERPRETER_NONE;
     unsigned char ibcs2_interpreter;
     int i;
-    struct elf_phdr * elf_ppnt;
+    struct elf_phdr *elf_ppnt;
     struct elf_phdr *elf_phdata;
     abi_ulong elf_bss, k, elf_brk;
     int retval;
-    char * elf_interpreter;
+    char *elf_interpreter;
     abi_ulong elf_entry, interp_load_addr = 0;
     abi_ulong start_code, end_code, start_data, end_data;
     abi_ulong reloc_func_desc = 0;
@@ -1183,14 +1183,14 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
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
@@ -1223,11 +1223,11 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
     elf_interpreter = NULL;
     start_code = ~((abi_ulong)0UL);
     end_code = 0;
-    start_data = 0;
+    start_data =n 0;
     end_data = 0;
     interp_ex.a_info = 0;
 
-    for (i = 0;i < elf_ex.e_phnum; i++) {
+    for (i = 0; i < elf_ex.e_phnum; i++) {
         if (elf_ppnt->p_type == PT_INTERP) {
             if (elf_interpreter != NULL)
             {
@@ -1267,7 +1267,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 
             if (strcmp(elf_interpreter, "/usr/lib/libc.so.1") == 0 ||
                 strcmp(elf_interpreter, "/usr/lib/ld.so.1") == 0) {
-              ibcs2_interpreter = 1;
+                ibcs2_interpreter = 1;
             }
 
             if (retval >= 0) {
-- 
2.22.1


