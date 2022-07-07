Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC675569BB0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:34:15 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9M1e-0006HN-7n
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lua-00034M-1C; Thu, 07 Jul 2022 03:26:56 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:55657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9LuY-00016Y-DG; Thu, 07 Jul 2022 03:26:55 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id AB7D52B05909;
 Thu,  7 Jul 2022 03:26:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 07 Jul 2022 03:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657178810; x=1657182410; bh=y+l8Jds1V8
 oMmLOSmR0Afdlw7vpYmGRTjDR7AwR9nps=; b=aNkRzVWryLz86ocD2Q0Qz02lKZ
 lrDcA/1vpV2PBSTyJyomRpXKUdBK3BnU2zfKfwfd3O8X+l5AkjrDsIZ0gc+3cgCa
 TZL7NRDOtkYZ+1YpVSKgQGDbHqpNZEq7CbDEd9IIG2TYcKgWEyq8gry8rHfWpoXz
 nGVFufkOG8vz6CL5RQ1vGqQpeMQlBEEB/hI2AK+UsAV29n0v28qJ2SAlCVEW/gJv
 guSCI/5dPK7gl6TpJ8VRn/0nZZu3JI1ZgKP2Zg47+XZDRMkwS0KtWKvjnRLBCl3K
 j7Wn7wHWCZip8Wes0tKvOvptd8C0nGdncfd7Is5yEkAD655T9WZMEYDMc61Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657178810; x=1657182410; bh=y+l8Jds1V8oMmLOSmR0Afdlw7vpY
 mGRTjDR7AwR9nps=; b=wQ4//1ekB8Rhw6B+G4sHtZEnqg7TPGSvE+u4MBFPTez9
 P3ORcLR1aDXz9j5SqyApXozqIRYwoBkfD0Cg7wSkt5Nt3XYbe1PbSvRBs/xgBpIA
 I6d4tId9RSbEcUr2uqdXEzVdhUFnqJQF9X6LDcEFNLxe1WVSA8rF7ldQ8LTz5CNl
 7K0iMArYAXLLDCGMonIfF4ZK3IPZQmPiiNziiF6GNy3szzKFl1NE898NBZcuL0Uf
 reFztYLR3m2E6JQqSwKlP/+tmFaE/70C+EWpGFFMpDKJqhw4M/gxKgAR1tDBmfc/
 IxRnC9dHR+i1f1jhteN98H30/idQ8lExkQtUtbSQzg==
X-ME-Sender: <xms:uYrGYpoz6kCtq7XBdV-O7qxus7mOjOnuEv4JxKUhLGOacNx1CB7UaQ>
 <xme:uYrGYrpwAnT8_mTE-9HBLM7EpnvvV-QSiaZ_ThvnFORD_c7zFdpisMenMr1Xz54gG
 Nl5F4NVvxmCE5eVnj0>
X-ME-Received: <xmr:uYrGYmNzKcVLfd7xNcZsVrVmtEURqKPWCQJ8OuDraS290sCZ1JS-IFu00mKRXBxv1AOSwpA_4cJE8ekObTogT6V->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduucdludehmdenucfjughrpe
 ffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghrucffvghl
 vghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpe
 duteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeekfeeukeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:uYrGYk5_eK5dzvQJgJsvU68im502f80Qdq2ZSuAH79Luj6HPlRLCFw>
 <xmx:uYrGYo4M2seYjO0bMyj0Pzsgmu9V4JtNbDJTsYTAmRbLO96lFNEisQ>
 <xmx:uYrGYsiI7TbNUEaHSsqHTTzl3Obbcm9p1LtKQw4t1fBxuDJrdMwtYw>
 <xmx:uorGYiQvJy9mqLJnsU7BElzxuDKXu0xTHjKVWB8jesY1D4_-pIcd5W8P8WI>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 03:26:48 -0400 (EDT)
Date: Thu, 7 Jul 2022 00:26:47 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Peter Delevoryas <peter@pjd.dev>
Cc: peter@pjd.dev, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] hw/gpio/aspeed: Don't let guests modify input pins
Message-ID: <YsaKtyJXbEWw4x3X@r37>
References: <20220707071731.34047-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707071731.34047-1-peter@pjd.dev>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 07, 2022 at 12:17:29AM -0700, Peter Delevoryas wrote:
> The fby35 OpenBMC sysvinit scripts check various GPIO pins at start and
> decide where to start IPMB daemons for each slot in the sled (4 slots max).
> It only starts an IPMB daemon if the slot GPIO pins indicate that it's
> present and powered on.
> 
> I've been simulating some input pins by setting their value in the machine
> reset function. I think a proper solution would be to add input pins to the
> Aspeed GPIO code and create devices that force the pins high or low
> appropriately, but for now setting the QOM property seemed fine.
> 
> But, I noticed that while the values were set initially, something in the
> boot process resets all the values I set to "low". I imagine something in
> userspace or the driver is blanket writing zero to the data registers. I
> think the Aspeed GPIO controller probably shouldn't be changing the value of
> input pins in this case.
> 
> To fix this, we could just make sure that aspeed_gpio_update() never sets
> the value of an input pin. However, that would also prevent my code in
> fby35_reset from initializing the input pins to some special value. So, to
> support the QOM property setup use-case, I added a "force" parameter. Kinda
> hacky, but it was the simplest thing I could think of.
> 
> Thanks,
> Peter

My gitconfig was messed up, I was using the maintainers.pl script in my
send-email.ccCmd, but that doesn't work for the cover letter.  So, it just sent
the cover letter to me. I didn't notice it in test emailing cause I usually just
test sending to myself. Sorry about this. Hopefully I should finally have
my email configuration fixed at this point...I hope.

Peter

> 
> Peter Delevoryas (2):
>   hw/gpio/aspeed: Don't let guests modify input pins
>   aspeed: Add fby35-bmc slot GPIO's
> 
>  hw/arm/aspeed.c       | 14 +++++++++++++-
>  hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
>  2 files changed, 25 insertions(+), 11 deletions(-)
> 
> -- 
> 2.36.1
> 

