Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF4645DA6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wMF-0005pX-9L; Wed, 07 Dec 2022 10:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2wM9-0005p6-T6
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:29:11 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2wM7-0004ao-OG
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BbnSbfq6B4EVvmVfIDYA80wL3jWRyp8ybdP+o89gIUo=; b=MoLxz/QJL+mhFrz/sZyJdki083
 +ebJWmSCrIiNACMZG+IKXp7Ap8NSlKf3HoEKAMHW41wvMGO+sxhGOtmRjuFUvDR2EspQtySm6vckW
 VLiaE/6oQ48pgMh85GTdN/0S5r72PWmmNxiTiSzxuDqPAJYZqbaofNkSy3Vcf96MaBF1YkAh6HUZ2
 btr1jqiTSli93+V5WR4DplA8qSeYQLst8rZZmBV9YNzbblxZP2jI3R2ZkJeOhhR/QHa8mMxMozAbS
 CpC88xblAJ1hGGGP9DulgvZOmkPCoWSZlN2Xyj4S6K0SxHBZhqd2pC47yRMydUY1BnIto1pLnsUzm
 uI4T81GuZZD5kiW+0fr28ZpVXIlkRwY0kHcm+jf2iO4wJNWoYZcDCCczR1ZOWeyksJC9Q4rOVFW0v
 fHeL1NY/p56NHDRPtr9CF6nkShdJSaShuX3bmpFQj/mt8ztwgPsSFwzpBjCU1AHZEVj/OXhz/kaiv
 jgkWiSc3BVf69UFx1U5VUOozjKkoBeGUo1H3Vlz3cCF/4N0vMGsuhDEoJtQnb1vVlXHAj3dGSfckS
 gRyALTtnloqMambo7co5nB+QOTKp3G0fFbBzBBXfmpJ8Ymap4aV/kKwyR2Jxsd9y5GAV8wvBeiYXz
 AbxtgN+kvDTlwLlWtU+1ny9XiRyWfysl+FODZp+sA=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p2wLq-0003WC-77; Wed, 07 Dec 2022 15:28:54 +0000
Message-ID: <8f0b1154-5d40-f098-ef1d-cd2a50145529@ilande.co.uk>
Date: Wed, 7 Dec 2022 15:29:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221206200641.339116-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 06/12/2022 20:06, Thomas Huth wrote:

