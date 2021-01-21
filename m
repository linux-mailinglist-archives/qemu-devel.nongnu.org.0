Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AC2FEA61
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:42:56 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZIY-000852-Hq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEq-0006dU-I4
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:00 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEo-0007OO-SI
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:00 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJdE-1lllLQ2nvY-00jMAK; Thu, 21 Jan 2021 13:38:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] linux-user: add missing UDP get/setsockopt option
Date: Thu, 21 Jan 2021 13:38:49 +0100
Message-Id: <20210121123852.91187-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121123852.91187-1-laurent@vivier.eu>
References: <20210121123852.91187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:05h2J2B8rFDDKxxhXb4J+rl7rekDMDov2+sk/QgjW+vNPM6ThEn
 bCcpoLtzYc0BhcPlcQ0XpdFgD2e0tftFkt5vMBfIVaIqubYdzJTbFK815FpjQGriNbeaDHf
 BplnD7RWcZShoF4EWVG4hadg/o0LFltS7zhEauMwx9CcBek5IpdKmYDscJFdc3fCA2hk2Dl
 mzIQ+BdIk7q4pnNzZRx0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ummW5OCjQ1U=:AGQBGTS2G7wOunSYrebkWk
 cHatBp4D5O9w0ZIRic12UNV17jUKYn86sNFy5o5fl4FuhsnAcdFbt5e4jYV+rA39ApKn+MezL
 pKHeA498i3XYyN08F/U5gB1/y0vwaTIjgulESthlN9+urC6bkkng2HeyO1U6CieRlWro1zC1k
 A4TTjS/Gt7XnXGl3xrhFO3nk9PSBpl4JQRmkJPsk3IguNsFDSeAKfD/gPEYmBK26c0dciPKxV
 vmzn1VgEWeZ0lQqEgnk0wxkkMkvsLcus1VD3FeOtZSOUswHyPZKIyQWvisrRk21u6KgWKz8MD
 m3b1SBk0+HaHOMyoUeRxmbjvzGR79MhpZjwLmHRrnQY0cp4ZqkrMdK1Za8CB2jm8IfrQxjmj6
 KsxJiTpf9POV8cXP78YUqI0M05iPwj2JML56Qk1tFwFAVqn4JDpLYX7SfSep3
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
Cc: Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

SOL_UDP manipulate options at UDP level. All six options currently defined
in linux source include/uapi/linux/udp.h take integer values.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-3-scw@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c  | 6 ++++++
 linux-user/syscall.c | 7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 227812c07e63..64172de99d98 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -7,6 +7,7 @@
 #include <sys/mount.h>
 #include <arpa/inet.h>
 #include <netinet/tcp.h>
+#include <netinet/udp.h>
 #include <linux/if_packet.h>
 #include <linux/netlink.h>
 #include <sched.h>
@@ -2644,6 +2645,11 @@ static void do_print_sockopt(const char *name, abi_long arg1)
         print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
         print_pointer(optval, 0);
         break;
+    case SOL_UDP:
+        qemu_log("SOL_UDP,");
+        print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
+        print_pointer(optval, 0);
+        break;
     case SOL_IP:
         qemu_log("SOL_IP,");
         print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 98aaca01872f..969db2008104 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -53,6 +53,7 @@
 //#include <sys/user.h>
 #include <netinet/ip.h>
 #include <netinet/tcp.h>
+#include <netinet/udp.h>
 #include <linux/wireless.h>
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
@@ -2184,7 +2185,8 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
 
     switch(level) {
     case SOL_TCP:
-        /* TCP options all take an 'int' value.  */
+    case SOL_UDP:
+        /* TCP and UDP options all take an 'int' value.  */
         if (optlen < sizeof(uint32_t))
             return -TARGET_EINVAL;
 
@@ -2832,7 +2834,8 @@ get_timeout:
         }
         break;
     case SOL_TCP:
-        /* TCP options all take an 'int' value.  */
+    case SOL_UDP:
+        /* TCP and UDP options all take an 'int' value.  */
     int_case:
         if (get_user_u32(len, optlen))
             return -TARGET_EFAULT;
-- 
2.29.2


