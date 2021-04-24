Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772036A1EA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:05:05 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKmF-0000X3-JE
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhs-0005MC-8A
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:33 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhp-0004B0-4d
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:32 -0400
Received: by mail-io1-xd33.google.com with SMTP id l21so8547795iob.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/0ZDjPpNKimgApH3VJbA8iqD7cHZMxKyxi6PoUgZmI=;
 b=tSgdyN42kSFrr/nLVBYqH9HjNVv25apObBYhGEF4YHkTaIVmHI0vVXAZYk53zFr//I
 hQ+BumOWezTrlOYbqVRI/eO89IxNfUc4AL15kuzMHzW1Ogs1TjY30F5hMfBRmZGZCsF9
 qzBZv4otgGl6uVu+1NVqDwgBNFAiZXOJQ6T3FQqb6kKPTpzsZe2Gxa90TIpcnewcoMqP
 y9wWg5sjuZ22bY2ZsxF2LZUXzKdXP4C7gm8Ld7o+3ucM5yOpWEBjpxOZj2fciTuDTtMA
 Fy8VADOgLz+sAGKYWHk3Gw8MxHmwKHgUMJlT/O2GbWXtFF0dRUlwr+su/NNmIiT41A/v
 jS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/0ZDjPpNKimgApH3VJbA8iqD7cHZMxKyxi6PoUgZmI=;
 b=JGZeyHhxCeFwWgUrKNtvauYlSl1sTg66PRv3P2rlE96kUCd6m9jg4KyDwVpAF/xSP4
 nCj86kstGuLYvOUU+8rIHDanIjGbf7UC08VRK/SLuwfkPSW2M2EhqwJWXIchRfxtf+vX
 og2+NBeympMmK+hs1NsN36R+kXxW9jDt4ypqwNb8Oon/PzjpWLUsq97qGkAOBl7CB16r
 tnKbbWL8GSjgBNj28PKPvQmvtM2JS5E5ucaIOzFvE4kz961z6ypo7NgHstxt1gZIxlSu
 Dpt0N2R5Gzt4rxs9NeH+no6F/Ffv9evI7UivJNsECYQlpw+Mr3H+8SRjQ/qShlr4Sxrl
 1dXw==
X-Gm-Message-State: AOAM531S/5r5H/8uiBWLMPQU7omL/vmtI6ldxsBJIgz8gEunTS5tTale
 VW/FfULkGdemUMERZfpCRU0a4bWi6Pyme2NP
X-Google-Smtp-Source: ABdhPJzS1UlXg+M89hc54toKfiNiiERcNORPEFaZ4jsuLhwEahmLxb4gnIhuXNI/JAHDEAYQOVkAIw==
X-Received: by 2002:a6b:ce12:: with SMTP id p18mr7542817iob.199.1619280027412; 
 Sat, 24 Apr 2021 09:00:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:27 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/48] bsd-user: whitespace changes
Date: Sat, 24 Apr 2021 09:59:29 -0600
Message-Id: <20210424160016.15200-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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

keyword space paren, no space before ( in function calls, spaces around
operators.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index f38c4faacf..546946b91d 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -20,11 +20,11 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
     return 0;
 }
 
-static int count(char ** vec)
+static int count(char **vec)
 {
     int         i;
 
-    for(i = 0; *vec; i++) {
+    for (i = 0; *vec; i++) {
         vec++;
     }
 
@@ -37,15 +37,15 @@ static int prepare_binprm(struct linux_binprm *bprm)
     int mode;
     int retval;
 
-    if(fstat(bprm->fd, &st) < 0) {
+    if (fstat(bprm->fd, &st) < 0) {
         return(-errno);
     }
 
     mode = st.st_mode;
-    if(!S_ISREG(mode)) {        /* Must be regular file */
+    if (!S_ISREG(mode)) {        /* Must be regular file */
         return(-EACCES);
     }
-    if(!(mode & 0111)) {        /* Must have at least one execute bit set */
+    if (!(mode & 0111)) {        /* Must have at least one execute bit set */
         return(-EACCES);
     }
 
@@ -53,7 +53,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
     bprm->e_gid = getegid();
 
     /* Set-uid? */
-    if(mode & S_ISUID) {
+    if (mode & S_ISUID) {
         bprm->e_uid = st.st_uid;
     }
 
@@ -69,10 +69,10 @@ static int prepare_binprm(struct linux_binprm *bprm)
 
     memset(bprm->buf, 0, sizeof(bprm->buf));
     retval = lseek(bprm->fd, 0L, SEEK_SET);
-    if(retval >= 0) {
+    if (retval >= 0) {
         retval = read(bprm->fd, bprm->buf, 128);
     }
-    if(retval < 0) {
+    if (retval < 0) {
         perror("prepare_binprm");
         exit(-1);
         /* return(-errno); */
@@ -125,15 +125,15 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     return sp;
 }
 
-int loader_exec(const char * filename, char ** argv, char ** envp,
-             struct target_pt_regs * regs, struct image_info *infop)
+int loader_exec(const char *filename, char **argv, char **envp,
+             struct target_pt_regs *regs, struct image_info *infop)
 {
     struct linux_binprm bprm;
     int retval;
     int i;
 
-    bprm.p = TARGET_PAGE_SIZE*MAX_ARG_PAGES-sizeof(unsigned int);
-    for (i=0 ; i<MAX_ARG_PAGES ; i++)       /* clear page-table */
+    bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
+    for (i = 0 ; i < MAX_ARG_PAGES ; i++)       /* clear page-table */
             bprm.page[i] = NULL;
     retval = open(filename, O_RDONLY);
     if (retval < 0)
@@ -147,26 +147,26 @@ int loader_exec(const char * filename, char ** argv, char ** envp,
 
     retval = prepare_binprm(&bprm);
 
-    if(retval>=0) {
+    if (retval >= 0) {
         if (bprm.buf[0] == 0x7f
                 && bprm.buf[1] == 'E'
                 && bprm.buf[2] == 'L'
                 && bprm.buf[3] == 'F') {
-            retval = load_elf_binary(&bprm,regs,infop);
+            retval = load_elf_binary(&bprm, regs, infop);
         } else {
             fprintf(stderr, "Unknown binary format\n");
             return -1;
         }
     }
 
-    if(retval>=0) {
+    if (retval >= 0) {
         /* success.  Initialize important registers */
         do_init_thread(regs, infop);
         return retval;
     }
 
     /* Something went wrong, return the inode and free the argument pages*/
-    for (i=0 ; i<MAX_ARG_PAGES ; i++) {
+    for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
         g_free(bprm.page[i]);
     }
     return(retval);
-- 
2.22.1


