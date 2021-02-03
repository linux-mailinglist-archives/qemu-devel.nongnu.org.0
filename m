Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E840830E4CC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:16:22 +0100 (CET)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PVd-0002ld-FX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7PTb-0001ze-Ld; Wed, 03 Feb 2021 16:14:15 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:57784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l7PTZ-0007XH-4K; Wed, 03 Feb 2021 16:14:15 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 25A5DC602E6;
 Wed,  3 Feb 2021 22:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612386849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EEnYCCzG9PWtib6tXNLQD66+EeJEANh6CSJRwlVV/wY=;
 b=HtlaS6B6UaywRqi+WmENeld124sEohg4T91wfkOhaj/OQrdqLaC2MnD5fNwXcmR7k2veIw
 kXPl8GfN5rHdI1ov6RLZ8t5AOEb0xX8AmZmxhV5kTfh7Jo9/oUjYZJqa5dtvo2VjkQsVel
 L3uOl2okKabl8vk41OlQZV452mlxdXDiDhXf1z0KmQijMCyUmyKQUDnl678JIAx8kO2eXl
 R/nWzm+UTkbPawHsM418+yGLz70vuk3x8wvJr4I2Sn/VkuiOzmKSJfKnj1RTDsM+I3UtxA
 m2CdtrVkuEy4r3uNqPXpCjz45bsHbkZQku9zsRKOgYQW/ROuR0tOZePAVJbbWw==
Date: Wed, 3 Feb 2021 22:14:36 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 0/4] New APIs for the Clock framework
Message-ID: <20210203211436.lkxqejxgx6alsvef@sekoia-pc.home.lmichel.fr>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12:30 Mon 01 Feb     , Peter Maydell wrote:
[snip]
> 
> Side note: there is currently no MAINTAINERS entry for the
> clock framework. Any volunteers? It would cover
> 
> F: include/hw/clock.h
> F: include/hw/qdev-clock.h
> F: hw/core/clock.c
> F: hw/core/qdev-clock.c
> F: docs/devel/clocks.rst

I'd love to get involved as a maintainer so I volunteer. And I think
this part is reasonably small to get started. Do you have some
guidelines? I found https://wiki.qemu.org/Contribute/SubmitAPullRequest
on the QEMU wiki.

Thanks.

-- 
Luc

> 
> thanks
> -- PMM
> 
> Peter Maydell (4):
>   clock: Add ClockEvent parameter to callbacks
>   clock: Add ClockPreUpdate callback event type
>   clock: Add clock_ns_to_ticks() function
>   hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
> 
>  docs/devel/clocks.rst            | 54 ++++++++++++++++++++++++++++++--
>  include/hw/clock.h               | 52 +++++++++++++++++++++++++++++-
>  hw/arm/armsse.c                  |  8 +++--
>  hw/char/cadence_uart.c           |  5 ++-
>  hw/char/ibex_uart.c              |  5 ++-
>  hw/char/pl011.c                  |  5 ++-
>  hw/core/clock.c                  |  5 ++-
>  hw/misc/bcm2835_cprman.c         | 20 +++++++++---
>  hw/misc/npcm7xx_clk.c            | 31 ++++++++++++++++--
>  hw/misc/zynq_slcr.c              |  6 +++-
>  hw/timer/cmsdk-apb-dualtimer.c   |  5 ++-
>  hw/timer/cmsdk-apb-timer.c       |  5 ++-
>  hw/timer/npcm7xx_timer.c         |  4 +--
>  hw/watchdog/cmsdk-apb-watchdog.c |  5 ++-
>  14 files changed, 188 insertions(+), 22 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 

