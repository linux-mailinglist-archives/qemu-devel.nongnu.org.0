Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72292DE9D4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:37:01 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLYh-0001pG-LT
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yQPdXwMKCko4o8s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--scw.bounces.google.com>)
 id 1kqLUP-0006nM-QP
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:35 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:33004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yQPdXwMKCko4o8s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--scw.bounces.google.com>)
 id 1kqLUJ-0007vV-Tv
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:33 -0500
Received: by mail-qt1-x84a.google.com with SMTP id z43so2431689qtb.0
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=mKDbibzb1OLx7+Yl1f4JMYfTN3DFSQs0DzMsIWEDo4I=;
 b=jAN78CwqHElbIcN+6/eS+DmwU6Owzp0GgLca9enIoCIlXzkqbdlWZ2TbLxw7aZlEDS
 epcp01DsWSdCz4lQ0T3ZHCBAJwy0ghBuSMyRacTtpCM/T8QwCx2Hee3E/a0BnW8sI21u
 6ssKmhTRVaGED7D4ceoWCmi5lR+gMt6/LNxJRYzYTQ7DZiaPiuM42qeUbxjQ/s9vLw0s
 uflcJWzgoQvuZds17Ir8/K94EndPAnNBVVccKmTo4ODnQhshJ3YvW9JrWcAIx8ifiSs5
 A3r6WA0z80lHBmw3t30q/wGnlGz1mlwoqQ0Fv3iChqHkh+avnOccOY1nztqnIInlTTgx
 0MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mKDbibzb1OLx7+Yl1f4JMYfTN3DFSQs0DzMsIWEDo4I=;
 b=iX2HaUv9D0O+Y7VrjStXvJDJUop+tSRYzjPM2jbYgnoLmmkv7qDNz6J0njEZDzY4dr
 MP+6Rz+xhhJ1lRBGZfGi2isdDnLpTVx508GpVtmgdcUkByGEqETVOy93W/BhzWLeHRwO
 knkoHHkOMd2Py1Nh5xjN/HUeJ5CIlEaUc/F7bEJJ6SAZK0PCsz4IMkfKI4pRWx1fO4tg
 DQx0rvGq3dtpRQKLBHvmoRpgY38F4OVg8QJEYX9RtsUGe0LV5jNShaaC+1tOPcBROjS2
 onhy3iozVYgWkny6GHZQuJgjHVbOr4XFm4dIaNef7xr4LrUce/y586ftFqqMiRr07eDz
 28pw==
X-Gm-Message-State: AOAM533DsvcBthDByvq759+Y2eXWBfucZAeyyk6NbcaiNtQ+5YLycJ8/
 50kzINXMHqCOW9RDYzWcO5D2bomUEIWe//tGiTXzdNPFtJgf18cyw5qt+b1YRFcQ+Bflh9SOxEr
 Gb68TYIqpxnzQLraveXHxxns8YM7ZxVXERaKlqDfCLFyX62ZbpGD3
X-Google-Smtp-Source: ABdhPJwjtZJyj7rLDa33/+mMn48CJnZ0qFlMXah/LMGr4YmtPXYSQa1SvYrWN/kqFvbLrwUa7Uly/B0=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:b4a8:: with SMTP id
 c40mr6093384qve.60.1608319945567; 
 Fri, 18 Dec 2020 11:32:25 -0800 (PST)
Date: Fri, 18 Dec 2020 11:32:13 -0800
In-Reply-To: <20201218193213.3566856-1-scw@google.com>
Message-Id: <20201218193213.3566856-5-scw@google.com>
Mime-Version: 1.0
References: <20201218193213.3566856-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 4/4] linux-user: Add IPv6 options to do_print_sockopt()
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3yQPdXwMKCko4o8s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--scw.bounces.google.com;
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

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
v1 -> v2:
  New: Add all IPV6 options to do_print_sockopt(), including the newly supported
  IPV6_ADDR_PREFERENCES.

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/strace.c | 108 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 64172de99d..bc3bb6b2f9 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -6,6 +6,7 @@
 #include <sys/select.h>
 #include <sys/mount.h>
 #include <arpa/inet.h>
+#include <netinet/in.h>
 #include <netinet/tcp.h>
 #include <netinet/udp.h>
 #include <linux/if_packet.h>
@@ -2761,6 +2762,113 @@ print_optint:
             break;
         }
         break;
