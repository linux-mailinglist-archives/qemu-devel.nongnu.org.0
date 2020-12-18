Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272E2DE9D2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:36:27 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLYA-0001hZ-J4
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xwPdXwMKCkg2m6qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--scw.bounces.google.com>)
 id 1kqLUN-0006mS-QX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:31 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xwPdXwMKCkg2m6qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--scw.bounces.google.com>)
 id 1kqLUJ-0007vR-8L
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:31 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id c9so4485802ybs.8
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=olShlt4DrOPr8PLRzTjh9UgQNZd0VxxTaitEcdUgak8=;
 b=dSlz5v+slEffEBM5NG7HxrfU+oBb97cGiY0Sn2p7HBwf1Us0gC31xw2ENlrKeIWZfq
 lO0ADPNpL1GKJLDHrcz1WWmaA3yuwGGArOx6iTgbs6LzYNlNkOUkZDdjE9LItyAs45pD
 AVPi7CCwBK+/+kUvI+ZWJLQvTHffM6WqAGq/Om39hZask2uVXIUvdQFLKhSJYEkHSdZJ
 rTPYDGvicmsJSvitAT1n1WGLmBE3q6yjSucLi6EsjWWXttL7mK9Za7gdaWF3BVUDLvlI
 o9en4YY0cRemTEk1bspK8kIN0kCydGU8lF5NR5mCkDXRnmx9CpQwBqebgVMjx8P6SovD
 68pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=olShlt4DrOPr8PLRzTjh9UgQNZd0VxxTaitEcdUgak8=;
 b=oK3PxcoSxsl5bRr4TSAGwcyGpUsLVmVNP7yBHRSDQe+4okEZ9baG/p6vWoQ1snYAyL
 5Kh+Z97DINVNwh8ANdcwM4Hg09W/yvKYF1Krvb0RpgyUCrSPaTzJoujHNMfKehY+Aihs
 BsnAWKyUM3lve6H5BsWPcgC/GLKweNSOQhspUAb42X/gaA9mibjuNunFqek7f8BTIVlA
 umKw77Y2ehYE0svHXWYlrK9w8TCpcjotIgpjzxSu4ie26Tb0IF4MA/fx/QFOtQMpIP+l
 SJ8DwjRn3nu/EG3eS5BoO9NWdSicL8zKD3/R2Q14Lg4ncvnVMPzXVypfqT77sZ2ACq+y
 IoCQ==
X-Gm-Message-State: AOAM531MDdcwc7huVW5eIXXQwrpMVk0RwdiBqfJFQOkUGZIHT0dapjAv
 Fowc50pS8x/6YiBkCqn1wVkdaUEXe7T9aIUtkHgIDjpiE6W75R5gzrU9KowexQXxHv8zMaD/QFB
 avtLl30TNcmMXzk5ZK3XSc+3zByxL5YFY5TMnATB48QMefSTMdgIj
X-Google-Smtp-Source: ABdhPJz+9TDRd9sDJh4/1P+e+X10+xyGsEGGlEx1r3VTEWHIDx56keWNIfJl8PRk9vtYAOcyMNi/nzA=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a25:3587:: with SMTP id
 c129mr8096391yba.223.1608319943651; 
 Fri, 18 Dec 2020 11:32:23 -0800 (PST)
Date: Fri, 18 Dec 2020 11:32:12 -0800
In-Reply-To: <20201218193213.3566856-1-scw@google.com>
Message-Id: <20201218193213.3566856-4-scw@google.com>
Mime-Version: 1.0
References: <20201218193213.3566856-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 3/4] linux-user: add missing IPv6 get/setsockopt option
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3xwPdXwMKCkg2m6qyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--scw.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
v1 -> v2:
  Split out IPV6 options into own patch.
  do_print_sockopt() changes added in a separate patch since a large number of
  unrelated changes are involved.

v2 -> v3:
  Rebase to master on Dec 18, 2020

 linux-user/syscall.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8576ad24b7..cac4ec3b5a 100644
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
@@ -2265,6 +2266,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
@@ -2919,6 +2921,7 @@ get_timeout:
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
-- 
2.29.2.684.gfbc64c5ab5-goog


