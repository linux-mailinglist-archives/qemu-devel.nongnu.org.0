Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62573C71F7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:17:32 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JE3-0005u8-Lv
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifk-0000BX-Pr
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:04 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifi-00066X-R5
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:04 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLQgv-1lm34N2K03-00IS0A; Tue, 13
 Jul 2021 15:42:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] linux-user,
 mips: update syscall-args-o32.c.inc to Linux v5.13
Date: Tue, 13 Jul 2021 15:41:51 +0200
Message-Id: <20210713134152.288423-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NbkzlmgiSTqVrc4AlVbKc4UxaNaRFS/XXC30jQ2mBM+6r4DUT3r
 kfWYPS0Em+PwkHFWBgLQfMDLLrZ0x1aod+TW/D29Hg0lO/ImSPU7VteWaDZJX0aegOZ1ogE
 0kq9oZqlY74Sx13N+iV5o4drZO6nW+ZqOWRRbaG9o9o8zclAdfsBlxW0dteGDJRBNOqpRW8
 IQhJBDLud9ST8ljRT17Fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jk4QfUljcJc=:jX8VdutyNySO0LrPnLBMW5
 /8+0w91B7fw0hykRz6CMdXwJf7XshGz7DTfTEXnGcDJJgVao2lj6TzoZpfoMQZGAQ6jWpNXlP
 jltfm4C2diiUAFzU2CSzxv2f50XXtEhU8DMNAiTsJHZ6QIancXxzpPFkN/mbr0y3aBZDsRAAx
 DwAYfQKEBU3eGJTV7Vwv69j6HTfnfHRU6LrEKZCwg+IBs1QEOkVAjV6w+msnLAFzmpWq+IzNc
 +/beaMkvvW1WP8sartZbBi9P4R7UFGZ977u1FdffUifp1tD/fA4ME+EcBiVSu6GCjpGgJHl0Y
 AtLQVZ6o1XmJ5XYxvZgOmg0w52Vsv7WgQHVk8p7wxIZtCzZIoVxZ58wQuSgYP/pxTMG96yaec
 heREexK7EgMuTaoCv8J7Od3U35fZf0MGDigPze5XQ3ZbzpWmLduCz9R3Ynfv0PhCIN9inLEf5
 2YTOi3kTDeG0g11VIgung1HfEigaonrfhmq/2lss3LFL+8ViesWkhwuM3z7Nc4euqAKCfm9U/
 tJjgQJCw2jYEMcdAuxkrWOWJmJ8NjvTXibHQCSfxDUopJKxSKZdW2W7Fras5GRUnMLm8Lhq+0
 cPwBJp1oCB+5vb16NpuuzWHGRrscE2/RcyqM4cv9a3xlGlgcQYuRS3La44M12PkqG1e0YYEpZ
 UdEGAPHf5PaJKO3sWTVzv8G6Cdp90g9dFtLSu8kmo+ZIQ8DUM5C2slJmqj604a52oP08U3ISY
 djjHVCT5514lvvJO+8/Ii2X1N9cAXuFVV4u6ICG3Y/nNCtgCPTGSEpFGX9k99uhZLY9JymGgM
 K19KqDVeEV6uJmg8FScgtBptUH6Z/kR0KAc28dPfXBbC2uzkomBIUUj6OXS7aa+YTGvz/Lt
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated running scripts/update-mips-syscall-args.sh

scripts/update-mips-syscall-args.sh has been updated to reflect
file directory changes in strace repository.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210708215756.268805-3-laurent@vivier.eu>
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


