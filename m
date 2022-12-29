Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FE6591A1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:39:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzed-0000jq-PI; Thu, 29 Dec 2022 15:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzeX-0000jB-Ve; Thu, 29 Dec 2022 15:37:27 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzeV-00014t-WD; Thu, 29 Dec 2022 15:37:25 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2A3585C009C;
 Thu, 29 Dec 2022 15:37:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Dec 2022 15:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672346241; x=
 1672432641; bh=KkGW0V7n76KrfMl23nOXHjJqW+EulqYXQcxHJ9Hw89Y=; b=G
 9NVwcaTEFSVu7R7eicfJL0/WzBxnv9s2ryzkUSJzx7ec0NN91wP34hhXkImlgKcq
 51Q5V3XCSjTd7pW2O8cyeqZUBIRQHTw0tysNL84lm0xhNTdoy3ozAGOzIcd1+9Y7
 ybg8F9cB6dkrkTvCsx66ObZZrwvtSpqHAwD64R9/X6rS9NHZeSRawLrjwLjwPbT5
 FYhZBrkykvS4S3xJHX/IBf26aZR9Z41Dc6K0so6MEehImKjAjDIzwanK8QreP5af
 egW/BxENo61A5bHRtLnd79FoEapwG3UOti2f+UOKxzMZIVAa8niyjfM4LXtNi8vY
 GQy61vftvW5LvSDaomeBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672346241; x=
 1672432641; bh=KkGW0V7n76KrfMl23nOXHjJqW+EulqYXQcxHJ9Hw89Y=; b=m
 mcNq112nSBV17yV4452eqQFo3IRYHwhuaONk6zT2/haEVNjSmglswsbA5GHXY01M
 i23wWqhe2DPiP0jK/udkGE9+f/6FjJjZxycOlMgLE+HoSpjgRXGivccxzAYh7AJk
 /DrxrDN2sGhyKHXSu3q9owtd3OjM8oxkWr94WduU+6JOwD4u77ofFTSD20md7ihB
 Y1StI9JbEfKWvCdcjsf/9tULLuxzhNaqBdutDJr66zouhfUXlgo/MqFBOAE1VZul
 poDpqKZ8Jcm7GjlBV7f2+60S687G4ypQlS+29htXCe1Jvca+4R8Zbz60XD9g6Ztp
 3Rc2pSGqBQhc9SNar26ng==
X-ME-Sender: <xms:gPqtY4EwJ6y8jUgxvxFBbLRcpKl-XBFFyPyTYAM1hHZa1pgmnQ3tmg>
 <xme:gPqtYxWpJV9bPkVU52LBdIwzIn0QX6mBxmABxxWPoxvnzllilyfzYqhqp1B-iDSG2
 0wGpNrDyR1dH0bJZLo>
X-ME-Received: <xmr:gPqtYyI0rmU1dAwr569EfbPU0qCZcdCVwxYUGL6hdkFve3w2i9xG5WTFcxvj3UFS1HiuZFMrzI-QuhFWMnHKdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:gPqtY6EqPp6eBkmS9k6Zgj2zVeSTuZ_U5nqR4i1kJ9H9SzkbrEDVcQ>
 <xmx:gPqtY-WQdGH3wA_cQ4yiBdDQ9DPa0SGuUjaZoaNUWJ3ZqEcOKN9_mw>
 <xmx:gPqtY9ML0uINPBh86evMAr9oQsnX6sDRAYV8jcLjrBmWuEG9TiHKTA>
 <xmx:gfqtY3UhiNok8Ylvmv2OWtUFbxXH4DSLxQJAzfwoTEFSVFBEGhV1pw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:37:18 -0500 (EST)
Date: Thu, 29 Dec 2022 12:37:16 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 0/9] hw/arm/aspeed_ast10x0: Map more peripherals & few
 more fixes
Message-ID: <Y636fEa4MePbmMh1@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Thu, Dec 29, 2022 at 04:23:16PM +0100, Philippe Mathieu-Daudé wrote:
> Trying to fix some bugs triggered running Zephyr.

Yay!

