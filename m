Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31960648EF2
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 14:49:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p40DE-0002P7-2W; Sat, 10 Dec 2022 08:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p40D9-0002Od-CI
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 08:48:18 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p40D7-0001G0-1J
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 08:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4e9f48/bK1R9bnJwzJrjuI3+9CQZ4hfP9Qsjq0QHjTc=; b=mLc49cIHy+HOzQy9B7z+5Dbyaa
 /V0zAh3VUtPFNtA27KW2OS6ItmHXq1+tLZi0285pPktXtkDpFZl1C8G5HYQzTqVYp2EIgYJkRWRxU
 xsYiBqV/EGo2ecEUljCt7mfNlbRZgEbqZ3vRnGkuvKma7WgjD62AAgXeyqobm8BTx0mDl1Bga1PvE
 XCooihI5LeH8eJQLKGhTBLh5eAi3RePdRw31CsCOPvAFz48JpcG6nD+yx1BdGSzhYOib1GrFwUWF3
 lu8y73EzHjzsv0IZ/P6iu9xRMX+bxYaIS4OK0dXSVaFGC7KehdYQAEOdC2GQ6yQ/jlz2awNzU9AKo
 4qGr7xENj/yfSVpGeQG/4OfEVPhKhxh5uNLwNww6rSFudtOwp6dSamE/xs7xKOjL/xixfYlzVOMci
 wdjUUcjZ5OXUNU5C6R/IWF+4n/zvlJPfIfnZcDEq8fzhTRYkE1HPawmAjE41LAnmimwz111iosQYo
 C7JjSn/uR2O7DSeRRwB24oJRcltcV/PGm7k8TPsTjeLw+tajtEs3sql0rFOG75OPlrIVsTCmi7Jb1
 NARb1myDDlsQtH22zYVTNtZg7XsbZnZ5eRR0j14cNsEGkSqdApqs6oTN4qdnnppiotQV6ZenaUnd7
 CtLwxI5NrxAY/5i44yZIK6QEfU0cYR5ZiEUDHkfOo=;
Received: from [2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p40Cn-000Avh-0k; Sat, 10 Dec 2022 13:47:57 +0000
Message-ID: <a9e8d0ef-e4cb-2319-d8d3-f657e167c729@ilande.co.uk>
Date: Sat, 10 Dec 2022 13:48:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221209111556.110757-1-thuth@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221209111556.110757-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:9200:322a:ac7b:c3c3:b65b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 for-8.0] hw/rtc/mc146818rtc: Make this rtc device
 target independent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09/12/2022 11:15, Thomas Huth wrote:

> The only reason for this code being target dependent is the apic-related
> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
> simple, we can easily move them into a new, separate file (apic_irqcount.c)
> which will always be compiled and linked if either APIC or the mc146818 device
> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
> that the code only gets compiled once for all targets.

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Looks much better!

> ---
>   v2: Move the apic functions into a separate file instead of using
>       an ugly function pointer
> 
>   include/hw/i386/apic.h          |  1 +
>   include/hw/i386/apic_internal.h |  1 -
>   include/hw/rtc/mc146818rtc.h    |  1 +
>   hw/intc/apic_common.c           | 27 -----------------
>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>   hw/intc/meson.build             |  6 +++-
>   hw/rtc/meson.build              |  3 +-
>   8 files changed, 68 insertions(+), 49 deletions(-)
>   create mode 100644 hw/intc/apic_irqcount.c
> 
> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
> index da1d2fe155..96b9939425 100644
> --- a/include/hw/i386/apic.h
> +++ b/include/hw/i386/apic.h
> @@ -9,6 +9,7 @@ int apic_accept_pic_intr(DeviceState *s);
>   void apic_deliver_pic_intr(DeviceState *s, int level);
>   void apic_deliver_nmi(DeviceState *d);
>   int apic_get_interrupt(DeviceState *s);
> +void apic_report_irq_delivered(int delivered);
>   void apic_reset_irq_delivered(void);
>   int apic_get_irq_delivered(void);
>   void cpu_set_apic_base(DeviceState *s, uint64_t val);
> diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
> index c175e7e718..e61ad04769 100644
> --- a/include/hw/i386/apic_internal.h
> +++ b/include/hw/i386/apic_internal.h
> @@ -199,7 +199,6 @@ typedef struct VAPICState {
>   
>   extern bool apic_report_tpr_access;
>   
> -void apic_report_irq_delivered(int delivered);
>   bool apic_next_timer(APICCommonState *s, int64_t current_time);
>   void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
>   void apic_enable_vapic(DeviceState *d, hwaddr paddr);
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 1db0fcee92..45bcd6f040 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -55,5 +55,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                                qemu_irq intercept_irq);
>   void rtc_set_memory(ISADevice *dev, int addr, int val);
>   int rtc_get_memory(ISADevice *dev, int addr);
> +void qmp_rtc_reset_reinjection(Error **errp);
>   
>   #endif /* HW_RTC_MC146818RTC_H */
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 2a20982066..b0f85f9384 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -33,7 +33,6 @@
>   #include "hw/sysbus.h"
>   #include "migration/vmstate.h"
>   
> -static int apic_irq_delivered;
>   bool apic_report_tpr_access;
>   
>   void cpu_set_apic_base(DeviceState *dev, uint64_t val)
> @@ -122,32 +121,6 @@ void apic_handle_tpr_access_report(DeviceState *dev, target_ulong ip,
>       vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
>   }
>   
> -void apic_report_irq_delivered(int delivered)
> -{
> -    apic_irq_delivered += delivered;
> -
> -    trace_apic_report_irq_delivered(apic_irq_delivered);
> -}
> -
> -void apic_reset_irq_delivered(void)
> -{
> -    /* Copy this into a local variable to encourage gcc to emit a plain
> -     * register for a sys/sdt.h marker.  For details on this workaround, see:
> -     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
> -     */
> -    volatile int a_i_d = apic_irq_delivered;
> -    trace_apic_reset_irq_delivered(a_i_d);
> -
> -    apic_irq_delivered = 0;
> -}
> -
> -int apic_get_irq_delivered(void)
> -{
> -    trace_apic_get_irq_delivered(apic_irq_delivered);
> -
> -    return apic_irq_delivered;
> -}
> -

