Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBE2DE9F3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:56:20 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLrN-0000KU-ST
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33wjdXwMKCmoaKeOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--scw.bounces.google.com>)
 id 1kqLpL-0007R7-W7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:12 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:49909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33wjdXwMKCmoaKeOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--scw.bounces.google.com>)
 id 1kqLpJ-0007H4-9C
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:11 -0500
Received: by mail-qt1-x84a.google.com with SMTP id a11so2440943qto.16
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=F/N/q4dsael2Jg577ucwa0NpI8hd+NA9mcYgK85nlzI=;
 b=HBIBjg5v81G1CmDdBrvY3kHmeBaG/yRx5DFXZ7/Zs24eAR3PUkKoTlbYFJ64jgnmV2
 XRspApriR8hpLjlttY1KfQULjyDw6rWZIUOeXwbatCazmrgnW2CkD4VGx9187woS2BgH
 fbDyQu5N29eH93/qK8jBmjNhQ0+GK9ofl9So7+B0ja3PprJMB5hqs8doQ6nweVKy2u84
 +XKB+sPT5v53kOrQYDFHewShlWTxiqO+rHFElq23ZUjh/JPulNkOGM57t+xy8pnGw/sK
 80n9cyXjDbEbtkoVDlsyAhz71tzoz/RYsOzFVMRmtE7QFix5XJHldYSovu1lKyyvJy0D
 6MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=F/N/q4dsael2Jg577ucwa0NpI8hd+NA9mcYgK85nlzI=;
 b=SHquDhPDqSgp3FRSDip2fElF3D8/Qnby6SnibLMzdWT4k2drVMDcRlH694sDnqJbYC
 3khty3+VVw4DRhFK0akOVJ4YhfMAB7bKPGS/HlbWWyYbM64i0KoLFqXNmP86/ysYmKtz
 bG1M5URTmHXiIYuTHEgq2qaIuGvH+1o2ZEK/f/fmQ+k75OTWXj/kNKSvUhK+QcIVN6sg
 qSgY1oSgzVXy5uIU/CF7OeulE9OAzs2QxgLNfjJnBYIpWwMiwwaIcYJ9t9DSenS196vv
 8lWs6OptMwJiFNphIkR2Ahsjr8CK8ZpubtZMP042O+DG1HsRYDSMK1le2X3ji55GvOw+
 LHGQ==
X-Gm-Message-State: AOAM531iq69gV3pQ6/OfdarGBzFQRC25uxHEoyT24eXmp9a5I0K/+nFX
 NhZAVW02MeD9eyqj1c49cM7ZBV+rnbW+8vF1citjDc94kRXVTnMpAP0wKEHnHDKRq+lmcUybKb0
 Oz3vcTGxa+8oEFWJCPk1A+D9PWZV+TlbgrmnNaY277Ne46ykqbyWA
X-Google-Smtp-Source: ABdhPJy5gonETZjt4DYpBemDDghN11g3C40S1a5GHWIypQun6A5APinPebhJhK43nde9rK+IfHXni9Q=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:c18e:: with SMTP id
 n14mr6425084qvh.48.1608321247659; 
 Fri, 18 Dec 2020 11:54:07 -0800 (PST)
Date: Fri, 18 Dec 2020 11:54:01 -0800
In-Reply-To: <20201218195402.3581189-1-scw@google.com>
Message-Id: <20201218195402.3581189-2-scw@google.com>
Mime-Version: 1.0
References: <20201218195402.3581189-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 1/2] linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=33wjdXwMKCmoaKeOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--scw.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Shu-Chun Weng <scw@google.com>
From: Shu-Chun Weng via <qemu-devel@nongnu.org>

Both guest options map to host SO_TIMESTAMP while keeping a global bit to
remember if the guest expects the old or the new format. Don't support
programs mixing two formats.

