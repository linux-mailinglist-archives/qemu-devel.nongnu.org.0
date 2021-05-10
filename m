Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319AD3799E2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:17:02 +0200 (CEST)
Received: from localhost ([::1]:41502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgECy-0006Ri-Fi
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBX-0004Nk-T0
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:31 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBW-00018g-8Y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:31 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so5667596otg.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZfggWCaQ+1RfHRqfpMCTeEbyU3GDPb25L1jnEm8AZs=;
 b=zf7/YaHnNcQtsRCNm4TJiG7xitgcpjtlue4mKDJJgpGlaKhBUFztuCsmB0h7Y7PsAS
 0yDaOKZ3oiQZHEn9aXi5ViMJ9mA1cFdSdMWVU4FKoy+4cETRWOG8oij1YY1DWLkPaXnY
 irHld5d/9dZCTaQqgxQw66tCLEz58eTk3BTKw11iKapYHH9PiZMjjW7p3/EXdq9y3SGc
 Y7oHwaGdVbLraJJpEt0IBlOnz201o8G2wSu9XMy/4CP2xoXniSAXEo01CbY84G+Cf4TE
 5PMi9XN039LK26LF1P2wpj4kn71Om88w7geExymBYIRVbkyyfCYkXIrkIKaTkRRBYRP1
 NIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZfggWCaQ+1RfHRqfpMCTeEbyU3GDPb25L1jnEm8AZs=;
 b=RJksmO7BcFCnpJN0QXtbwv0WjeC43YLMVZkoA0WaLKtF9qhLV1pTLKbM7ugxEORv4G
 BCToJyWNQxW/olKu5I5HEXUYI7P1fDlVGuEsZY9/+qERArHqgWpG7DapN9JFuMEEXsOg
 vJQ2mBbHbbNAFdouNXLDMq8bYA8ZPMcCCXJOOd+KquXOiUhNvBsbdoTErUs09r0bVryR
 Tj2ms+IYcKFSc2TzIt8KtdPdumWAGsLYe31P4lHiy8/DuUKO+LrNXc5xmAmb7j56WPPo
 Hki0nPJNA3hN9y3SL3MWKvYHrLGsrZNLtQf+fnR+TRgkGV6S/CjbYbLL3mm33jPVeM/i
 2YzQ==
X-Gm-Message-State: AOAM530AFFX4AsRHVca4Qf1Ld+CJUqBdSFLsFfDdgm8eJcqnn9/OOi63
 qnwNMzqwQ7PZilV9fccOjCieo1OJTIlfAg==
X-Google-Smtp-Source: ABdhPJwfnKUxZh6oF+Hs5RAPEQEWFjcwDt84gMw4g7O6uyzHxRoYfQg2PRsENYuvaS9racNobqXlHw==
X-Received: by 2002:a9d:425:: with SMTP id 34mr23379081otc.25.1620684928593;
 Mon, 10 May 2021 15:15:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p64sm2874405oib.57.2021.05.10.15.15.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 15:15:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] bsd-user: rename linux_binprm to bsd_binprm
Date: Mon, 10 May 2021 16:15:11 -0600
Message-Id: <20210510221511.14205-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210510221511.14205-1-imp@bsdimp.com>
References: <20210510221511.14205-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::336;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x336.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename linux_binprm to bsd_binprm to reflect that we're loading BSD binaries,
not ELF ones.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 4 ++--
 bsd-user/elfload.c | 4 ++--
 bsd-user/qemu.h    | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index e1ed3b7b60..8d83f21eda 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -32,7 +32,7 @@ static int count(char **vec)
     return i;
 }
 
-static int prepare_binprm(struct linux_binprm *bprm)
+static int prepare_binprm(struct bsd_binprm *bprm)
 {
     struct stat         st;
     int mode;
@@ -127,7 +127,7 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 int loader_exec(const char *filename, char **argv, char **envp,
              struct target_pt_regs *regs, struct image_info *infop)
 {
-    struct linux_binprm bprm;
+    struct bsd_binprm bprm;
     int retval;
     int i;
 
diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 5f4d824d78..d658d722a5 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -662,7 +662,7 @@ static abi_ulong copy_elf_strings(int argc,char ** argv, void **page,
     return p;
 }
 
-static abi_ulong setup_arg_pages(abi_ulong p, struct linux_binprm *bprm,
+static abi_ulong setup_arg_pages(abi_ulong p, struct bsd_binprm *bprm,
                                  struct image_info *info)
 {
     abi_ulong stack_base, size, error;
@@ -1143,7 +1143,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
     syminfos = s;
 }
 
-int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
+int load_elf_binary(struct bsd_binprm * bprm, struct target_pt_regs * regs,
                     struct image_info * info)
 {
     struct elfhdr elf_ex;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 369c649fe5..5c33b4279f 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -114,7 +114,7 @@ extern unsigned long mmap_min_addr;
  * This structure is used to hold the arguments that are
  * used when loading binaries.
  */
-struct linux_binprm {
+struct bsd_binprm {
         char buf[128];
         void *page[MAX_ARG_PAGES];
         abi_ulong p;
@@ -132,9 +132,9 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 int loader_exec(const char * filename, char ** argv, char ** envp,
              struct target_pt_regs * regs, struct image_info *infop);
 
-int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
+int load_elf_binary(struct bsd_binprm * bprm, struct target_pt_regs * regs,
                     struct image_info * info);
-int load_flt_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
+int load_flt_binary(struct bsd_binprm * bprm, struct target_pt_regs * regs,
                     struct image_info * info);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
-- 
2.22.1


