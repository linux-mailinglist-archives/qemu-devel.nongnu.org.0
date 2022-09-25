Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D85E91DA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:25:42 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNtN-00028J-Qj
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNpF-000670-4c; Sun, 25 Sep 2022 05:21:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNpC-0004mN-Uk; Sun, 25 Sep 2022 05:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ewjn8XQ6EyslsksR91eqrD3ZRexJQio5S8wG0QKQdYY=; b=Q9TNLofJQqvTPAzCLZwh32Fi85
 iMy4FZiOH/pKuh+gq0d5nisOxTbfbqC0ewXP9pJn4536SbTCBSflZ8ZXAMXn8pgi2gGMhKycK31vR
 HAnZypcFrbxsAmfIvM+bYHr5Xp4r+3/VLoN2HXsesnxqDNgTy2jSUgOBBRdSGStGIGmybhuI/afpp
 EBGasCxG4e5hnz5mvLyaeOftlIvSWdOfY5hXho62SpzD02XBuHnkE3QDqjCl4GGjArsx9D4J3EB3m
 xgukJU0P9k3RGUddbL4IWxA37fpv+JCcFlewGBPTvKLBQZSrtNh8XKv9VCei5hsVyCFzPNgp5pZjb
 AIoPRdVZeCYefSTK3Ure9iG8UgG7V3xChCANNkfvGb4leJHl3lym+O8eyDsDc37GS8dZf0/HhRa7U
 yosI6fGEc5cjvBUQGOmOnkkxEar2hSvhICO3Fv41BZKRLng3nce+db2PsqEaFz92W67zYTEsBYqdx
 nYE78/A5DonMIhCi3DxBKWErDPowNfKDzUoIHSqFDkkXE/wNdrYFIttgHRTglHIihcr3X8WGUR6Av
 EvodcK2v73lypnS9Aw6VUs3s11Xig5P+To3toWoAlZiyC+o8CymTyzhVny7jgf8fAzkn++SC9xcJH
 18t2ppLF8zFYR8Tygw2ReDzJ6xXY9Y4qK3XTftehU=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNnT-0006wA-1A; Sun, 25 Sep 2022 10:19:39 +0100
Message-ID: <4e54027f-b74b-6ed0-9c5d-f655e4784630@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <e10a8d11ea424aa8fa727936b2ad6c2fe439b3ad.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e10a8d11ea424aa8fa727936b2ad6c2fe439b3ad.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/10] hw/ppc/mac.h: Move grackle-pcihost declaration out
 from shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

> It is only used by mac_oldworld anyway and it already instantiates
> a few devices by name so this allows reducing the shared header further.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/pci-host/grackle.c | 1 +
>   hw/ppc/mac.h          | 3 ---
>   hw/ppc/mac_oldworld.c | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index b05facf463..5282123004 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -34,6 +34,7 @@
>   #include "trace.h"
>   #include "qom/object.h"
>   
> +#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>   OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
>   
>   struct GrackleState {
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index 55cb02c990..fe77a6c6db 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -35,9 +35,6 @@
>   #define KERNEL_LOAD_ADDR 0x01000000
>   #define KERNEL_GAP       0x00100000
>   
> -/* Grackle PCI */
> -#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
> -
>   /* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index f323a49d7a..a4094226bc 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -214,7 +214,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       }
>   
>       /* Grackle PCI host bridge */
> -    grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> +    grackle_dev = qdev_new("grackle-pcihost");
>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>       s = SYS_BUS_DEVICE(grackle_dev);
>       sysbus_realize_and_unref(s, &error_fatal);

This is the wrong way around - we want to move towards using TYPE_ macros everywhere 
for device instantiation instead of hardcoded strings.

What's really missing here is that the QOM structs and definitions for grackle.c 
should be moved to a new include/hw/pci-host/grackle.h file from mac.h and included 
where necessary.


ATB,

Mark.