Added a multiarch test to verify.

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
v1 -> v2:
  Only keep track of old or new format globally, remove support for different
  sockets mixing different formats.
  Fix style problems.

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/alpha/sockbits.h            |   8 +-
 linux-user/generic/sockbits.h          |   9 +-
 linux-user/hppa/sockbits.h             |   8 +-
 linux-user/mips/sockbits.h             |   8 +-
 linux-user/sparc/sockbits.h            |   8 +-
 linux-user/strace.c                    |   7 +-
 linux-user/syscall.c                   |  91 ++++++--
 tests/tcg/multiarch/socket_timestamp.c | 296 +++++++++++++++++++++++++
 8 files changed, 408 insertions(+), 27 deletions(-)
 create mode 100644 tests/tcg/multiarch/socket_timestamp.c

diff --git a/linux-user/alpha/sockbits.h b/linux-user/alpha/sockbits.h
index d54dc98c09..40f0644df0 100644
--- a/linux-user/alpha/sockbits.h
+++ b/linux-user/alpha/sockbits.h
@@ -48,8 +48,6 @@
 #define TARGET_SO_DETACH_FILTER        27
 
 #define TARGET_SO_PEERNAME      28
-#define TARGET_SO_TIMESTAMP     29
-#define TARGET_SCM_TIMESTAMP        TARGET_SO_TIMESTAMP
 
 #define TARGET_SO_PEERSEC       30
 #define TARGET_SO_PASSSEC       34
@@ -75,6 +73,12 @@
 /* Instruct lower device to use last 4-bytes of skb data as FCS */
 #define TARGET_SO_NOFCS     43
 
+#define TARGET_SO_TIMESTAMP_OLD        29
+#define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+
+#define TARGET_SO_TIMESTAMP_NEW        63
+#define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+
 /* TARGET_O_NONBLOCK clashes with the bits used for socket types.  Therefore we
  * have to define SOCK_NONBLOCK to a different value here.
  */
diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
index e44733c601..532cf2d3dc 100644
--- a/linux-user/generic/sockbits.h
+++ b/linux-user/generic/sockbits.h
@@ -49,10 +49,15 @@
 #define TARGET_SO_DETACH_FILTER        27
 
 #define TARGET_SO_PEERNAME             28
-#define TARGET_SO_TIMESTAMP            29
-#define TARGET_SCM_TIMESTAMP           TARGET_SO_TIMESTAMP
 
 #define TARGET_SO_ACCEPTCONN           30
 
 #define TARGET_SO_PEERSEC              31
+
+#define TARGET_SO_TIMESTAMP_OLD        29
+#define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+
+#define TARGET_SO_TIMESTAMP_NEW        63
+#define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+
 #endif
diff --git a/linux-user/hppa/sockbits.h b/linux-user/hppa/sockbits.h
index 23f69a3293..284a47e74e 100644
--- a/linux-user/hppa/sockbits.h
+++ b/linux-user/hppa/sockbits.h
@@ -29,8 +29,6 @@
 #define TARGET_SO_BSDCOMPAT    0x400e
 #define TARGET_SO_PASSCRED     0x4010
 #define TARGET_SO_PEERCRED     0x4011
-#define TARGET_SO_TIMESTAMP    0x4012
-#define TARGET_SCM_TIMESTAMP   TARGET_SO_TIMESTAMP
 #define TARGET_SO_TIMESTAMPNS  0x4013
 #define TARGET_SCM_TIMESTAMPNS TARGET_SO_TIMESTAMPNS
 
@@ -67,6 +65,12 @@
 
 #define TARGET_SO_CNX_ADVICE           0x402E
 
+#define TARGET_SO_TIMESTAMP_OLD        0x4012
+#define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+
+#define TARGET_SO_TIMESTAMP_NEW        0x4038
+#define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+
 /* TARGET_O_NONBLOCK clashes with the bits used for socket types.  Therefore we
  * have to define SOCK_NONBLOCK to a different value here.
  */
diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
index 0f022cd598..b4c39d9588 100644
--- a/linux-user/mips/sockbits.h
+++ b/linux-user/mips/sockbits.h
@@ -61,14 +61,18 @@
 #define TARGET_SO_DETACH_FILTER        27
 
 #define TARGET_SO_PEERNAME             28
-#define TARGET_SO_TIMESTAMP            29
-#define SCM_TIMESTAMP          SO_TIMESTAMP
 
 #define TARGET_SO_PEERSEC              30
 #define TARGET_SO_SNDBUFFORCE          31
 #define TARGET_SO_RCVBUFFORCE          33
 #define TARGET_SO_PASSSEC              34
 
+#define TARGET_SO_TIMESTAMP_OLD        29
+#define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+
+#define TARGET_SO_TIMESTAMP_NEW        63
+#define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+
 /** sock_type - Socket types
  *
  * Please notice that for binary compat reasons MIPS has to
diff --git a/linux-user/sparc/sockbits.h b/linux-user/sparc/sockbits.h
index 0a822e3e1f..07440efd14 100644
--- a/linux-user/sparc/sockbits.h
+++ b/linux-user/sparc/sockbits.h
@@ -48,8 +48,6 @@
 #define TARGET_SO_GET_FILTER           TARGET_SO_ATTACH_FILTER
 
 #define TARGET_SO_PEERNAME             0x001c
-#define TARGET_SO_TIMESTAMP            0x001d
-#define TARGET_SCM_TIMESTAMP           TARGET_SO_TIMESTAMP
 
 #define TARGET_SO_PEERSEC              0x001e
 #define TARGET_SO_PASSSEC              0x001f
@@ -104,6 +102,12 @@
 
 #define TARGET_SO_ZEROCOPY             0x003e
 
+#define TARGET_SO_TIMESTAMP_OLD        0x001d
+#define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+
+#define TARGET_SO_TIMESTAMP_NEW        0x0046
+#define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+
 /* Security levels - as per NRL IPv6 - don't actually do anything */
 #define TARGET_SO_SECURITY_AUTHENTICATION              0x5001
 #define TARGET_SO_SECURITY_ENCRYPTION_TRANSPORT        0x5002
diff --git a/linux-user/strace.c b/linux-user/strace.c
index e00275fcb5..1a4dd13fe8 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2679,8 +2679,11 @@ print_optint:
         case TARGET_SO_PASSCRED:
             qemu_log("SO_PASSCRED,");
             goto print_optint;
-        case TARGET_SO_TIMESTAMP:
-            qemu_log("SO_TIMESTAMP,");
+        case TARGET_SO_TIMESTAMP_OLD:
+            qemu_log("SO_TIMESTAMP_OLD,");
+            goto print_optint;
+        case TARGET_SO_TIMESTAMP_NEW:
+            qemu_log("SO_TIMESTAMP_NEW,");
             goto print_optint;
         case TARGET_SO_RCVLOWAT:
             qemu_log("SO_RCVLOWAT,");
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7bf99beb18..ddeca7bfd2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1934,6 +1934,18 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
     return 0;
 }
 
+/*
+ * Linux kernel actually keeps track of whether the old version (potentially
+ * 32-bit time_t) or the new version is used for each socket. Instead of
+ * replicate it will all the complexity, we only keep track of one global state,
+ * which is enough for guest programs that don't intentionally mix the two
+ * versions.
+ */
+static enum TargetTimestampVersion {
+    TARGET_TIMESTAMP_OLD,
+    TARGET_TIMESTAMP_NEW,
+} target_expected_timestamp_version = TARGET_TIMESTAMP_OLD;
+
 static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                                            struct msghdr *msgh)
 {
@@ -1984,8 +1996,17 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
         switch (cmsg->cmsg_level) {
         case SOL_SOCKET:
             switch (cmsg->cmsg_type) {
-            case SO_TIMESTAMP:
-                tgt_len = sizeof(struct target_timeval);
+            case SCM_TIMESTAMP:
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                    tgt_len = sizeof(struct target_timeval);
+                    target_cmsg->cmsg_type = tswap32(TARGET_SCM_TIMESTAMP_OLD);
+                    break;
+                case TARGET_TIMESTAMP_NEW:
+                    tgt_len = sizeof(struct target__kernel_sock_timeval);
+                    target_cmsg->cmsg_type = tswap32(TARGET_SCM_TIMESTAMP_NEW);
+                    break;
+                }
                 break;
             default:
                 break;
@@ -2019,20 +2040,39 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                 }
                 break;
             }
