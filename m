Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40073C1B51
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 00:02:02 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1c5p-0002qe-Oi
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 18:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2M-0008Vo-5c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1c2K-000668-BO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:58:25 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqINP-1lNHKW1n87-00nReu; Thu, 08
 Jul 2021 23:57:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user,
 mips: update syscall-args-o32.c.inc to Linux v5.13
Date: Thu,  8 Jul 2021 23:57:55 +0200
Message-Id: <20210708215756.268805-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708215756.268805-1-laurent@vivier.eu>
References: <20210708215756.268805-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vi42TLyKxyOJPq7eNkTXHGgF1mdc+s7mDqQnYqrEZR+7uj1liI7
 X7KWUmHfKZtdNIgXbgmW0QaenPtXQNuxeeMaHcDLm8zoeIq6mDV1Z77RtdxpWaAjXBWRA7f
 DEmE+qead2Hk052M1yc/ZVOFTV1dlSDYR3EoYep/9yk9n8Ums/ma09RZrJKr/O2/nAQEyBO
 vTefxY9+jovM6RVslJgUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IOo+vTKODVE=:pw0qsFBBEPjvPlsdRkdlAc
 ct5/yhLRuGpJu0KiQnwSnxkBK8f2ONrayRfCBP1uhhD2SuUFGXCWruVpAVXDVFW+0iMjkKar4
 QdeFWmq5ym12UaiA84vshkcwAtGw3S9kAtyjtYK8VDrakaYvqTDM2/IklJPvJuIO2FBncbIdf
 JpGSDYzevArRyIsbKSaFnzysB5+/Rrt6QkNkplYT8JkDYRpdv6CRrC3uNNmRz7AKoS4NRGlJs
 ebpSFu9caED9vtETUG3e+wf2dwLWdqs/tS2TAc4bGDEY0jy/BG3RMgzMg52gpB+r6+Yi86Yg5
 38gBtWU3o0qk2s95gz7L5cydmu7Tc61pjN3Kn2W7x9PjUGHJuIOmTlvje4K1PYOUOQ+m7C5kI
 gN6JxeTTlJAvr0irbXyLLLTCUHoNdTen+QYsKmGnjyH9w8yhbEOOffzJy1m070a1X2xHiXwtp
 OyE3fjPtMYq91AzklQUSXpbVopHPM3H4MHa+KoLzevWsL50TWk0ez8HUfPLNHt66dXeVUSQmZ
 J5QLLE7YM1ENcty6rfInnFATaXKEJ51/kh5wS/eJgmOzCdFxGqTFlY9bUSSP/XwbUj8TR61hP
 NMs4BOAK+nj8F8ow1R2d4QlgpWBDFUkRyouJa650HGY7tx0QUcwX9F6DgnWU7qndKzkj+w5Za
 F4/KNWcTPfh7L62rrt3Dgq4KVfX/09+ennwUxxqpbDDqXmKRShlqP8SyR+q2Eqliy4ENzM1vL
 wWIDMfJiWhp1GZ2B+jHL1+V1U9mwzUTwnYrNZYtKQgtjOT/867Nxg72uHTl5F6yn9TIl+0QRa
 PkJxTNDlYhSb6Zjq3guneFfJ45gF0iIGEYmNUMdNe4nAWV1NQB7mD+eqvG/96I6RSUraBni
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Taylor Simpson <tsimpson@quicinc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated running scripts/update-mips-syscall-args.sh

scripts/update-mips-syscall-args.sh has been updated to reflect
file directory changes in strace repository.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/syscall-args-o32.c.inc |  5 ++++-
 scripts/update-mips-syscall-args.sh    | 13 +++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/linux-user/mips/syscall-args-o32.c.inc b/linux-user/mips/syscall-args-o32.c.inc
index 92ee4f921ec7..a6a2c5c566ca 100644
--- a/linux-user/mips/syscall-args-o32.c.inc
+++ b/linux-user/mips/syscall-args-o32.c.inc
@@ -356,7 +356,7 @@
     [ 355] = 3, /* bpf */
     [ 356] = 5, /* execveat */
     [ 357] = 1, /* userfaultfd */
-    [ 358] = 2, /* membarrier */
+    [ 358] = 3, /* membarrier */
     [ 359] = 3, /* mlock2 */
     [ 360] = 6, /* copy_file_range */
     [ 361] = 6, /* preadv2 */
@@ -438,3 +438,6 @@
     [ 437] = 4, /* openat2 */
     [ 438] = 3, /* pidfd_getfd */
     [ 439] = 4, /* faccessat2 */
+    [ 440] = 5, /* process_madvise */
+    [ 441] = 6, /* epoll_pwait2 */
+    [ 442] = 5, /* mount_setattr */
diff --git a/scripts/update-mips-syscall-args.sh b/scripts/update-mips-syscall-args.sh
index 4f0dda4b83bc..5a529b699eb8 100755
--- a/scripts/update-mips-syscall-args.sh
+++ b/scripts/update-mips-syscall-args.sh
@@ -1,9 +1,9 @@
 #!/bin/sh
 
-URL=https://raw.githubusercontent.com/strace/strace/master
+URL=https://raw.githubusercontent.com/strace/strace/master/src
 FILES="sysent.h sysent_shorthand_defs.h linux/mips/syscallent-compat.h \
-       linux/mips/syscallent-o32.h linux/syscallent-common-32.h \
-       linux/syscallent-common.h"
+       linux/mips/syscallent-o32.h linux/32/syscallent-common-32.h \
+       linux/generic/syscallent-common.h"
 
 output="$1"
 if [ "$output" = "" ] ; then
@@ -16,10 +16,11 @@ TMP=$(mktemp -d)
 cd $TMP
 
 for file in $FILES; do
-    curl -O $URL/$file
+    curl --create-dirs $URL/$file -o $TMP/$file
 done
 
-> subcall32.h
+> linux/generic/subcallent.h
+> linux/32/subcallent.h
 
 cat > gen_mips_o32.c <<EOF
 #include <stdio.h>
@@ -52,6 +53,6 @@ int main(void)
 }
 EOF
 
-cc -o gen_mips_o32 gen_mips_o32.c && ./gen_mips_o32 > "$output/$INC"
+cc -o gen_mips_o32 -I linux/mips -I linux/generic gen_mips_o32.c && ./gen_mips_o32 > "$output/$INC"
 
 rm -fr "$TMP"
-- 
2.31.1