> The only code that is really, really target dependent is the apic-related
> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
> function as parameter to mc146818_rtc_init(), we can make the RTC completely
> target-independent.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/rtc/mc146818rtc.h |  7 +++++--
>   hw/alpha/dp264.c             |  2 +-
>   hw/hppa/machine.c            |  2 +-
>   hw/i386/microvm.c            |  3 ++-
>   hw/i386/pc.c                 | 10 +++++++++-
>   hw/mips/jazz.c               |  2 +-
>   hw/ppc/pnv.c                 |  2 +-
>   hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>   hw/rtc/meson.build           |  3 +--
>   9 files changed, 32 insertions(+), 33 deletions(-)
> 
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 1db0fcee92..c687953cc4 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -46,14 +46,17 @@ struct RTCState {
>       Notifier clock_reset_notifier;
>       LostTickPolicy lost_tick_policy;
>       Notifier suspend_notifier;
> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>       QLIST_ENTRY(RTCState) link;
>   };
>   
>   #define RTC_ISA_IRQ 8
>   
> -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
> -                             qemu_irq intercept_irq);
> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq,
> +                             bool (*policy_slew_deliver_irq)(RTCState *s));
>   void rtc_set_memory(ISADevice *dev, int addr, int val);
>   int rtc_get_memory(ISADevice *dev, int addr);
> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
> +void qmp_rtc_reset_reinjection(Error **errp);
>   
>   #endif /* HW_RTC_MC146818RTC_H */
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index c502c8c62a..8723942b52 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>       qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>   
>       /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>   
>       /* VGA setup.  Don't bother loading the bios.  */
>       pci_vga_init(pci_bus);
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index de1cc7ab71..311031714a 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machine)
>       assert(isa_bus);
>   
>       /* Realtime clock, used by firmware for PDC_TOD call. */
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>   
>       /* Serial ports: Lasi and Dino use a 7.272727 MHz clock. */
>       serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 170a331e3f..d0ed4dca50 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>   
>       if (mms->rtc == ON_OFF_AUTO_ON ||
>           (mms->rtc == ON_OFF_AUTO_AUTO && !kvm_enabled())) {
> -        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL);
> +        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL,
> +                                      rtc_apic_policy_slew_deliver_irq);
>           microvm_set_rtc(mms, rtc_state);
>       }
>   
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 546b703cb4..650e7bc199 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>       g_free(a20_line);
>   }
>   
> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
> +{
> +    apic_reset_irq_delivered();
> +    qemu_irq_raise(s->irq);
> +    return apic_get_irq_delivered();
> +}
> +
>   void pc_basic_device_init(struct PCMachineState *pcms,
>                             ISABus *isa_bus, qemu_irq *gsi,
>                             ISADevice **rtc_state,
> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>           pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>           rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>       }
> -    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
> +    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq,
> +                                   rtc_apic_policy_slew_deliver_irq);
>   
>       qemu_register_boot_set(pc_boot_set, *rtc_state);
>   
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 6aefe9a61b..50fbd57b23 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -356,7 +356,7 @@ static void mips_jazz_init(MachineState *machine,
>       fdctrl_init_sysbus(qdev_get_gpio_in(rc4030, 1), 0x80003000, fds);
>   
>       /* Real time clock */
> -    mc146818_rtc_init(isa_bus, 1980, NULL);
> +    mc146818_rtc_init(isa_bus, 1980, NULL, NULL);
>       memory_region_init_io(rtc, NULL, &rtc_ops, NULL, "rtc", 0x1000);
>       memory_region_add_subregion(address_space, 0x80004000, rtc);
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 3d01e26f84..c5482554b7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -992,7 +992,7 @@ static void pnv_init(MachineState *machine)
>       serial_hds_isa_init(pnv->isa_bus, 0, MAX_ISA_SERIAL_PORTS);
>   
>       /* Create an RTC ISA device too */
> -    mc146818_rtc_init(pnv->isa_bus, 2000, NULL);
> +    mc146818_rtc_init(pnv->isa_bus, 2000, NULL, NULL);
>   
>       /*
>        * Create the machine BMC simulator and the IPMI BT device for
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 1ebb412479..9543ae0279 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -44,11 +44,6 @@
>   #include "qapi/visitor.h"
>   #include "hw/rtc/mc146818rtc_regs.h"
>   
> -#ifdef TARGET_I386
> -#include "qapi/qapi-commands-misc-target.h"
> -#include "hw/i386/apic.h"
> -#endif
> -
>   //#define DEBUG_CMOS
>   //#define DEBUG_COALESCED
>   
> @@ -112,7 +107,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>   static QLIST_HEAD(, RTCState) rtc_devices =
>       QLIST_HEAD_INITIALIZER(rtc_devices);
>   
> -#ifdef TARGET_I386
>   void qmp_rtc_reset_reinjection(Error **errp)
>   {
>       RTCState *s;
> @@ -124,9 +118,8 @@ void qmp_rtc_reset_reinjection(Error **errp)
>   
>   static bool rtc_policy_slew_deliver_irq(RTCState *s)
>   {
> -    apic_reset_irq_delivered();
> -    qemu_irq_raise(s->irq);
> -    return apic_get_irq_delivered();
> +    assert(s->policy_slew_deliver_irq);
> +    return s->policy_slew_deliver_irq(s);
>   }
>   
>   static void rtc_coalesced_timer(void *opaque)
> @@ -145,13 +138,6 @@ static void rtc_coalesced_timer(void *opaque)
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
> @@ -922,14 +908,14 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
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
> +        if (s->policy_slew_deliver_irq) {
> +            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
> +            break;
> +        }
> +        /* fallthrough */
>       default:
>           error_setg(errp, "Invalid lost tick policy.");
>           return;
> @@ -960,7 +946,8 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>       QLIST_INSERT_HEAD(&rtc_devices, s, link);
>   }
>   
> -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq,
> +                             bool (*policy_slew_deliver_irq)(RTCState *s))
>   {
>       DeviceState *dev;
>       ISADevice *isadev;
> @@ -969,6 +956,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
>       isadev = isa_new(TYPE_MC146818_RTC);
>       dev = DEVICE(isadev);
>       s = MC146818_RTC(isadev);
> +    s->policy_slew_deliver_irq = policy_slew_deliver_irq;
>       qdev_prop_set_int32(dev, "base_year", base_year);
>       isa_realize_and_unref(isadev, bus, &error_fatal);
>       if (intercept_irq) {
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

Ouch this is quite a nasty one :/

These days we really should try and avoid setting function pointers outside of 
_init() and class_init() where possible. If I were looking to model this today I'd 
probably try an approach like this:

- Move apic_irq_delivered into APICCommonState

- Define apic_reset_irq_delivered() and apic_get_irq_delivered() as function pointers 
in APICCommonState and assign them to the current implementations in 
apic_common_initfn() adding an APICCommonState parameter as required

- Grab a reference to APICCommonState in mc146818rtc.c's rtc_realizefn() using either 
an object property link or object_resolve_path_type("", TYPE_APIC_COMMON, NULL)

- Use "if (s->apic) { .. }" or similar in mc146818rtc.c to guard calling the apic_*() 
functions

Note that this is a good example as to why legacy global init functions such as 
mc146818_rtc_init() are a bad idea, since if you add a new optional parameter then 
you end up having to touch all function callers rather than just the places where you 
want to make use of the new parameter.


ATB,

Mark.

