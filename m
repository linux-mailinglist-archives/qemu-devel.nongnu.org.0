Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC62FEAA5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:51:04 +0100 (CET)
Received: from localhost ([::1]:40412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZQV-000515-IR
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEu-0006jW-Cw
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:04 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEs-0007QR-Gn
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:03 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MBDva-1lAmy70WmE-00CmJ0; Thu, 21 Jan 2021 13:38:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
Date: Thu, 21 Jan 2021 13:38:50 +0100
Message-Id: <20210121123852.91187-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121123852.91187-1-laurent@vivier.eu>
References: <20210121123852.91187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UfDgn/V84wVgz/0m9gpHWTHbi5c1g9r/mC8hZ+r6KNr1ysSwBX9
 LAuFD62VoqDCIn79aEeqSwe+tNeHmPsD+TEv44/vzKjZIkWQXv0I8k0P6DamP76WQtdEumV
 xpyLOVHbgTkHf38YXNlx6tx27N/pzn94+mLSSG0CLCOeVdKpDH88eT81HEMIxd0jptss+LI
 VQRXeVeI8ddyDGpQ6tfDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:voalCCUVyM0=:dKJasTO5QxMP+BVZHCqSzJ
 WGY92pCzaycc3PxhIgX3DOu6onfeT5P3tNBuSW67LuCHYEk9tknvlcK4YxJLV3d6OlRrv76Rn
 oaEhpBTjnZkyfGYPqGwBfpHxY4QrEn8Amxz4gV26MKcRR7JQ9z2t0Rym9jTLqdT6FH9SGQsKk
 7si3jEG+CMIN9hWt79cr7Eln6Uu96FExcn4twSsCjZmC/g2zBiq73a2ZOD7tQBdUA7+Vp9A8F
 D4FUY2vMw4L+yN8H1tv4DfUbjRH+d5c083uTS86XCwQXvkZf/nPZ9KS0Oc0foNIsyilZCmriY
 UB4c//zSEwJyBIKUYcyBidHdlXxZ+oYkVz48lwAmgmGjbtdpAW3HBp9xDJ4zZXb4u7WqExrSS
 +6ONhHa8RvRamZxF81cnHzMl1X6CXHhavAGIk4NUJHwwD4/GI6g+5GoCnMkQZBjTwTXEGMyMt
 6COnrajNrQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-4-scw@google.com>
[PMD: Add missing <linux/in6.h> include for IPV6_ADDR_PREFERENCES]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 969db2008104..5d482dcbefd6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -51,6 +51,7 @@
 #include <sys/sysinfo.h>
 #include <sys/signalfd.h>
 //#include <sys/user.h>
+#include <netinet/in.h>
 #include <netinet/ip.h>
 #include <netinet/tcp.h>
 #include <netinet/udp.h>
@@ -58,6 +59,7 @@
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
 #include <linux/if_tun.h>
+#include <linux/in6.h>
 #include <linux/errqueue.h>
 #include <linux/random.h>
 #ifdef CONFIG_TIMERFD
@@ -2272,6 +2274,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
@@ -2926,6 +2929,7 @@ get_timeout:
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
-- 
2.29.2