> 
> Still 2 bugs:
> 
> 1/
> uart:~$ sensor get SYSCLK
> [00:00:23.592,000] <err> os: ***** USAGE FAULT *****
> [00:00:23.593,000] <err> os:   Illegal use of the EPSR
> [00:00:23.593,000] <err> os: r0/a1:  0x00033448  r1/a2:  0x00000000  r2/a3:  0x00047f50
> [00:00:23.593,000] <err> os: r3/a4:  0x00000000 r12/ip:  0x00000000 r14/lr:  0x00000fbd
> [00:00:23.593,000] <err> os:  xpsr:  0x60000000
> [00:00:23.593,000] <err> os: Faulting instruction address (r15/pc): 0x00000000
> [00:00:23.593,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
> [00:00:23.594,000] <err> os: Current thread: 0x38248 (shell_uart)
> [00:00:23.601,000] <err> os: Halting system
> 
> 2/
> uart:~$ mcuboot
> [00:01:04.990,000] <err> os: ***** BUS FAULT *****
> [00:01:04.990,000] <err> os:   Instruction bus error
> [00:01:04.991,000] <err> os: r0/a1:  0x00000000  r1/a2:  0x000ffff0  r2/a3:  0x00047ef0
> [00:01:04.991,000] <err> os: r3/a4:  0x00000010 r12/ip:  0x6df7ecb5 r14/lr:  0x000188ed
> [00:01:04.991,000] <err> os:  xpsr:  0x61000000
> [00:01:04.991,000] <err> os: Faulting instruction address (r15/pc): 0x6df7ecb4
> [00:01:04.991,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
> [00:01:04.991,000] <err> os: Current thread: 0x38248 (shell_uart)
> [00:01:04.994,000] <err> os: Halting system
> 
> ----------------
> IN:
> PMSA MPU lookup for reading at 0x0001d400 mmu_idx 65 -> Hit (prot rwx)
> 0x0001d5a2:  6869       ldr      r1, [r5, #4]
> 0x0001d5a4:  4421       add      r1, r4
> 0x0001d5a6:  6883       ldr      r3, [r0, #8]
> 0x0001d5a8:  681c       ldr      r4, [r3]
> 0x0001d5aa:  463a       mov      r2, r7
> 0x0001d5ac:  4633       mov      r3, r6
> 0x0001d5ae:  46a4       mov      ip, r4
> 0x0001d5b0:  e8bd 41f0  pop.w    {r4, r5, r6, r7, r8, lr}
> 0x0001d5b4:  4760       bx       ip
> 
> PMSA MPU lookup for reading at 0x00000008 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for execute at 0x6df7ecb4 mmu_idx 65 -> Hit (prot rwx)
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...at fault address 0x6df7ecb4
> ...with CFSR.IBUSERR
> PMSA MPU lookup for writing at 0x00047ec8 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ecc mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed0 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed4 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed8 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047edc mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ee0 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ee4 mmu_idx 65 -> Hit (prot rwx)
> ...taking pending nonsecure exception 5
> ...loading from element 5 of non-secure vector table at 0x14
> ...loaded new PC 0xa0cd
> ----------------
> 
> HACE isn't really functional there. I probably screwed smth while wiring
> the peripheral. Not obvious without access to the datasheet.

Hmmmmm well I have the datasheet, but I don't see what the issue could be. The
MMIO address for the HACE is correct (0x7E6D_0000), what else could be wrong?

> 
> Philippe Mathieu-Daudé (9):
>   hw/watchdog/wdt_aspeed: Map the whole MMIO range
>   hw/arm/aspeed: Use the IEC binary prefix definitions
>   hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
>   hw/arm/aspeed_ast10x0: Map I3C peripheral
>   hw/arm/aspeed_ast10x0: Map the secure SRAM
>   hw/arm/aspeed_ast10x0: Map HACE peripheral
>   hw/misc/aspeed_hace: Do not crash if address_space_map() failed
>   hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
>   tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board
> 
>  hw/arm/aspeed_ast10x0.c          | 84 ++++++++++++++++++++++++++++++--
>  hw/arm/aspeed_ast2600.c          |  5 +-
>  hw/arm/aspeed_soc.c              |  6 +--
>  hw/misc/aspeed_hace.c            | 21 +++++---
>  hw/watchdog/wdt_aspeed.c         | 12 +++--
>  include/hw/arm/aspeed_soc.h      | 14 ++++++
>  include/hw/watchdog/wdt_aspeed.h |  2 +-
>  tests/avocado/machine_aspeed.py  | 41 +++++++++++++++-
>  8 files changed, 163 insertions(+), 22 deletions(-)
> 
> -- 
> 2.38.1
> 

