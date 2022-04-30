Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D050515E33
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:31:26 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nko85-0006op-08
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>)
 id 1nkiQg-0003D5-My; Sat, 30 Apr 2022 04:26:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>)
 id 1nkiQe-0003u2-OW; Sat, 30 Apr 2022 04:26:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BEE635C010A;
 Sat, 30 Apr 2022 04:26:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 30 Apr 2022 04:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bzzt.net; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1651307169; x=1651393569; bh=zDht1KUoBQsbXmkhCkY2Mzl8H
 p9Hocud9nuQ12H9mSI=; b=Br0lqAxvJxqpeYZ/fMHqVmJpIls0GY2/WrptHvV6G
 tDXXBIQR4g11X52raDutMwDpE3z80/mRPd/4BjP3aoZyNYoaJY7NSssLA9vyIMUm
 niuGKVbn/Wjys85/ctSHJnWjf+Z14+wVxSeH4GVqN16XId3msHzBZMyfKKE8bueW
 BtFFCslmPRLzfYzCFHuSc3Zm0GoP5ojhRp48uxra8VBoCDZOmIxA3Nxz3YQSz8xP
 hVLkZkODWqo4M4V4GoOKvey4CqXyMLrgf0FPwUoRlhjsXljslT794SvM/hOVxplt
 PXtyWRuECxLEqlNyx6p0ZEfsN1Wb2Xo2WMRmAgJiMkDsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1651307169; x=1651393569; bh=z
 Dht1KUoBQsbXmkhCkY2Mzl8Hp9Hocud9nuQ12H9mSI=; b=GsOZwQbLWY2DbYfvB
 sSjIjLtM+f+j00OIEAlEHDggl1peq/xY+Zoc+MYvXg7AtAer/lFPRb3FHU/jv8lz
 uh6F5CRaHwDapgTVPTCoLKqDVHudpZz+HWz7i5Rr7d5szPjHLMof/Gg463bS8IPp
 sRiw3lxg4Xjuhe1KrCqkexhufow45glqM10GaZu9gJc0ADgzxWpmWzd8YytCkd7M
 FIApGxDm6BkBMfIih7Ze04A6O/wbcRGx20Y0qS9xFpsJkMoPo98QhbOira6JljBb
 QZHy7ic0VkqgYQKnnZV0xkwlYHk+ZRdn5RvSI6XFFFh6CqO+tUVl7Sb1NmR9tN/4
 Jurpg==
X-ME-Sender: <xms:ofJsYnicBD8p87kQLMAigdyUu1afDq1mOA8kgYrRlsHnLSW2rK_PpQ>
 <xme:ofJsYkCLIJA1EbXzEfFPIGpmarBXBkyFyTpg8FlbqMQCgkTBD91u3qRpJfp7EaRgu
 FOPzk4lIOv5iuce5x0>
X-ME-Received: <xmr:ofJsYnEiV3GMo1b7iao1dnElVxd3m3FTclaQmFf3EcqqWJ0fniSMGx_NNY3vbX3NiAfN3v4Atp0XamhEulF6SbpuT4d2FWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddugddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheptehrnhhouhhtucfgnhhgvghlvghnuceorghrnhhouhhtsegsiiii
 thdrnhgvtheqnecuggftrfgrthhtvghrnhepkefgieehjeelheektedugeduueevjeevue
 dugeevleekjeefveeikefggeduveffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghrnhhouhhtsegsiiiithdrnhgvth
X-ME-Proxy: <xmx:ofJsYkScGo4AXFiAdJ9fZZJ1T9vyWcnMBhT_QFxGLK8_Tj9H_f1dLA>
 <xmx:ofJsYkxlrazUMHOSItR50EcbTPc2p4VwiEC0QQkaQUWyhj7fw8aTpw>
 <xmx:ofJsYq4FzRmSUVCkaOnGHte6A8MkbUyjaZaEyYTlORVGE9XnVnbvAg>
 <xmx:ofJsYv9PC4kXLsKUORcezYeLGKxll9PPzh_KE00wq60WdOUHBwvnkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Apr 2022 04:26:08 -0400 (EDT)
From: Arnout Engelen <arnout@bzzt.net>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH] hw/usb/hcd-ehci.c: print diagnostics when cpage out of range
Date: Sat, 30 Apr 2022 10:25:56 +0200
Message-Id: <20220430082556.271627-1-arnout@bzzt.net>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=arnout@bzzt.net;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 30 Apr 2022 10:29:03 -0400
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
Cc: Arnout Engelen <arnout@bzzt.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Making it easier to diagnose what is going on when it happens

Signed-off-by: Arnout Engelen <arnout@bzzt.net>
---
 hw/usb/hcd-ehci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 33a8a377bd..8e2f6578c2 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1195,6 +1195,11 @@ static int ehci_init_transfer(EHCIPacket *p)
     while (bytes > 0) {
         if (cpage > 4) {
             fprintf(stderr, "cpage out of range (%u)\n", cpage);
+            bytes  = get_field(p->qtd.token, QTD_TOKEN_TBYTES);
+            offset = p->qtd.bufptr[0] & ~QTD_BUFPTR_MASK;
+            cpage  = get_field(p->qtd.token, QTD_TOKEN_CPAGE);
+            fprintf(stderr, "reading %u bytes from offset %u at page %u\n",
+                    bytes, offset, cpage);
             qemu_sglist_destroy(&p->sgl);
             return -1;
         }
-- 
2.35.3