+    case SOL_IPV6:
+        qemu_log("SOL_IPV6,");
+        switch (optname) {
+        case IPV6_MTU_DISCOVER:
+            qemu_log("IPV6_MTU_DISCOVER,");
+            goto print_optint;
+        case IPV6_MTU:
+            qemu_log("IPV6_MTU,");
+            goto print_optint;
+        case IPV6_V6ONLY:
+            qemu_log("IPV6_V6ONLY,");
+            goto print_optint;
+        case IPV6_RECVPKTINFO:
+            qemu_log("IPV6_RECVPKTINFO,");
+            goto print_optint;
+        case IPV6_UNICAST_HOPS:
+            qemu_log("IPV6_UNICAST_HOPS,");
+            goto print_optint;
+        case IPV6_MULTICAST_HOPS:
+            qemu_log("IPV6_MULTICAST_HOPS,");
+            goto print_optint;
+        case IPV6_MULTICAST_LOOP:
+            qemu_log("IPV6_MULTICAST_LOOP,");
+            goto print_optint;
+        case IPV6_RECVERR:
+            qemu_log("IPV6_RECVERR,");
+            goto print_optint;
+        case IPV6_RECVHOPLIMIT:
+            qemu_log("IPV6_RECVHOPLIMIT,");
+            goto print_optint;
+        case IPV6_2292HOPLIMIT:
+            qemu_log("IPV6_2292HOPLIMIT,");
+            goto print_optint;
+        case IPV6_CHECKSUM:
+            qemu_log("IPV6_CHECKSUM,");
+            goto print_optint;
+        case IPV6_ADDRFORM:
+            qemu_log("IPV6_ADDRFORM,");
+            goto print_optint;
+        case IPV6_2292PKTINFO:
+            qemu_log("IPV6_2292PKTINFO,");
+            goto print_optint;
+        case IPV6_RECVTCLASS:
+            qemu_log("IPV6_RECVTCLASS,");
+            goto print_optint;
+        case IPV6_RECVRTHDR:
+            qemu_log("IPV6_RECVRTHDR,");
+            goto print_optint;
+        case IPV6_2292RTHDR:
+            qemu_log("IPV6_2292RTHDR,");
+            goto print_optint;
+        case IPV6_RECVHOPOPTS:
+            qemu_log("IPV6_RECVHOPOPTS,");
+            goto print_optint;
+        case IPV6_2292HOPOPTS:
+            qemu_log("IPV6_2292HOPOPTS,");
+            goto print_optint;
+        case IPV6_RECVDSTOPTS:
+            qemu_log("IPV6_RECVDSTOPTS,");
+            goto print_optint;
+        case IPV6_2292DSTOPTS:
+            qemu_log("IPV6_2292DSTOPTS,");
+            goto print_optint;
+        case IPV6_TCLASS:
+            qemu_log("IPV6_TCLASS,");
+            goto print_optint;
+        case IPV6_ADDR_PREFERENCES:
+            qemu_log("IPV6_ADDR_PREFERENCES,");
+            goto print_optint;
+#ifdef IPV6_RECVPATHMTU
+        case IPV6_RECVPATHMTU:
+            qemu_log("IPV6_RECVPATHMTU,");
+            goto print_optint;
+#endif
+#ifdef IPV6_TRANSPARENT
+        case IPV6_TRANSPARENT:
+            qemu_log("IPV6_TRANSPARENT,");
+            goto print_optint;
+#endif
+#ifdef IPV6_FREEBIND
+        case IPV6_FREEBIND:
+            qemu_log("IPV6_FREEBIND,");
+            goto print_optint;
+#endif
+#ifdef IPV6_RECVORIGDSTADDR
+        case IPV6_RECVORIGDSTADDR:
+            qemu_log("IPV6_RECVORIGDSTADDR,");
+            goto print_optint;
+#endif
+        case IPV6_PKTINFO:
+            qemu_log("IPV6_PKTINFO,");
+            print_pointer(optval, 0);
+            break;
+        case IPV6_ADD_MEMBERSHIP:
+            qemu_log("IPV6_ADD_MEMBERSHIP,");
+            print_pointer(optval, 0);
+            break;
+        case IPV6_DROP_MEMBERSHIP:
+            qemu_log("IPV6_DROP_MEMBERSHIP,");
+            print_pointer(optval, 0);
+            break;
+        default:
+            print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
+            print_pointer(optval, 0);
+            break;
+        }
+        break;
     default:
         print_raw_param(TARGET_ABI_FMT_ld, level, 0);
         print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
-- 
2.29.2.684.gfbc64c5ab5-goog


