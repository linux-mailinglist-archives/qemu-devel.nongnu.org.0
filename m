Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350B22DE9F4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:56:39 +0100 (CET)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLri-0000UA-6q
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34QjdXwMKCmwcMgQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--scw.bounces.google.com>)
 id 1kqLpO-0007UI-LY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:14 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:33106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34QjdXwMKCmwcMgQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--scw.bounces.google.com>)
 id 1kqLpL-0007Hh-Ey
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:14 -0500
Received: by mail-yb1-xb49.google.com with SMTP id a206so4588386ybg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=AvhLDaiP3y7Ice2XstK1LlBGN0YJ2Hde0KYC5wY7zyM=;
 b=tYxfyMniP0l8CRtRS0c521K6W5uT8NBac9H/W9yOJvOs3my4eVPPravgRRdSEKgbq7
 rvJiwOJpaCMCYJPnW4ZUfMwUWI0A9GKExTk7Vj8CL6L8s6LXqfNrMxgg9fS2Aog3/AqW
 gMVijeC9veHD/EdrHjR5KNSy9FAiYQZ4NB43WwOHfrPdbJbQI/RsnsFONMVuQ3R772lA
 07EJ0qu0mDh5qMoVz/C34rQnIevZxknYlJzzZv1i00Ni1Vo7Dy4TlsL9LzfJ3XLHU8Pz
 XJU7r3z4eIvkgQAyEayYSbXy+s9XiCUiiu8NNTM80mCmW1BCESUCM4uYNOSoP5PuSTWV
 XZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=AvhLDaiP3y7Ice2XstK1LlBGN0YJ2Hde0KYC5wY7zyM=;
 b=kb1wH+myRI1oh46dJvFeKXA/QHc+E4j7YwFS30ou4ssn4JNOc9Kzjoc6HtGzseBN0x
 WhZYq9ouZwqWCpzvrf/ME1Kq07wgZwXQr8Yd/1V6H+XvC+CiLceWs22JgOb0XlBh6uzu
 E8AEl7z2wiqQRUVDQrd+3QKL09rwsdmZZvnd4hvIjSaeC6og1BA4lu8YwIVKIRKSqHkf
 SXw9PMYx5kDV52GgPStjatFSJqP3V6xvg/LjPXiJvh48ZBTYql5OLUroSIadLfCIM2VW
 tqW0bggDn1Hz94ikIwpCVDEkLTkxPlzYdQpH7GN3pbm8GBZgNyEnXuaTi2GkuceIS4Iw
 SnbQ==
X-Gm-Message-State: AOAM532w5j8ppl0kBnvoYUx0owgTf3N4Vqkc+ZTh89poW4unWRk/08fV
 6X9ywDhajABRyoM0etFcTu+dMk6j7h9zDHFBc6ShswAq9iqhKSr9uUarw4I5L4/qdZ8bk391/Rr
 Y7DkIH3id+5QcK7XErbOPtLitn0Zl9KxQdBcJwJniZ90CwZazW0cQ
X-Google-Smtp-Source: ABdhPJygwauUsRLFLBBUgTl9Yw77c2E13PHuBRKH/9WitBY7OUzEdEz5TmCsDzjqOR3MFBJuW8p6IQU=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a25:d98f:: with SMTP id
 q137mr8640306ybg.128.1608321249575; 
 Fri, 18 Dec 2020 11:54:09 -0800 (PST)
Date: Fri, 18 Dec 2020 11:54:02 -0800
In-Reply-To: <20201218195402.3581189-1-scw@google.com>
Message-Id: <20201218195402.3581189-3-scw@google.com>
Mime-Version: 1.0
References: <20201218195402.3581189-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 2/2] linux-user: setsockopt() SO_TIMESTAMPNS and
 SO_TIMESTAMPING
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=34QjdXwMKCmwcMgQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--scw.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

This change supports SO_TIMESTAMPNS_OLD/NEW and SO_TIMESTAMPING_OLD/NEW
for setsocketopt() with SOL_SOCKET. Based on the SO_TIMESTAMP_OLD/NEW
framework. The three pairs share the same flag `SOCK_TSTAMP_NEW` in
linux kernel for deciding if the old or the new format is used.

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
v1 -> v2:
  Only keep track of old/new format in a global state.
  Fix style problems.

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/alpha/sockbits.h            |  13 +-
 linux-user/generic/sockbits.h          |   8 +
 linux-user/hppa/sockbits.h             |  12 +-
 linux-user/mips/sockbits.h             |   8 +
 linux-user/sparc/sockbits.h            |  13 +-
 linux-user/strace.c                    |  12 +
 linux-user/syscall.c                   | 149 ++++++++-
 tests/tcg/multiarch/socket_timestamp.c | 442 +++++++++++++++++++------
 8 files changed, 540 insertions(+), 117 deletions(-)

diff --git a/linux-user/alpha/sockbits.h b/linux-user/alpha/sockbits.h
index 40f0644df0..c2c88f432b 100644
--- a/linux-user/alpha/sockbits.h
+++ b/linux-user/alpha/sockbits.h
@@ -51,8 +51,6 @@
 
 #define TARGET_SO_PEERSEC       30
 #define TARGET_SO_PASSSEC       34
-#define TARGET_SO_TIMESTAMPNS       35
-#define TARGET_SCM_TIMESTAMPNS      TARGET_SO_TIMESTAMPNS
 
 /* Security levels - as per NRL IPv6 - don't actually do anything */
 #define TARGET_SO_SECURITY_AUTHENTICATION       19
