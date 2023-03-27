Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF976CA2E8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglSK-0006ud-AV; Mon, 27 Mar 2023 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglSF-0006u7-Ac; Mon, 27 Mar 2023 07:56:04 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglSA-0001gN-39; Mon, 27 Mar 2023 07:56:00 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 503ED320089C;
 Mon, 27 Mar 2023 07:55:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 27 Mar 2023 07:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679918155; x=
 1680004555; bh=ylcd8ApIadkg24cFh65EK3b8KXwNopU172jf4fw5acI=; b=Y
 UlrLQkaa8rqRXNq1cy8Yu6JrZFx5h4bNhSQCK6bRTMvJT4XeWD7DoE452mxyDCg5
 O0DSHiSPRfTzMpiiQcAvs30U6N+kCHUregm33c/jLqwB1A670u47ip0CnIhAT22J
 WXIbcfJ8mJnRkO9BZQbyeX6MF3Qk+a/EGabi8o1G7MIWBTTfSwCqPOth9sHA9LbE
 IpQ9fu5Wyrw03zHeMRn76ToxsWCYGpsRZXX009Yj6R1G2OrJEc/zmGW4FaN4s+tE
 C4aHLPoIdh4ck136VFc1Ly5J+FRp8KuxWQXyWnBaQ232LXmkE/4xo1QSEoID1p0w
 HwOyE1egJlN0GxfF/UozA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679918155; x=
 1680004555; bh=ylcd8ApIadkg24cFh65EK3b8KXwNopU172jf4fw5acI=; b=A
 jGHAP+3mMVzckxc+D97xMKUfEPGPHdBL4NxXs+67Vv2wFBqnbBFGe+WM6hQ5aLAX
 opBrdFg1zeiszr3DeyLDGOSUlxtdg95PcW19EwahvFELM5WVa8OFJWH5ESEODYkA
 E2ip89NWKNMUxbvgfSMioTi1Tn6X/e+WNuMYbO0Re0z4VPFAkF5gZQPwxxhe0IWk
 qUAEUOsMq9fei9Xwb61HUhXxoCDWanWhPlSkRLhnpjJf79xnasO5LgaWmRASUf5x
 CqsevwilWxrhXD/wuwWFtjdWwxaAhnXRVJhh0pKMWCEBXvA2UeaPM7GO2yvgpQZj
 nab90ygMC1fXGKknAsprQ==
X-ME-Sender: <xms:S4QhZKR_s3Og2vTd_WN4jYpLfWTzK4WNGlWNfuobqFQf_x6-38eI-Q>
 <xme:S4QhZPzMQLOeRipEjOfGZ3vKt-Ay__G1qvaUcoV8EWYp0g4kAIhiH4iyl0iRe2-aS
 vRI5YDl0wloX73lUg>
X-ME-Received: <xmr:S4QhZH0HcgKX1ll9m940QFU2Z9J8CPDqFe1mGO551shQqMoLjUzcNWDvyNI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpefhgfelffeujefghefghedugfegfe
 efffdvjeekiedutdekiefgleegkeduleegveenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:S4QhZGDqZg-rg2cxD3pENbYnpVxFR_7xtq-hBcZybBQXs8eIGX4YgQ>
 <xmx:S4QhZDjPJ5I4jZ0YoR9inv-S7AyERBlM3iNXjKvHy_kwSiz1eJTVmQ>
 <xmx:S4QhZConpheZPNVa8C9Rt6_cV4faH71eGgkXITIaIErNGbZTmsbUBQ>
 <xmx:S4QhZLbhDIMe2r6Y_BYKtb1nc3A_bL84dO9Pt2Ph5Z7be3dNyp7gOA>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 07:55:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH 1/2] linux-user: elfload: s/min_mmap_addr/mmap_min_addr/
Date: Mon, 27 Mar 2023 22:25:23 +1030
Message-Id: <20230327115524.1981482-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327115524.1981482-1-andrew@aj.id.au>
References: <20230327115524.1981482-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=andrew@aj.id.au;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As-is the error message can cause some confusion as the mentioned sysctl
attribute name is wrong:

https://www.kernel.org/doc/html/latest/admin-guide/sysctl/vm.html#mmap-min-addr

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1dbc1f0f9baa..601b156b476b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2771,7 +2771,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
-                     "virtual memory ulimit setting, min_mmap_addr or reserve less "
+                     "virtual memory ulimit setting, mmap_min_addr or reserve less "
                      "using -R option)", reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
-- 
2.39.2