-            case SO_TIMESTAMP:
+            case SCM_TIMESTAMP:
             {
                 struct timeval *tv = (struct timeval *)data;
-                struct target_timeval *target_tv =
-                    (struct target_timeval *)target_data;
-
-                if (len != sizeof(struct timeval) ||
-                    tgt_len != sizeof(struct target_timeval)) {
+                if (len != sizeof(struct timeval)) {
                     goto unimplemented;
                 }
 
-                /* copy struct timeval to target */
-                __put_user(tv->tv_sec, &target_tv->tv_sec);
-                __put_user(tv->tv_usec, &target_tv->tv_usec);
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                {
+                    struct target_timeval *target_tv =
+                        (struct target_timeval *)target_data;
+                    if (tgt_len != sizeof(struct target_timeval)) {
+                        goto unimplemented;
+                    }
+
+                    __put_user(tv->tv_sec, &target_tv->tv_sec);
+                    __put_user(tv->tv_usec, &target_tv->tv_usec);
+                    break;
+                }
+                case TARGET_TIMESTAMP_NEW:
+                {
+                    struct target__kernel_sock_timeval *target_tv =
+                        (struct target__kernel_sock_timeval *)target_data;
+                    if (tgt_len != sizeof(struct target__kernel_sock_timeval)) {
+                        goto unimplemented;
+                    }
+
+                    __put_user(tv->tv_sec, &target_tv->tv_sec);
+                    __put_user(tv->tv_usec, &target_tv->tv_usec);
+                    break;
+                }
+                }
                 break;
             }
             case SCM_CREDENTIALS:
@@ -2174,6 +2214,8 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
     int val;
     struct ip_mreqn *ip_mreq;
     struct ip_mreq_source *ip_mreq_source;
