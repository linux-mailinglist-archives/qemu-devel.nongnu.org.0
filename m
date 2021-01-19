Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D92FBF01
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:32:39 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vny-0008QT-Qv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDD-00028N-Ew
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:37675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-00041L-Eu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3bjH-1m0w5s3btL-010Zdp; Tue, 19 Jan 2021 18:54:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] linux-user: add missing IPv6 get/setsockopt option
Date: Tue, 19 Jan 2021 18:54:25 +0100
Message-Id: <20210119175427.2050737-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
References: <20210119175427.2050737-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cE+nRZZ8neKadDPXHjqjUGXRTwcOaCoeTWrq4tXu8Xd4+9bVTfs
 QXE1WdqAE6fW3KZgM0Z8Nazasi9YLjdCkTPw0kjPqKBDNH3C8EVyrK8h7hNFYkbL8uo//yG
 667PF7UROIY8jMtqN2mMbQLbZYVcvl4CgbWwpb4R/dJZ76jD/BM+CTtCaC5wVqVXjOCUGwO
 IFmDoW1f4/FegoP82jVdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhXVF3FY7Bc=:DZqfNNUes80axSBDAWfyZQ
 QhMOjFHqUu6wECGbdZUymsJZohNoZgAB7KQuZgl3T75/7N0Gl4671HUUzWDxfDIsruTjiXves
 6gA4uWI8r2S4TM5hEgYswKhf/UEOccKDSbJ+0HTXxp8sxg6Y9K1dw+4hh70aDWHpcGecU9o23
 7KFXFMWqiumjv/ULW7seHrezaYs+dquxYJzwxL5BxjtfCnAmnr7/WgHAewnKNcWPF4yRIpzJc
 0vOrajpp3yeHI6p8VPjpSf0/Ej3CGxopSdEIcue2hKntN5N/ZM+AH97laWEnxVcretVN3X6PU
 hv/tutgr9RNPs3bRr3FRjLZ9lbOyzYrJdFI48oKJPS4SsusvNk/UOVkB6NKk5EUh6RrEhWWy7
 DzMUL6kvmejZLfDTOa0YNU29oOwVrQ3MjL/t1o5dN+km94WVRF2d7VNT3O8sQZJ8kFKOwKpqR
 ONvS1S1wLg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-4-scw@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 969db2008104..70c61d15ebf8 100644
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
@@ -2272,6 +2273,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
@@ -2926,6 +2928,7 @@ get_timeout:
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
-- 
2.29.2


