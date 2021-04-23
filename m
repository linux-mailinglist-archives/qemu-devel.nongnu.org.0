Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A42369B75
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:44:03 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2eg-0000ZP-KS
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aY-000543-M3
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:46 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:37542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aX-0007uI-15
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:46 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso32334707otm.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2s8vq4d/u6ExixWr3LABUBqHOg+2FqYKQ6WxdLTQB3U=;
 b=yduzLWhW34Sjac2zln4bKYrcC6o2//LQnrb6suPqxQh+2t8tbwY08Rd3ZOs+Oyzn7E
 APdZaxsYAs5ZYD8kN6AT26KihpkD48IU0zjyHczJvhWmdO/1RnfoSdFNNpQknRx0Dz3A
 Rm1jhDdPDu8Z344qgBbMkZ6tkgZjSVfakk7LYMnW/jI5ZPTp7F8VpAbmULdh6ZuQjNPz
 PZtGIrmtUlvsqF/tdQVT6BJbeylq2dUTdtmNfkVx2AeJhDNTTVxU9jUKfJCq4VBl2+lK
 06gZ8cnEXeIhBonzuBYSMO4cv8NOKZmzoBB5MvgFutls+YT2t2wK4zJIlqK5FhccNp6a
 xEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2s8vq4d/u6ExixWr3LABUBqHOg+2FqYKQ6WxdLTQB3U=;
 b=SjdxCZbFywZVrW4WRPy2DML4duv7cecqlRRo18GNVxfeB5w8WicCI8j+gtu0vVAQzX
 7GbwLd+MzpCm2WvRBwpJw8+dXyJpuEfw2rHIMDei85FRQ5NfIk/KJeHJdfuGLNBY9etQ
 qNmeyRnWyYTFUwDih9UDYAIR4PLo727hFmw48SrQIcyoWDgOOgOdFRfOgFYI4WXcNfw6
 8N/Dp5Rnt61kjLtsPv02Htfed7Mi2FLiyo6wJJCIbjnyRTjgi5LEqa8D5AX4AkFteTwV
 SzLaHBRg1ZlqJXqOaQ+xrlYn/aVdM54V7QUQsqLLyb97syQ4zc5sbpZdP/10FOoDbXXr
 s+Ow==
X-Gm-Message-State: AOAM533AzEPX2VSsupJVbT0giIQfP6qZB7Tr92xG6RNSXWcJqUcXziGV
 Tm9o2V9aL4BWmTD42qSIhSyuf5DJef571n1s
X-Google-Smtp-Source: ABdhPJwuSymUc1k32AwdbsNztctGgKDOVKDFPcGyjXjY/hBLrgBBdKauxaRXLK7pkoZUzBpk9D5ZSA==
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr4799725oti.258.1619210383374; 
 Fri, 23 Apr 2021 13:39:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:42 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] bsd-user: whitespace changes
Date: Fri, 23 Apr 2021 14:39:27 -0600
Message-Id: <20210423203935.78225-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::333;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x333.google.com
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

keyword space paren, no space before ( in function calls, spaces around
operators.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index f38c4faacf..2bacae7393 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -24,7 +24,7 @@ static int count(char ** vec)
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
@@ -132,8 +132,8 @@ int loader_exec(const char * filename, char ** argv, char ** envp,
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


