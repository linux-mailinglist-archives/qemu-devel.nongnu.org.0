Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE5628E92
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijp-0004N9-Qa; Mon, 14 Nov 2022 18:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ouieS-00039s-OP; Mon, 14 Nov 2022 18:14:05 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oueop-0006QX-Ra; Mon, 14 Nov 2022 14:08:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EA585C01AD;
 Mon, 14 Nov 2022 14:08:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 14:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1668452906; x=1668539306; bh=+EkW7niIO2ESJMZsyiMB8bPKJ
 w80De6Ug4FFIbb56Cc=; b=NdSsaCykkPMJshpRdbZvg4ZDxD73xqeQWmueu9Kwt
 GGUi+Gj24ncwh6yT2tO/rccVuWzNoPxZ/o9gnNsoPEBizh2HJBYDg5JyrlVPrd9O
 Iy7TdMNWBMoBW4dieH8I4JD/X2lwJCtUihS2+3rYgRfI6DPJaErtZAYDWAGq1SRu
 N+8Bmw+Jx8bGfB8U29r89rHGv/1KLBsSAVBjT0GTwmW3ePZp/CmZ/KyA4YJe0c3G
 XGqjh0rP6JdCG6T9qbyR+b9bzn3FKLXOZrPx+/WpHJ/g55fR3BUPky5iVz3dIPZw
 0Ah9Du51XWI/Vvx/hiONghI5Mrf1JIdGStBAej2YC7dcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1668452906; x=1668539306; bh=+EkW7niIO2ESJMZsyiMB8bPKJw80De6Ug4F
 FIbb56Cc=; b=nNqpAgu0gevnLtD1Hw1kyUg5lm23zX6/03tRB7Lvaz6BeY/2VcN
 2hpVf1FiHXT5BLLKSQG6uMB8cfXnnUW5nN4iD8L48CZN6c3yV510ByJq0S0ZGtnn
 UyKdHZznupsTdzQYVxSqaYckz6PYECzIOjCcvGPg+uRDmjKg66Vy0QKA20foZYjK
 j/q0RpDTqo8iBIttZfhfUut8Ak83y0Ixsj+WTntmbDdK/z6ToDHVj/e0vFyfR23/
 ClQwmuqgFYw/xqf9pxInwJbNgxspQCRQIKeajvJ9fqNul+XpvL0wbuGy/vlN47PF
 hDvGIzKC4nNQZNBmQPQ1zgFJX+v1kUIQaQw==
X-ME-Sender: <xms:KpJyY7VryfWq882jD3ZQ7N4ztST38vDc1CMiAUUzIWCXiu7Ak9TqKg>
 <xme:KpJyYzmWWSYNXR3qkZwgAH3Aq2iD2RlS1hysqfedbxXnPvc0d_JyH6QCmzo0KCBcZ
 96XwAy0YQcYWCEI0Eg>
X-ME-Received: <xmr:KpJyY3aECLOWg8kSaNNlA5EXxN7OV3_sp-mH_w5RT6m0mwnaVZJqqpyyqdeBOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghr
 ucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpedvjeeghfekjeejiedtuddtvdeugeehheefleetffeugeejuddttefgvdegveei
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:KpJyY2XWTZdF2z8O0K-LopwYgykXv0qBjI_Gi_FUGDpZVCijGzfYHQ>
 <xmx:KpJyY1nLItJCGif6Tuw4PeyGPn1Wgi_xrg3jyO8L1QGEgzMqGgRllw>
 <xmx:KpJyYzcndeDsa-eGujdrwo9XSMI_g8Y2t4xVxLhIhc3-EDC1qu3jsg>
 <xmx:KpJyYzYobVSssZ3lVNJmKmG_2fWia6NQDUnR4s6UJ0GzN4LRfG9ErA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:08:25 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter@pjd.dev,
 patrick@stwcx.xyz
Subject: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
Date: Mon, 14 Nov 2022 11:08:22 -0800
Message-Id: <20221114190823.1888691-1-peter@pjd.dev>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I've been using this patch for a long time so that I don't have to use
dd to zero-extend stuff all the time. It's just doing what people are
doing already, right? I hope it's not controversial.

One note: I couldn't figure out how to make it work without changing the
permissions on the block device to allow truncation. If somebody knows
how to avoid the `blk_get_perm`, `blk_set_perm` calls here, let me know!

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Automatically zero-extend flash images

 hw/arm/aspeed.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

-- 
2.38.1


