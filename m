Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F99646FA0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3FzN-0008Q4-Nk; Thu, 08 Dec 2022 07:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzI-0008Nj-Ko; Thu, 08 Dec 2022 07:26:53 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3FzG-0005BN-8n; Thu, 08 Dec 2022 07:26:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 255EF5C0035;
 Thu,  8 Dec 2022 07:26:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Dec 2022 07:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670502407; x=1670588807; bh=i8
 vfM4/oizfqP85pJtrvbxGw1dK22UDfOV+TImIeF4Y=; b=GRMSKS672AJbkLchbP
 RqTIJeiCt0GJ+g683CAOeWDKhr6UvZ/uL/Wnu7itsoentlVpG2MGTA8t5iAEAuFh
 D+5qgo7zuKtihaSi1RyK+EoLlXIr1DvjQ6SstFiw4cBk/k7ztVgBfV4mieGldmFz
 fXaYLYRioaOeORkD/tkkgDTfKCt2ZJewlN5cne1OBvtbf6v+dXmNQ68gOlen/lFJ
 6+fFBAQrU9MgmqMzoZwuxePUau2NjG23lg1DvC7BoN5ym24tdckJ1DOt0frg5cQ0
 GnzUgr90+7yR2tLdcpEg18V7t3dcPpIHTPJBxiL0IAXJM5lICoVoXZP6p9ZLnnaN
 NcoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670502407; x=1670588807; bh=i8vfM4/oizfqP
 85pJtrvbxGw1dK22UDfOV+TImIeF4Y=; b=TmfyTJyL8jJ5z1vsfw7G92U2KObHI
 dMEsDM9v7iDKjBIIXbP0oEplM/Zi4nJnJC18iCuxFCTkAanx6sVcEIx9KOzi5mWv
 uUEhX6d1kIUvtVpA+SIWrWfXtV7ir8cgj5vMw9eX0tykcMH1rV4TZApUCdH5ctXD
 5jXdiJyiX9pGMXaZg1fZ/plDQd05yb5UpdCrce0KTV2hLPams4ImTzLf9/vFg3bM
 KpzJSlXSLMQIcsI4NHi5apHwwUd57pQ1mS2zr4r3wNGY8i4bNRLpOUxwDsqsENb1
 OajpwZpuXGMpMNKJQQ9PMmJJs57yzJTFzDr5AkGpsx4vRb8WdFC/kv5YA==
X-ME-Sender: <xms:BdiRY2vitoiHAsn2_tKUiqCDHrUzJLqydNYkA13khvAAktjAgivXrw>
 <xme:BdiRY7el5FGEhJ8VSIls0fBc7kEIAZxqbpgD_fTyAfel_CNs5TjpQhaNEfIGHH4Oq
 bXu4vB5yDhIrYiQJEs>
X-ME-Received: <xmr:BdiRYxxRUbnEm44HEmcV9DnH9Qch_Rc-Q0zJwoz8QhPoxxbva7NfwLp6l0O2jK4slSFF1lmESgKRtMseCEj7jRqYFkZReuGQ28AVqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepieffueejgeetudeljedtfeevieeukeelffffledtvddvheevgedutedufedttdev
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BdiRYxMdMkloLepM2_XEZ34LZFuhZtGH6R6AL9Dwn52Rt1UAh0uHXg>
 <xmx:BdiRY283PbRr3MWfB3tB6oMf-deLTKjc1rCXNz6MzsQYgACl2_8Kng>
 <xmx:BdiRY5XwGJtNUyIdSfeld61FCJDbpCMol2T-uzlsmB1arMW1kse_xw>
 <xmx:B9iRY6a1mUCdHr4uCPhIfrC_Pegn2Ui7cjozMcowZtF93PzfeJWCAA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 07:26:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 0/3] hw/nvme: shadow doorbells broken on riscv64
Date: Thu,  8 Dec 2022 13:26:39 +0100
Message-Id: <20221208122642.80574-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; i=k.jensen@samsung.com;
 h=from:subject; bh=oZ6UX4laIkm9ZD4yx7+XLyN6r/SjiX1aOQpAbGCOO7c=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOR2AKOmE6AY/qBXsa1pVBVNyKps0Li0PvgRRF5
 mvS6pEW6Q4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjkdgCAAoJEE3hrzFtTw3p9e
 sH/R8jNK5hRoye4ZyqNDKBVzhOAK40sUza5YR3b3FMej82JzKEo4tFvt5sgV9RRQ+P9xeVeYveNUnP
 1cLHY0i7goykBF6CVb7PL+nmL3VFC11ahcXEFtt59r73yqycs62gklW1d0y03c+1HI+YTzJx3SSt1/
 +y77mtuE/Rd4GeHbLuLR7vB24n06Bozva0GCHQ0LiKjszhP9O6NKEbRFbtQrC8UUvjyg2gOK40XVl1
 8gicW9xcOXvNI/RQmfKgjdhY3krgEGFpWi0NmltsOJ+EMZHYntwRcxuJ+t8zvNFB74xTTSQ0DpSWZA
 N3I0TgrDsBP/J8qxevJdleJCCGvtJ2CbgZWqz9
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
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

From: Klaus Jensen <k.jensen@samsung.com>

Guenter reports[1] that hw/nvme is broken on riscv64.

This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
I'm sure Guenter can carry this patch in his tree, and maybe we can get
this out in a stable release.

I really wonder why this issue only shows up on riscv64. We have not
observed this on other platforms (yet).

  [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-us.net/

v2:
 - use QOM accessor (Philippe)
 - added some cleanup patches in front

Klaus Jensen (3):
  hw/nvme: use QOM accessors
  hw/nvme: rename shadow doorbell related trace events
  hw/nvme: fix missing cq eventidx update

 hw/nvme/ctrl.c       | 109 +++++++++++++++++++++++++------------------
 hw/nvme/trace-events |   8 ++--
 2 files changed, 68 insertions(+), 49 deletions(-)

-- 
2.38.1


