Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9E3C2A6C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:36:26 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xEX-0001PM-R2
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x73-0006MY-O6; Fri, 09 Jul 2021 16:28:42 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x71-0007X0-Pq; Fri, 09 Jul 2021 16:28:41 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWRZt-1lebal0N0V-00Xqe0; Fri, 09
 Jul 2021 22:28:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] target/xtensa/xtensa-semi: Fix compilation problem on Haiku
Date: Fri,  9 Jul 2021 22:28:22 +0200
Message-Id: <20210709202824.578187-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MQSXHUsX0woclw4HIMUHiRVfSE/jYaJeaH1z0Cqytp1uvkj5Q05
 +iv3ONPMHC5ZWAb+xRWAon3KOLa9VHCaA7qdRTL1cy5rFBjwDk+vZqpHckyQw5gmjGCsdcS
 MAJrkLJnDjzN+7PdAQ2M96N3jkGtme9R2HO0+vjGeb1KgWVig3CzIjPvU206ozOGltmEOXf
 nXMYujbGWaQ2lxLEm09iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NJgHbCqVIaY=:7eMEc4PRIw7F+9L6yyW2y2
 l35OtEkLm97HBiOxX+snQLfVUeMdphDaY8d89i3G/Vt89USL0L1Ty+f1T/UBWIECklcdsjyvm
 BvbSGvPr1esRo10nTXBJoaiQqlcfc+BJpPrQUrhTOeczzg+PSq2Lhr+hQ2TGuKNw2MPdxXEO5
 2u1l/iBwQbJ2HZblHWt3uS3bg9iXoEyExIUBpKhsXXbs/87bG2Qq9EaXcJuPSOkPyNeJ4uj4X
 SzxpMT4HwKKHlvlXB1HOsKJtZhJ/EOGBmQWGVjxn4wqICPcGsZygB9GYlrIKLtB69VgGVSJbB
 Vi57w7WimNZr6avivgZdxgNxckf4XISm6cr2tcAXhYIAg8MKXK/3BnaEkGzlpOk2j3RUHEjdg
 s11nfx9feDQhgh1osLGhLxa7Z4gKkq82N/0b68/wUA46audbgnQaywmcFTpahx0i9odZVPfav
 Pr80g3zs+JmD2Ca2QWIQOFAqJE+jpXQYZh2Eamgt9q5vueXbnsCWeaf6gs8AA54TvlMs2s3Qz
 7nzPBUeDLG+kMYxQ3ZOZkIEJd0/Kj5aJQB8qqzXZqvgFaA2pEfOTwjxafhPdEDq4eb7N9nzso
 l0kHs/Th0afEjTQsFlaoAFqQPyPLxOpfjZ2766092B35H7+fpNNcpJZhRtSpCQbPsaHdx/znF
 Vmj5kGH7N3aoFqquHUcuXUZHtAdGA4asujuWv3jXFAmuKTL2OlJ9eTUPFT2/76SMDZrod8pXH
 zkUnmZuvLSUbUDdK7Fa93d2qLawPTTsT7AKzIDIpLk5BsrNcE77xsdzY9JqzuwcDFIVaU0K4b
 9UsrFsaoL45oviX77sshV05vwpbO1GWPnfyD6lgvFveYCgq3A5lT8/QwQ6CNgRElPws2l7h
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The errno numbers are very large on Haiku, so the linking currently
fails there with a "final link failed: memory exhausted" error
message. We should not use the errno number as array indexes here,
thus convert the code to a switch-case statement instead. A clever
compiler should be able to optimize this code in a similar way
anway.

Reported-by: Richard Zak <richard.j.zak@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210706081822.1316551-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 45 deletions(-)

diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 79f2b043f233..fa21b7e11fc2 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -95,59 +95,53 @@ enum {
 
 static uint32_t errno_h2g(int host_errno)
 {
-    static const uint32_t guest_errno[] = {
-        [EPERM]         = TARGET_EPERM,
-        [ENOENT]        = TARGET_ENOENT,
-        [ESRCH]         = TARGET_ESRCH,
-        [EINTR]         = TARGET_EINTR,
-        [EIO]           = TARGET_EIO,
-        [ENXIO]         = TARGET_ENXIO,
-        [E2BIG]         = TARGET_E2BIG,
-        [ENOEXEC]       = TARGET_ENOEXEC,
-        [EBADF]         = TARGET_EBADF,
-        [ECHILD]        = TARGET_ECHILD,
-        [EAGAIN]        = TARGET_EAGAIN,
-        [ENOMEM]        = TARGET_ENOMEM,
-        [EACCES]        = TARGET_EACCES,
-        [EFAULT]        = TARGET_EFAULT,
+    switch (host_errno) {
+    case 0:         return 0;
+    case EPERM:     return TARGET_EPERM;
+    case ENOENT:    return TARGET_ENOENT;
+    case ESRCH:     return TARGET_ESRCH;
+    case EINTR:     return TARGET_EINTR;
+    case EIO:       return TARGET_EIO;
+    case ENXIO:     return TARGET_ENXIO;
+    case E2BIG:     return TARGET_E2BIG;
+    case ENOEXEC:   return TARGET_ENOEXEC;
+    case EBADF:     return TARGET_EBADF;
+    case ECHILD:    return TARGET_ECHILD;
+    case EAGAIN:    return TARGET_EAGAIN;
+    case ENOMEM:    return TARGET_ENOMEM;
+    case EACCES:    return TARGET_EACCES;
+    case EFAULT:    return TARGET_EFAULT;
 #ifdef ENOTBLK
-        [ENOTBLK]       = TARGET_ENOTBLK,
+    case ENOTBLK:   return TARGET_ENOTBLK;
 #endif
-        [EBUSY]         = TARGET_EBUSY,
-        [EEXIST]        = TARGET_EEXIST,
-        [EXDEV]         = TARGET_EXDEV,
-        [ENODEV]        = TARGET_ENODEV,
-        [ENOTDIR]       = TARGET_ENOTDIR,
-        [EISDIR]        = TARGET_EISDIR,
-        [EINVAL]        = TARGET_EINVAL,
-        [ENFILE]        = TARGET_ENFILE,
-        [EMFILE]        = TARGET_EMFILE,
-        [ENOTTY]        = TARGET_ENOTTY,
+    case EBUSY:     return TARGET_EBUSY;
+    case EEXIST:    return TARGET_EEXIST;
+    case EXDEV:     return TARGET_EXDEV;
+    case ENODEV:    return TARGET_ENODEV;
+    case ENOTDIR:   return TARGET_ENOTDIR;
+    case EISDIR:    return TARGET_EISDIR;
+    case EINVAL:    return TARGET_EINVAL;
+    case ENFILE:    return TARGET_ENFILE;
+    case EMFILE:    return TARGET_EMFILE;
+    case ENOTTY:    return TARGET_ENOTTY;
 #ifdef ETXTBSY
-        [ETXTBSY]       = TARGET_ETXTBSY,
+    case ETXTBSY:   return TARGET_ETXTBSY;
 #endif
-        [EFBIG]         = TARGET_EFBIG,
-        [ENOSPC]        = TARGET_ENOSPC,
-        [ESPIPE]        = TARGET_ESPIPE,
-        [EROFS]         = TARGET_EROFS,
-        [EMLINK]        = TARGET_EMLINK,
-        [EPIPE]         = TARGET_EPIPE,
-        [EDOM]          = TARGET_EDOM,
-        [ERANGE]        = TARGET_ERANGE,
-        [ENOSYS]        = TARGET_ENOSYS,
+    case EFBIG:     return TARGET_EFBIG;
+    case ENOSPC:    return TARGET_ENOSPC;
+    case ESPIPE:    return TARGET_ESPIPE;
+    case EROFS:     return TARGET_EROFS;
+    case EMLINK:    return TARGET_EMLINK;
+    case EPIPE:     return TARGET_EPIPE;
+    case EDOM:      return TARGET_EDOM;
+    case ERANGE:    return TARGET_ERANGE;
+    case ENOSYS:    return TARGET_ENOSYS;
 #ifdef ELOOP
-        [ELOOP]         = TARGET_ELOOP,
+    case ELOOP:     return TARGET_ELOOP;
 #endif
     };
 
-    if (host_errno == 0) {
-        return 0;
-    } else if (host_errno > 0 && host_errno < ARRAY_SIZE(guest_errno) &&
-            guest_errno[host_errno]) {
-        return guest_errno[host_errno];
-    } else {
-        return TARGET_EINVAL;
-    }
+    return TARGET_EINVAL;
 }
 
 typedef struct XtensaSimConsole {
-- 
2.31.1


