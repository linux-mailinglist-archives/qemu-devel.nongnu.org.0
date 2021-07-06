Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF03BDFDF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:51:41 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uqq-0003ZI-TM
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uot-0000jB-VW
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:39 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uop-0006ay-Sn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id u14so381956pga.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7mIiYUnLQpG7lF7E8+dxMfsx1Pwi8mqFmSQ1+Sw9cU=;
 b=NSFKxcm16tB+WPC6uFupR7M8gdsPqL7G1ukdfyxZC+lXRCDVCWSvfpvwWVT81xMGQa
 7q78Fl/zm9yp7gfAckG+j8M1HxVgWVh7wOVOlrOzfxYXjOvxK5BCz4JNF6PhA/0pV1nV
 VK1ncyYilD8Y2uUq9uRDOKriihna2VqWcz3m7dGII8vddOvq8Jz8bd2jQHxf5PieXl7B
 8gNBnorX+OVHXqpyWbZ5oFmhGV2ESFMlqDhpldQJYx+tfhKW8/2mexe+le/H8s9qFaxH
 WHYlM1mJIWYjhc+/hujbYvKlm0WBYN1TWeHQqUF/vU64F5b8Wt9oDWrAh9cZSzJ3o5Pu
 E0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7mIiYUnLQpG7lF7E8+dxMfsx1Pwi8mqFmSQ1+Sw9cU=;
 b=j02MbAdinsbeQiFsZ7R81mVZUhuWpJ8qeO2prxwbkK7yEICig6eWSyMJr/N3yZGcnA
 Tue8x7gsur8vdjs+We3fBrQP2oFNtMLsgsgmCuNpWRKpQ4ip0yGB/0F53DhgU0Y7A9T6
 o0cGAkXTqah1srXSPb6BX5EBA3IF+fOxf/1PDkGPoIWaKZAE3wgXctCD9JvdqBX1H0lP
 6g96vDaMlWY+Ab8p3Gdcafg+f9l4gFDIT/0XH4STpxuvMqSR8HhZ3do0tJiciSMaeEvi
 JRZuaJYzfFfWvnndTETpSK/EpRkMQjvLrGEfXNpRznvOrwhdNCiVjOR2GYhJ9dCdIsgv
 Hhqw==
X-Gm-Message-State: AOAM531UceZPNczmaNNcJ922O1OeTRSUy+GUkxSrjM3Si2O1HuMhgkUD
 SFHYSRUUZe8XyBfa1gvANLAAPdLnMQ7KuQ==
X-Google-Smtp-Source: ABdhPJz5JI3LixvoNhAXNBLym8RIvEBUOcBnruSrC9LflnCpmDI1ig3CdPP39DQu8MUYxC0QFcA83Q==
X-Received: by 2002:a63:d90b:: with SMTP id r11mr23272359pgg.81.1625615374633; 
 Tue, 06 Jul 2021 16:49:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/36] linux-user: Fix style problems in linuxload.c
Date: Tue,  6 Jul 2021 16:48:58 -0700
Message-Id: <20210706234932.356913-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