@@ -61,9 +59,6 @@
 
 #define TARGET_SO_MARK          36
 
-#define TARGET_SO_TIMESTAMPING      37
-#define TARGET_SCM_TIMESTAMPING TARGET_SO_TIMESTAMPING
-
 #define TARGET_SO_RXQ_OVFL             40
 
 #define TARGET_SO_WIFI_STATUS       41
@@ -75,9 +70,17 @@
 
 #define TARGET_SO_TIMESTAMP_OLD        29
 #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+#define TARGET_SO_TIMESTAMPNS_OLD      35
+#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
+#define TARGET_SO_TIMESTAMPING_OLD     37
+#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
 
 #define TARGET_SO_TIMESTAMP_NEW        63
 #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+#define TARGET_SO_TIMESTAMPNS_NEW      64
+#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
+#define TARGET_SO_TIMESTAMPING_NEW     65
+#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
 
 /* TARGET_O_NONBLOCK clashes with the bits used for socket types.  Therefore we
  * have to define SOCK_NONBLOCK to a different value here.
diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
index 532cf2d3dc..a0496d8751 100644
--- a/linux-user/generic/sockbits.h
+++ b/linux-user/generic/sockbits.h
@@ -56,8 +56,16 @@
 
 #define TARGET_SO_TIMESTAMP_OLD        29
 #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+#define TARGET_SO_TIMESTAMPNS_OLD      35
+#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
+#define TARGET_SO_TIMESTAMPING_OLD     37
+#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
 
 #define TARGET_SO_TIMESTAMP_NEW        63
 #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+#define TARGET_SO_TIMESTAMPNS_NEW      64
+#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
+#define TARGET_SO_TIMESTAMPING_NEW     65
+#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
 
 #endif
diff --git a/linux-user/hppa/sockbits.h b/linux-user/hppa/sockbits.h
index 284a47e74e..d7e9aa340d 100644
--- a/linux-user/hppa/sockbits.h
+++ b/linux-user/hppa/sockbits.h
@@ -29,8 +29,6 @@
 #define TARGET_SO_BSDCOMPAT    0x400e
 #define TARGET_SO_PASSCRED     0x4010
 #define TARGET_SO_PEERCRED     0x4011
-#define TARGET_SO_TIMESTAMPNS  0x4013
-#define TARGET_SCM_TIMESTAMPNS TARGET_SO_TIMESTAMPNS
 
 #define TARGET_SO_SECURITY_AUTHENTICATION              0x4016
 #define TARGET_SO_SECURITY_ENCRYPTION_TRANSPORT        0x4017
@@ -44,8 +42,6 @@
 #define TARGET_SO_PEERSEC              0x401d
 #define TARGET_SO_PASSSEC              0x401e
 #define TARGET_SO_MARK                 0x401f
-#define TARGET_SO_TIMESTAMPING         0x4020
-#define TARGET_SCM_TIMESTAMPING        TARGET_SO_TIMESTAMPING
 #define TARGET_SO_RXQ_OVFL             0x4021
 #define TARGET_SO_WIFI_STATUS          0x4022
 #define TARGET_SCM_WIFI_STATUS         TARGET_SO_WIFI_STATUS
@@ -67,9 +63,17 @@
 
 #define TARGET_SO_TIMESTAMP_OLD        0x4012
 #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+#define TARGET_SO_TIMESTAMPNS_OLD      0x4013
+#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
+#define TARGET_SO_TIMESTAMPING_OLD     0x4020
+#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
 
 #define TARGET_SO_TIMESTAMP_NEW        0x4038
 #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+#define TARGET_SO_TIMESTAMPNS_NEW      0x4039
+#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
+#define TARGET_SO_TIMESTAMPING_NEW     0x403A
+#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
 
 /* TARGET_O_NONBLOCK clashes with the bits used for socket types.  Therefore we
  * have to define SOCK_NONBLOCK to a different value here.
diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
index b4c39d9588..49524e23ac 100644
--- a/linux-user/mips/sockbits.h
+++ b/linux-user/mips/sockbits.h
@@ -69,9 +69,17 @@
 
 #define TARGET_SO_TIMESTAMP_OLD        29
 #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+#define TARGET_SO_TIMESTAMPNS_OLD      35
+#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
+#define TARGET_SO_TIMESTAMPING_OLD     37
+#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
 
 #define TARGET_SO_TIMESTAMP_NEW        63
 #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+#define TARGET_SO_TIMESTAMPNS_NEW      64
+#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
+#define TARGET_SO_TIMESTAMPING_NEW     65
+#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
 
 /** sock_type - Socket types
  *
diff --git a/linux-user/sparc/sockbits.h b/linux-user/sparc/sockbits.h
index 07440efd14..c5fade3ad1 100644
--- a/linux-user/sparc/sockbits.h
+++ b/linux-user/sparc/sockbits.h
@@ -51,14 +51,9 @@
 
 #define TARGET_SO_PEERSEC              0x001e
 #define TARGET_SO_PASSSEC              0x001f
-#define TARGET_SO_TIMESTAMPNS          0x0021
-#define TARGET_SCM_TIMESTAMPNS         TARGET_SO_TIMESTAMPNS
 
 #define TARGET_SO_MARK                 0x0022
 
-#define TARGET_SO_TIMESTAMPING         0x0023
-#define TARGET_SCM_TIMESTAMPING        TARGET_SO_TIMESTAMPING
-
 #define TARGET_SO_RXQ_OVFL             0x0024
 
 #define TARGET_SO_WIFI_STATUS          0x0025
@@ -104,9 +99,17 @@
 
 #define TARGET_SO_TIMESTAMP_OLD        0x001d
 #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
+#define TARGET_SO_TIMESTAMPNS_OLD      0x0021
+#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
+#define TARGET_SO_TIMESTAMPING_OLD     0x0023
+#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
 
 #define TARGET_SO_TIMESTAMP_NEW        0x0046
 #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
+#define TARGET_SO_TIMESTAMPNS_NEW      0x0042
+#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
+#define TARGET_SO_TIMESTAMPING_NEW     0x0043
+#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
 
 /* Security levels - as per NRL IPv6 - don't actually do anything */
 #define TARGET_SO_SECURITY_AUTHENTICATION              0x5001
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 1a4dd13fe8..563e87bfaa 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2682,9 +2682,21 @@ print_optint:
         case TARGET_SO_TIMESTAMP_OLD:
             qemu_log("SO_TIMESTAMP_OLD,");
             goto print_optint;
