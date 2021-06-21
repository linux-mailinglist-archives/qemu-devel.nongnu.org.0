Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F03AE7F0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:11:24 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHpr-000076-4T
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjc-0002xy-Oo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:56 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjZ-0003xk-J2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:56 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MnaTt-1lWN3H2ULd-00jdPM; Mon, 21
 Jun 2021 13:04:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] linux-user: Use public sigev_notify_thread_id member if
 available
Date: Mon, 21 Jun 2021 13:04:45 +0200
Message-Id: <20210621110445.231771-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OSHs+dmDvEn0uZhXqdH2sKalijNwm9KPwS72P9Dh0esovpuDgP+
 +2E55s5DBda97yjDRSuffBKaZh1A2ZBxCtYBFGwK85sVGndJN9hblTwIrNFuVOcefTXrmMc
 CGEyzdaVVo9R0o/vv9wWQU0mL5yEu/RJhtUDVJ+OkXMUy6EP6t5q0jQ4MZFs2fFvZSZx0uh
 df7JTDC5Ne5XsoI1UGdUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rmNylIgJ/1E=:GDCgYbkT7iUMcpRivFHIEO
 xAdVPqrPmvr3wG6/Xv8eQu5OJPVteYF4B47jIRJp1oYXx8ntT7T73Fle5mGbtgQADj25VCDFO
 L0InN4WIA3lStPz8KylsT4ndF72K29DZEIIS/FcCPMN6sIqT1Pczz0dZIDLOsH9HkIp7r6zE+
 QgG0yRyTFwpvS/R96N1H8bqka9IpvHu9bcQjYhxugSAQqzQ7fnDu7oKR0Zn0P0ClA6OZ0F1Yu
 rgBLADPteS+QFZFpOQqnGomDeKV7RWVd7iOpo3apGjcK9DVlAm91HfbiDUAi8rB+Wa5Nw0JXv
 GlwzfEg6/HZi8zKn81KJlI2YpdGev+tMeH58ejI+15IRcwwXlRkbXR+92B1XN6RaWfhA+XV6X
 Tg2Vu3e9ncXtfaeiQaZmi9IxVaPrxgB21jhf/gtgjpISWhCgjbtFnPZs21WdC9/imuHJK6RYd
 6Uf2UYwrD2h6aRD5V4eTkSAWclYl1cADzqU3xReRZCN9Klhygm5015jHxyCVeMkzPPDycYlql
 Z1sce5rD6WlLFJHl30akq0=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Forney <mforney@mforney.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

_sigev_un._tid is an internal glibc field and is not available on
musl libc. The sigevent(7) man page and Linux UAPI headers both use
sigev_notify_thread_id as a public way to access this field.

musl libc supports this field since 1.2.2[0], and glibc plans to
add support as well[1][2].

If sigev_notify_thread_id is not available, fall back to _sigev_un._tid
as before.

[0] http://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb
[1] https://www.openwall.com/lists/musl/2019/08/01/5
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=27417

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210526035556.7931-1-mforney@mforney.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure            | 16 ++++++++++++++++
 linux-user/syscall.c |  6 +++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 8dcb9965b24e..942c531cce63 100755
--- a/configure
+++ b/configure
@@ -4440,6 +4440,19 @@ if compile_prog "" "" ; then
     st_atim=yes
 fi
 
+##########################################
+# check if we have sigev_notify_thread_id
+
+sigev_notify_thread_id=no
+cat > $TMPC << EOF
+#include <stddef.h>
+#include <signal.h>
+int main(void) { return offsetof(struct sigevent, sigev_notify_thread_id); }
+EOF
+if compile_prog "" "" ; then
+    sigev_notify_thread_id=yes
+fi
+
 ##########################################
 # check if trace backend exists
 
@@ -5692,6 +5705,9 @@ fi
 if test "$st_atim" = "yes" ; then
   echo "HAVE_STRUCT_STAT_ST_ATIM=y" >> $config_host_mak
 fi
+if test "$sigev_notify_thread_id" = "yes" ; then
+  echo "HAVE_SIGEV_NOTIFY_THREAD_ID=y" >> $config_host_mak
+fi
 if test "$byteswap_h" = "yes" ; then
   echo "CONFIG_BYTESWAP_H=y" >> $config_host_mak
 fi
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 70ae8884ee54..64bbf331b282 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7405,6 +7405,10 @@ static inline abi_long host_to_target_timex64(abi_long target_addr,
 }
 #endif
 
+#ifndef HAVE_SIGEV_NOTIFY_THREAD_ID
+#define sigev_notify_thread_id _sigev_un._tid
+#endif
+
 static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
                                                abi_ulong target_addr)
 {
@@ -7425,7 +7429,7 @@ static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
     host_sevp->sigev_signo =
         target_to_host_signal(tswap32(target_sevp->sigev_signo));
     host_sevp->sigev_notify = tswap32(target_sevp->sigev_notify);
-    host_sevp->_sigev_un._tid = tswap32(target_sevp->_sigev_un._tid);
+    host_sevp->sigev_notify_thread_id = tswap32(target_sevp->_sigev_un._tid);
 
     unlock_user_struct(target_sevp, target_addr, 1);
     return 0;
-- 
2.31.1


