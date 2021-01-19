Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9642FBE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:09:12 +0100 (CET)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vRH-0002yI-Nj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDD-000293-Qv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:59769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-00041H-Et
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mf0Ru-1lhHZN1xVq-00gbvc; Tue, 19 Jan 2021 18:54:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] linux-user: add missing UDP get/setsockopt option
Date: Tue, 19 Jan 2021 18:54:24 +0100
Message-Id: <20210119175427.2050737-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
References: <20210119175427.2050737-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KMdifg9/aD+juG9NMB48iSLOLflGSvxgTFdmQ12t1CI5znhiv0i
 wRfpySnZvRp/0w43ee95HzbXTjbXCIa4Ovw0qkF6FbdavbxwIDxEfjGJuG4oaoRsf5C5Aq1
 ciUzfq5kJuf415PWhiAJ8o23nq0usZBGRXxpwmPjan7Bgn67TRN5GsKA6zr2PMokk/xtYY/
 NiUTvEMbTWwlx133Xp0LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zt5CsZbw7Rs=:XB4zAGva2PaH//F9VELHSs
 0w8TwJeAMuCRWpcm9PKscgotMSg5ATwinrEDZkKkDhpzwBtBznxHpIzHBYj3z4nx8XFEN7Syc
 gyod3UkLkBwhUoyiUtZnkCv+K/FZFMuVKDWIatEoPDVtsUs6eG+KWU6zmQstjU7bpsgBNhhSo
 Hv3lJg5lNP1fIxIqo4h/QPRubHnGxbhic5kIooeiN/h8sdfuPY6+tgB0eyRqshhvg0t3IoylY
 RgZiEXRkW4LHibmYE+vom9Xk/4NJebJjNjT4vwGtr2LR9i9A+MJ+CV4p6+SVlapAPQRqbGoX6
 /bNSxxHAByjjzBSyDYbvyjn0m47QKHdZwxhy58dbPKAQp/jcK11Dkk+RydvLSzFhLnVH2rFps
 p+ZZUsqPbxRxJQP9reZuV/UwJXwtlk0MkDx/SQ5x6r/KrmTxWqxkBmdNo0CWllJSZ+/+TXxp/
 vo6x7qq+bw==
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