+        case TARGET_SO_TIMESTAMPNS_OLD:
+            qemu_log("SO_TIMESTAMPNS_OLD,");
+            goto print_optint;
+        case TARGET_SO_TIMESTAMPING_OLD:
+            qemu_log("SO_TIMESTAMPING_OLD,");
+            goto print_optint;
         case TARGET_SO_TIMESTAMP_NEW:
             qemu_log("SO_TIMESTAMP_NEW,");
             goto print_optint;
+        case TARGET_SO_TIMESTAMPNS_NEW:
+            qemu_log("SO_TIMESTAMPNS_NEW,");
+            goto print_optint;
+        case TARGET_SO_TIMESTAMPING_NEW:
+            qemu_log("SO_TIMESTAMPING_NEW,");
+            goto print_optint;
         case TARGET_SO_RCVLOWAT:
             qemu_log("SO_RCVLOWAT,");
             goto print_optint;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ddeca7bfd2..4f834b16ab 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2008,6 +2008,34 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                     break;
                 }
                 break;
+            case SCM_TIMESTAMPNS:
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                    tgt_len = sizeof(struct target_timespec);
+                    target_cmsg->cmsg_type =
+                        tswap32(TARGET_SCM_TIMESTAMPNS_OLD);
+                    break;
+                case TARGET_TIMESTAMP_NEW:
+                    tgt_len = sizeof(struct target__kernel_timespec);
+                    target_cmsg->cmsg_type =
+                        tswap32(TARGET_SCM_TIMESTAMPNS_NEW);
+                    break;
+                }
+                break;
+            case SCM_TIMESTAMPING:
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                    tgt_len = sizeof(struct target_timespec[3]);
+                    target_cmsg->cmsg_type =
+                        tswap32(TARGET_SCM_TIMESTAMPING_OLD);
+                    break;
+                case TARGET_TIMESTAMP_NEW:
+                    tgt_len = sizeof(struct target__kernel_timespec[3]);
+                    target_cmsg->cmsg_type =
+                        tswap32(TARGET_SCM_TIMESTAMPING_NEW);
+                    break;
+                }
+                break;
             default:
                 break;
             }
@@ -2075,6 +2103,81 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                 }
                 break;
             }