Just a comment whilst reviewing this patch: apic_irq_delivered is also used by 
hw/i386/kvm/i8259.c which seems incorrect since it is a PIC rather than an APIC, but 
that's why it isn't immediately possible to move apic_irq_delivered into APICCommonState.

I suspect what should happen is that PICCommonState should have its own KVM irq 
delivery count rather than relying on the APIC one, which might actually be the 
reason that this dependency between mc146818rtc and APIC exists in the first place. 
Any x86 people care to comment?

>   void apic_deliver_nmi(DeviceState *dev)
>   {
>       APICCommonState *s = APIC_COMMON(dev);
> diff --git a/hw/intc/apic_irqcount.c b/hw/intc/apic_irqcount.c
> new file mode 100644
> index 0000000000..0aadef1cb5
> --- /dev/null
> +++ b/hw/intc/apic_irqcount.c
> @@ -0,0 +1,53 @@
> +/*
> + * APIC support - functions for counting the delivered IRQs.
> + * (this code is in a separate file since it is used from the
> + * mc146818rtc code on targets without APIC, too)
> + *
> + *  Copyright (c) 2011      Jan Kiszka, Siemens AG
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i386/apic.h"
> +#include "trace.h"
> +
> +static int apic_irq_delivered;
> +
> +void apic_report_irq_delivered(int delivered)
> +{
> +    apic_irq_delivered += delivered;
> +
> +    trace_apic_report_irq_delivered(apic_irq_delivered);
> +}
> +
> +void apic_reset_irq_delivered(void)
> +{
> +    /*
> +     * Copy this into a local variable to encourage gcc to emit a plain
> +     * register for a sys/sdt.h marker.  For details on this workaround, see:
> +     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
> +     */
> +    volatile int a_i_d = apic_irq_delivered;
> +    trace_apic_reset_irq_delivered(a_i_d);
> +
> +    apic_irq_delivered = 0;
> +}
> +
> +int apic_get_irq_delivered(void)
> +{
> +    trace_apic_get_irq_delivered(apic_irq_delivered);
> +
> +    return apic_irq_delivered;
> +}
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 1ebb412479..afb1f385a3 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -43,11 +43,7 @@
>   #include "qapi/qapi-events-misc.h"
>   #include "qapi/visitor.h"
>   #include "hw/rtc/mc146818rtc_regs.h"
> -
> -#ifdef TARGET_I386
> -#include "qapi/qapi-commands-misc-target.h"
>   #include "hw/i386/apic.h"
> -#endif
>   
>   //#define DEBUG_CMOS
>   //#define DEBUG_COALESCED
> @@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>   static QLIST_HEAD(, RTCState) rtc_devices =
>       QLIST_HEAD_INITIALIZER(rtc_devices);
>   
> -#ifdef TARGET_I386
>   void qmp_rtc_reset_reinjection(Error **errp)
>   {
>       RTCState *s;
> @@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
>   
>       rtc_coalesced_timer_update(s);
>   }
> -#else
> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
> -{
> -    assert(0);
> -    return false;
> -}
> -#endif
>   
>   static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>   {
> @@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>       rtc_set_date_from_host(isadev);
>   
>       switch (s->lost_tick_policy) {
> -#ifdef TARGET_I386
> -    case LOST_TICK_POLICY_SLEW:
> -        s->coalesced_timer =
> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
> -        break;
> -#endif
>       case LOST_TICK_POLICY_DISCARD:
>           break;
> +    case LOST_TICK_POLICY_SLEW:
> +        /* Slew tick policy is only available if the machine has an APIC */
> +        if (object_resolve_path_type("", "apic-common", NULL) != NULL) {

Hmmm. These days we should be using TYPE_APIC_COMMON, however it seems that 
APICCommonState is defined in apic_internal.h rather than apic.h which seems wrong 
(it prevents you from passing an APICCommonState as an object link property as well 
as from using TYPE_APIC_COMMON).

> +            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
> +            break;
> +        }
> +        /* fallthrough */
>       default:
>           error_setg(errp, "Invalid lost tick policy.");
>           return;
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index bcbf22ff51..036ad1936b 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -25,8 +25,12 @@ softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
>   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
>   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
>   
> -specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
> +if config_all_devices.has_key('CONFIG_APIC') or config_all_devices.has_key('CONFIG_MC146818RTC')
> +    softmmu_ss.add(files('apic_irqcount.c'))
> +endif
>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
> +
> +specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
> index dc33973384..34a4d316fa 100644
> --- a/hw/rtc/meson.build
> +++ b/hw/rtc/meson.build
> @@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
>   softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
>   softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
>   softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
> -
> -specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
> +softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))

Fixing up the headers to allow TYPE_APIC_COMMON rather than hard-coding "apic-common" 
would be my preference, however there is a lot of legacy code here and the fear would 
be that once you pull on that string then more will keep unravelling... so if that 
isn't something you can easily get to work I'm inclined to give a:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

regardless since it nudges things in the right direction until we can get some 
guidance from more knowledgeable x86 people.


ATB,

Mark.

