Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249933E5F6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:21:57 +0100 (CET)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMKsl-0006g6-Qi
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lMKqm-0005uu-Cy
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:19:52 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lMKqk-0005UG-Oq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:19:52 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B027DFA7;
 Tue, 16 Mar 2021 21:19:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 16 Mar 2021 21:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=49tXHCSg1y2E9z41iCbz08EjLB
 KFbM6SYF3OQt/Z0Bw=; b=ioIRDsjIm7r+Q2bBok1rNuZflUTDSZaTP+JjUGuF3Y
 Mroy/Bpy66UxP2YCOzT1NU4ADJbBrJLCUVIocb7pIcujwxVft4TVngJeQjnLHDXS
 MI9RkWHFvxh3i94UD/M1TKFWMzMIaYgEFER2Z79oK/ptd++eJpUNCodC7ARDN4gy
 JDTStAXWorjGP+cSJ5t2nlwvld+wNE3FSdjf8ThEa8tSoKvHmXPcPNzKtNngTEN0
 ujvWIT5t+FHONC4Ck+SKhjxWVP/teoACEFio2HAeCHNU30biI03X9xwD9RMABrzw
 DCfbXGpRDRhTXNnrcs2We4rqeqtXj56eNKSwnG0KOodw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=49tXHCSg1y2E9z41i
 Cbz08EjLBKFbM6SYF3OQt/Z0Bw=; b=Ia7qNSCW6YNfO571AyF52VKSOnBrGhwZs
 VexGQ4o+V/E2ZF6RLOiFjySy+EylEcPXOyu9aKna61Tbf2NrVAovp2Bj919GGXkg
 uXR0EVQ3r4gnDwrIW0eQn2ClEbJ0GN2Iss+eUmOM56SMShieHuxOqtOa0ld8RVFl
 kSC5CB/r0sbIyWj0rBsoUShF4AmGDohT4QkV/xnrZJCXQgWwUD3pqQyzgHIX6HIz
 YA652QuWyjzz3IpIK2z1iULItTLZnS/x72AlEjb/wxSpLfFrPxOi4ybW0ekm3hY2
 JOQtJnh+FbtM6j5E30X235ZPc4Ga64Vn8oPxjSSmZGei/poUvAhXA==
X-ME-Sender: <xms:M1lRYFdDxtOJDrpGq2GS_GXZeZXfOs82_5w9Mpqi64z-PFgEIkstqg>
 <xme:M1lRYDPyFBpfPlA6-30sW1OHn5NcFlk2BqTEQMd07ZHaRIC3TNdiEeobrIUZSRYTQ
 IKE3MqIoqp4lKjFNY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeffedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhephfejtdektdeuhedtieefteekveffteejteefgeekveegffetvddugfel
 iefhtddunecukfhppedukedtrdduiedurdduvdefrddutdelnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:M1lRYOhJ6WRuL89pQSgv65QLTd1c6xhJW7bddiDFY3mnuSYgvd3-lw>
 <xmx:M1lRYO9TfiZMNKcqVX7NlzVl4ZMKpIMJTwXTsgxR2VFFH0VvqvHIPw>
 <xmx:M1lRYBs7ysFJEMuVPGHoVV3PBqco8NXBSJFOpsKrdBJZ9iPLBABEew>
 <xmx:NFlRYCVOTBo-Bv8TZzVv4NMkVlwbgNDE-SMRtJZDdBGwjlMz6FnlEA>
Received: from archlinux.U-LINK.com (unknown [180.161.123.109])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64D70108005F;
 Tue, 16 Mar 2021 21:19:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] linux-user: add missing MULTICAST_IF get/setsockopt option
Date: Wed, 17 Mar 2021 09:19:36 +0800
Message-Id: <20210317011936.9707-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yunqiang Su <syq@debian.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

{IP,IPV6}_MULTICAST_IF was not supported.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Yunqiang Su <syq@debian.org>
---
v3: Add missing reported-by.
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
2.30.2


