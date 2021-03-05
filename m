Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3F32E05E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 05:07:01 +0100 (CET)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI1jv-0004SK-H2
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 23:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lI1it-00041d-RU
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 23:05:55 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lI1ir-0001ks-PZ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 23:05:55 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DD105C0117;
 Thu,  4 Mar 2021 23:05:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 04 Mar 2021 23:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=NLhai53zZ5jBSbPSro6ZlU/6vs
 4WAwegzqBDCO83KJc=; b=HXy6pMDxjNs/5i72wvQP0bL/BSRZiKUbfB81KRbiKZ
 C+cuHBVXkbeLXhnPgEZGwbJPHn4TlnwTzr3HCrSYdNllo4Ocmdb+hgwSd8Sj1OAS
 BuUUlkLkL11KLULijreme2YqztgG73OfDONmHsWQJMuQLHCTzE9//vfEm4lq34ZO
 JTL3CKGUz8HYuVrmcHY7vunTNnhH3CtZZr/0F7YsDSGyxv5fxheF/pA7qqHm0L54
 cLHsMplvL3XLhw4/XJN6pAtf+0Je2dVX6HvRTIEx5lfpwbVNod1uokHEkEl9K1/e
 pEgJRUg4hcL7XqEb/oxCQpbfa/oDfNb1kocISsNrknkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NLhai53zZ5jBSbPSr
 o6ZlU/6vs4WAwegzqBDCO83KJc=; b=BS5q+nL22wC3rLZIkFl9aEjKj5PpUJZnq
 ZyYbIXcVk3glkZMElK7kggp6nIDLT4An3CeqLK9W39HPsB/rC72vQE+PkWW+GH19
 Alr9lFYtJGNUeFWwQVvA22UiMXTu/WjzNQ6I+PMhLpIUSp/DuOwDxIYV6SU/jjwk
 QDrdg4IF5+sup/8VBjyo5mrAD0a4nIgaLc+p/KqTt/GqVnZaI7hvwyKibwyyY5x8
 PSfptW4s2RPID/1pQ7P0a3HgySzbYGXVZI+UE4DnwHU6sZggWpLCd7HSvbVIcuvQ
 5/LZRNnImJVJweC5Bpxaq+p/2WKTtVhM7frGd3eiRvoNtx1tcceEg==
X-ME-Sender: <xms:IK5BYNTbqXjmZnZpQpwfpfr66r3bGrYdAKgsEgI-vgWdMvb4YjW_4w>
 <xme:IK5BYEkfY1SE3tiyyOYVp8mcY4i_VwmDZhQ2whNMp4UVIIcCAiqZFbfAkvWuRh2N7
 PxA5knjpgRokuu7f98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhjedtkedtueehtdeifeetke
 evffetjeetfeegkeevgefftedvudfgleeihfdtudenucfkphepudduhedrvddvjedrudei
 hedrudehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:IK5BYNQd3c73OY-jAnMJ__tTL4q42ddrYnGaEX5IUpoPiAUETM9IDA>
 <xmx:IK5BYCN5-GIu7o7pgHDWXS44Lskf2Od5qYMkcr4r8ClPrjI_wdTZDQ>
 <xmx:IK5BYGUZ0O6owA7GTYoiq3QBC0PglQm_RAbxNjJjs4XKuUMgKxdbaQ>
 <xmx:Ia5BYJfzXlq16SL6R9qo-Y2SkDlKjFJ_7AC7aoTlUp17haGWpzfEqw>
Received: from archlinux.202.net.flygoat.com (unknown [115.227.165.152])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40A1724005A;
 Thu,  4 Mar 2021 23:05:50 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Subject: [PATCH v2] linux-user: add missing MULTICAST_IF get/setsockopt option
Date: Fri,  5 Mar 2021 12:05:42 +0800
Message-Id: <20210305040542.9879-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

{IP,IPV6}_MULTICAST_IF was not supported.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09764..77343130b3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2219,6 +2219,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
 #ifdef IP_FREEBIND
         case IP_FREEBIND:
 #endif
+        case IP_MULTICAST_IF:
         case IP_MULTICAST_TTL:
         case IP_MULTICAST_LOOP:
             val = 0;
@@ -2265,6 +2266,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
         case IPV6_V6ONLY:
         case IPV6_RECVPKTINFO:
         case IPV6_UNICAST_HOPS:
+        case IPV6_MULTICAST_IF:
         case IPV6_MULTICAST_HOPS:
         case IPV6_MULTICAST_LOOP:
         case IPV6_RECVERR:
@@ -2891,6 +2893,7 @@ get_timeout:
 #ifdef IP_FREEBIND
         case IP_FREEBIND:
 #endif
+        case IP_MULTICAST_IF:
         case IP_MULTICAST_TTL:
         case IP_MULTICAST_LOOP:
             if (get_user_u32(len, optlen))
@@ -2926,6 +2929,7 @@ get_timeout:
         case IPV6_V6ONLY:
         case IPV6_RECVPKTINFO:
         case IPV6_UNICAST_HOPS:
+        case IPV6_MULTICAST_IF:
         case IPV6_MULTICAST_HOPS:
         case IPV6_MULTICAST_LOOP:
         case IPV6_RECVERR:
-- 
2.30.1


