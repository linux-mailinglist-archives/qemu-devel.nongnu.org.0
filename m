Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B452569B8D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:28:53 +0200 (CEST)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LwS-0002n9-51
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lod-00073C-Nz; Thu, 07 Jul 2022 03:20:59 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lo9-0008BF-Lm; Thu, 07 Jul 2022 03:20:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BCF222B05961;
 Thu,  7 Jul 2022 03:20:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Jul 2022 03:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1657178413; x=1657182013; bh=o/d4I9s4uyJ2wz9XQaSPt7mRN
 CiwaRBPAINIRm7Je6w=; b=eQB9tv42oMpFqX145wpWTT55M0mqSqS0NrFSvP8IY
 opA9A8/43MzOkV068UM+jv0UeLuOmJs4aaRi7cXK3Gh8F6opYtF/un/owAf6e/IE
 5qr+OWf0YV2EvZgC1D2ZcOABD4Ar3jBXeNPRFbXhbqTsHk7fwI4Wg8TmcKlBvCtR
 HHo3rePIN93nso4jI6BT04wWbKgjOR8/q9FdyR7o5eIoSrvqdRbrBcavRxgzvvNZ
 S/XFRD3+b6oB7gNgBY35xWF0tL+4s92NJ5g+m5PfEDEvcyn0Ld5XGj0T8uak4gmF
 +2uwMbcY+djO0wU8ZLB0S5fwP8sSbXMviWVGtrDh4FhDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1657178413; x=1657182013; bh=o/d4I9s4uyJ2wz9XQaSPt7mRNCiwaRBPAIN
 IRm7Je6w=; b=DXrRNg4XttiHZODyKRjLPmY6fTnNPMjF1KyCUtGIwPyBP9cuOuD
 AyJMRhgq0W5mFc8mrtP9VDUGxjr1uqbW9l00k7fRDqP3WT7n+mrPTMRO7q7G2BZI
 8CBYtMxDCSE/ttEpJhj/ASOUEvzLUz74rXFoj7SoA/6olXO9YNyz2twFt5vfYP1K
 0Qh0zlfeBEuzhjkFrS7A0WowkOsGP3Il+yoMmVBOyHbcpRkj6l16104k4fcmA4b6
 0gnSJaQ2A4S58ll3SL0n4idtupY6klTKGdbMbBJILf4iwa9+p9X0ZhLeLyB687x6
 Gvb8O1mFeGEvTJfXgvQb1dXb/OAbHpS2zSA==
X-ME-Sender: <xms:LInGYtqkWzFNZE6lbHlpp4KLbdzWi4CZo6KCjDrdiSf5TWLw14z9XQ>
 <xme:LInGYvooD6ctTWdo022GsAdg3JgJtPQpKMhJv5LzRRx8uUGTqVgs7Hiq1C6NPdbai
 s592gpT2gPoNFTr6aM>
X-ME-Received: <xmr:LInGYqNmHUrGEWNWMA0ElK006dKeA5OanskqmNs3aYg5M7vU197l0ls9ElFQSHqpuNym2N0pqmEfLZBbAZcVVhXqQkGsyVYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeer
 tdertddtnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvjeeghfekjeejiedtuddtvdeugeeh
 heefleetffeugeejuddttefgvdegveeigeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:LYnGYo6R4jWGG4IlpfW8uDze71qnivTuQk9-Bfrpw32l3svjpP6I-A>
 <xmx:LYnGYs5RaQ-M8XXYXqeLRMaXoMYauVyBvjHIx9dwuRF_srVlY5zd-Q>
 <xmx:LYnGYgiFJb7zWqF-W1xfRt20qJOojtv0asyyI6YH9hAc9nxYIq3wow>
 <xmx:LYnGYn2ErwZA1PxvydEx_UYeoY5EgmPq4ALIDjMNgnh0sXJQbWBLyZlPsjQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 03:20:12 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/gpio/aspeed: Don't let guests modify input pins
Date: Thu,  7 Jul 2022 00:20:11 -0700
Message-Id: <20220707072011.34582-1-peter@pjd.dev>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fby35 OpenBMC sysvinit scripts check various GPIO pins at start and
decide where to start IPMB daemons for each slot in the sled (4 slots max).
It only starts an IPMB daemon if the slot GPIO pins indicate that it's
present and powered on.

I've been simulating some input pins by setting their value in the machine
reset function. I think a proper solution would be to add input pins to the
Aspeed GPIO code and create devices that force the pins high or low
appropriately, but for now setting the QOM property seemed fine.

But, I noticed that while the values were set initially, something in the
boot process resets all the values I set to "low". I imagine something in
userspace or the driver is blanket writing zero to the data registers. I
think the Aspeed GPIO controller probably shouldn't be changing the value of
input pins in this case.

To fix this, we could just make sure that aspeed_gpio_update() never sets
the value of an input pin. However, that would also prevent my code in
fby35_reset from initializing the input pins to some special value. So, to
support the QOM property setup use-case, I added a "force" parameter. Kinda
hacky, but it was the simplest thing I could think of.

Thanks,
Peter

Peter Delevoryas (2):
  hw/gpio/aspeed: Don't let guests modify input pins
  aspeed: Add fby35-bmc slot GPIO's

 hw/arm/aspeed.c       | 14 +++++++++++++-
 hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
 2 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.36.1


