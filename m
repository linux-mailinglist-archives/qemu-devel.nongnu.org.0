Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E909D52FA4C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:26:50 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLNq-0007cy-29
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLLl-0006bf-9v; Sat, 21 May 2022 05:24:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLLj-0002Ss-Mu; Sat, 21 May 2022 05:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOYi/1BiSNtVuEj8MxtUdiPqVrSmrcedfM4/hZQZkVw=; b=xDFQfkXTZau85kDdqO4pLiXf81
 8A49dxvWsRHSzFU8D9nq41Gd2nyeZgLE7qP9JOvgbIZA1JFLxI/JkWUA433hvJ9FMUBFVyXRmi25X
 AQtt+ceVzOhPTcG/yaS4uzwkmHEAquLBkEL6GLc4doQkqLW5lHqDcuOFhh3ziUa4wbA2feS0UrslW
 lsF4AyA2wrHg/28q6CZj27HQwNT9irrhWWIQPH3ekLNj8x48lDI/12Cz0MMY9xdRvL6yduIb7kSb0
 3rfoOMFheAvriB4rvdCYPe/BryeOha13u8rG+y9iwp0keY79BBWRk8apYPiWHLbaJYPgfBZwmWE2d
 hZCpMHruGmr+++ouDya7JoqQJ8VLVSSUemMs/pOaI/8TVgW1oAh8Ijwrk1xBxFhgkVcYHY4UwdR6n
 5XS7HxrfzFT3Hi7wQfqdw4vDb2pdfliBR/HjTuLvAgMfJuCIq79VRgNxUXo9Rnt2GcPHBelWPMNzq
 zameFVwFkRlFZ7s8SWQhbkpXqru5C82aNKvXLKCdIAN5WStoxsFtSu5Ol/qLpWVBo9S3XIK2EUUp0
 peP0EtF2fFkK9k6pBc8QQ3gdS+wX2HZ28YE1sXt+b2PVaVCiCRzsmAcF82hDwoRVosv+1odqU76A3
 ENnAVsbSkWzUIALjbyWlh5C027Z5ZA77Pal3+tAs4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLKf-000AZy-2n; Sat, 21 May 2022 10:23:37 +0100
Message-ID: <233ae2da-ca1c-ea11-8af5-3eb8f936dbba@ilande.co.uk>
Date: Sat, 21 May 2022 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220520174537.5827-1-shentey@gmail.com>
 <20220520174537.5827-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220520174537.5827-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] rtc/mc146818rtc: QOM'ify io_base offset
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

On 20/05/2022 18:45, Bernhard Beschow wrote:

> Exposing the io_base offset as a QOM property not only allows it to be
> configurable but also to be displayed in HMP:
> 
> Before:
> 
> (qemu) info qtree
>         ...
>            dev: mc146818rtc, id ""
>              gpio-out "" 1
>              base_year = 0 (0x0)
>              irq = 8 (0x8)
>              lost_tick_policy = "discard"
> 
> After:
> 
>            dev: mc146818rtc, id ""
>              gpio-out "" 1
>              base_year = 0 (0x0)
>              iobase = 112 (0x70)
>              irq = 8 (0x8)
>              lost_tick_policy = "discard"
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/microvm-dt.c         | 2 +-
>   hw/rtc/mc146818rtc.c         | 7 ++++---
>   include/hw/rtc/mc146818rtc.h | 2 +-
>   3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index a5db9e4e5a..39fe425b26 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -209,7 +209,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
>   {
>       const char compat[] = "motorola,mc146818";
>       uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
> -    hwaddr base = RTC_ISA_BASE;
> +    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);

Same comment here re: &error_abort.

>       hwaddr size = 8;
>       char *nodename;
>   
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index f235c2ddbe..484f91b6f8 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -941,7 +941,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>       qemu_register_suspend_notifier(&s->suspend_notifier);
>   
>       memory_region_init_io(&s->io, OBJECT(s), &cmos_ops, s, "rtc", 2);
> -    isa_register_ioport(isadev, &s->io, RTC_ISA_BASE);
> +    isa_register_ioport(isadev, &s->io, s->io_base);
>   
>       /* register rtc 0x70 port for coalesced_pio */
>       memory_region_set_flush_coalesced(&s->io);
> @@ -950,7 +950,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(&s->io, 0, &s->coalesced_io);
>       memory_region_add_coalescing(&s->coalesced_io, 0, 1);
>   
> -    qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
> +    qdev_set_legacy_instance_id(dev, s->io_base, 3);
>   
>       object_property_add_tm(OBJECT(s), "date", rtc_get_date);
>   
> @@ -983,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>   
>   static Property mc146818rtc_properties[] = {
>       DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
> +    DEFINE_PROP_UINT32("iobase", RTCState, io_base, 0x70),

I think this should be RTC_ISA_BASE?

>       DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>                                  lost_tick_policy, LOST_TICK_POLICY_DISCARD),
> @@ -1028,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
>        * does, even though qemu only responds to the first two ports.
>        */
>       crs = aml_resource_template();
> -    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
> +    aml_append(crs, aml_io(AML_DECODE16, s->io_base, s->io_base,
>                              0x01, 0x08));
>       aml_append(crs, aml_irq_no_flags(s->isairq));
>   
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 33d85753c0..1f7942a9f8 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -26,6 +26,7 @@ struct RTCState {
>       uint8_t cmos_data[128];
>       uint8_t cmos_index;
>       uint8_t isairq;
> +    uint32_t io_base;
>       int32_t base_year;
>       uint64_t base_rtc;
>       uint64_t last_update;
> @@ -49,7 +50,6 @@ struct RTCState {
>   };
>   
>   #define RTC_ISA_IRQ 8
> -#define RTC_ISA_BASE 0x70

... and so you'll need to keep this.

>   ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                                qemu_irq intercept_irq);

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