+            case SCM_TIMESTAMPNS:
+            {
+                struct timespec *ts = (struct timespec *)data;
+                if (len != sizeof(struct timespec)) {
+                    goto unimplemented;
+                }
+
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                {
+                    struct target_timespec *target_ts =
+                        (struct target_timespec *)target_data;
+                    if (tgt_len != sizeof(struct target_timespec)) {
+                        goto unimplemented;
+                    }
+
+                    __put_user(ts->tv_sec, &target_ts->tv_sec);
+                    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
+                    break;
+                }
+                case TARGET_TIMESTAMP_NEW:
+                {
+                    struct target__kernel_timespec *target_ts =
+                        (struct target__kernel_timespec *)target_data;
+                    if (tgt_len != sizeof(struct target__kernel_timespec)) {
+                        goto unimplemented;
+                    }
+
+                    __put_user(ts->tv_sec, &target_ts->tv_sec);
+                    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
+                    break;
+                }
+                }
+                break;
+            }
+            case SCM_TIMESTAMPING:
+            {
+                int i;
+                struct timespec *ts = (struct timespec *)data;
+                if (len != sizeof(struct timespec[3])) {
+                    goto unimplemented;
+                }
+
+                switch (target_expected_timestamp_version) {
+                case TARGET_TIMESTAMP_OLD:
+                {
+                    struct target_timespec *target_ts =
+                        (struct target_timespec *)target_data;
+                    if (tgt_len != sizeof(struct target_timespec[3])) {
+                        goto unimplemented;
+                    }
+
+                    for (i = 0; i < 3; ++i) {
+                        __put_user(ts[i].tv_sec, &target_ts[i].tv_sec);
+                        __put_user(ts[i].tv_nsec, &target_ts[i].tv_nsec);
+                    }
+                    break;
+                }
+                case TARGET_TIMESTAMP_NEW:
+                {
+                    struct target__kernel_timespec *target_ts =
+                        (struct target__kernel_timespec *)target_data;
+                    if (tgt_len != sizeof(struct target__kernel_timespec[3])) {
+                        goto unimplemented;
+                    }
+
+                    for (i = 0; i < 3; ++i) {
+                        __put_user(ts[i].tv_sec, &target_ts[i].tv_sec);
+                        __put_user(ts[i].tv_nsec, &target_ts[i].tv_nsec);
+                    }
+                    break;
+                }
+                }
+                break;
+            }
             case SCM_CREDENTIALS:
             {
                 struct ucred *cred = (struct ucred *)data;
@@ -2616,6 +2719,22 @@ set_timeout:
                 target_timestamp_version = TARGET_TIMESTAMP_NEW;
                 optname = SO_TIMESTAMP;
                 break;
+        case TARGET_SO_TIMESTAMPNS_OLD:
+                target_timestamp_version = TARGET_TIMESTAMP_OLD;
+                optname = SO_TIMESTAMPNS;
+                break;
+        case TARGET_SO_TIMESTAMPNS_NEW:
+                target_timestamp_version = TARGET_TIMESTAMP_NEW;
+                optname = SO_TIMESTAMPNS;
+                break;
+        case TARGET_SO_TIMESTAMPING_OLD:
+                target_timestamp_version = TARGET_TIMESTAMP_OLD;
+                optname = SO_TIMESTAMPING;
+                break;
+        case TARGET_SO_TIMESTAMPING_NEW:
+                target_timestamp_version = TARGET_TIMESTAMP_NEW;
+                optname = SO_TIMESTAMPING;
+                break;
         case TARGET_SO_RCVLOWAT:
 		optname = SO_RCVLOWAT;
 		break;
@@ -2628,7 +2747,9 @@ set_timeout:
 	if (get_user_u32(val, optval_addr))
             return -TARGET_EFAULT;
 	ret = get_errno(setsockopt(sockfd, SOL_SOCKET, optname, &val, sizeof(val)));
-        if (!is_error(ret) && optname == SO_TIMESTAMP) {
+        if (!is_error(ret) &&
+            (optname == SO_TIMESTAMP || optname == SO_TIMESTAMPNS ||
+             optname == SO_TIMESTAMPING)) {
             target_expected_timestamp_version = target_timestamp_version;
         }
         break;
@@ -2872,6 +2993,26 @@ get_timeout:
                 (target_expected_timestamp_version == TARGET_TIMESTAMP_NEW);
             optname = SO_TIMESTAMP;
             goto int_case;
+        case TARGET_SO_TIMESTAMPNS_OLD:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_OLD);
+            optname = SO_TIMESTAMPNS;
+            goto int_case;
+        case TARGET_SO_TIMESTAMPNS_NEW:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_NEW);
+            optname = SO_TIMESTAMPNS;
+            goto int_case;
+        case TARGET_SO_TIMESTAMPING_OLD:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_OLD);
+            optname = SO_TIMESTAMPING;
+            goto int_case;
+        case TARGET_SO_TIMESTAMPING_NEW:
+            timestamp_format_matches =
+                (target_expected_timestamp_version == TARGET_TIMESTAMP_NEW);
+            optname = SO_TIMESTAMPING;
+            goto int_case;
         case TARGET_SO_RCVLOWAT:
             optname = SO_RCVLOWAT;
             goto int_case;
@@ -2895,9 +3036,9 @@ get_timeout:
             return ret;
         if (optname == SO_TYPE) {
             val = host_to_target_sock_type(val);
-        }
-        if (optname == SO_TIMESTAMP) {
-            val = val && timestamp_format_matches;
+        } else if ((optname == SO_TIMESTAMP || optname == SO_TIMESTAMPNS ||
+                    optname == SO_TIMESTAMPING) && !timestamp_format_matches) {
+            val = 0;
         }
         if (len > lv)
             len = lv;
diff --git a/tests/tcg/multiarch/socket_timestamp.c b/tests/tcg/multiarch/socket_timestamp.c
index 71ab1845de..3ae833ad44 100644
--- a/tests/tcg/multiarch/socket_timestamp.c
+++ b/tests/tcg/multiarch/socket_timestamp.c
@@ -1,5 +1,6 @@
 #include <assert.h>
 #include <errno.h>
+#include <linux/net_tstamp.h>
 #include <linux/types.h>
 #include <netinet/in.h>
 #include <stdint.h>
@@ -11,6 +12,7 @@
 #include <sys/time.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include <time.h>
 #include <unistd.h>
 
 #ifdef __kernel_old_timeval
@@ -27,6 +29,33 @@ struct kernel_sock_timeval {
     int64_t tv_usec;
 };
 