+    enum TargetTimestampVersion target_timestamp_version =
+        target_expected_timestamp_version;
 
     switch(level) {
     case SOL_TCP:
@@ -2566,9 +2608,14 @@ set_timeout:
         case TARGET_SO_PASSSEC:
                 optname = SO_PASSSEC;
                 break;
-        case TARGET_SO_TIMESTAMP:
-		optname = SO_TIMESTAMP;
-		break;
+        case TARGET_SO_TIMESTAMP_OLD:
+                target_timestamp_version = TARGET_TIMESTAMP_OLD;
+                optname = SO_TIMESTAMP;
+                break;
+        case TARGET_SO_TIMESTAMP_NEW:
+                target_timestamp_version = TARGET_TIMESTAMP_NEW;
+                optname = SO_TIMESTAMP;
+                break;
         case TARGET_SO_RCVLOWAT:
 		optname = SO_RCVLOWAT;
 		break;
@@ -2581,6 +2628,9 @@ set_timeout:
 	if (get_user_u32(val, optval_addr))
             return -TARGET_EFAULT;
 	ret = get_errno(setsockopt(sockfd, SOL_SOCKET, optname, &val, sizeof(val)));
+        if (!is_error(ret) && optname == SO_TIMESTAMP) {
+            target_expected_timestamp_version = target_timestamp_version;
+        }
         break;
 #ifdef SOL_NETLINK
     case SOL_NETLINK:
@@ -2631,6 +2681,7 @@ static abi_long do_getsockopt(int sockfd, int level, int optname,
     abi_long ret;
     int len, val;
     socklen_t lv;
+    int timestamp_format_matches = 0;
 
     switch(level) {
     case TARGET_SOL_SOCKET:
@@ -2811,7 +2862,14 @@ get_timeout:
         case TARGET_SO_PASSCRED:
             optname = SO_PASSCRED;
             goto int_case;
-        case TARGET_SO_TIMESTAMP:
+        case TARGET_SO_TIMESTAMP_OLD:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_OLD);
+            optname = SO_TIMESTAMP;
+            goto int_case;
+        case TARGET_SO_TIMESTAMP_NEW:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_NEW);
             optname = SO_TIMESTAMP;
             goto int_case;
         case TARGET_SO_RCVLOWAT:
@@ -2838,6 +2896,9 @@ get_timeout:
         if (optname == SO_TYPE) {
             val = host_to_target_sock_type(val);
         }
+        if (optname == SO_TIMESTAMP) {
+            val = val && timestamp_format_matches;
+        }
         if (len > lv)
             len = lv;
         if (len == 4) {
diff --git a/tests/tcg/multiarch/socket_timestamp.c b/tests/tcg/multiarch/socket_timestamp.c
new file mode 100644
index 0000000000..71ab1845de
--- /dev/null
+++ b/tests/tcg/multiarch/socket_timestamp.c
@@ -0,0 +1,296 @@
+#include <assert.h>
+#include <errno.h>
+#include <linux/types.h>
+#include <netinet/in.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/socket.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#ifdef __kernel_old_timeval
+#define kernel_old_timeval __kernel_old_timeval
+#else
+struct kernel_old_timeval {
+    __kernel_long_t tv_sec;
+    __kernel_long_t tv_usec;
+};
+#endif
+
+struct kernel_sock_timeval {
+    int64_t tv_sec;
+    int64_t tv_usec;
+};
+
+int create_udp_socket(struct sockaddr_in *sockaddr)
+{
+    socklen_t sockaddr_len;
+    int sock = socket(AF_INET, SOCK_DGRAM, 0);
+    if (sock < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to create server socket: %s\n", strerror(err));
+        exit(err);
+    }
+
+    memset(sockaddr, 0, sizeof(*sockaddr));
+    sockaddr->sin_family = AF_INET;
+    sockaddr->sin_port = htons(0);  /* let kernel select a port for us */
+    sockaddr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+
+    if (bind(sock, (struct sockaddr *)sockaddr, sizeof(*sockaddr)) < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to bind server socket: %s\n", strerror(err));
+        exit(err);
+    }
+
+    sockaddr_len = sizeof(*sockaddr);
+    if (getsockname(sock, (struct sockaddr *)sockaddr, &sockaddr_len) < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to get socket name: %s\n", strerror(err));
+        exit(err);
+    }
+    return sock;
+}
+
+/*
+ * Checks that the timestamp in the message is not after the reception timestamp
+ * as well as the reception time is within 10 seconds of the message time.
+ */
+void check_timestamp_difference(const struct timeval *msg_tv,
+                                const struct timeval *pkt_tv)
+{
+    if (pkt_tv->tv_sec < msg_tv->tv_sec ||
+        (pkt_tv->tv_sec == msg_tv->tv_sec && pkt_tv->tv_usec < msg_tv->tv_usec))
+    {
+        fprintf(stderr,
+                "Packet received before sent: %lld.%06lld < %lld.%06lld\n",
+                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
+                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
+        exit(-1);
+    }
+
+    if (pkt_tv->tv_sec > msg_tv->tv_sec + 10 ||
+        (pkt_tv->tv_sec == msg_tv->tv_sec + 10 &&
+         pkt_tv->tv_usec > msg_tv->tv_usec)) {
+        fprintf(stderr,
+                "Packet received more than 10 seconds after sent: "
+                "%lld.%06lld > %lld.%06lld + 10\n",
+                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
+                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
+        exit(-1);
+    }
+}
+
+void send_current_time(int sock, struct sockaddr_in server_sockaddr)
+{
+    struct timeval tv = {0, 0};
+    gettimeofday(&tv, NULL);
+    sendto(sock, &tv, sizeof(tv), 0, (struct sockaddr *)&server_sockaddr,
+           sizeof(server_sockaddr));
+}
+
+typedef void (*get_timeval_t)(const struct cmsghdr *cmsg, struct timeval *tv);
+
+
+void receive_packet(int sock, get_timeval_t get_timeval)
+{
+    struct msghdr msg = {0};
+
+    char iobuf[1024];
+    struct iovec iov;
+
+    union {
+        /*
+         * 128 bytes are enough for all existing
+         * timeval/timespec/scm_timestamping structures.
+         */
+        char cmsg_buf[CMSG_SPACE(128)];
+        struct cmsghdr align;
+    } u;
+    struct cmsghdr *cmsg;
+    struct timeval msg_tv, pkt_tv;
+
+    int res;
+
+    iov.iov_base = iobuf;
+    iov.iov_len = sizeof(iobuf);
+
+    msg.msg_iov = &iov;
+    msg.msg_iovlen = 1;
+    msg.msg_control = (caddr_t)u.cmsg_buf;
+    msg.msg_controllen = sizeof(u.cmsg_buf);
+
+    res = recvmsg(sock, &msg, 0);
+    if (res < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to receive packet: %s\n", strerror(err));
+        exit(err);
+    }
+
+    assert(res == sizeof(struct timeval));
+    assert(iov.iov_base == iobuf);
+    memcpy(&msg_tv, iov.iov_base, sizeof(msg_tv));
+    printf("Message timestamp: %lld.%06lld\n",
+           (long long)msg_tv.tv_sec, (long long)msg_tv.tv_usec);
+
+    cmsg = CMSG_FIRSTHDR(&msg);
+    assert(cmsg);
+    (*get_timeval)(cmsg, &pkt_tv);
+    printf("Packet timestamp: %lld.%06lld\n",
+           (long long)pkt_tv.tv_sec, (long long)pkt_tv.tv_usec);
+
+    check_timestamp_difference(&msg_tv, &pkt_tv);
+}
+
+void get_timeval_from_so_timestamp(const struct cmsghdr *cmsg,
+                                   struct timeval *tv)
+{
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SCM_TIMESTAMP);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)));
+    memcpy(tv, CMSG_DATA(cmsg), sizeof(*tv));
+}
+
+#ifdef SO_TIMESTAMP_OLD
+void get_timeval_from_so_timestamp_old(const struct cmsghdr *cmsg,
+                                       struct timeval *tv)
+{
+    struct kernel_old_timeval old_tv;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMP_OLD);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(old_tv)));
+
+    memcpy(&old_tv, CMSG_DATA(cmsg), sizeof(old_tv));
+    tv->tv_sec = old_tv.tv_sec;
+    tv->tv_usec = old_tv.tv_usec;
+}
+
+#ifdef SO_TIMESTAMP_NEW
+void get_timeval_from_so_timestamp_new(const struct cmsghdr *cmsg,
+                                       struct timeval *tv)
+{
+    struct kernel_sock_timeval sock_tv;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMP_NEW);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(sock_tv)));
+
+    memcpy(&sock_tv, CMSG_DATA(cmsg), sizeof(sock_tv));
+    tv->tv_sec = sock_tv.tv_sec;
+    tv->tv_usec = sock_tv.tv_usec;
+}
+#endif /* defined(SO_TIMESTAMP_NEW) */
+#endif /* defined(SO_TIMESTAMP_OLD) */
+
+void set_socket_option(int sock, int sockopt, int on)
+{
+    socklen_t len;
+    int val = on;
+    if (setsockopt(sock, SOL_SOCKET, sockopt, &val, sizeof(val)) < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to setsockopt %d (%s): %s\n",
+                sockopt, on ? "on" : "off", strerror(err));
+        exit(err);
+    }
+
+    len = sizeof(val);
+    val = -1;
+    if (getsockopt(sock, SOL_SOCKET, sockopt, &val, &len) < 0) {
+        int err = errno;
+        fprintf(stderr, "Failed to getsockopt (%d): %s\n", sock, strerror(err));
+        exit(err);
+    }
+    assert(len == sizeof(val));
+    assert(val == on);
+}
+
+int main(int argc, char **argv)
+{
+    int parent_sock, child_sock;
+    struct sockaddr_in parent_sockaddr, child_sockaddr;
+    int pid;
+    struct timeval tv = {0, 0};
+    gettimeofday(&tv, NULL);
+
+    parent_sock = create_udp_socket(&parent_sockaddr);
+    child_sock = create_udp_socket(&child_sockaddr);
+
+    printf("Parent sock bound to port %d\nChild sock bound to port %d\n",
+           parent_sockaddr.sin_port, child_sockaddr.sin_port);
+
+    pid = fork();
+    if (pid < 0) {
+        fprintf(stderr, "SKIPPED. Failed to fork: %s\n", strerror(errno));
+    } else if (pid == 0) {
+        close(child_sock);
+
+        /* Test 1: SO_TIMESTAMP */
+        send_current_time(parent_sock, child_sockaddr);
+
+        if (tv.tv_sec > 0x7fffff00) {
+            /* Too close to y2038 problem, old system may not work. */
+            close(parent_sock);
+            return 0;
+        }
+
+#ifdef SO_TIMESTAMP_OLD
+        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
+            /* Test 2a: SO_TIMESTAMP_OLD */
+            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 1);
+            receive_packet(parent_sock, &get_timeval_from_so_timestamp_old);
+            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 0);
+        }
+#ifdef SO_TIMESTAMP_NEW
+        else {
+            /* Test 2b: SO_TIMESTAMP_NEW */
+            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 1);
+            receive_packet(parent_sock, &get_timeval_from_so_timestamp_new);
+            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 0);
+        }
+#endif /* defined(SO_TIMESTAMP_NEW) */
+#endif /* defined(SO_TIMESTAMP_OLD) */
+
+        close(parent_sock);
+    } else {
+        int child_status;
+        close(parent_sock);
+
+        /* Test 1: SO_TIMESTAMP */
+        set_socket_option(child_sock, SO_TIMESTAMP, 1);
+        receive_packet(child_sock, &get_timeval_from_so_timestamp);
+        set_socket_option(child_sock, SO_TIMESTAMP, 0);
+
+        if (tv.tv_sec > 0x7fffff00) {
+            /* Too close to y2038 problem, old system may not work. */
+            close(child_sock);
+            return 0;
+        }
+
+#ifdef SO_TIMESTAMP_OLD
+        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
+            /* Test 2a: SO_TIMESTAMP_OLD */
+            send_current_time(child_sock, parent_sockaddr);
+        }
+#ifdef SO_TIMESTAMP_NEW
+        else {
+            /* Test 2b: SO_TIMESTAMP_NEW */
+            send_current_time(child_sock, parent_sockaddr);
+        }
+#endif /* defined(SO_TIMESTAMP_NEW) */
+#endif /* defined(SO_TIMESTAMP_OLD) */
+
+        close(child_sock);
+
+        if (waitpid(pid, &child_status, 0) < 0) {
+            int err = errno;
+            fprintf(stderr, "Final wait() failed: %s\n", strerror(err));
+            return err;
+        }
+        return child_status;
+    }
+    return 0;
+}
-- 
2.29.2.684.gfbc64c5ab5-goog


