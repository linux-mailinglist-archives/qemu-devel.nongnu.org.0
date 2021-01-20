Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B892FDA3B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:58:05 +0100 (CET)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2JcC-0006wo-Ot
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXw-000231-7B
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:41 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXr-00032U-GN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:40 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLhsE-1lJyx20j2G-00HhKf; Wed, 20 Jan 2021 20:53:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
Date: Wed, 20 Jan 2021 20:53:15 +0100
Message-Id: <20210120195317.84222-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120195317.84222-1-laurent@vivier.eu>
References: <20210120195317.84222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0Kp7dotUjG9j39lJazbcAYX7CrI/sgFCna4Ku8BS/Hfp09NDD4H
 JiD8WvAU9Kt6tHMMjTEm+kWE/+aIco/Sv2zRVsPoubpwbVoYswgDkpHTWioyAiE3+wGGlw9
 yFpFD54Rqcs8sz6gqX08oBuJIufsZcij5iChjszQ93yWPBjnJRrxTfSg7Qkl4XnF8m0Coso
 uXgKnkN6DJM8ochwojX+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fvaAj96Ssxs=:ddZcLxOHF2t17h1Hidzmlu
 sZVodVjWtwr1pCnpcF1gw7x0v3aOGEpjzdD+kUHIsNmQP9z0qdw8jMMZdGG1UtnqLEEVpa7Yz
 KL0utkhScWDj0GRaiVAM8TqP2mB0q2gWfaD9i/hukvV/sjcFtYGpz4Y7llHTHU5LbHSirvmMT
 i93nuD89go5xBsENf/6pj5jg3vEhwqOAS797Xv/kmIONNxxGuFFJY4tYuw90+aq904a4wTTMn
 0lsRaIALjTjEry4R19TNMKmxiaOJA6fQ8U5xnRf0tGJyNCJYkzNfJJ3M8tm4RwkH0ZFyf0TtW
 tFFt/rX2rNxFKn/ZovvmMtGvrcFRqqlWHG4AMfP/afkqSHb0RsuFAmlGn2Mm3V2/YRk/XMy6v
 aWNnpTy9B1ANd5VReu1Wbvh9i1jlt6vdJN+GW59xLWZD3iRQBn8bVRbOTunWOR1J/dtHBhnZE
 ubZft3/TfQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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