+struct kernel_old_timespec {
+    __kernel_long_t tv_sec;
+    long            tv_nsec;
+};
+
+struct kernel_timespec {
+    int64_t   tv_sec;
+    long long tv_nsec;
+};
+
+struct scm_timestamping {
+    struct timespec ts[3];
+};
+
+struct scm_old_timestamping {
+    struct kernel_old_timespec ts[3];
+};
+
+struct scm_timestamping64 {
+    struct kernel_timespec ts[3];
+};
+
+const int so_timestamping_flags =
+    SOF_TIMESTAMPING_RX_HARDWARE |
+    SOF_TIMESTAMPING_RX_SOFTWARE |
+    SOF_TIMESTAMPING_SOFTWARE;
+
 int create_udp_socket(struct sockaddr_in *sockaddr)
 {
     socklen_t sockaddr_len;
@@ -61,43 +90,47 @@ int create_udp_socket(struct sockaddr_in *sockaddr)
  * Checks that the timestamp in the message is not after the reception timestamp
  * as well as the reception time is within 10 seconds of the message time.
  */
-void check_timestamp_difference(const struct timeval *msg_tv,
-                                const struct timeval *pkt_tv)
+void check_timestamp_difference(const struct timespec *msg_ts,
+                                const struct timespec *pkt_ts)
 {
-    if (pkt_tv->tv_sec < msg_tv->tv_sec ||
-        (pkt_tv->tv_sec == msg_tv->tv_sec && pkt_tv->tv_usec < msg_tv->tv_usec))
+    if (pkt_ts->tv_sec < msg_ts->tv_sec ||
+        (pkt_ts->tv_sec == msg_ts->tv_sec && pkt_ts->tv_nsec < msg_ts->tv_nsec))
     {
         fprintf(stderr,
-                "Packet received before sent: %lld.%06lld < %lld.%06lld\n",
-                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
-                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
+                "Packet received before sent: %lld.%06lld < %lld.%09lld\n",
+                (long long)pkt_ts->tv_sec, (long long)pkt_ts->tv_nsec,
+                (long long)msg_ts->tv_sec, (long long)msg_ts->tv_nsec);
         exit(-1);
     }
 
-    if (pkt_tv->tv_sec > msg_tv->tv_sec + 10 ||
-        (pkt_tv->tv_sec == msg_tv->tv_sec + 10 &&
-         pkt_tv->tv_usec > msg_tv->tv_usec)) {
+    if (pkt_ts->tv_sec > msg_ts->tv_sec + 10 ||
+        (pkt_ts->tv_sec == msg_ts->tv_sec + 10 &&
+         pkt_ts->tv_nsec > msg_ts->tv_nsec)) {
         fprintf(stderr,
                 "Packet received more than 10 seconds after sent: "
-                "%lld.%06lld > %lld.%06lld + 10\n",
-                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
-                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
+                "%lld.%06lld > %lld.%09lld + 10\n",
+                (long long)pkt_ts->tv_sec, (long long)pkt_ts->tv_nsec,
+                (long long)msg_ts->tv_sec, (long long)msg_ts->tv_nsec);
         exit(-1);
     }
 }
 
 void send_current_time(int sock, struct sockaddr_in server_sockaddr)
 {
-    struct timeval tv = {0, 0};
-    gettimeofday(&tv, NULL);
-    sendto(sock, &tv, sizeof(tv), 0, (struct sockaddr *)&server_sockaddr,
+    struct timespec ts = {0, 0};
+    clock_gettime(CLOCK_REALTIME, &ts);
+#ifdef MSG_CONFIRM
+    const int flags = MSG_CONFIRM;
+#else
+    const int flags = 0;
+#endif
+    sendto(sock, &ts, sizeof(ts), flags, (struct sockaddr *)&server_sockaddr,
            sizeof(server_sockaddr));
 }
 
-typedef void (*get_timeval_t)(const struct cmsghdr *cmsg, struct timeval *tv);
+typedef void (*get_timespec_t)(const struct cmsghdr *cmsg, struct timespec *tv);
 
-
-void receive_packet(int sock, get_timeval_t get_timeval)
+void receive_packet(int sock, get_timespec_t get_timespec)
 {
     struct msghdr msg = {0};
 
@@ -113,7 +146,7 @@ void receive_packet(int sock, get_timeval_t get_timeval)
         struct cmsghdr align;
     } u;
     struct cmsghdr *cmsg;
-    struct timeval msg_tv, pkt_tv;
+    struct timespec msg_ts, pkt_ts;
 
     int res;
 
@@ -134,31 +167,35 @@ void receive_packet(int sock, get_timeval_t get_timeval)
 
     assert(res == sizeof(struct timeval));
     assert(iov.iov_base == iobuf);
-    memcpy(&msg_tv, iov.iov_base, sizeof(msg_tv));
-    printf("Message timestamp: %lld.%06lld\n",
-           (long long)msg_tv.tv_sec, (long long)msg_tv.tv_usec);
+    memcpy(&msg_ts, iov.iov_base, sizeof(msg_ts));
+    printf("Message timestamp: %lld.%09lld\n",
+           (long long)msg_ts.tv_sec, (long long)msg_ts.tv_nsec);
 
     cmsg = CMSG_FIRSTHDR(&msg);
     assert(cmsg);
-    (*get_timeval)(cmsg, &pkt_tv);
-    printf("Packet timestamp: %lld.%06lld\n",
-           (long long)pkt_tv.tv_sec, (long long)pkt_tv.tv_usec);
+    (*get_timespec)(cmsg, &pkt_ts);
+    printf("Packet timestamp: %lld.%09lld\n",
+           (long long)pkt_ts.tv_sec, (long long)pkt_ts.tv_nsec);
 
-    check_timestamp_difference(&msg_tv, &pkt_tv);
+    check_timestamp_difference(&msg_ts, &pkt_ts);
 }
 
-void get_timeval_from_so_timestamp(const struct cmsghdr *cmsg,
-                                   struct timeval *tv)
+void get_timespec_from_so_timestamp(const struct cmsghdr *cmsg,
+                                    struct timespec *ts)
 {
+    struct timeval tv;
     assert(cmsg->cmsg_level == SOL_SOCKET);
     assert(cmsg->cmsg_type == SCM_TIMESTAMP);
-    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)));
-    memcpy(tv, CMSG_DATA(cmsg), sizeof(*tv));
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tv)));
+
+    memcpy(&tv, CMSG_DATA(cmsg), sizeof(tv));
+    ts->tv_sec = tv.tv_sec;
+    ts->tv_nsec = tv.tv_usec * 1000LL;
 }
 
 #ifdef SO_TIMESTAMP_OLD
