Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85056CA2EA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglSM-0006vb-5b; Mon, 27 Mar 2023 07:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglSJ-0006ub-2c; Mon, 27 Mar 2023 07:56:07 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1pglSE-0001hy-KW; Mon, 27 Mar 2023 07:56:04 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 558DA32007E8;
 Mon, 27 Mar 2023 07:55:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Mar 2023 07:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679918158; x=
 1680004558; bh=G3VEwzrPpgQY1Y6MYXIsAiRyuQmLO4WhRk5XPnxIRc4=; b=D
 9iJlV3DnuoZQcj1QrPAIlQZJDx/C7x1fo9lKb1HFBIM3P047hAG5dHr/5t3UDV8Z
 /c59BA6O9VQ+rWo0XuCmTND6Wa6IoBslbH6tVgcF/lmq3Ber2EAkdgAZBnLaMijX
 HgTgJdkVEPO414Yb/5ksoXWH/P6VlrukKnMeXIzCR+Uq5beDsqY9OpxyV2InwKtd
 A0icdn7cl/LqJlgA25JlSbiPPUaPYIj0xNNZYF/MCzATT4LIUoQWPyH+AlMtymcq
 x+chDJuqeya7jiktLAhVKx3VthEW9nEnqt2V/gTJJfhLyBn/G2QSriI/wFDW5drj
 AihUwvGigTHHOWNZ+epog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679918158; x=
 1680004558; bh=G3VEwzrPpgQY1Y6MYXIsAiRyuQmLO4WhRk5XPnxIRc4=; b=J
 s+2+BGd8Yg4Tgw+TV5VaJDUjvzI9pbAClZKXewUj0QXwofUckys56xTlaUpd7biQ
 amW1S7ETLhCVv5zHpcPMpMPAnPCtji/o8VMkxficILyDJTLa8Ec1jkh6LVvwvNuo
 s/zIIxPXZdF+AkteLhVHZyVl34Mt0SYuvsZW6WeJzoku7ZBEvjAXrUs99lCOESCx
 YfzkOYFh0frzxeXlwE5FnDTSbkrmBk28oS5L89clnTSrs4oxIioOYG1U7Ybrc8u/
 XdgU7Pod49kqiPcADr98SmMh3dmjs4EaHFwauwnXGU/m2hyBFY4XvBvQT3y2Gl6R
 QpoctWK9LSmrKvUR7QHyg==
X-ME-Sender: <xms:ToQhZKS6se2Zb_knLJLePxdGYEp4BbKxumIKRKNYp5RKNygliKNE-w>
 <xme:ToQhZPzrgXFR5HqwYavHTOeTTy0OioOmiOFkd2XqG7RSPiWpZSSdmWOrqLctITuGq
 NqRvWWyAQpKuoZ7gw>
X-ME-Received: <xmr:ToQhZH06BhqQyRXhiTpFvmDlZUir1X9Z5ljqUxen44sMppphj959zpsTbGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeefveekleefgfejteeuheejvddttd
 euvdduhfelveduleeugefgfeehveefudfgueenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ToQhZGChUkOsn8kBlQG8LSZCL8128aiQpNGNcdEXeDuX3z33u2884A>
 <xmx:ToQhZDi67ifozpV2IKPBdYNnwrtcbT0VLB8JqgvXxNfscg0y49Xpgg>
 <xmx:ToQhZCo2ejhANf1glLFBqTpm8URV5mBkHj2utc37pHcSXrkTWK0Qfg>
 <xmx:ToQhZLZ4GA6NiKIVvFaOS3Kt23xZ9p2-JGo_Il8oRXBheTF4faJH_Q>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 07:55:57 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH 2/2] linux-user: elfload: Specify -R is an option for
 qemu-user binaries
Date: Mon, 27 Mar 2023 22:25:24 +1030
Message-Id: <20230327115524.1981482-3-andrew@aj.id.au>
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

Given several different concepts are suggested for investigation, let's
not confuse e.g. ulimit's -R with what was actually intended.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 601b156b476b..694794f97202 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2772,7 +2772,8 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, mmap_min_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "using qemu-user's -R option)",
+                     reserved_va, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
 
-- 
2.39.2


