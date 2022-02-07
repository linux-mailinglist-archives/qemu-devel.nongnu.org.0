Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0034AC411
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:44:51 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6C9-00028O-VN
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:44:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z7-0004Ne-SS; Mon, 07 Feb 2022 10:04:30 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z3-0004b7-Ax; Mon, 07 Feb 2022 10:04:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0014B32020D3;
 Mon,  7 Feb 2022 10:04:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 10:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9gGbEWbk6zYLA+d0=; b=ma7vU
 QQhJYDbacUyx0oa3r5WBU/vsy+MY6dNqfJrZpqulEOh0sObfeW2nGMSuK006xkOJ
 h00tbsypibl0r2MOXHYWClIEt5CGMX7OPo0jn6D5JTrY9Tp/SdBUZFMnedAzx1Au
 S5A32YRJXEG3+kCWrt6V4mPvgyOEJNaknr7FI1lI/fNj2yMvI4eUGwhzX/AXThSk
 To+czRVPvl3GuodSoaHKDm5WnZYZRgdoVGDrgp4Cqt131NVnf0YxoaTqoqheCwC+
 ysvtYdlChO+mILL0gcY1XVhzwQ3wD7Mu9m8cAEUXCupFFUU329n9PAN716oTWI65
 qXNz8Eku0qo15VIWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9g
 GbEWbk6zYLA+d0=; b=WJvCVlpJFIB0jm8jTG3D9bXKBfqLpDcH0hqmO8a/4CpNN
 7yt9U/3x3sZ3Ivq6kTBTI8nknNIRlUq2puGp07MI4Kf3FGinkhHwOEfBcR+0EIT6
 6/PMfGCgxC/SUqGeb8l/I0NjJPEMRgMIjqdiHHFfNQy5cebnKyI7RBLWGG+5E5qU
 Se/I+eDkK3uabALqicCo5Y+da7NfxXRxvezTN8HRVhfoPt4dd411pXl61Ou8zi+h
 //bzLTJy/StiXMNX609VokXGnhR2BJWhpHSRnMUX+E3fdnNWKGkLL5ic1jtfQpTl
 X8d2uoqpbMUQWLj5Bciet2HZaA7A2qO21HO7sxCFw==
X-ME-Sender: <xms:8jQBYs4jj-YDnGqGljZCpyiFcJq_KdcxwutE-qwPPpz8JUyR5L-F7Q>
 <xme:8jQBYt5u-7LVpX_kYJSvKTWZCN1J8nNAuSjGagHNDIlymqWl1WaXnpiO7rSeJ_VcY
 rgPe0sZUo8p3mPQNA>
X-ME-Received: <xmr:8jQBYrcAssp3MM55wkL_BNYJVtT3dUD3UAmuQbV2277T8QnWTfVwNrLkXYbCcgqNXM8zKgaQpo0DBxB1X6RJmh3zx-ae5QANObmdV9pjo1pw8JukE4VoMVCkhfZEXaE_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8jQBYhIkBtr1g3aViXn-TFBYoBfcTm5AjoocNKddRAeGrThPO_b7NQ>
 <xmx:8jQBYgJM4XEnuterSrbQb-ry6E9Hf4KTdVV8GECpklNssd6W8h3Vgw>
 <xmx:8jQBYizF9TVv1V6P_GbUmSkQJhmuT9AAn9i_aetcBD95rwfLEz7jYQ>
 <xmx:8zQBYlFCsXRHPS5JxY-Uw0e3dV_sMzJqTCA_GXC6MDQN-bbnDjV89Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:15 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw: aspeed_gpio: Model new interface for the AST2600
Date: Tue,  8 Feb 2022 01:34:06 +1030
Message-Id: <20220207150409.358888-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
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

Hello,

This series adds support for a new register interface supported by the
Aspeed GPIO controller, present in at least the AST2600.

The new interface is a single register implementing an indirect command
protocol that allows us to manipulate up to (at least) 208 GPIOs. This
makes it possible to write very simple drivers for e.g. u-boot and
jettison the need for the tedious data model required to deal with the
old register layout.

I've lightly tested the device consistency under Linux. The Linux
driver is implemented in terms of the old interface, so data model
consistency can be tested one way by poking the driver using the
libgpiod tools and then the other using devmem to drive the new
interface.

Please review!

Andrew

Andrew Jeffery (3):
  hw: aspeed_gpio: Cleanup stray semicolon after switch
  hw: aspeed_gpio: Split GPIOSet handling from accessors
  hw: aspeed_gpio: Support the AST2600's indexed register interface

 hw/gpio/aspeed_gpio.c         | 305 ++++++++++++++++++++++++++++------
 include/hw/gpio/aspeed_gpio.h |   3 +
 2 files changed, 261 insertions(+), 47 deletions(-)

-- 
2.32.0