-void get_timeval_from_so_timestamp_old(const struct cmsghdr *cmsg,
-                                       struct timeval *tv)
+void get_timespec_from_so_timestamp_old(const struct cmsghdr *cmsg,
+                                        struct timespec *ts)
 {
     struct kernel_old_timeval old_tv;
     assert(cmsg->cmsg_level == SOL_SOCKET);
@@ -166,13 +203,13 @@ void get_timeval_from_so_timestamp_old(const struct cmsghdr *cmsg,
     assert(cmsg->cmsg_len == CMSG_LEN(sizeof(old_tv)));
 
     memcpy(&old_tv, CMSG_DATA(cmsg), sizeof(old_tv));
-    tv->tv_sec = old_tv.tv_sec;
-    tv->tv_usec = old_tv.tv_usec;
+    ts->tv_sec = old_tv.tv_sec;
+    ts->tv_nsec = old_tv.tv_usec * 1000LL;
 }
 
 #ifdef SO_TIMESTAMP_NEW
-void get_timeval_from_so_timestamp_new(const struct cmsghdr *cmsg,
-                                       struct timeval *tv)
+void get_timespec_from_so_timestamp_new(const struct cmsghdr *cmsg,
+                                        struct timespec *ts)
 {
     struct kernel_sock_timeval sock_tv;
     assert(cmsg->cmsg_level == SOL_SOCKET);
@@ -180,42 +217,298 @@ void get_timeval_from_so_timestamp_new(const struct cmsghdr *cmsg,
     assert(cmsg->cmsg_len == CMSG_LEN(sizeof(sock_tv)));
 
     memcpy(&sock_tv, CMSG_DATA(cmsg), sizeof(sock_tv));
-    tv->tv_sec = sock_tv.tv_sec;
-    tv->tv_usec = sock_tv.tv_usec;
+    ts->tv_sec = sock_tv.tv_sec;
+    ts->tv_nsec = sock_tv.tv_usec * 1000LL;
 }
 #endif /* defined(SO_TIMESTAMP_NEW) */
 #endif /* defined(SO_TIMESTAMP_OLD) */
 
-void set_socket_option(int sock, int sockopt, int on)
+void get_timespec_from_so_timestampns(const struct cmsghdr *cmsg,
+                                      struct timespec *ts)
+{
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SCM_TIMESTAMPNS);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(*ts)));
+
+    memcpy(ts, CMSG_DATA(cmsg), sizeof(*ts));
+}
+
+#ifdef SO_TIMESTAMPNS_OLD
+void get_timespec_from_so_timestampns_old(const struct cmsghdr *cmsg,
+                                          struct timespec *ts)
+{
+    struct kernel_old_timespec old_ts;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMPNS_OLD);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(old_ts)));
+
+    memcpy(&old_ts, CMSG_DATA(cmsg), sizeof(old_ts));
+    ts->tv_sec = old_ts.tv_sec;
+    ts->tv_nsec = old_ts.tv_nsec;
+}
+
+#ifdef SO_TIMESTAMPNS_NEW
+void get_timespec_from_so_timestampns_new(const struct cmsghdr *cmsg,
+                                          struct timespec *ts)
+{
+    struct kernel_timespec sock_ts;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMPNS_NEW);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(sock_ts)));
+
+    memcpy(&sock_ts, CMSG_DATA(cmsg), sizeof(sock_ts));
+    ts->tv_sec = sock_ts.tv_sec;
+    ts->tv_nsec = sock_ts.tv_nsec;
+}
+#endif /* defined(SO_TIMESTAMPNS_NEW) */
+#endif /* defined(SO_TIMESTAMPNS_OLD) */
+
+void get_timespec_from_so_timestamping(const struct cmsghdr *cmsg,
+                                       struct timespec *ts)
+{
+    int i;
+    struct scm_timestamping tss;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SCM_TIMESTAMPING);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
+
+    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
+
+    for (i = 0; i < 3; ++i) {
+        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
+            *ts = tss.ts[i];
+            return;
+        }
+    }
+    assert(!"All three entries in scm_timestamping are empty");
+}
+
+#ifdef SO_TIMESTAMPING_OLD
+void get_timespec_from_so_timestamping_old(const struct cmsghdr *cmsg,
+                                           struct timespec *ts)
+{
+    int i;
+    struct scm_old_timestamping tss;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMPING_OLD);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
+
+    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
+
+    for (i = 0; i < 3; ++i) {
+        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
+            ts->tv_sec = tss.ts[i].tv_sec;
+            ts->tv_nsec = tss.ts[i].tv_nsec;
+            return;
+        }
+    }
+    assert(!"All three entries in scm_old_timestamping are empty");
+}
+
+#ifdef SO_TIMESTAMPING_NEW
+void get_timespec_from_so_timestamping_new(const struct cmsghdr *cmsg,
+                                           struct timespec *ts)
+{
+    int i;
+    struct scm_timestamping64 tss;
+    assert(cmsg->cmsg_level == SOL_SOCKET);
+    assert(cmsg->cmsg_type == SO_TIMESTAMPING_NEW);
+    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
+
+    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
+    for (i = 0; i < 3; ++i) {
+        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
+            ts->tv_sec = tss.ts[i].tv_sec;
+            ts->tv_nsec = tss.ts[i].tv_nsec;
+            return;
+        }
+    }
+    assert(!"All three entries in scm_timestamp64 are empty");
+}
+#endif /* defined(SO_TIMESTAMPING_NEW) */
+#endif /* defined(SO_TIMESTAMPING_OLD) */
+
+void set_socket_option(int sock, int sockopt, int set_to)
 {
     socklen_t len;
-    int val = on;
+    int val = set_to;
     if (setsockopt(sock, SOL_SOCKET, sockopt, &val, sizeof(val)) < 0) {
         int err = errno;
-        fprintf(stderr, "Failed to setsockopt %d (%s): %s\n",
-                sockopt, on ? "on" : "off", strerror(err));
+        fprintf(stderr, "Failed at setsockopt(%d, SOL_SOCKET, %d, %d): %s\n",
+                sock, sockopt, set_to, strerror(err));
         exit(err);
     }
 
+#ifdef SO_TIMESTAMPING_NEW
+    if (sockopt == SO_TIMESTAMPING_NEW) {
+        /*
+         * `getsockopt(sock, SOL_SOCKET, SO_TIMESTAMPING_NEW)` not implemented
+         * as of linux kernel v5.8-rc4.
+         */
+        return;
+    }
+#endif
+
     len = sizeof(val);
     val = -1;
     if (getsockopt(sock, SOL_SOCKET, sockopt, &val, &len) < 0) {
         int err = errno;
-        fprintf(stderr, "Failed to getsockopt (%d): %s\n", sock, strerror(err));
+        fprintf(stderr, "Failed at getsockopt(%d, SOL_SOCKET, %d): %s\n",
+                sock, sockopt, strerror(err));
         exit(err);
     }
     assert(len == sizeof(val));
-    assert(val == on);
+    assert(val == set_to);
+}
+
+void child_steps(int sock, struct sockaddr_in addr, int run_old)
+{
+    /* Test 1: SO_TIMESTAMP */
+    send_current_time(sock, addr);
+
+    /* Test 2: SO_TIMESTAMPNS */
+    printf("Test 2: SO_TIMESTAMPNS\n");
+    set_socket_option(sock, SO_TIMESTAMPNS, 1);
+    receive_packet(sock, &get_timespec_from_so_timestampns);
+    set_socket_option(sock, SO_TIMESTAMPNS, 0);
+
+    /* Test 3: SO_TIMESTAMPING */
+    send_current_time(sock, addr);
+
+    if (!run_old) {
+        return;
+    }
+
+#ifdef SO_TIMESTAMP_OLD
+    if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
+        /* Test 4a: SO_TIMESTAMP_OLD */
+        printf("Test 4a: SO_TIMESTAMP_OLD\n");
+        set_socket_option(sock, SO_TIMESTAMP_OLD, 1);
+        receive_packet(sock, &get_timespec_from_so_timestamp_old);
+        set_socket_option(sock, SO_TIMESTAMP_OLD, 0);
+    }
+#ifdef SO_TIMESTAMP_NEW
+    else {
+        /* Test 4b: SO_TIMESTAMP_NEW */
+        printf("Test 4b: SO_TIMESTAMP_NEW\n");
+        set_socket_option(sock, SO_TIMESTAMP_NEW, 1);
+        receive_packet(sock, &get_timespec_from_so_timestamp_new);
+        set_socket_option(sock, SO_TIMESTAMP_NEW, 0);
+    }
+#endif /* defined(SO_TIMESTAMP_NEW) */
+#endif /* defined(SO_TIMESTAMP_OLD) */
+
+#ifdef SO_TIMESTAMPNS_OLD
+    if (SO_TIMESTAMPNS_OLD != SO_TIMESTAMPNS) {
+        /* Test 5a: SO_TIMESTAMPNS_OLD */
+        send_current_time(sock, addr);
+    }
+#ifdef SO_TIMESTAMPNS_NEW
+    else {
+        /* Test 5b: SO_TIMESTAMPNS_NEW */
+        send_current_time(sock, addr);
+    }
+#endif /* defined(SO_TIMESTAMPNS_NEW) */
+#endif /* defined(SO_TIMESTAMPNS_OLD) */
+
+#ifdef SO_TIMESTAMPING_OLD
+    if (SO_TIMESTAMPING_OLD != SO_TIMESTAMPING) {
+        /* Test 6a: SO_TIMESTAMPING_OLD */
+        printf("Test 6a: SO_TIMESTAMPING_OLD\n");
+        set_socket_option(sock, SO_TIMESTAMPING_OLD, so_timestamping_flags);
+        receive_packet(sock, &get_timespec_from_so_timestamping_old);
+        set_socket_option(sock, SO_TIMESTAMPING_OLD, 0);
+    }
+#ifdef SO_TIMESTAMPING_NEW
+    else {
+        /* Test 6b: SO_TIMESTAMPING_NEW */
+        printf("Test 6b: SO_TIMESTAMPING_NEW\n");
+        set_socket_option(sock, SO_TIMESTAMPING_NEW, so_timestamping_flags);
+        receive_packet(sock, &get_timespec_from_so_timestamping_new);
+        set_socket_option(sock, SO_TIMESTAMPING_NEW, 0);
+    }
+#endif /* defined(SO_TIMESTAMPING_NEW) */
+#endif /* defined(SO_TIMESTAMPING_OLD) */
+}
+
+void parent_steps(int sock, struct sockaddr_in addr, int run_old)
+{
+    /* Test 1: SO_TIMESTAMP */
+    printf("Test 1: SO_TIMESTAMP\n");
+    set_socket_option(sock, SO_TIMESTAMP, 1);
+    receive_packet(sock, &get_timespec_from_so_timestamp);
+    set_socket_option(sock, SO_TIMESTAMP, 0);
+
+    /* Test 2: SO_TIMESTAMPNS */
+    send_current_time(sock, addr);
+
+    /* Test 3: SO_TIMESTAMPING */
+    printf("Test 3: SO_TIMESTAMPING\n");
+    set_socket_option(sock, SO_TIMESTAMPING, so_timestamping_flags);
+    receive_packet(sock, &get_timespec_from_so_timestamping);
+    set_socket_option(sock, SO_TIMESTAMPING, 0);
+
+    if (!run_old) {
+        return;
+    }
+
+#ifdef SO_TIMESTAMP_OLD
+    if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
+        /* Test 4a: SO_TIMESTAMP_OLD */
+        send_current_time(sock, addr);
+    }
+#ifdef SO_TIMESTAMP_NEW
+    else {
+        /* Test 4b: SO_TIMESTAMP_NEW */
+        send_current_time(sock, addr);
+    }
+#endif /* defined(SO_TIMESTAMP_NEW) */
+#endif /* defined(SO_TIMESTAMP_OLD) */
+
+#ifdef SO_TIMESTAMPNS_OLD
+    if (SO_TIMESTAMPNS_OLD != SO_TIMESTAMPNS) {
+        /* Test 5a: SO_TIMESTAMPNS_OLD */
+        printf("Test 5a: SO_TIMESTAMPNS_OLD\n");
+        set_socket_option(sock, SO_TIMESTAMPNS_OLD, 1);
+        receive_packet(sock, &get_timespec_from_so_timestampns_old);
+        set_socket_option(sock, SO_TIMESTAMPNS_OLD, 0);
+    }
+#ifdef SO_TIMESTAMPNS_NEW
+    else {
+        /* Test 5b: SO_TIMESTAMPNS_NEW */
+        printf("Test 5b: SO_TIMESTAMPNS_NEW\n");
+        set_socket_option(sock, SO_TIMESTAMPNS_NEW, 1);
+        receive_packet(sock, &get_timespec_from_so_timestampns_new);
+        set_socket_option(sock, SO_TIMESTAMPNS_NEW, 0);
+    }
+#endif /* defined(SO_TIMESTAMPNS_NEW) */
+#endif /* defined(SO_TIMESTAMPNS_OLD) */
+
+#ifdef SO_TIMESTAMPING_OLD
+    if (SO_TIMESTAMPING_OLD != SO_TIMESTAMPING) {
+        /* Test 6a: SO_TIMESTAMPING_OLD */
+        send_current_time(sock, addr);
+    }
+#ifdef SO_TIMESTAMPING_NEW
+    else {
+        /* Test 6b: SO_TIMESTAMPING_NEW */
+        send_current_time(sock, addr);
+    }
+#endif /* defined(SO_TIMESTAMPING_NEW) */
+#endif /* defined(SO_TIMESTAMPING_OLD) */
 }
 
 int main(int argc, char **argv)
 {
     int parent_sock, child_sock;
     struct sockaddr_in parent_sockaddr, child_sockaddr;
-    int pid;
+    int pid, run_old;
     struct timeval tv = {0, 0};
     gettimeofday(&tv, NULL);
 
+    /* Too close to y2038 old systems may not work. */
+    run_old = tv.tv_sec < 0x7fffff00;
+
     parent_sock = create_udp_socket(&parent_sockaddr);
     child_sock = create_udp_socket(&child_sockaddr);
 
@@ -226,64 +519,15 @@ int main(int argc, char **argv)
     if (pid < 0) {
         fprintf(stderr, "SKIPPED. Failed to fork: %s\n", strerror(errno));
     } else if (pid == 0) {
-        close(child_sock);
-
-        /* Test 1: SO_TIMESTAMP */
-        send_current_time(parent_sock, child_sockaddr);
-
-        if (tv.tv_sec > 0x7fffff00) {
-            /* Too close to y2038 problem, old system may not work. */
-            close(parent_sock);
-            return 0;
-        }
-
-#ifdef SO_TIMESTAMP_OLD
-        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
-            /* Test 2a: SO_TIMESTAMP_OLD */
-            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 1);
-            receive_packet(parent_sock, &get_timeval_from_so_timestamp_old);
-            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 0);
-        }
-#ifdef SO_TIMESTAMP_NEW
-        else {
-            /* Test 2b: SO_TIMESTAMP_NEW */
-            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 1);
-            receive_packet(parent_sock, &get_timeval_from_so_timestamp_new);
-            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 0);
-        }
-#endif /* defined(SO_TIMESTAMP_NEW) */
-#endif /* defined(SO_TIMESTAMP_OLD) */
-
         close(parent_sock);
