Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CD3AD776
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:45:25 +0200 (CEST)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRv9-0002jz-JC
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtS-000083-K3
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtN-00080q-D9
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id a127so9195616pfa.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFyiLCGJg5Xo3SqM6ckKPEkOJUNRw/fc9LhzEEFhQ7g=;
 b=GnTPI02Ze0kaGpPWSFxBVUpYR5KTg6tCO08UEaNwHuxSxSBd2ORwCixEnFr4RC1fOJ
 DH+uG9APHkyEOxuP59vG6Z+U+au1XCVfAwu8er0OtrillEW4VvzDYWlt0DTZV8DVO/1h
 z9wNCdprtuXs8DUZYnj9Z8B8bjVgaQyIEkVKjlx5sj9/93FNtCddjzJ5n3Qfgez4b1u8
 KxtDzvlr+zHaz5/kODHC0wSSpSpvM3UXEsJXAjF/XLr40JdP3RULwPKdNQEPdMFyfuT3
 VUnopY5PFTzTOlj9gKVueWWfzd1gdnw0PjA7ufTeLgaT59rCEtHgHPI31/tnWqV3Ufog
 QNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFyiLCGJg5Xo3SqM6ckKPEkOJUNRw/fc9LhzEEFhQ7g=;
 b=QSQneVyCdcr0kIUjc0Eluia+cx542B2b6DnOmX12mlaMbvxsFQ3oCuuuKBOLe+FsJn
 fzTCt8oXtYN8zAeMyVKGOLJhfZgUzKrNQkXS6TMMHtdibA9w0zSKB1mNDj37jh7aowZ6
 icYKgn4x3jPdYMj65oDz+DeppP9SUh4DBx3RFJIqQtYx4hmv8xh3lC6cd3O+zLPv1y+3
 1zVBXgvNYoSQ+/KDJ70/iIHc88HOafojp7Xiy14ljup2+jm1HpdPqA0eXiX6bFGxbmB9
 jeRkGnPmdR0oa7Lwns/0UnFCbkKQSL8BZO3NYwO54kY+4RYUdrGoepT63hUgSsoawE9P
 mrCA==
X-Gm-Message-State: AOAM533cCDjG6JLfs4TArQjbCyi8e5okDbhkJA2pUXCbidvjQp/h/1C7
 Kl/X2GkErtQI8ypOkHJI9FYcn30kFX006g==
X-Google-Smtp-Source: ABdhPJyREZWJNhVQp+g4+hmCGOlMI2bKurW3sc247ztpi6ygPGoRJ3RAJ6bmd9IQ7jRl8CNKgPsiKQ==
X-Received: by 2002:a63:4c5e:: with SMTP id m30mr13000355pgl.153.1624074211389; 
 Fri, 18 Jun 2021 20:43:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/12] linux-user: Fix style problems in linuxload.c
Date: Fri, 18 Jun 2021 20:43:18 -0700
Message-Id: <20210619034329.532318-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/linuxload.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index a27e1d0d8b..9d4eb5e94b 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -1,59 +1,57 @@
 /* Code for loading Linux executables.  Mostly linux kernel code.  */
 
 #include "qemu/osdep.h"
-
 #include "qemu.h"
 
 #define NGROUPS 32
 
 /* ??? This should really be somewhere else.  */
-abi_long memcpy_to_target(abi_ulong dest, const void *src,
-                          unsigned long len)
+abi_long memcpy_to_target(abi_ulong dest, const void *src, unsigned long len)
 {
     void *host_ptr;
 
     host_ptr = lock_user(VERIFY_WRITE, dest, len, 0);
-    if (!host_ptr)
+    if (!host_ptr) {
         return -TARGET_EFAULT;
+    }
     memcpy(host_ptr, src, len);
     unlock_user(host_ptr, dest, 1);
     return 0;
 }
 
-static int count(char ** vec)
+static int count(char **vec)
 {
-    int		i;
+    int i;
 
-    for(i = 0; *vec; i++) {
+    for (i = 0; *vec; i++) {
         vec++;
     }
-
-    return(i);
+    return i;
 }
 
 static int prepare_binprm(struct linux_binprm *bprm)
 {
-    struct stat		st;
+    struct stat st;
     int mode;
     int retval;
 
-    if(fstat(bprm->fd, &st) < 0) {
-        return(-errno);
+    if (fstat(bprm->fd, &st) < 0) {
+        return -errno;
     }
 
     mode = st.st_mode;
-    if(!S_ISREG(mode)) {	/* Must be regular file */
-        return(-EACCES);
+    if (!S_ISREG(mode)) {   /* Must be regular file */
+        return -EACCES;
     }
-    if(!(mode & 0111)) {	/* Must have at least one execute bit set */
-        return(-EACCES);
+    if (!(mode & 0111)) {   /* Must have at least one execute bit set */
+        return -EACCES;
     }
 
     bprm->e_uid = geteuid();
     bprm->e_gid = getegid();
 
     /* Set-uid? */
-    if(mode & S_ISUID) {
+    if (mode & S_ISUID) {
         bprm->e_uid = st.st_uid;
     }
 
@@ -125,8 +123,8 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 }
 
 int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
-             struct target_pt_regs * regs, struct image_info *infop,
-             struct linux_binprm *bprm)
+                struct target_pt_regs *regs, struct image_info *infop,
+                struct linux_binprm *bprm)
 {
     int retval;
 
@@ -139,7 +137,7 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
 
     retval = prepare_binprm(bprm);
 
-    if(retval>=0) {
+    if (retval >= 0) {
         if (bprm->buf[0] == 0x7f
                 && bprm->buf[1] == 'E'
                 && bprm->buf[2] == 'L'
@@ -157,11 +155,11 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
         }
     }
 
-    if(retval>=0) {
+    if (retval >= 0) {
         /* success.  Initialize important registers */
         do_init_thread(regs, infop);
         return retval;
     }
 
-    return(retval);
+    return retval;
 }
-- 
2.25.1


