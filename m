Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1379D4AC445
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:49:33 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6Gh-0006fc-JL
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5ZA-0004On-3V; Mon, 07 Feb 2022 10:04:32 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z7-0004bZ-S2; Mon, 07 Feb 2022 10:04:31 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 539D33202113;
 Mon,  7 Feb 2022 10:04:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Feb 2022 10:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=1qgKl6N4zhoA08lqEXx3+JopS52gVw
 bVnOMx+Ef8nCE=; b=cfNWMuY6bn2cbE5GXg6eXa1VSQOR+ThxsfvZ0cJ1BjU3h5
 UrgduaiM6eJfUZJnOWszsEHklVeyymXHsdTXgXL2YbDFOJASdhxnT+0hxj6slL78
 fuYd0HRZEV6OGnKrJVntwoEC35vqc+CumI27bfq6a1tgnpyP+c/60HR2Z267k9fE
 Pyg3QKROFY0fPugoHD5bq9U7WJHhsox4qMVNgPRvATUrvlvH4SnRDkJWU4Yh/gpt
 TaTE7zH/17Xb9ObMOfroE9N2BXgexh16GqlsoRW1xj27BDzcOi9jAtoSke5hdIiH
 AmxZMvi4KwWSlstFh3tDhsWp3xkRS0lYba2Rc09g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1qgKl6
 N4zhoA08lqEXx3+JopS52gVwbVnOMx+Ef8nCE=; b=aafy2FxSQV8kYNGHr8Mg45
 VddEOuX98QyJscW8U4UKLI6kdm8Mz2T1BKSmUmMJ0umqJhTK8ohqDcNc7/inJe2b
 j3riFjgkN5rF/LjZyykwrkHA2T9DM+EORWpmLDVWeFPNT0EZwu3v3s1T2G8Hyu20
 mx5MQ0aktcbaPn4WJKU1zyi4PEXp7606buTi0dam4QFuh0ul7vIbVBOufqxGeoP/
 CxH2a05UXoM6Gjn/NKEpKZhczHnQX3hpLpx1pKKTjtGqiY0Tu4z+dqKKaob+7xG3
 Q1HZsoRvnk+yjbd4/phGo3/WGtSkuui1VqJ0DUmVEfhtKw+gvQMdoCiGztEJmoyw
 ==
X-ME-Sender: <xms:9zQBYm6mYqvsZgsKrv3E6vyta8dULu4fsZt9ensvBA7E0XZ9Qt7ILQ>
 <xme:9zQBYv7M5bMkzstoa4cS1ZbxNGj5eg9wbBFrgHApS3HnBq1LGhuyB5TBGwEhDksGD
 ZE3mdZmAAT6EqGFkQ>
X-ME-Received: <xmr:9zQBYlfUjER9ToP3gv9TUlS1FqOUHahXJqOm648HdTkXp1z6ANIWRLBDgSN9mBAQGO_e7X-CiwN2bP9eMbuYZTZ6O55s084VmYlvmga74A9fItF73_qtxW3ZqEobGPVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9zQBYjL_0y1KWApWHv5BX1xBLKSfIaaPA0uiMXbaOEacM-0L_bAJzA>
 <xmx:9zQBYqJY5tTqGxPr3eaITxy6Fr5oOyVX0va9yUG-V1fiMxIOgo-H3g>
 <xmx:9zQBYkzl80s14q74bpXW0F8CYP7i2SJfUCpGAeRY8uCgvHm3nPmzBA>
 <xmx:9zQBYvHDhd7ALB-CV9x8SuYJdubB7TKMQYEHsfBUAhFqp0o3HgL3yQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:20 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw: aspeed_gpio: Cleanup stray semicolon after switch
Date: Tue,  8 Feb 2022 01:34:07 +1030
Message-Id: <20220207150409.358888-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure how that got there.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 911d21c8cfbe..c63634d3d3e2 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -571,7 +571,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
-    };
+    }
 }
 
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
-- 
2.32.0


