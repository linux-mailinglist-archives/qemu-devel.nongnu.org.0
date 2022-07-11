Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A556D6F9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 09:40:52 +0200 (CEST)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAo2E-0007ND-Oh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 03:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oAo0N-0004X5-CA; Mon, 11 Jul 2022 03:38:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oAo0L-0007c4-V4; Mon, 11 Jul 2022 03:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNqkWV7TwmI+iaN0WSr6dKOXDpPNKrkD30YL1zZppqU=; b=CNiGe8z2P9TxElLinfJAhqiKau
 svZAk1Wdt+s+b8Zoq9pYfYpr0g0V0+VHmo0PN2N7Naawve+gjQuVjzROU+qtHGxSXqeHMsDI5c7Sk
 Og7kp8mvnC/XPwKwNVyeXeFLiJ8dfDIXgHxXobh/WbKTk0j0faVKMiWYvl7GW3xoCi1+AXI/FHkgB
 +KDCv7+Gs+VAZjl2JoKdPSkSVJ5IpnRZROmuxEjidlBitZXkbmhMV9wnoHNK/XQUq/FJQEN/1NS4w
 SnnuxFqmSfwGyTM/S45zI71YES2DZg2tgkc/4ub74VaCoGl/LzZ99nM/Jwpc+1hV9+4yBpZUKQsDU
 dBXjHUOajVYvDbyb9+wPrtyatctL3ltZNAkY3ZwaUk+8hWV37T0g17C5piCzFjDWjgMjIRnRKSkJX
 qbVF01VG5qzLSeni5A8XM/9tIgp4ogAtGpbCsUEVLvQYmx+uqQAfrAwDqhq/VhOkTnAR5DTjLjcAt
 ACWEl9k9bFP+myi7T7rXXl52fdzlNX9OK2vcAzsv/0WOt91VwBUdlT6GpncMeeqiswJ1Zk2e7PTIx
 ePMUHhvm7PF8iXWP0CZUp3HqhoiZhlnBmwKjA6BlORZj+z04btyZ9Z9i4WP+2/EbBl6xTpd+z0PzP
 JnJuwe+4BRnftAxQjefxSZaG65gbuT0HBIPELZdck=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oAnz1-0000qn-Aj; Mon, 11 Jul 2022 08:37:35 +0100
Message-ID: <9e38f411-bc18-0064-6a02-33d37e3e5ddb@ilande.co.uk>
Date: Mon, 11 Jul 2022 08:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>
References: <20220705145814.461723-1-clg@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] ppc: Remove irq_inputs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 15:58, Cédric Le Goater wrote:

> Hello,
> 
> This replaces the IRQ array 'irq_inputs' with GPIO lines and removes
> 'irq_inputs' when all CPUs have been converted.
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (5):
>    ppc64: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc: Remove unused irq_inputs
> 
>   target/ppc/cpu.h       |  1 -
>   hw/intc/xics.c         | 10 ++++++----
>   hw/intc/xive.c         |  4 ++--
>   hw/ppc/e500.c          |  8 ++++----
>   hw/ppc/mac_newworld.c  | 16 ++++++++--------
>   hw/ppc/mac_oldworld.c  |  2 +-
>   hw/ppc/pegasos2.c      |  2 +-
>   hw/ppc/ppc.c           | 30 ++++++------------------------
>   hw/ppc/ppc405_uc.c     |  4 ++--
>   hw/ppc/ppc440_bamboo.c |  4 ++--
>   hw/ppc/prep.c          |  2 +-
>   hw/ppc/prep_systemio.c |  2 +-
>   hw/ppc/sam460ex.c      |  4 ++--
>   hw/ppc/virtex_ml507.c  | 10 +++++-----
>   target/ppc/cpu_init.c  |  5 -----
>   15 files changed, 41 insertions(+), 63 deletions(-)

For the Mac machines:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

