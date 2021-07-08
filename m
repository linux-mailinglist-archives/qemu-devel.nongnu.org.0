Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE73BF822
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:11:48 +0200 (CEST)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R0W-0003DN-0O
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx2-0004q6-Gz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:12 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx0-0001Hr-28
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:12 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7zW7-1l5o4a38vT-0150iO; Thu, 08
 Jul 2021 12:07:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] linux-user: Fix style problems in linuxload.c
Date: Thu,  8 Jul 2021 12:07:51 +0200
Message-Id: <20210708100756.212085-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WG/2a1s9usHFNHaqS+rLmINkKvlGXzc/eJGkgTnuNwz4bLYML0Y
 0TP1ixWv3QXMms3aRQB95iVEGU5XIqlKVrmYzn9GNJoxyat8oy2sGazoWQa4DasT/fVySxx
 i2LO5xuziLSYbYN8Eyjl+6KDyzyWp8g9lEPMY+hdpx0S62mdSV5+7IFAN/BvITn3xo/OkDT
 Pa/jtW92+Pyz6ywVYlX9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hcJz5NLv+VM=:NT2NZn+39hm7A/9wQKaXYA
 wccB/x82jJeTptreoJpPI3J1PHZAdhfQUzoZKTm6Qfql8MRK7FXQDwOd+hrhr/0TU008/1p8+
 +mm6TubaUR8n1N6tc1QiR/ocy8Rw/zfnlFqNJRUtFeXM+DbGhKc8IIoTkBovzPiGh39pTACvu
 7WKg8BiXrpjLy7JYOXnpjIErvEAaTD1sig9PcZtEtl5uz5k9VMTWnkTNBR0SpUuh9oKqQoaOL
 9MPUYjgzmUaffVMbuK735K5cQPVGB5oUmgUCQPk1PxbSCN7DrrDEjTy72FXzOwtoj463my8F9
 fvXCQaJmFPIO1ZZq6xBASVH3frtmsQsKN9ZPxMvMzka15rfeKt2w+ZjeheyswokcLNnTkqn67
 2V2NQfaphgU4F2igASqE/42sm18w5fqbF0HD7I5X2iz4amEtXiNIrVwAgh/epHVjcaLQ4rlAO
 knU9uOJcc8r8zTvvFXpri5NOrOVx52AmY5HBnzMvgn6Gwu5k6uknVBFgABwDXgqK9uvrJ2n00
 bhwtz0aRzTiNRtuzUgU52uS6lVzaBQHO3jcJanbDfLNsjp8FR5myZUd/QNhch5/gf2GGOC29k
 koqGHgeNkSSZGM0dUiV6PbgnEOV3ysUNCQ4kDX/CCbJbDdhA/kTv+k0yK/7wPHf+sgY2iF2Hp
 7f8NIAmtUgkY6n0qg88fCo8PpxILxo9oqC2Wr87q2pdfqFitjkuCF713inhJQXZrP4fj5rLvS
 gI0l6R7MA8ZJq1v92YyKSpN+uZYgg6z8JDBnNa/n77IBsFEipoofLQaA7SnpvwyXus+7QKOoI
 +P0gHdwaPTmsw7CBOtWikCdPG6cYEvcqBzHvaABcielqwSuQVNuESLma+zXF6CTPl67AHiR
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210706234932.356913-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/linuxload.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index a27e1d0d8bc2..9d4eb5e94b9b 100644
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
2.31.1


