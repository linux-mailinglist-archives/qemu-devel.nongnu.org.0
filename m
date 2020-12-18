Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D402DE9CC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:34:07 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLVu-00080c-W6
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xQPdXwMKCkY0k4owwotm.kwuymu2-lm3mtvwvov2.wzo@flex--scw.bounces.google.com>)
 id 1kqLUL-0006l0-UR
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:30 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:42338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xQPdXwMKCkY0k4owwotm.kwuymu2-lm3mtvwvov2.wzo@flex--scw.bounces.google.com>)
 id 1kqLUG-0007uU-Am
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:29 -0500
Received: by mail-pg1-x549.google.com with SMTP id f3so2285410pgg.9
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=1tMnHV/4/e4q+MAB0WmRon6EU9Fl6zVw62+wbVTIBM4=;
 b=G3q7e82FaBO4ZGk1Rkfvbr4yEbc62tlB5L8iD3j9TcWf2YFFkVnd3m79Gk0p726yY0
 MyMVFB4/fPxAxCDyTEtTNyj7aLI66jc/1e4NQKWXhtQup0uv+T+/Dn+DiJHIwAL/+Z3k
 IBplI4aKVmU9RPuo0rVS+saS9ahgrLIB3zJi/NbT6MuABD9dJ/lZCe94yBcB+SYpkdJG
 aB5h7LLeqT+1VcArqXHaEVsUvjAnbeBO1+Onlup2XL4wcnECN03eUVNgQauSDpmYR0ns
 HfvKJ+l4kSnD9GYeT17l9+yuxxcD2m2+HIkSRdcWU0ld9bGxDfq7Ifp1/Tkd9D8ivy0O
 nmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1tMnHV/4/e4q+MAB0WmRon6EU9Fl6zVw62+wbVTIBM4=;
 b=QU6/IaNJFFMhtoZq6Q4ZrdfSA7xaPTcOrd4uN5RobO6iT7tlTHGCPU3FtqD6V9p0sc
 V/JDzuFMWtqf+PNJ22MbMS6FaCpO7YwiHHUfTAbtMF77yh/506BYXBzIc96eNWtNREBJ
 hKO0SpdKR9eAeWNS+j/whFnvXZymfuSIsYqWgL9EM4fo9eGrGC89IWGS9RWqUMTKr5cD
 +ipmMuC7cXEPom2d7FwFOemVcjngC8WPnWsR5c+iopxxITqqhtInk5MQgyGauSo5sNR5
 SPHmU5cZrWoef27sScHq4J7IybBcSniry26y0wytmQruAu2WIQy0MOuru3EQ5r0sEqvP
 bV6g==
X-Gm-Message-State: AOAM533+vDew2OT9+QN3w5KYhlK7EEuXhoON2Z6AE6TKD8QQvQwIzxO1
 1FiRLoYFyc2N5BmTRpJA+/wCWTGi+0uu/2IBe9WBcUSDb+OdNm0Z6pabq84YGPuuxgC0tL8doUh
 3UtutIB+CxHzLI330NtdAM9dtroW47/Kpu6GVPI/7CR1MJzvC0qPm
X-Google-Smtp-Source: ABdhPJzLytA/q7cfnp5t/ca+J+FB0QHA8JupkrD1tDqDnUokAh3CNiexziwV/hRV4JPeQ6wbvyNFw4c=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a62:1d43:0:b029:1ab:7f7a:4ab8 with SMTP id
 d64-20020a621d430000b02901ab7f7a4ab8mr3721623pfd.43.1608319941690; Fri, 18
 Dec 2020 11:32:21 -0800 (PST)
Date: Fri, 18 Dec 2020 11:32:11 -0800
In-Reply-To: <20201218193213.3566856-1-scw@google.com>
Message-Id: <20201218193213.3566856-3-scw@google.com>
Mime-Version: 1.0
References: <20201218193213.3566856-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 2/4] linux-user: add missing UDP get/setsockopt option
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3xQPdXwMKCkY0k4owwotm.kwuymu2-lm3mtvwvov2.wzo@flex--scw.bounces.google.com;
 helo=mail-pg1-x549.google.com
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

SOL_UDP manipulate options at UDP level. All six options currently defined
in linux source include/uapi/linux/udp.h take integer values.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
v1 -> v2:
  Split out SOL_UDP into own patch.
  Updated do_print_sockopt().

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/strace.c  | 6 ++++++
 linux-user/syscall.c | 7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 227812c07e..64172de99d 100644
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
index be39cf8215..8576ad24b7 100644
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
@@ -2177,7 +2178,8 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
 
     switch(level) {
     case SOL_TCP:
-        /* TCP options all take an 'int' value.  */
+    case SOL_UDP:
+        /* TCP and UDP options all take an 'int' value.  */
         if (optlen < sizeof(uint32_t))
             return -TARGET_EINVAL;
 
@@ -2825,7 +2827,8 @@ get_timeout:
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
2.29.2.684.gfbc64c5ab5-goog


