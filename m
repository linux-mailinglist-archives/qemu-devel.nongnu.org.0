Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94229370002
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:51:56 +0200 (CEST)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXIs-0004Fe-2p
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvt-0001Bs-90
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:05 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvp-0003mD-TO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:04 -0400
Received: by mail-oi1-x22a.google.com with SMTP id m13so70677822oiw.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88kJGdKOyrj+N0c0p0woyth0FHSFaX4rzOPFlVxWZbI=;
 b=sS+rzJPaaA3Ab+ObCYYMSSL09NWVbXzyj6uaPxd1dYDqvclr6Z5B8zZ5fa2E3oKbI4
 RxRUy2KJBEFgM5uT+rPu0lc0aagkFpoMOTwwJLLFkp0nV9QyMDD5blR7og/QMTOYk3xn
 4X5W3Yy156nhTxJy61uwZ4C3wqGTmE4EUMttm7Q6OeEYr0hSPlPplrWOnubZXT6p11JW
 8WUHpJ8sFQJOtEohsmBS16cEIDLGfbxBteAwyS9rty+7QbeIR4I6x92r3P6MPJ5M/Z9a
 sTxkwfzfeVu2GuGQc7owW4JcUanQTHHfTj4DBZwTCU377nCMsHdmwCfX/+ouCSrUKe2Q
 JPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88kJGdKOyrj+N0c0p0woyth0FHSFaX4rzOPFlVxWZbI=;
 b=VsBAx6xF3S8iVMvQB+GLt5hMushaCpykif0zLCwPA6mK5X4y9H/jl9Fu8gMdC4+I7h
 WCj1FvoWtwoZrbiYyKoksMpgSt36cNGuA3vi8cQkzRw/7ji/CucgY1Z4yn4TwHiqhJPw
 DdC658Gfh60PF8/SAEr2/gLy/xb+jsCD78WlL+YpiBRgsgQepk6rkFXayrpIbnT+sjzD
 Ya5mC8Wx8ZwXM1GeRH5y5ugH78XRPZlkk59RoIJHyBUZtXr+SMQe6lFXTjXyGyDTSLCb
 eb9uw8WTrotz1ahQDOpbPDiuY7fhh54Jc4xtQcwkKPDvw7CHGOUzQWL1qRFLFyrOjrh9
 wxYg==
X-Gm-Message-State: AOAM533i8NFq7g1RfNxP9JKwVZw6DrGmHBjJ5N4Gn1jUfHEkprodft0+
 NaTMcN26GvOZ5kqEBSD8rmFcEfgP2629wg==
X-Google-Smtp-Source: ABdhPJznHyYCyjrt14w4j2kfl3kUr+tZumAhhIa5ul5VH9UzoSjko/nrBi15VbfLyjIZeKnaPXwaQw==
X-Received: by 2002:aca:d70b:: with SMTP id o11mr4668306oig.151.1619803680430; 
 Fri, 30 Apr 2021 10:28:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.27.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:27:59 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] bsd-user: whitespace changes
Date: Fri, 30 Apr 2021 11:27:42 -0600
Message-Id: <20210430172746.99818-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
References: <20210430172746.99818-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x22a.google.com
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
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