+        child_steps(child_sock, parent_sockaddr, run_old);
+        close(child_sock);
     } else {
         int child_status;
-        close(parent_sock);
-
-        /* Test 1: SO_TIMESTAMP */
-        set_socket_option(child_sock, SO_TIMESTAMP, 1);
-        receive_packet(child_sock, &get_timeval_from_so_timestamp);
-        set_socket_option(child_sock, SO_TIMESTAMP, 0);
-
-        if (tv.tv_sec > 0x7fffff00) {
-            /* Too close to y2038 problem, old system may not work. */
-            close(child_sock);
-            return 0;
-        }
-
-#ifdef SO_TIMESTAMP_OLD
-        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
-            /* Test 2a: SO_TIMESTAMP_OLD */
-            send_current_time(child_sock, parent_sockaddr);
-        }
-#ifdef SO_TIMESTAMP_NEW
-        else {
-            /* Test 2b: SO_TIMESTAMP_NEW */
-            send_current_time(child_sock, parent_sockaddr);
-        }
-#endif /* defined(SO_TIMESTAMP_NEW) */
-#endif /* defined(SO_TIMESTAMP_OLD) */
 
         close(child_sock);
+        parent_steps(parent_sock, child_sockaddr, run_old);
+        close(parent_sock);
 
         if (waitpid(pid, &child_status, 0) < 0) {
             int err = errno;
-- 
2.29.2.684.gfbc64c5ab5-goog


