Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D8436D986
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:26:29 +0200 (CEST)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl93-0007jo-2U
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lbl7L-0007EC-Eb; Wed, 28 Apr 2021 10:24:43 -0400
Received: from wforward1-smtp.messagingengine.com ([64.147.123.30]:57105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lbl7I-0007e6-Jr; Wed, 28 Apr 2021 10:24:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.west.internal (Postfix) with ESMTP id C9809B64;
 Wed, 28 Apr 2021 10:24:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 28 Apr 2021 10:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HQQ7SpOqqpIwy1otx
 y1mWGf90mk55isIJKpzIEWUu1w=; b=O+5/nHzHlRhTl3zn3jPZx5Ni81cln3oao
 vlOjqg6LWgvXJrqOv8obs4fRaPxz2cPnvQXpHhSsJht3lZcjlUf1MSaK0iclkiUF
 PrAhdUPFdQczW7hfLE2ifucktETeVqwE23oVIkfz7W6teKVNkMwWExUxj9oFiizs
 d3+tuqhNAptxyeK+MXLL+5XAJsPSYGcoBYGaK4TmsT1P2Png2jja/qV+W2X3dNdM
 ENpqomCe0HBJrOeyYZ5IwPlTzKlKKFfPCqaU16ZBlu59t1ScQZK0rFUEv/vVrDCx
 lXMhsv6CEQjEk6n2ku+J/28OujVljr2mMVXFEQi3QXe5rtl4Wrv8g==
X-ME-Sender: <xms:InCJYDrxundC7WYciFjOmv2ygrpJ74plT-1tgE3QNiT86yqRcU3wgw>
 <xme:InCJYNrtwORwdx_yk2wjh8CKyGszyCTLjkQ12WUX8kL-biEnYSlvX9qngaQbTxwA2
 yOC0iKheOpqdbgNaME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvvddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfg
 ughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeduhfetvdfhgfeltddtgeelheetveeufeegteevtddu
 iedvgeejhfdukeegteehheenucfkphepkedurddukeejrddviedrvdefkeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgvughm
 ohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:InCJYAN6LwT4F_kI-ZrSJDsYSOal9EHWCwOLABuSbw5efip584eLXA>
 <xmx:InCJYG4Rfck2DvMzNI4VuZbwFJTvMLIMgIkQOv9owGXXOV6tFyRLNw>
 <xmx:InCJYC4EldmNbbTlIWMexAUYRyxGTgAazj-35dUTwHF2DNTm86TwQQ>
 <xmx:I3CJYPz9HB7OH-lak-hCi56L6NnX36Ww0D5UBexpmEW3ItPFvTAyRZq_yO0>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 28 Apr 2021 10:24:33 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id b1bbd0bf;
 Wed, 28 Apr 2021 14:24:31 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel: kvm: clarify that extra exit data is hexadecimal
Date: Wed, 28 Apr 2021 15:24:31 +0100
Message-Id: <20210428142431.266879-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=64.147.123.30;
 envelope-from=david.edmondson@oracle.com;
 helo=wforward1-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dumping the extra exit data provided by KVM, make it clear that
the data is hexadecimal.

At the same time, zero-pad the output.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b6d9f92f15..93d7cbfeaf 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2269,7 +2269,7 @@ static int kvm_handle_internal_error(CPUState *cpu, struct kvm_run *run)
         int i;
 
         for (i = 0; i < run->internal.ndata; ++i) {
-            fprintf(stderr, "extra data[%d]: %"PRIx64"\n",
+            fprintf(stderr, "extra data[%d]: 0x%016"PRIx64"\n",
                     i, (uint64_t)run->internal.data[i]);
         }
     }
-- 
2.30.2


